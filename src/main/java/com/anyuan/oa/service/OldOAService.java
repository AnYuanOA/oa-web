package com.anyuan.oa.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.anyuan.oa.model.DictionVO;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.plan.PlanVo;
import com.anyuan.oa.model.request.OldOALeaveRequest;
import com.anyuan.oa.model.request.OldOAProcessWorkflowRequest;
import com.anyuan.oa.model.request.OldOAUsCarRequest;
import com.anyuan.oa.model.response.*;
import com.anyuan.oa.utils.*;
import com.anyuan.oa.utils.thread.HTTPTask;
import com.anyuan.oa.utils.thread.HTTPTaskCallback;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/1.
 */
@Component("oldOAService")
public class OldOAService {
    @Resource(name = "taskExecutor")
    private ThreadPoolTaskExecutor taskExecutor;

    /**
     * 登录 (返回的accessToken保存在session中，供后续接口调用使用)
     * @param username 用户名
     * @param password 密码
     * */
    public OldServiceResponse<OldAccessToken> login(String username, String password) throws IOException {
        String url = OldServiceConstant.TOKEN_URL;
        Map<String, String> param = new HashMap<String, String>();
        param.put("grant_type", OldServiceConstant.GRANT_TYPE);
        param.put("username", username);
        param.put("password", password);
        param.put("client_id", OldServiceConstant.CLIENT_ID);
        HTTPResponse result = HTTPUtil.sendPostWithEncodeForm(url, param, null);
        OldServiceResponse<OldAccessToken> response = JSON.parseObject(result.getResult(), OldServiceResponse.class);
        if(result.getCode() == HTTPResponse.SUCCESS){
            response.setSuccess(true);
            OldAccessToken token = JSON.parseObject(result.getResult(), OldAccessToken.class);
            response.setData(token);
        }
        return response;
    }

    /**
     * 获取待办列表 (返回值不作任何处理，直接交给客户端)
     * @param token 保存在session中的accessToken
     * */
    public OldServiceResponse<OldOAToDoListResponse> getToDoList(OldAccessToken token, String lastTime) throws IOException {
        String url = OldServiceConstant.TODO_URL;
        if(lastTime==null){
            lastTime = "";
        }
        int setLoad = 0;
        if(lastTime.trim().length()>0){
            setLoad = 1;
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("count", 10);
        param.put("flag", 1);
        param.put("key", "");
        param.put("lastTime", lastTime);
        param.put("setload", setLoad);
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse result = HTTPUtil.sendPostWithJson(url, param, headers);
        OldServiceResponse<OldOAToDoListResponse> response = JSON.parseObject(result.getResult(), OldServiceResponse.class);
        if(result.getCode() == HTTPResponse.SUCCESS){
            response.setSuccess(true);
            OldOAToDoListResponse toDoListResponse = JSON.parseObject(result.getResult(), OldOAToDoListResponse.class);
            response.setData(toDoListResponse);
        }
        return response;
    }

    /**
     * 获取待阅列表
     * @param currentPage  页码，从1开始
     */
    public OldServiceResponse<OldOAToReadListResponse> getToReadList(OldAccessToken token, int currentPage) throws IOException {
        String url  = OldServiceConstant.TOREAD_URL;
        if(currentPage<=0){
            currentPage = 1;
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("CurrentPage", currentPage);
        param.put("Obj_Title", "");
        param.put("PageSize", 10);
        param.put("lastTime", "");
        param.put("setload", 0);
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse result = HTTPUtil.sendPostWithJson(url, param, headers);
        OldServiceResponse<OldOAToReadListResponse> response = JSON.parseObject(result.getResult(), OldServiceResponse.class);
        if(result.getCode() == HTTPResponse.SUCCESS){
            response.setSuccess(true);
            OldOAToReadListResponse toReadListResponse = JSON.parseObject(result.getResult(), OldOAToReadListResponse.class);
            response.setData(toReadListResponse);
        }
        return response;
    }

    /**
     * 获取待办详情 (返回值不作任何处理，直接交给客户端)
     * @param token 保存在session中的accessToken
     * @param appID 待办项ID
     * @param workflowName 流程名称
     * */
    public OldServiceResponse<OldOAToDoDetailResponse> getToDoDetail(OldAccessToken token, String appID, String workflowName) throws IOException {
        final Object lock = new Object();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //待办详情请求结果
        final HTTPResponse detailResponse = new HTTPResponse();
        //待办当前允许操作请求结果
        final HTTPResponse operationResponse = new HTTPResponse();
        //待办流程已办理节点请求结果
        final HTTPResponse dealtResponse = new HTTPResponse();

        //待办流程详情任务
        String detaillUrl = getDetailUrlWithWorkflowName(workflowName);//OldServiceConstant.TODO_DETAIL_URL;
        Map<String, Object> detailParam = new HashMap<String, Object>();
        detailParam.put("AppID", appID);
        List<HTTPResponse> detailRelationTasks = new ArrayList<HTTPResponse>();
        detailRelationTasks.add(operationResponse);
        detailRelationTasks.add(dealtResponse);
        HTTPTask detailTask = getTask(detaillUrl, ConstantUtil.HTTP_METHOD_POST, detailParam, headers, lock, detailResponse, detailRelationTasks);

        //待办流程当前操作任务
        String operationUrl = OldServiceConstant.WORKFLOW_OPERATION_INFO_URL;
        List<HTTPResponse> operationRelationTasks = new ArrayList<HTTPResponse>();
        operationRelationTasks.add(detailResponse);
        operationRelationTasks.add(dealtResponse);
        HTTPTask operationTask = getTask(operationUrl, ConstantUtil.HTTP_METHOD_POST, appID, headers, lock, operationResponse, operationRelationTasks);

        //待办流程已办理节点任务
        String dealtUrl = OldServiceConstant.WORKFLOW_DEALT_INFO_URL;
        List<HTTPResponse> dealtRelationTasks = new ArrayList<HTTPResponse>();
        dealtRelationTasks.add(detailResponse);
        dealtRelationTasks.add(operationResponse);
        HTTPTask dealtTask = getTask(dealtUrl, ConstantUtil.HTTP_METHOD_POST, appID, headers, lock, dealtResponse, dealtRelationTasks);

        //并发执行任务
        OldServiceResponse<OldOAToDoDetailResponse> serviceResponse = new OldServiceResponse<OldOAToDoDetailResponse>();
        List<HTTPTask> tasks = new ArrayList<HTTPTask>();
        tasks.add(detailTask);
        tasks.add(operationTask);
        tasks.add(dealtTask);
        executeSync(serviceResponse, tasks, lock);

        //处理请求结果
        if(operationResponse.getCode()==HTTPResponse.SUCCESS && dealtResponse.getCode()==HTTPResponse.SUCCESS){
            Map<String, Object> detailJson = JSON.parseObject(detailResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            Map<String, Object> operationJson = JSON.parseObject(operationResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            Map<String, Object> dealtJson = JSON.parseObject(dealtResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            if((Integer)operationJson.get("success")==1 && (Integer)dealtJson.get("success")==1){
                OldOAToDoDetail detail = getDetail(JSON.toJSONString(detailJson.get("executedModel")), workflowName);
                OldOAToDoOperation operation = JSON.parseObject(JSON.toJSONString(operationJson), OldOAToDoOperation.class);
                List<OldOAToDoDealt> dealtList = JSON.parseArray(JSON.toJSONString(dealtJson.get("wfDealtList")), OldOAToDoDealt.class);
                //查询待办流程附件列表
                String attachsUrl = OldServiceConstant.WORKFLOW_ATTACHS_URL;
                Map<String, Object> attachsParam = new HashMap<String, Object>();
                attachsParam.put("attL_ID", detail.getAttL_ID());
                HTTPResponse attachResponse = HTTPUtil.sendPostWithJson(attachsUrl, attachsParam, headers);
                Map<String, Object> attachJson = JSON.parseObject(attachResponse.getResult(), new TypeReference<Map<String, Object>>(){});
                if((Boolean) attachJson.get("isSucceed")){
                    //汇总各接口结果
                    List<OldOAAttachment> attachmentList = JSON.parseArray(JSON.toJSONString(attachJson.get("executedModel")), OldOAAttachment.class);
                    OldOAToDoDetailResponse detailRes = new OldOAToDoDetailResponse();
                    detailRes.setDetail(detail);
                    detailRes.setOperation(operation);
                    detailRes.setDealtList(dealtList);
                    detailRes.setAttachmentList(attachmentList);
                    serviceResponse.setSuccess(true);
                    serviceResponse.setData(detailRes);
                }
            }
        }

        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 根据流程类型获取查询流程详细信息的接口url
     * @param workflowName
     * @return
     */
    private String getDetailUrlWithWorkflowName(String workflowName) {
        String url = OldServiceConstant.TODO_DETAIL_URL;
        if(WorkflowName.LEAVE.getValue().equals(workflowName)){
            url = OldServiceConstant.TODO_DETAIL_URL;
        }else if(WorkflowName.USCAR.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_USCAR_URL;
        }else if(WorkflowName.CHENGPIN.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_FINISHED_PRODUCT_URL;
        }else if(WorkflowName.YUSHENXIUGAIGAO.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_FIRST_AUDIT_URL;
        }else if(WorkflowName.XIANCHANGTAKAN.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANCHANG_URL;
        }else if(WorkflowName.GUKECAICHAN.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_GUKECAICHAN_URL;
        }else if(WorkflowName.XIANGMUJIHUA.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANGMU_URL;
        }else if(WorkflowName.XIANGMUJIHUABIANGENG.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANGMUBIANGENG_URL;
        }else if(WorkflowName.XIANGMUZUCHENGYUANBIANGENG.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANGMUCHENGYUANBIANGENG_URL;
        }else if(WorkflowName.XIANGMUZUCHENGYUAN.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANGMUCHENGYUAN_URL;
        }else if(WorkflowName.XIANGMUKAIGONGTONGZHIDANBIANGENG.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANGMUKAIGONGBIANGENG_URL;
        }else if(WorkflowName.XIANGMUKAIGONGTONGZHIDAN.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANGMUKAIGONG_URL;
        }else if(WorkflowName.HETONGBIANGENGSHENQING.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_HETONGBIANGENG_URL;
        }else if(WorkflowName.HETONGHUIQIANSHENQING.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_HETONG_URL;
        }else if(WorkflowName.XIANGMUFENGXIANFENXI.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_XIANGMUFENGXIAN_URL;
        }else if(WorkflowName.XINWENZHONGXIN.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_NEWSCENTER_URL;
        }else if(WorkflowName.QINGSHIBANLI.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_QINGSHI_URL;
        }else if(WorkflowName.SHOUWENBANLILIUCHENG.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_SHOUWEN_URL;
        }else if(WorkflowName.FAWENBANLILIUCHENG.getValue().equals(workflowName)){
            url = OldServiceConstant.WORKFLOW_FAWEN_URL;
        }
        return url;
    }

    /**
     * 根据流程类型处理接口返回值
     * @param result
     * @param workflowName
     * @return
     */
    private OldOAToDoDetail getDetail(String result, String workflowName) {
        /**
         * workflowTitle
         * workflowTemplateID
         * in_sp_id
         * buzPKID
         * attLT_Name
         * attL_Reason
         */
        OldOAToDoDetail detail = new OldOAToDoDetail();
        Map<String, Object> detailJson = JSON.parseObject(result, new TypeReference<Map<String, Object>>(){});
        detail.setWorkflowTitle(detailJson.get("workflowTitle")==null?"":(String) detailJson.get("workflowTitle"));
        detail.setWorkflowTemplateID(workflowName);
        detail.setIn_sp_id(detailJson.get("in_sp_id")==null?0:(Integer) detailJson.get("in_sp_id"));
        detail.setBuzPKID(detailJson.get("buzPKID")==null?0:(Integer) detailJson.get("buzPKID"));
        detail.setFields(new ArrayList<OldOaDetailField>());
        if(WorkflowName.LEAVE.getValue().equals(workflowName)){//请假流程
            setUpLevelDetailFields(detail, detailJson);
        }else if(WorkflowName.USCAR.getValue().equals(workflowName)){//用车申请流程
            setUpUsCarDetailFields(detail, detailJson);
        }else if(WorkflowName.CHENGPIN.getValue().equals(workflowName)){//成品会签流程
            setUpChengPinDetailFields(detail, detailJson);
        }else if(WorkflowName.YUSHENXIUGAIGAO.getValue().equals(workflowName)){//预审修改稿流程
            setUpYuShenXiuGaiGaoDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANCHANGTAKAN.getValue().equals(workflowName)){//现场踏勘流程
            setUpXianChangTaKanDetailFields(detail, detailJson);
        }else if(WorkflowName.GUKECAICHAN.getValue().equals(workflowName)){//顾客财产流程
            setUpGuKeCaiChanDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANGMUJIHUA.getValue().equals(workflowName)){//项目计划流程
            setUpXiangMuJiHuaDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANGMUJIHUABIANGENG.getValue().equals(workflowName)){//项目计划变更流程
            setUpXiangMuJiHuaBianGengDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANGMUZUCHENGYUAN.getValue().equals(workflowName)){//项目组成员审批表流程
            setUpXiangMuZuChengYuanDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANGMUZUCHENGYUANBIANGENG.getValue().equals(workflowName)){//项目组成员变更流程
            setUpXiangMuZuChengYuanBianGengDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANGMUKAIGONGTONGZHIDANBIANGENG.getValue().equals(workflowName)){//项目开工通知单变更流程
            setUpXiangMuKaiGongTongZhiDanBianGengDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANGMUKAIGONGTONGZHIDAN.getValue().equals(workflowName)){//项目开工通知单流程
            setUpXiangMuKaiGongTongZhiDanDetailFields(detail, detailJson);
        }else if(WorkflowName.HETONGBIANGENGSHENQING.getValue().equals(workflowName)){//合同变更申请流程
            setUpHeTongBianGengShenQingDeailFields(detail, detailJson);
        }else if(WorkflowName.HETONGHUIQIANSHENQING.getValue().equals(workflowName)){//合同会签申请流程
            setUpHeTongHuiQianShenQingDetailFields(detail, detailJson);
        }else if(WorkflowName.XIANGMUFENGXIANFENXI.getValue().equals(workflowName)){//项目风险分析流程
            setUpXiangMuFengXianFenXiDetailFields(detail, detailJson);
        }else if(WorkflowName.XINWENZHONGXIN.getValue().equals(workflowName)){//新闻中心流程
            setUpXinWenZhongXinDetailFields(detail, detailJson);
        }else if(WorkflowName.QINGSHIBANLI.getValue().equals(workflowName)){//请示办理流程
            setUpQingShiBanLiDetailFields(detail, detailJson);
        }else if(WorkflowName.SHOUWENBANLILIUCHENG.getValue().equals(workflowName)){//收文办理流程
            setUpShouWenBanLiDetailFields(detail, detailJson);
        }else if(WorkflowName.FAWENBANLILIUCHENG.getValue().equals(workflowName)){//发文办理流程
            setUpFaWenBanLiDetailFields(detail, detailJson);
        }
        return detail;
    }

    /**
     * 获取请假类型
     * @param token
     * @return
     * @throws IOException
     */
    public OldServiceResponse<List<OldOARestType>> getRestTypeList(OldAccessToken token) throws IOException {
        OldServiceResponse<List<OldOARestType>> serviceResponse = new OldServiceResponse<List<OldOARestType>>();
        String restTypeUrl = OldServiceConstant.WORKFLOW_GET_RESTTYPE_URL;
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse response = HTTPUtil.sendGet(restTypeUrl, headers);
        Map<String, Object> restTypeJson = JSON.parseObject(response.getResult(), new TypeReference<Map<String, Object>>(){});
        boolean success = (Boolean)restTypeJson.get("isSucceed");
        if(success){
            List<OldOARestType> restTypes = JSON.parseArray(JSON.toJSONString(restTypeJson.get("executedModel")), OldOARestType.class);
            serviceResponse.setSuccess(true);
            serviceResponse.setData(restTypes);
        }
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }
        return serviceResponse;
    }

    /**
     * 获取用车类型
     * @param token
     * @return
     * @throws IOException
     */
    public OldServiceResponse<List<OldOAUsingType>> getUsingTypeList(OldAccessToken token) throws IOException {
        OldServiceResponse<List<OldOAUsingType>> serviceResponse = new OldServiceResponse<List<OldOAUsingType>>();

        String usTypeUrl = OldServiceConstant.WORKFLOW_GET_USCARTYPE_URL;
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse response = HTTPUtil.sendGet(usTypeUrl, headers);

        Map<String, Object> usTypeJson = JSON.parseObject(response.getResult(), new TypeReference<Map<String, Object>>(){});
        boolean success = (Boolean)usTypeJson.get("isSucceed");
        if(success){
            List<OldOAUsingType> usingTypes = JSON.parseArray(JSON.toJSONString(usTypeJson.get("executedModel")), OldOAUsingType.class);
            serviceResponse.setSuccess(true);
            serviceResponse.setData(usingTypes);
        }

        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }
        return serviceResponse;
    }

    /**
     * 获取开始流程所需信息
     * @param token
     * @param workflowName  流程名称  请假:IHRM_AttendanceLeave  用车:IOA_Vehicle
     * @return
     */
    public OldServiceResponse<OldOAToDoInfoResponse> getToDoInfo(OldAccessToken token, String workflowName) throws IOException {
        assert workflowName!=null;
        assert workflowName.trim().length()>0;
        OldServiceResponse<OldOAToDoInfoResponse> serviceResponse = new OldServiceResponse<OldOAToDoInfoResponse>();
        /**
         * 1.获取流程图信息svg格式字符串  /bapi/api/WorkFlow/GetFlowSvgNodeStr
         * 2.获取流程开始信息 /bapi/api/WorkFlow/getWokFlowStartInfo
         * 3.获取用车类型    /bapi/api/HRC6CarUsingApply/GetUsingTypes   用车流程才需要
         * 4.获取请假类型    /bapi/api/HRC6RestApply/GetRestTypes        请假流程才需要
         * 5.获取审批流程步骤信息   /bapi/api/WorkFlow/GetWFStepInfo (上述任务完成后才执行此任务)
         */
        final Object lock = new Object();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse svgResponse = new HTTPResponse();
        HTTPResponse infoResponse = new HTTPResponse();
        HTTPResponse usTypeResponse = new HTTPResponse();
        HTTPResponse restTypeResponse = new HTTPResponse();

        //获取流程图svg字符串任务
        String svgUrl = OldServiceConstant.WORKFLOW_SVGSTR_URL;
        Map<String, Object> svgParam = new HashMap<String, Object>();
        svgParam.put("App_ID", 0);
        svgParam.put("AppTID", workflowName);
        List<HTTPResponse> svgRelationTasks = new ArrayList<HTTPResponse>();
        svgRelationTasks.add(infoResponse);
        if(isLeaveWorkflow(workflowName)){
            svgRelationTasks.add(restTypeResponse);
        }else if(isCarWorkflow(workflowName)) {
            svgRelationTasks.add(usTypeResponse);
        }
        HTTPTask svgTask = getTask(svgUrl, ConstantUtil.HTTP_METHOD_POST, svgParam, headers, lock, svgResponse, svgRelationTasks);

        //获取流程初始信息任务
        String infoUrl = OldServiceConstant.WORKFLOW_START_INFO_URL;
        List<HTTPResponse> infoRelationTasks = new ArrayList<HTTPResponse>();
        infoRelationTasks.add(svgResponse);
        if(isLeaveWorkflow(workflowName)){
            infoRelationTasks.add(restTypeResponse);
        }else if(isCarWorkflow(workflowName)) {
            infoRelationTasks.add(usTypeResponse);
        }
        HTTPTask infoTask = getTask(infoUrl, ConstantUtil.HTTP_METHOD_POST, workflowName, headers, lock, infoResponse, infoRelationTasks);

        //用车类型任务
        HTTPTask usTypeTask = null;
        //请假类型任务
        HTTPTask restTypeTask = null;
        List<HTTPResponse> typeRelationTasks = new ArrayList<HTTPResponse>();
        typeRelationTasks.add(svgResponse);
        typeRelationTasks.add(infoResponse);
        if(isCarWorkflow(workflowName)){
            String usTypeUrl = OldServiceConstant.WORKFLOW_GET_USCARTYPE_URL;
            usTypeTask = getTask(usTypeUrl, ConstantUtil.HTTP_METHOD_GET,null, headers, lock, usTypeResponse, typeRelationTasks);
        }else if(isLeaveWorkflow(workflowName)){
            String restTypeUrl = OldServiceConstant.WORKFLOW_GET_RESTTYPE_URL;
            restTypeTask = getTask(restTypeUrl, ConstantUtil.HTTP_METHOD_GET,null, headers, lock, restTypeResponse, typeRelationTasks);
        }

        //执行并发任务
        List<HTTPTask> tasks = new ArrayList<HTTPTask>();
        tasks.add(svgTask);
        tasks.add(infoTask);
        if(usTypeTask != null){
            tasks.add(usTypeTask);
        }
        if(restTypeTask != null){
            tasks.add(restTypeTask);
        }
        executeSync(serviceResponse, tasks, lock);

        //判断是否所有请求已处理成功
        boolean success = svgResponse.getCode()==HTTPResponse.SUCCESS && infoResponse.getCode()==HTTPResponse.SUCCESS;
        Map<String, Object> usTypeJson = null;
        Map<String, Object> restTypeJson = null;
        if(isCarWorkflow(workflowName)){
            success = success && usTypeResponse.getCode()==HTTPResponse.SUCCESS;
            if(success){
                usTypeJson = JSON.parseObject(usTypeResponse.getResult(), new TypeReference<Map<String, Object>>(){});
                success = success && (Boolean)usTypeJson.get("isSucceed");
            }
        }else if(isLeaveWorkflow(workflowName)){
            success = success && restTypeResponse.getCode()==HTTPResponse.SUCCESS;
            if(success){
                restTypeJson = JSON.parseObject(restTypeResponse.getResult(), new TypeReference<Map<String, Object>>(){});
                success = success && (Boolean)restTypeJson.get("isSucceed");
            }
        }

        if(success){
            OldOAToDoStartInfo startInfo = JSON.parseObject(infoResponse.getResult(), OldOAToDoStartInfo.class);
            if(startInfo.getSuccess()==1 && startInfo.getAppButton().size()>0){//请求成功
                //请求获取审批步骤接口
                String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
                Map<String, Object> stepParam = new HashMap<String, Object>();
                stepParam.put("ButtonType", startInfo.getAppButton().get(0).getButtonId());
                stepParam.put("appID", 0);
                stepParam.put("appTID", workflowName);
                stepParam.put("appVersion", "1.0");
                stepParam.put("businessId", "");
                stepParam.put("condition", "");
                stepParam.put("isNewFlag", getIsNewFlag(workflowName));
                HTTPResponse stepResponse = HTTPUtil.sendPostWithJson(stepUrl, stepParam, headers);
                Map<String, Object> stepJson = JSON.parseObject(stepResponse.getResult(), new TypeReference<Map<String, Object>>(){});
                if((Integer) stepJson.get("success") == 1){
                    List<OldOAToDoStepInfo> stepList = JSON.parseArray(JSON.toJSONString(stepJson.get("wfNextStepList")), OldOAToDoStepInfo.class);
                    OldOAToDoInfoResponse response = new OldOAToDoInfoResponse();
                    response.setWorkflowSvg(svgResponse.getResult());
                    response.setStartInfo(startInfo);
                    if(usTypeJson != null){
                        List<OldOAUsingType> usingTypes = JSON.parseArray(JSON.toJSONString(usTypeJson.get("executedModel")), OldOAUsingType.class);
                        response.setUsingTypes(usingTypes);
                    }
                    if(restTypeJson != null){
                        List<OldOARestType> restTypes = JSON.parseArray(JSON.toJSONString(restTypeJson.get("executedModel")), OldOARestType.class);
                        response.setRestTypes(restTypes);
                    }
                    response.setStepList(stepList);
                    serviceResponse.setSuccess(true);
                    serviceResponse.setData(response);
                }
            }
        }

        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }
        return serviceResponse;
    }

    /**
     * 提交请假流程
     * @param token
     * @param requestParam 请求参数
     * @return
     */
    public OldServiceResponse submitLeaveWorkflow(OldAccessToken token, OldOALeaveRequest requestParam) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        /**
         * 1.1. 调用新增请假流程的接口，保存请假数据
         * 1.2. 获取流程开始信息 api/WorkFlow/getWokFlowStartInfo
         * 2. 获取审批流程步骤信息   /bapi/api/WorkFlow/GetWFStepInfo (上述任务完成后才执行此任务)
         * 3. 调用流程办理接口，办理流程
         */
        final Object lock = new Object();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse addResponse = new HTTPResponse();
        HTTPResponse infoResponse = new HTTPResponse();

        //新增请假信息任务
        String addUrl = OldServiceConstant.WORKFLOW_ADDLEAVE_URL;
        Map<String, Object> addParam = JSON.parseObject(JSON.toJSONString(requestParam), new TypeReference<Map<String, Object>>(){});
        List<HTTPResponse> addRelationTasks = new ArrayList<HTTPResponse>();
        addRelationTasks.add(infoResponse);
        HTTPTask addTask = getTask(addUrl, ConstantUtil.HTTP_METHOD_POST, addParam, headers, lock, addResponse, addRelationTasks);

        //获取流程开始信息任务
        List<HTTPResponse> infoRelationTasks = new ArrayList<HTTPResponse>();
        infoRelationTasks.add(addResponse);
        HTTPTask infoTask = getStartInfoTask(WorkflowName.LEAVE.getValue(),
                token,
                lock,
                infoResponse,
                infoRelationTasks);

        //执行并发任务(新增请假数据、获取请假流程基础信息)
        List<HTTPTask> tasks = new ArrayList<HTTPTask>();
        tasks.add(addTask);
        tasks.add(infoTask);
        executeSync(serviceResponse, tasks, lock);

        //解析参数执行请求审批流程步骤信息的任务
        boolean success = addResponse.getCode()==HTTPResponse.SUCCESS && infoResponse.getCode()==HTTPResponse.SUCCESS;
        if(success) {
            Map<String, Object> addJson = JSON.parseObject(addResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            success = success && (Boolean)addJson.get("isSucceed");
            if(success) {
                OldOALeaveResponse addRes = JSON.parseObject(JSON.toJSONString(addJson.get("executedModel")), OldOALeaveResponse.class);
                success = success && addRes.isBuzDataSaveSucceed();
                if (success) {
                    OldOAToDoStartInfo startInfo = JSON.parseObject(infoResponse.getResult(), OldOAToDoStartInfo.class);
                    success = success && startInfo.getSuccess()==1 && startInfo.getAppButton().size()>0;
                    if(success){
                        serviceResponse = startWorkflow(token,
                                startInfo.getAppButton().get(0),
                                WorkflowName.LEAVE.getValue(),
                                requestParam.getWorkflowTitle(),
                                addRes.getIn_sp_id(),
                                addRes.getBuzPKID(),
                                null,
                                requestParam.getAppFieldName(),
                                0,
                                "1.0",
                                null);
                    }
                }
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 提交用车申请流程
     * @param token
     * @return
     */
    public OldServiceResponse submitUsingCarWorkflow(OldAccessToken token, OldOAUsCarRequest requestParam) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        /**
         * 1.1. 调用新增用车申请流程的接口，保存用车申请数据
         * 1.2. 获取流程开始信息 api/WorkFlow/getWokFlowStartInfo
         * 2. 获取审批流程步骤信息   /bapi/api/WorkFlow/GetWFStepInfo (上述任务完成后才执行此任务)
         * 3. 调用流程办理接口，办理流程
         */
        final Object lock = new Object();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse addResponse = new HTTPResponse();
        HTTPResponse infoResponse = new HTTPResponse();

        //保存用车申请的任务
        String addUrl = OldServiceConstant.WORKFLOW_ADDUSCAR_URL;
        Map<String, Object> addParam = JSON.parseObject(JSON.toJSONString(requestParam), new TypeReference<Map<String, Object>>(){});
        List<HTTPResponse> addRelationTasks = new ArrayList<HTTPResponse>();
        addRelationTasks.add(infoResponse);
        HTTPTask addTask = getTask(addUrl, ConstantUtil.HTTP_METHOD_POST, addParam, headers, lock, addResponse, addRelationTasks);

        //获取流程开始信息的任务
        List<HTTPResponse> infoRelationTasks = new ArrayList<HTTPResponse>();
        infoRelationTasks.add(addResponse);
        HTTPTask infoTask = getStartInfoTask(WorkflowName.USCAR.getValue(),
                token,
                lock,
                infoResponse,
                infoRelationTasks);

        //执行并发任务
        List<HTTPTask> tasks = new ArrayList<HTTPTask>();
        tasks.add(addTask);
        tasks.add(infoTask);
        executeSync(serviceResponse, tasks, lock);

        //解析任务执行结果，执行后续任务
        boolean success = addResponse.getCode()==HTTPResponse.SUCCESS && infoResponse.getCode()==HTTPResponse.SUCCESS;
        if(success){
            Map<String, Object> addJson = JSON.parseObject(addResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            success = success && (Boolean)addJson.get("isSucceed");
            if(success) {
                OldOAUsCarResponse addRes = JSON.parseObject(JSON.toJSONString(addJson.get("executedModel")), OldOAUsCarResponse.class);
                success = success && addRes.isBuzDataSaveSucceed();
                if(success){
                    OldOAToDoStartInfo startInfo = JSON.parseObject(infoResponse.getResult(), OldOAToDoStartInfo.class);
                    success = success && startInfo.getSuccess()==1 && startInfo.getAppButton().size()>0;
                    if(success){
                        serviceResponse = startWorkflow(token,
                                startInfo.getAppButton().get(0),
                                WorkflowName.USCAR.getValue(),
                                requestParam.getWorkflowTitle(),
                                addRes.getIn_sp_id(),
                                addRes.getBuzPKID(),
                                null,
                                requestParam.getAppFieldName(),
                                0,
                                "1.0",
                                null);
                    }
                }
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 办理流程
     * @param token
     * @param button 流程操作对象
     * @param workflowName 流程名称
     * @param workflowTitle 流程标题
     * @param in_sp_id
     * @param buzPKID 业务ID
     * @param currentStepId 当前审批步骤ID，可不填，默认选中流程列表第一步
     * @param appFieldName 审批人ID及用户名  可为空
     * @return
     */
    public OldServiceResponse submitWorkflow(OldAccessToken token,
                                             OldOAAppButton button,
                                             String workflowName,
                                             String workflowTitle,
                                             int in_sp_id,
                                             int buzPKID,
                                             String currentStepId,
                                             String appFieldName,
                                             int isNewFlag,
                                             String flowVersion,
                                             String targetStepId) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", button.getButtonId());
        stepParam.put("appID", button.getAppID()!=null?Integer.parseInt(button.getAppID()):0);
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", flowVersion);
        stepParam.put("businessId", "");
        stepParam.put("condition", "");
        stepParam.put("isNewFlag", getIsNewFlag(workflowName));
        HTTPResponse stepResponse = HTTPUtil.sendPostWithJson(stepUrl, stepParam, headers);
        Map<String, Object> stepJson = JSON.parseObject(stepResponse.getResult(), new TypeReference<Map<String, Object>>() {
        });
        if ((Integer) stepJson.get("success") == 1 || "9".equals(button.getButtonId())) {
            List<OldOAToDoStepInfo> stepList = JSON.parseArray(JSON.toJSONString(stepJson.get("wfNextStepList")), OldOAToDoStepInfo.class);
            if (stepList.size()>0 || "9".equals(button.getButtonId())) {
                //获取第一个审批步骤，组装参数，并执行流程办理任务
                int currentIndex = 0;
                if(targetStepId != null){
                    for (int i = 0; i < stepList.size(); i++) {
                        OldOAToDoStepInfo tmp = stepList.get(i);
                        if (targetStepId.equals(tmp.getNextStepID())) {
                            currentIndex = i;
                            break;
                        }
                    }
                }else {
                    if (currentStepId != null && !currentStepId.equals("null")) {
                        for (int i = 0; i < stepList.size(); i++) {
                            OldOAToDoStepInfo tmp = stepList.get(i);
                            if (currentStepId.equals(tmp.getNextStepID())) {
                                currentIndex = i;
                                break;
                            }
                        }
//                        if (stepList.size() > currentIndex + 1) {
//                            currentIndex++;
//                        }
                    }
                }

                OldOAToDoStepInfo step = stepList.size()>currentIndex?stepList.get(currentIndex):null;
                OldOAToDoAcceptUserInfo userInfo = null;
                if(step!=null && step.getAcceptUserInfo().size()>0 && appFieldName!=null){
                    for(int i=0; i<step.getAcceptUserInfo().size(); i++) {
                        OldOAToDoAcceptUserInfo tmp = step.getAcceptUserInfo().get(i);
                        if (appFieldName.equals(tmp.getAppFieldName())) {
                            userInfo = tmp;
                            break;
                        }
                    }
                }

                if(userInfo == null && step!=null){
                    if(step.getAcceptUserInfo().size() > 0){
                        userInfo = step.getAcceptUserInfo().get(0);
                    }
                }

                Map<String, Object> params = buildSubmitProcessParam(
                        !"5".equals(button.getButtonId()),
                        in_sp_id,
                        buzPKID,
                        Integer.parseInt(button.getAppID()),
                        workflowName,
                        workflowTitle,
                        Integer.parseInt(button.getButtonId()),
                        userInfo!=null?userInfo.getAppFieldName():null,
                        userInfo!=null?userInfo.getAppFieldValue():null,
                        step!=null?step.getNextStepID():null,
                        step!=null?step.getNextStepName():null,
                        isNewFlag,
                        flowVersion
                );
                String processUrl = OldServiceConstant.WORKFLOW_PROCESS_URL;
                HTTPResponse processResponse = HTTPUtil.sendPostWithJson(processUrl, params, headers);
                if (processResponse.getCode() == HTTPResponse.SUCCESS) {
                    Map<String, Object> processJson = JSON.parseObject(processResponse.getResult(), new TypeReference<Map<String, Object>>() {
                    });
                    if ((Boolean) processJson.get("isSucceed")) {
                        serviceResponse.setSuccess(true);
                    }
                }
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    public OldServiceResponse startWorkflow(OldAccessToken token,
                                             OldOAAppButton button,
                                             String workflowName,
                                             String workflowTitle,
                                             int in_sp_id,
                                             int buzPKID,
                                             String currentStepId,
                                             String appFieldName,
                                             int isNewFlag,
                                             String flowVersion,
                                             String targetStepId) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", button.getButtonId());
        stepParam.put("appID", button.getAppID()!=null?Integer.parseInt(button.getAppID()):0);
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", flowVersion);
        stepParam.put("businessId", "");
        stepParam.put("condition", "");
        stepParam.put("isNewFlag", 0);
        HTTPResponse stepResponse = HTTPUtil.sendPostWithJson(stepUrl, stepParam, headers);
        Map<String, Object> stepJson = JSON.parseObject(stepResponse.getResult(), new TypeReference<Map<String, Object>>() {
        });
        if ((Integer) stepJson.get("success") == 1 || "9".equals(button.getButtonId())) {
            List<OldOAToDoStepInfo> stepList = JSON.parseArray(JSON.toJSONString(stepJson.get("wfNextStepList")), OldOAToDoStepInfo.class);
            if (stepList.size()>0 || "9".equals(button.getButtonId())) {
                //获取第一个审批步骤，组装参数，并执行流程办理任务
                int currentIndex = 0;
                if(targetStepId != null){
                    for (int i = 0; i < stepList.size(); i++) {
                        OldOAToDoStepInfo tmp = stepList.get(i);
                        if (targetStepId.equals(tmp.getNextStepID())) {
                            currentIndex = i;
                            break;
                        }
                    }
                }else {
                    if (currentStepId != null && !currentStepId.equals("null")) {
                        for (int i = 0; i < stepList.size(); i++) {
                            OldOAToDoStepInfo tmp = stepList.get(i);
                            if (currentStepId.equals(tmp.getNextStepID())) {
                                currentIndex = i;
                                break;
                            }
                        }
                        if (stepList.size() > currentIndex + 1) {
                            currentIndex++;
                        }
                    }
                }

                OldOAToDoStepInfo step = stepList.size()>currentIndex?stepList.get(currentIndex):null;
                OldOAToDoAcceptUserInfo userInfo = null;
                if(step!=null && step.getAcceptUserInfo().size()>0 && appFieldName!=null){
                    for(int i=0; i<step.getAcceptUserInfo().size(); i++) {
                        OldOAToDoAcceptUserInfo tmp = step.getAcceptUserInfo().get(i);
                        if (appFieldName.equals(tmp.getAppFieldName())) {
                            userInfo = tmp;
                            break;
                        }
                    }
                }

                if(userInfo == null && step!=null){
                    if(step.getAcceptUserInfo().size() > 0){
                        userInfo = step.getAcceptUserInfo().get(0);
                    }
                }

                Map<String, Object> params = buildSubmitProcessParam(
                        !"5".equals(button.getButtonId()),
                        in_sp_id,
                        buzPKID,
                        Integer.parseInt(button.getAppID()),
                        workflowName,
                        workflowTitle,
                        Integer.parseInt(button.getButtonId()),
                        userInfo!=null?userInfo.getAppFieldName():null,
                        userInfo!=null?userInfo.getAppFieldValue():null,
                        step!=null?step.getNextStepID():null,
                        step!=null?step.getNextStepName():null,
                        isNewFlag,
                        flowVersion
                );
                Map<String, Object> buttonMap = (Map<String, Object>)params.get("button");
                buttonMap.put("isNewFlag", 0);

                String processUrl = OldServiceConstant.WORKFLOW_PROCESS_URL;
                HTTPResponse processResponse = HTTPUtil.sendPostWithJson(processUrl, params, headers);
                if (processResponse.getCode() == HTTPResponse.SUCCESS) {
                    Map<String, Object> processJson = JSON.parseObject(processResponse.getResult(), new TypeReference<Map<String, Object>>() {
                    });
                    if ((Boolean) processJson.get("isSucceed")) {
                        serviceResponse.setSuccess(true);
                    }
                }
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 组装办理流程接口的请求参数
     * @param agree  是否同意
     * @param in_sp_id
     * @param buzPKID
     * @param appID
     * @param workflowName
     * @param workflowTitle
     * @param buttonId
     * @param appFieldName
     * @param appFieldValue
     * @param nextStepID
     * @param nextStepName
     * @return
     */
    private Map<String, Object> buildSubmitProcessParam(
            boolean agree,
            int in_sp_id,
            int buzPKID,
            int appID,
            String workflowName,
            String workflowTitle,
            int buttonId,
            String appFieldName,
            String appFieldValue,
            String nextStepID,
            String nextStepName,
            int isNewFlag,
            String flowVersion) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("oaSPYJ", agree?"true":"false");
        params.put("oaSPID", in_sp_id);
        params.put("appOId", buzPKID);
        params.put("appOValue", 0);
        Map<String, Object> buttonParams = new HashMap<String, Object>();
        params.put("button", buttonParams);
        buttonParams.put("appFlag", "2");
        buttonParams.put("appID", appID);
        buttonParams.put("appIdea", "同意");
        buttonParams.put("appTID", workflowName);
        buttonParams.put("appTitle", workflowTitle);
        buttonParams.put("businessData", null);
        buttonParams.put("buttonId", buttonId);
        buttonParams.put("buttonValue", "");
        buttonParams.put("callCheckFlag", 0);
        Map<String, Object> callUsersParam = new HashMap<String, Object>();
        buttonParams.put("callUsers", callUsersParam);
        List<Object> stepUserArray = new ArrayList<Object>();
        callUsersParam.put("stepUser", stepUserArray);
        callUsersParam.put("mes", null);
        callUsersParam.put("success", 1);
        buttonParams.put("copyFlag", 0);
        List<Object> distributeUsersArray = new ArrayList<Object>();
        buttonParams.put("distributeUsers", distributeUsersArray);
        buttonParams.put("isJump", "");
        buttonParams.put("isNewFlag", getIsNewFlag(workflowName));
        buttonParams.put("isOrder", "");
        buttonParams.put("maxCount", "");
        buttonParams.put("mes", null);
        Map<String, Object> nextStepListParams = new HashMap<String, Object>();
        buttonParams.put("nextStepList", nextStepListParams);
        nextStepListParams.put("mes", null);
        nextStepListParams.put("success", 1);
        List<Object> wfNextStepListArray = new ArrayList<Object>();
        nextStepListParams.put("wfNextStepList", wfNextStepListArray);
        Map<String, Object> acceptUserInfoParams = new HashMap<String, Object>();
        wfNextStepListArray.add(acceptUserInfoParams);
        List<Object> acceptUserInfoArray = new ArrayList<Object>();
        acceptUserInfoParams.put("acceptUserInfo", acceptUserInfoArray);
        Map<String, Object> acceptUserInfo = new HashMap<String, Object>();
        acceptUserInfoArray.add(acceptUserInfo);
        acceptUserInfo.put("appFieldType", null);
        acceptUserInfo.put("appFieldName", appFieldName);
        acceptUserInfo.put("appFieldValue", appFieldValue);
        acceptUserInfoParams.put("callFlag", 1);
        acceptUserInfoParams.put("isMulti", null);
        acceptUserInfoParams.put("nextStepID", nextStepID);
        acceptUserInfoParams.put("nextStepName", nextStepName);
        acceptUserInfoParams.put("smsFlag", 0);
        acceptUserInfoParams.put("transactMode", 0);
        acceptUserInfoParams.put("mes", null);
        acceptUserInfoParams.put("success", 1);
        buttonParams.put("promptContent", agree?"同意":"退回");
        buttonParams.put("smsTransactFlag", 0);
        buttonParams.put("success", 1);
        buttonParams.put("version", flowVersion);
        return params;
    }

    /**
     * 获取下一步流程信息
     * @param token
     * @param buttonId 审批操作按钮ID
     * @param workflowName 流程名称
     * @param currentStepId 当前步骤ID 可为空
     * @return
     * @throws IOException
     */
    public OldServiceResponse<OldOAToDoStepInfo> getAcceptUserList(
            OldAccessToken token,
            String buttonId,
            String workflowName,
            String currentStepId,
            String flowVersion,
            String appID) throws IOException {
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", buttonId);
        stepParam.put("appID", appID==null?0:Integer.parseInt(appID));
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", flowVersion);
        stepParam.put("businessId", "");
        stepParam.put("condition", "");
        stepParam.put("isNewFlag", getIsNewFlag(workflowName));
        HTTPResponse stepResponse = HTTPUtil.sendPostWithJson(stepUrl, stepParam, headers);
        Map<String, Object> stepJson = JSON.parseObject(stepResponse.getResult(), new TypeReference<Map<String, Object>>() {
        });
        if ((Integer) stepJson.get("success") == 1) {
            List<OldOAToDoStepInfo> stepList = JSON.parseArray(JSON.toJSONString(stepJson.get("wfNextStepList")), OldOAToDoStepInfo.class);
            if (stepList.size() > 0) {
                //获取第一个审批步骤，组装参数，并执行流程办理任务
                int currentIndex = 0;
                if (currentStepId != null && !currentStepId.equals("null")) {
                    for (int i = 0; i < stepList.size(); i++) {
                        OldOAToDoStepInfo tmp = stepList.get(i);
                        if (currentStepId.equals(tmp.getNextStepID())) {
                            currentIndex = i;
                            break;
                        }
                    }
//                    if (stepList.size() > currentIndex + 1) {
//                        currentIndex++;
//                    }
                }
                OldOAToDoStepInfo step = stepList.get(currentIndex);
                serviceResponse.setSuccess(true);
                serviceResponse.setData(step);
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    public OldServiceResponse<OldOAToDoStepInfo> getStartAcceptUserList(
            OldAccessToken token,
            String buttonId,
            String workflowName,
            String currentStepId,
            String flowVersion,
            String appID) throws IOException {
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", buttonId);
        stepParam.put("appID", appID==null?0:Integer.parseInt(appID));
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", flowVersion);
        stepParam.put("businessId", "");
        stepParam.put("condition", "");
        stepParam.put("isNewFlag", 0);
        HTTPResponse stepResponse = HTTPUtil.sendPostWithJson(stepUrl, stepParam, headers);
        Map<String, Object> stepJson = JSON.parseObject(stepResponse.getResult(), new TypeReference<Map<String, Object>>() {
        });
        if ((Integer) stepJson.get("success") == 1) {
            List<OldOAToDoStepInfo> stepList = JSON.parseArray(JSON.toJSONString(stepJson.get("wfNextStepList")), OldOAToDoStepInfo.class);
            if (stepList.size() > 0) {
                //获取第一个审批步骤，组装参数，并执行流程办理任务
                int currentIndex = 0;
                if (currentStepId != null && !currentStepId.equals("null")) {
                    for (int i = 0; i < stepList.size(); i++) {
                        OldOAToDoStepInfo tmp = stepList.get(i);
                        if (currentStepId.equals(tmp.getNextStepID())) {
                            currentIndex = i;
                            break;
                        }
                    }
//                    if (stepList.size() > currentIndex + 1) {
//                        currentIndex++;
//                    }
                }
                OldOAToDoStepInfo step = stepList.get(currentIndex);
                serviceResponse.setSuccess(true);
                serviceResponse.setData(step);
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 获取流程步骤信息
     * @param token
     * @param buttonId
     * @param workflowName
     * @param appID
     * @return
     * @throws IOException
     */
    public OldServiceResponse<List<OldOAToDoStepInfo>> getStepList(OldAccessToken token,
                                                                   String buttonId,
                                                                   String workflowName,
                                                                   String appID,
                                                                   String flowVersion) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", buttonId);
        stepParam.put("appID", appID==null?0:Integer.parseInt(appID));
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", flowVersion);
        stepParam.put("businessId", "");
        stepParam.put("condition", "");
        stepParam.put("isNewFlag", getIsNewFlag(workflowName));
        HTTPResponse stepResponse = HTTPUtil.sendPostWithJson(stepUrl, stepParam, headers);
        Map<String, Object> stepJson = JSON.parseObject(stepResponse.getResult(), new TypeReference<Map<String, Object>>() {
        });
        if ((Integer) stepJson.get("success") == 1) {
            List<OldOAToDoStepInfo> stepList = JSON.parseArray(JSON.toJSONString(stepJson.get("wfNextStepList")), OldOAToDoStepInfo.class);
            serviceResponse.setSuccess(true);
            serviceResponse.setData(stepList);
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 查询消息类型列表
     * @param token
     * @return
     * @throws IOException
     */
    public OldServiceResponse<List<OldOAMessageType>> getMessageTypeList(OldAccessToken token) throws IOException {
        OldServiceResponse<List<OldOAMessageType>> serviceResponse = new OldServiceResponse<List<OldOAMessageType>>();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        Map<String, Object> params = new HashMap<String, Object>();
        HTTPResponse response = HTTPUtil.sendPostWithJson(OldServiceConstant.MESSAGE_TYPE_LIST_URL, params, headers);
        if(response.getCode() == HTTPResponse.SUCCESS){
            Map<String, Object> responseJson = JSON.parseObject(response.getResult(), new TypeReference<Map<String, Object>>(){});
            if((Boolean) responseJson.get("isSucceed")){
                List<OldOAMessageType> msgTypes = JSONArray.parseArray(JSON.toJSONString(responseJson.get("executedModel")), OldOAMessageType.class);
                serviceResponse.setSuccess(true);
                serviceResponse.setData(msgTypes);
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 根据消息类型查询新闻消息
     * @param mainType 新闻类型ID
     * @param pageIndex 页码  从0开始
     * @param pageSize  每页消息条数
     * @param token 访问token
     * @return
     * @throws IOException
     */
    public OldServiceResponse<List<OldOAMessage>> getMessageListWithType(
            String mainType, int pageIndex, int pageSize, OldAccessToken token) throws IOException {
        OldServiceResponse<List<OldOAMessage>> serviceResponse = new OldServiceResponse<List<OldOAMessage>>();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("MainType", mainType);
        params.put("pageIndex", pageIndex);
        params.put("pageSize", pageSize);
        HTTPResponse response = HTTPUtil.sendPostWithJson(OldServiceConstant.MESSAGE_BY_TYPE_URL, params, headers);
        if(response.getCode() == HTTPResponse.SUCCESS){
            Map<String, Object> responseJson = JSON.parseObject(response.getResult(), new TypeReference<Map<String, Object>>(){});
            if((Boolean) responseJson.get("isSucceed")){
                List<Map<Object, Object>> dataListJson = (List<Map<Object, Object>>)
                        ((Map<String, Object>)responseJson.get("executedModel")).get("data");
                List<OldOAMessage> msgs = JSONArray.parseArray(
                        JSONArray.toJSONString(dataListJson), OldOAMessage.class);
                serviceResponse.setSuccess(true);
                serviceResponse.setData(msgs);
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    /**
     * 查询用户信息
     * @param token
     * @return
     * @throws IOException
     */
    public OldServiceResponse<OldOAUser> getUserInfo(OldAccessToken token) throws IOException {
        OldServiceResponse<OldOAUser> serviceResponse = new OldServiceResponse<OldOAUser>();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse response = HTTPUtil.sendGet(OldServiceConstant.USER_INFO_URL, headers);
                //HTTPUtil.sendPostWithJson(OldServiceConstant.USER_INFO_URL, null, headers);
        if(response.getCode() == HTTPResponse.SUCCESS){
            Map<String, Object> responseJson = JSON.parseObject(response.getResult(), new TypeReference<Map<String, Object>>(){});
            if((Boolean) responseJson.get("isSucceed")){
                OldOAUser user = JSON.parseObject(JSON.toJSONString(responseJson.get("executedModel")), OldOAUser.class);
                serviceResponse.setSuccess(true);
                serviceResponse.setData(user);
            }
        }

        //任务没有全部执行成功
        if(!serviceResponse.isSuccess()){
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        return serviceResponse;
    }

    private int getIsNewFlag(String workflowName) {
//        if(isLeaveWorkflow(workflowName) || isCarWorkflow(workflowName)){
//            return 0;
//        }else {
            return 1;
//        }
    }

    /**
     * 判断是否是请假流程
     * @param workflowName 流程名称
     * @return
     */
    private boolean isLeaveWorkflow(String workflowName) {
        return WorkflowName.LEAVE.getValue().equals(workflowName);
    }

    /**
     * 判断是否是用车申请流程
     * @param workflowName 流程名称
     * @return
     */
    private boolean isCarWorkflow(String workflowName) {
        return WorkflowName.USCAR.getValue().equals(workflowName);
    }

    /**
     * 拷贝请求结果
     * @param response 目标请求，需要写入数据的对象
     * @param tmpResponse 请求完成获得的临时对象
     */
    private void completeWithResponse(HTTPResponse response, HTTPResponse tmpResponse) {
        response.setComplete(true);
        response.setCode(tmpResponse.getCode());
        response.setResult(tmpResponse.getResult());
    }

    /**
     * 批量提交异步任务，并同步处理结果
     * @param tasks 需要执行的任务序列
     * @param lock 同步锁
     */
    private void executeSync(OldServiceResponse serviceResponse, List<HTTPTask> tasks, Object lock) {
        try {
            synchronized (lock) {
                for(HTTPTask task : tasks){
                    taskExecutor.execute(task);
                }
                lock.wait();
            }
        }catch (InterruptedException e) {
            e.printStackTrace();
            serviceResponse.setSuccess(false);
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /**
     * 根据参数生成HTTP请求任务
     * @param url 目标URL
     * @param method HTTP方法  GET/POST
     * @param param 参数  map 或 字符串
     * @param headers 请求头
     * @param lock 同步锁
     * @param doResponse 执行目标任务的请求结果
     * @param relationTasks 需要同步的关联任务
     * @return
     */
    private HTTPTask getTask(String url, String method, Object param, Map<String, String> headers, final Object lock, final HTTPResponse doResponse, final List<HTTPResponse> relationTasks){
        HTTPTask task = new HTTPTask(url, method, param, headers, new HTTPTaskCallback() {
            public void requestComplete(HTTPResponse response) {
                completeWithResponse(doResponse, response);
                synchronized (lock) {
                    if(tasksAllComplete(relationTasks)){
                        lock.notify();
                    }
                }
            }
        });
        return task;
    }

    /**
     * 生成获取流程初始信息的任务
     * @param token
     * @param lock
     * @param infoResponse
     * @param infoRelationTasks
     * @return
     */
    private HTTPTask getStartInfoTask(String workflowName, OldAccessToken token, Object lock, HTTPResponse infoResponse, List<HTTPResponse> infoRelationTasks) {
        String infoUrl = OldServiceConstant.WORKFLOW_START_INFO_URL;
        HTTPTask infoTask = getTask(infoUrl,
                ConstantUtil.HTTP_METHOD_POST,
                workflowName,
                HTTPUtil.getAuthHeaders(token),
                lock,
                infoResponse,
                infoRelationTasks);
        return infoTask;
    }

    /**
     * 任务是否全部完成
     * @param tasks
     * @return
     */
    private boolean tasksAllComplete(List<HTTPResponse> tasks) {
        boolean complete = true;
        for(HTTPResponse response : tasks) {
            if(!response.isComplete()){
                complete = false;
                break;
            }
        }
        return complete;
    }

    /**
     * 设置请假流程需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpLevelDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object applyObj = detailJson.get("applyUserChnName");
        Object typeObj = detailJson.get("attLT_Name");
        Object startObj = detailJson.get("rest_start_date");
        Object startTypeObj = detailJson.get("startType");
        Object endObj = detailJson.get("rest_end_date");
        Object endTypeObj = detailJson.get("endType");
        Object daysObj = detailJson.get("rest_day_num");
        Object reasonObj = detailJson.get("attL_Reason");

        //1.申请人
        OldOaDetailField applyField = new OldOaDetailField();
        applyField.setFieldName("申请人");
        applyField.setFieldValue(applyObj);
        detail.getFields().add(applyField);
        //2.休假类型
        OldOaDetailField typeField = new OldOaDetailField();
        typeField.setFieldName("休假类型");
        typeField.setFieldValue(typeObj);
        detail.getFields().add(typeField);
        //3.开始时间
        OldOaDetailField startField = new OldOaDetailField();
        startField.setFieldName("开始时间");
        startField.setFieldValue(startObj);
        detail.getFields().add(startField);
        //4.开始类型
        OldOaDetailField startTypeField = new OldOaDetailField();
        startTypeField.setFieldName("类型");
        startTypeField.setFieldValue(startTypeObj);
        detail.getFields().add(startTypeField);
        //5.结束时间
        OldOaDetailField endField = new OldOaDetailField();
        endField.setFieldName("结束时间");
        endField.setFieldValue(endObj);
        detail.getFields().add(endField);
        //6.结束类型
        OldOaDetailField endTypeField = new OldOaDetailField();
        endTypeField.setFieldName("类型");
        endTypeField.setFieldValue(endTypeObj);
        detail.getFields().add(endTypeField);
        //7.休假天数
        OldOaDetailField daysField = new OldOaDetailField();
        daysField.setFieldName("休假天数");
        daysField.setFieldValue(daysObj);
        detail.getFields().add(daysField);
        //8.休假原因
        OldOaDetailField reasonField = new OldOaDetailField();
        reasonField.setFieldName("休假原因");
        reasonField.setFieldValue(reasonObj);
        detail.getFields().add(reasonField);
    }

    /**
     * 设置用车流程需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpUsCarDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object applyObj = detailJson.get("applyUserChnName");
        Object deptObj = detailJson.get("applyUserDeptName");
        Object phoneObj = detailJson.get("applyUserCellphone");
        Object useTypeObj = detailJson.get("applyUsingType");
        Object overObj = detailJson.get("driverIsOverWork");
        Object countObj = detailJson.get("inCarNums");
        Object spandObj = detailJson.get("carUsingHours");
        Object useTimeObj = detailJson.get("usingCarTime");
        Object rangeObj = detailJson.get("usingCarRange");
        Object toObj = detailJson.get("dest");
        Object fromObj = detailJson.get("startPoint");
        Object reasonObj = detailJson.get("usingReason");

        //1.申请人
        OldOaDetailField applyField = new OldOaDetailField();
        applyField.setFieldName("申请人");
        applyField.setFieldValue(applyObj);
        detail.getFields().add(applyField);
        //2.用车部门
        OldOaDetailField deptField = new OldOaDetailField();
        deptField.setFieldName("用车部门");
        deptField.setFieldValue(deptObj);
        detail.getFields().add(deptField);
        //3.联系电话
        OldOaDetailField phoneField = new OldOaDetailField();
        phoneField.setFieldName("联系电话");
        phoneField.setFieldValue(phoneObj);
        detail.getFields().add(phoneField);
        //4.用车性质
        OldOaDetailField useTypeField = new OldOaDetailField();
        useTypeField.setFieldName("用车性质");
        useTypeField.setFieldValue(useTypeObj);
        detail.getFields().add(useTypeField);
        //5.司机是否加班
        boolean over = overObj!=null?(Boolean)overObj:false;
        OldOaDetailField overField = new OldOaDetailField();
        overField.setFieldName("司机是否加班");
        overField.setFieldValue(overObj);
        detail.getFields().add(overField);
        //6.用车人数
        OldOaDetailField countField = new OldOaDetailField();
        countField.setFieldName("用车人数");
        countField.setFieldValue(countObj);
        detail.getFields().add(countField);
        //7.占用时间
        OldOaDetailField spandField = new OldOaDetailField();
        spandField.setFieldName("占用时间");
        spandField.setFieldValue(spandObj);
        detail.getFields().add(spandField);
        //8.用车时间
        OldOaDetailField useTimeField = new OldOaDetailField();
        useTimeField.setFieldName("用车时间");
        useTimeField.setFieldValue(useTimeObj);
        detail.getFields().add(useTimeField);
        //9.市内/市外
        OldOaDetailField rangeField = new OldOaDetailField();
        rangeField.setFieldName("市内/市外");
        rangeField.setFieldValue(rangeObj);
        detail.getFields().add(rangeField);
        //10.去往地点
        OldOaDetailField toField = new OldOaDetailField();
        toField.setFieldName("去往地点");
        toField.setFieldValue(toObj);
        detail.getFields().add(toField);
        //11.发车地点
        OldOaDetailField fromField = new OldOaDetailField();
        fromField.setFieldName("发车地点");
        fromField.setFieldValue(fromObj);
        detail.getFields().add(fromField);
        //12.申请原因
        OldOaDetailField reasonField = new OldOaDetailField();
        reasonField.setFieldName("申请原因");
        reasonField.setFieldValue(reasonObj);
        detail.getFields().add(reasonField);
    }

    /**
     * 设置成品会签要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpChengPinDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object leaderObj = detailJson.get("fzr");
        Object reportObj = detailJson.get("baogaobianhao");
        Object endObj = detailJson.get("zhonggaowcsj");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.负责人
        OldOaDetailField leaderField = new OldOaDetailField();
        leaderField.setFieldName("负责人");
        leaderField.setFieldValue(leaderObj);
        detail.getFields().add(leaderField);
        //6.报告编号
        OldOaDetailField reportField = new OldOaDetailField();
        reportField.setFieldName("报告编号");
        reportField.setFieldValue(reportObj);
        detail.getFields().add(reportField);
        //7.终稿完成时间
        OldOaDetailField endField = new OldOaDetailField();
        endField.setFieldName("终稿完成时间");
        endField.setFieldValue(endObj);
        detail.getFields().add(endField);
    }

    /**
     * 设置预审修改稿需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpYuShenXiuGaiGaoDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object leaderObj = detailJson.get("fzr");
        Object reportObj = detailJson.get("baogaobianhao");
        Object endObj = detailJson.get("xiugaigaowcsj");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.负责人
        OldOaDetailField leaderField = new OldOaDetailField();
        leaderField.setFieldName("负责人");
        leaderField.setFieldValue(leaderObj);
        detail.getFields().add(leaderField);
        //6.报告编号
        OldOaDetailField reportField = new OldOaDetailField();
        reportField.setFieldName("报告编号");
        reportField.setFieldValue(reportObj);
        detail.getFields().add(reportField);
        //7.修改稿完成时间
        OldOaDetailField endField = new OldOaDetailField();
        endField.setFieldName("修改稿完成时间");
        endField.setFieldValue(endObj);
        detail.getFields().add(endField);
    }

    /**
     * 设置现场踏勘详情需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXianChangTaKanDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object leaderObj = detailJson.get("fzr");
        Object peopleObj = detailJson.get("xianchangtakanrys");
        Object caseObj = detailJson.get("takanqingkuang");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.负责人
        OldOaDetailField leaderField = new OldOaDetailField();
        leaderField.setFieldName("负责人");
        leaderField.setFieldValue(leaderObj);
        detail.getFields().add(leaderField);
        //6.现场踏勘人员
        OldOaDetailField peopleField = new OldOaDetailField();
        peopleField.setFieldName("现场踏勘人员");
        peopleField.setFieldValue(peopleObj);
        detail.getFields().add(peopleField);
        //7.踏勘情况
        OldOaDetailField caseField = new OldOaDetailField();
        caseField.setFieldName("踏勘情况");
        caseField.setFieldValue(caseObj);
        detail.getFields().add(caseField);
    }

    /**
     * 设置顾客财产需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpGuKeCaiChanDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object leaderObj = detailJson.get("fzr");
        Object contentObj = detailJson.get("gukecaichanneirong");
        Object opinionObj = detailJson.get("yanzhengyijian");
        Object opinionRemarkObj = detailJson.get("yanzhengyijiansm");
        Object applyObj = detailJson.get("isShiyong");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.负责人
        OldOaDetailField leaderField = new OldOaDetailField();
        leaderField.setFieldName("负责人");
        leaderField.setFieldValue(leaderObj);
        detail.getFields().add(leaderField);
        //6.顾客财产的内容
        OldOaDetailField contentField = new OldOaDetailField();
        contentField.setFieldName("顾客财产的内容");
        contentField.setFieldValue(contentObj);
        detail.getFields().add(contentField);
        //7.验证意见
        OldOaDetailField opinionField = new OldOaDetailField();
        opinionField.setFieldName("验证意见");
        opinionField.setFieldValue(opinionObj);
        detail.getFields().add(opinionField);
        //8.验证意见说明
        OldOaDetailField opinionRemarkField = new OldOaDetailField();
        opinionRemarkField.setFieldName("验证意见说明");
        opinionRemarkField.setFieldValue(opinionRemarkObj);
        detail.getFields().add(opinionRemarkField);
        //9.适用情况
        OldOaDetailField applyField = new OldOaDetailField();
        applyField.setFieldName("适用情况");
        applyField.setFieldValue(applyObj);
        detail.getFields().add(applyField);
    }

    /**
     * 设置项目计划需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXiangMuJiHuaDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object startObj = detailJson.get("kaishishijian");
        Object endObj = detailJson.get("jiezhishijian");
        Object tenetObj = detailJson.get("gzyj_zygzyz");
        Object rangeObj = detailJson.get("gongzuofanwei");
        Object qualityObj = detailJson.get("zlxxfkqkyy");
        Object controlObj = detailJson.get("zlkzcs");
        Object riskObj = detailJson.get("hyfx_zywt");
        Object timeObj = detailJson.get("shijiananpai");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.开始时间
        OldOaDetailField startField = new OldOaDetailField();
        startField.setFieldName("开始时间");
        startField.setFieldValue(startObj);
        detail.getFields().add(startField);
        //6.结束时间
        OldOaDetailField endField = new OldOaDetailField();
        endField.setFieldName("结束时间");
        endField.setFieldValue(endObj);
        detail.getFields().add(endField);
        //7.作依据及主要工作原则
        OldOaDetailField tenetField = new OldOaDetailField();
        tenetField.setFieldName("作依据及主要工作原则");
        tenetField.setFieldValue(tenetObj);
        detail.getFields().add(tenetField);
        //8.工作范围
        OldOaDetailField rangeField = new OldOaDetailField();
        rangeField.setFieldName("工作范围");
        rangeField.setFieldValue(rangeObj);
        detail.getFields().add(rangeField);
        //9.质量信息反馈情况的应用
        OldOaDetailField qualityField = new OldOaDetailField();
        qualityField.setFieldName("质量信息反馈情况的应用");
        qualityField.setFieldValue(qualityObj);
        detail.getFields().add(qualityField);
        //10.质量控制措施
        OldOaDetailField controlField = new OldOaDetailField();
        controlField.setFieldName("质量控制措施");
        controlField.setFieldValue(controlObj);
        detail.getFields().add(controlField);
        //11.行业风险及注意问题
        OldOaDetailField riskField = new OldOaDetailField();
        riskField.setFieldName("行业风险及注意问题");
        riskField.setFieldValue(riskObj);
        detail.getFields().add(riskField);
        //12.时间安排
        OldOaDetailField timeField = new OldOaDetailField();
        timeField.setFieldName("时间安排");
        timeField.setFieldValue(timeObj);
        detail.getFields().add(timeField);
    }

    /**
     * 设置项目计划变更需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXiangMuJiHuaBianGengDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        setUpXiangMuJiHuaDetailFields(detail, detailJson);
    }

    /**
     * 设置项目组成员需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXiangMuZuChengYuanDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object leaderObj = detailJson.get("xmtd_fzr");
        Object remarkObj = detailJson.get("xmtd_sm");
        Object memberObj = detailJson.get("subList");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.负责人
        OldOaDetailField leaderField = new OldOaDetailField();
        leaderField.setFieldName("负责人");
        leaderField.setFieldValue(leaderObj);
        detail.getFields().add(leaderField);
        //6.项目团队说明
        OldOaDetailField remarkField = new OldOaDetailField();
        remarkField.setFieldName("项目团队说明");
        remarkField.setFieldValue(remarkObj);
        detail.getFields().add(remarkField);
        //7.项目成员
        if(memberObj != null) {
            List<Map<String, Object>> memberList = (List<Map<String, Object>>) memberObj;
            for(int i=0; i<memberList.size(); i++){
                Map<String, Object> member = memberList.get(i);
                OldOaDetailField memberField = new OldOaDetailField();
                memberField.setFieldName("项目组成员"+(i+1));
                StringBuilder memberInfo = new StringBuilder();
                memberInfo.append(member.get("xingming")).append("-");
                memberInfo.append(member.get("xingbie")).append("-");
                memberInfo.append(member.get("xiangmujuese")).append("-");
                memberInfo.append(member.get("lianxifangshi")).append("-");
                memberInfo.append(member.get("bumen"));
                memberField.setFieldValue(memberInfo.toString());
                detail.getFields().add(memberField);
            }
        }
    }

    /**
     * 设置项目组成员变更需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXiangMuZuChengYuanBianGengDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        setUpXiangMuZuChengYuanDetailFields(detail, detailJson);
//        Object titleObj = detailJson.get("workflowTitle");
//        Object serialObj = detailJson.get("lsh");
//        Object projectObj = detailJson.get("xiangmumingcheng");
//        Object noObj = detailJson.get("xiangmubianhao");
//        Object leaderObj = detailJson.get("xmtd_fzr");
//        Object remarkObj = detailJson.get("xmtd_sm");
//        Object memberObj = detailJson.get("subList");
//
//        //1.流程标题
//        OldOaDetailField titleField = new OldOaDetailField();
//        titleField.setFieldName("流程标题");
//        titleField.setFieldValue(titleObj!=null?(String)titleObj:"");
//        detail.getFields().add(titleField);
//        //2.流水号
//        OldOaDetailField serialField = new OldOaDetailField();
//        serialField.setFieldName("流水号");
//        serialField.setFieldValue(serialObj!=null?(String)serialObj:"");
//        detail.getFields().add(serialField);
//        //3.项目名称
//        OldOaDetailField projectField = new OldOaDetailField();
//        projectField.setFieldName("项目名称");
//        projectField.setFieldValue(projectObj!=null?(String)projectObj:"");
//        detail.getFields().add(projectField);
//        //4.项目编号
//        OldOaDetailField noField = new OldOaDetailField();
//        noField.setFieldName("项目编号");
//        noField.setFieldValue(noObj!=null?(String)noObj:"");
//        detail.getFields().add(noField);
//        //5.负责人
//        OldOaDetailField leaderField = new OldOaDetailField();
//        leaderField.setFieldName("负责人");
//        leaderField.setFieldValue(leaderObj!=null?(String)leaderObj:"");
//        detail.getFields().add(leaderField);
//        //6.项目团队说明
//        OldOaDetailField remarkField = new OldOaDetailField();
//        remarkField.setFieldName("项目团队说明");
//        remarkField.setFieldValue(remarkObj!=null?(String)remarkObj:"");
//        detail.getFields().add(remarkField);
//        //7.项目成员
//        if(memberObj != null) {
//            List<Map<String, Object>> memberList = (List<Map<String, Object>>) memberObj;
//            for(int i=0; i<memberList.size(); i++){
//                Map<String, Object> member = memberList.get(i);
//                OldOaDetailField memberField = new OldOaDetailField();
//                memberField.setFieldName("项目组成员"+(i+1));
//                StringBuilder memberInfo = new StringBuilder();
//                memberInfo.append(member.get("xingming")!=null?(String) member.get("xingming"):"").append("-");
//                memberInfo.append(member.get("xingbie")!=null?(String) member.get("xingbie"):"").append("-");
//                memberInfo.append(member.get("xiangmujuese")!=null?(String) member.get("xiangmujuese"):"").append("-");
//                memberInfo.append(member.get("lianxifangshi")!=null?(String) member.get("lianxifangshi"):"").append("-");
//                memberInfo.append(member.get("bumen")!=null?(String) member.get("bumen"):"");
//                memberField.setFieldValue(memberInfo.toString());
//                detail.getFields().add(memberField);
//            }
//        }
    }

    /**
     * 设置项目开工通知单流程需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXiangMuKaiGongTongZhiDanDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object contractTitleObj = detailJson.get("hetongbiaoti");
        Object contractNoObj = detailJson.get("hetongbianhao");
        Object natureObj = detailJson.get("jianshexingzhi");
        Object customerObj = detailJson.get("jianshedanweimc");
        Object contactObj = detailJson.get("jianshedanwei_lxrmc");
        Object phoneObj = detailJson.get("jianshedanwei_lxdh");
        Object contractObj = detailJson.get("hetong_weituoshu");
        Object approvalObj = detailJson.get("lixiang_lxr");
        Object startObj = detailJson.get("kaigongriqi");
        Object endObj = detailJson.get("beian_jfrq");
        Object deptObj = detailJson.get("guishubumen");
        Object requieObj = detailJson.get("xiangguanyaoqiu");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.合同标题
        OldOaDetailField contractTitleField = new OldOaDetailField();
        contractTitleField.setFieldName("合同标题");
        contractTitleField.setFieldValue(contractTitleObj);
        detail.getFields().add(contractTitleField);
        //6.合同编号
        OldOaDetailField contractNoField = new OldOaDetailField();
        contractNoField.setFieldName("合同编号");
        contractNoField.setFieldValue(contractNoObj);
        detail.getFields().add(contractNoField);
        //7.建设性质
        OldOaDetailField natureField = new OldOaDetailField();
        natureField.setFieldName("建设性质");
        natureField.setFieldValue(natureObj);
        detail.getFields().add(natureField);
        //8.建设单位(客户)
        OldOaDetailField customerField = new OldOaDetailField();
        customerField.setFieldName("建设单位(客户)");
        customerField.setFieldValue(customerObj);
        detail.getFields().add(customerField);
        //9.建设单位联系人
        OldOaDetailField contactField = new OldOaDetailField();
        contactField.setFieldName("建设单位联系人");
        contactField.setFieldValue(contactObj);
        detail.getFields().add(contactField);
        //10.联系电话
        OldOaDetailField phoneField = new OldOaDetailField();
        phoneField.setFieldName("联系电话");
        phoneField.setFieldValue(phoneObj);
        detail.getFields().add(phoneField);
        //11.合同或委托书
        OldOaDetailField contractField = new OldOaDetailField();
        contractField.setFieldName("合同或委托书");
        contractField.setFieldValue(contractObj);
        detail.getFields().add(contractField);
        //12.立项联系人
        OldOaDetailField approvalField = new OldOaDetailField();
        approvalField.setFieldName("立项联系人");
        approvalField.setFieldValue(approvalObj);
        detail.getFields().add(approvalField);
        //9.开工日期
        OldOaDetailField startField = new OldOaDetailField();
        startField.setFieldName("开工日期");
        startField.setFieldValue(startObj);
        detail.getFields().add(startField);
        //10.备案/交付日期
        OldOaDetailField endField = new OldOaDetailField();
        endField.setFieldName("备案/交付日期");
        endField.setFieldValue(endObj);
        detail.getFields().add(endField);
        //11.归属部门
        OldOaDetailField deptField = new OldOaDetailField();
        deptField.setFieldName("归属部门");
        deptField.setFieldValue(deptObj);
        detail.getFields().add(deptField);
        //12.相关要求
        OldOaDetailField requieField = new OldOaDetailField();
        requieField.setFieldName("相关要求");
        requieField.setFieldValue(requieObj);
        detail.getFields().add(requieField);
    }

    /**
     * 设置项目开工通知单变更需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXiangMuKaiGongTongZhiDanBianGengDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xiangmumingcheng");
        Object noObj = detailJson.get("xiangmubianhao");
        Object contractTitleObj = detailJson.get("hetongbiaoti");
        Object contractNoObj = detailJson.get("hetongbianhao");
        Object natureObj = detailJson.get("jianshexingzhi");
        Object customerObj = detailJson.get("jianshedanweimc");
        Object contactObj = detailJson.get("jianshedanwei_lxrmc");
        Object phoneObj = detailJson.get("jianshedanwei_lxdh");
        Object contractObj = detailJson.get("hetong_weituoshu");
        Object approvalObj = detailJson.get("lixiang_lxr");
        Object startObj = detailJson.get("kaigongriqi");
        Object endObj = detailJson.get("beian_jfrq");
        Object deptObj = detailJson.get("guishubumen");
        Object requieObj = detailJson.get("xiangguanyaoqiu");
        Object remarkObj = detailJson.get("biangengshuoming");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //3.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //4.项目编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("项目编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.合同标题
        OldOaDetailField contractTitleField = new OldOaDetailField();
        contractTitleField.setFieldName("合同标题");
        contractTitleField.setFieldValue(contractTitleObj);
        detail.getFields().add(contractTitleField);
        //6.合同编号
        OldOaDetailField contractNoField = new OldOaDetailField();
        contractNoField.setFieldName("合同编号");
        contractNoField.setFieldValue(contractNoObj);
        detail.getFields().add(contractNoField);
        //7.建设性质
        OldOaDetailField natureField = new OldOaDetailField();
        natureField.setFieldName("建设性质");
        natureField.setFieldValue(natureObj);
        detail.getFields().add(natureField);
        //8.建设单位(客户)
        OldOaDetailField customerField = new OldOaDetailField();
        customerField.setFieldName("建设单位(客户)");
        customerField.setFieldValue(customerObj);
        detail.getFields().add(customerField);
        //9.建设单位联系人
        OldOaDetailField contactField = new OldOaDetailField();
        contactField.setFieldName("建设单位联系人");
        contactField.setFieldValue(contactObj);
        detail.getFields().add(contactField);
        //10.联系电话
        OldOaDetailField phoneField = new OldOaDetailField();
        phoneField.setFieldName("联系电话");
        phoneField.setFieldValue(phoneObj);
        detail.getFields().add(phoneField);
        //11.合同或委托书
        OldOaDetailField contractField = new OldOaDetailField();
        contractField.setFieldName("合同或委托书");
        contractField.setFieldValue(contractObj);
        detail.getFields().add(contractField);
        //12.立项联系人
        OldOaDetailField approvalField = new OldOaDetailField();
        approvalField.setFieldName("立项联系人");
        approvalField.setFieldValue(approvalObj);
        detail.getFields().add(approvalField);
        //13.开工日期
        OldOaDetailField startField = new OldOaDetailField();
        startField.setFieldName("开工日期");
        startField.setFieldValue(startObj);
        detail.getFields().add(startField);
        //14.备案/交付日期
        OldOaDetailField endField = new OldOaDetailField();
        endField.setFieldName("备案/交付日期");
        endField.setFieldValue(endObj);
        detail.getFields().add(endField);
        //15.归属部门
        OldOaDetailField deptField = new OldOaDetailField();
        deptField.setFieldName("归属部门");
        deptField.setFieldValue(deptObj);
        detail.getFields().add(deptField);
        //16.相关要求
        OldOaDetailField requieField = new OldOaDetailField();
        requieField.setFieldName("相关要求");
        requieField.setFieldValue(requieObj);
        detail.getFields().add(requieField);
        //17.变更说明
        OldOaDetailField remarkField = new OldOaDetailField();
        remarkField.setFieldName("变更说明");
        remarkField.setFieldValue(remarkObj);
        detail.getFields().add(remarkField);
    }

    /**
     * 设置合同会签申请需要展示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpHeTongHuiQianShenQingDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object titleObj = detailJson.get("workflowTitle");
        Object contractTitleObj = detailJson.get("hetongbiaoti");
        Object contractNoObj = detailJson.get("hetongbianhao");
        Object connectObj = detailJson.get("guanlianhetong");
        Object customerObj = detailJson.get("khmc");
        Object applyDateObj = detailJson.get("chuangjianriqi");
        Object receiveObj = detailJson.get("shouruleixing");
        Object buzDeptObj = detailJson.get("yewubumen");
        Object amountObj = detailJson.get("chengjiaojine");
        Object industryObj = detailJson.get("suoshuhangye");
        Object ownerTypeObj = detailJson.get("yezhuleixing");
        Object peopleObj = detailJson.get("guishuren");
        Object deptObj = detailJson.get("hetongcbbm");
        Object natureObj = detailJson.get("hetongxingzhi");
        Object contentObj = detailJson.get("yezhuxuqiu");

        //1.流程标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("流程标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //2.合同名称
        OldOaDetailField contractTitleField = new OldOaDetailField();
        contractTitleField.setFieldName("合同名称");
        contractTitleField.setFieldValue(contractTitleObj);
        detail.getFields().add(contractTitleField);
        //3.合同编号
        OldOaDetailField contractNoField = new OldOaDetailField();
        contractNoField.setFieldName("合同编号");
        contractNoField.setFieldValue(contractNoObj);
        detail.getFields().add(contractNoField);
        //4.关联合同
        OldOaDetailField connectField = new OldOaDetailField();
        connectField.setFieldName("关联合同");
        connectField.setFieldValue(connectObj);
        detail.getFields().add(connectField);
        //5.客户
        OldOaDetailField customerField = new OldOaDetailField();
        customerField.setFieldName("客户");
        customerField.setFieldValue(customerObj);
        detail.getFields().add(customerField);
        //6.申请日期
        OldOaDetailField applyDateField = new OldOaDetailField();
        applyDateField.setFieldName("申请日期");
        applyDateField.setFieldValue(applyDateObj);
        detail.getFields().add(applyDateField);
        //7.回款方式
        OldOaDetailField receiveField = new OldOaDetailField();
        receiveField.setFieldName("回款方式");
        receiveField.setFieldValue(receiveObj);
        detail.getFields().add(receiveField);
        //8.业务部门
        OldOaDetailField buzDeptField = new OldOaDetailField();
        buzDeptField.setFieldName("业务部门");
        buzDeptField.setFieldValue(buzDeptObj);
        detail.getFields().add(buzDeptField);
        //9.合同金额(万元)
        OldOaDetailField amountField = new OldOaDetailField();
        amountField.setFieldName("合同金额(万元)");
        amountField.setFieldValue(amountObj);
        detail.getFields().add(amountField);
        //10.所属行业
        OldOaDetailField industryField = new OldOaDetailField();
        industryField.setFieldName("所属行业");
        industryField.setFieldValue(industryObj);
        detail.getFields().add(industryField);
        //11.业主类型
        OldOaDetailField ownerTypeField = new OldOaDetailField();
        ownerTypeField.setFieldName("业主类型");
        ownerTypeField.setFieldValue(ownerTypeObj);
        detail.getFields().add(ownerTypeField);
        //12.合同经办人
        OldOaDetailField peopleField = new OldOaDetailField();
        peopleField.setFieldName("合同经办人");
        peopleField.setFieldValue(peopleObj);
        detail.getFields().add(peopleField);
        //13.合同承办部门
        OldOaDetailField deptField = new OldOaDetailField();
        deptField.setFieldName("合同承办部门");
        deptField.setFieldValue(deptObj);
        detail.getFields().add(deptField);
        //14.合同性质
        OldOaDetailField natureField = new OldOaDetailField();
        natureField.setFieldName("合同性质");
        natureField.setFieldValue(natureObj);
        detail.getFields().add(natureField);
        //15.合同主要内容
        OldOaDetailField contentField = new OldOaDetailField();
        contentField.setFieldName("合同主要内容");
        contentField.setFieldValue(contentObj);
        detail.getFields().add(contentField);
    }

    /**
     * 设置合同变更申请需要展示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpHeTongBianGengShenQingDeailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        setUpHeTongHuiQianShenQingDetailFields(detail, detailJson);
    }

    /**
     * 设置项目风险分析需要展示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXiangMuFengXianFenXiDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object serialObj = detailJson.get("lsh");
        Object projectObj = detailJson.get("xmfx_xiangmumingcheng");
        Object scaleObj = detailJson.get("gongchengguimo");
        Object customerObj = detailJson.get("khmc");
        Object surveyObj = detailJson.get("xiangmugaikuang");
        Object riskObj = detailJson.get("zyfx_cpyqps");
        Object resultObj = detailJson.get("fx_psjg");

        //1.流水号
        OldOaDetailField serialField = new OldOaDetailField();
        serialField.setFieldName("流水号");
        serialField.setFieldValue(serialObj);
        detail.getFields().add(serialField);
        //2.项目名称
        OldOaDetailField projectField = new OldOaDetailField();
        projectField.setFieldName("项目名称");
        projectField.setFieldValue(projectObj);
        detail.getFields().add(projectField);
        //3.工程规模
        OldOaDetailField scaleField = new OldOaDetailField();
        scaleField.setFieldName("工程规模");
        scaleField.setFieldValue(scaleObj);
        detail.getFields().add(scaleField);
        //4.客户
        OldOaDetailField customerField = new OldOaDetailField();
        customerField.setFieldName("客户");
        customerField.setFieldValue(customerObj);
        detail.getFields().add(customerField);
        //5.项目概况
        OldOaDetailField surveyField = new OldOaDetailField();
        surveyField.setFieldName("项目概况");
        surveyField.setFieldValue(surveyObj);
        detail.getFields().add(surveyField);
        //6.主要风险分析 产品要求评审
        OldOaDetailField riskField = new OldOaDetailField();
        riskField.setFieldName("主要风险分析 产品要求评审");
        riskField.setFieldValue(riskObj);
        detail.getFields().add(riskField);
        //7.分析/评审结果
        OldOaDetailField resultField = new OldOaDetailField();
        resultField.setFieldName("分析/评审结果");
        resultField.setFieldValue(resultObj);
        detail.getFields().add(resultField);
    }

    /**
     * 设置新闻中心流程需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpXinWenZhongXinDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object applyObj = detailJson.get("djr");
        Object typeObj = detailJson.get("messageType");
        Object typeNameObj = detailJson.get("moduleTypeName");
        Object titleObj = detailJson.get("messageTitle");
        Object deptObj = detailJson.get("");
        Object dateObj = detailJson.get("publishDateTime");
        Object contentObj = detailJson.get("zwmc");

        //1.申请人
        OldOaDetailField applyField = new OldOaDetailField();
        applyField.setFieldName("申请人");
        applyField.setFieldValue(applyObj);
        detail.getFields().add(applyField);
        //2.信息类型
        StringBuilder messageContent = new StringBuilder();
        messageContent.append(typeNameObj).append(typeObj);
        OldOaDetailField typeField = new OldOaDetailField();
        typeField.setFieldName("信息类型");
        typeField.setFieldValue(messageContent.toString());
        detail.getFields().add(typeField);
        //3.标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //4.查看部门
        OldOaDetailField deptField = new OldOaDetailField();
        deptField.setFieldName("查看部门");
        deptField.setFieldValue(deptObj);
        detail.getFields().add(deptField);
        //5.发布日期
        OldOaDetailField dateField = new OldOaDetailField();
        dateField.setFieldName("发布日期");
        dateField.setFieldValue(dateObj);
        detail.getFields().add(dateField);
        //6.发布内容
        OldOaDetailField contentField = new OldOaDetailField();
        contentField.setFieldName("发布内容");
        contentField.setFieldValue(contentObj);
        detail.getFields().add(contentField);
    }

    /**
     * 设置请示办理流程需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpQingShiBanLiDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object applyObj = detailJson.get("djr");
        Object typeObj = detailJson.get("askType");
        Object titleObj = detailJson.get("askTitle");
        Object contentObj = detailJson.get("fileName");

        //1.申请人
        OldOaDetailField applyField = new OldOaDetailField();
        applyField.setFieldName("申请人");
        applyField.setFieldValue(applyObj);
        detail.getFields().add(applyField);
        //2.请示类型
        OldOaDetailField typeField = new OldOaDetailField();
        typeField.setFieldName("请示类型");
        typeField.setFieldValue(typeObj);
        detail.getFields().add(typeField);
        //3.请示标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("请示标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //4.请示正文
        OldOaDetailField contentField = new OldOaDetailField();
        contentField.setFieldName("请示正文");
        contentField.setFieldValue(contentObj);
        detail.getFields().add(contentField);
    }

    /**
     * 设置收文办理流程需要显示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpShouWenBanLiDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object applyObj = detailJson.get("djr");
        Object typeObj = detailJson.get("acceptType");
        Object titleObj = detailJson.get("acceptTitle");
        Object noObj = detailJson.get("acceptNO");
        Object dateObj = detailJson.get("acceptDate");
        Object fromObj = detailJson.get("acceptFrom");
        Object keyObj = detailJson.get("acceptKey");
        Object contentObj = detailJson.get("zwmc");

        //1.申请人
        OldOaDetailField applyField = new OldOaDetailField();
        applyField.setFieldName("申请人");
        applyField.setFieldValue(applyObj);
        detail.getFields().add(applyField);
        //2.收文类型
        OldOaDetailField typeField = new OldOaDetailField();
        typeField.setFieldName("收文类型");
        typeField.setFieldValue(typeObj);
        detail.getFields().add(typeField);
        //3.来文标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("来文标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //4.收文编号
        OldOaDetailField noField = new OldOaDetailField();
        noField.setFieldName("收文编号");
        noField.setFieldValue(noObj);
        detail.getFields().add(noField);
        //5.收文日期
        OldOaDetailField dateField = new OldOaDetailField();
        dateField.setFieldName("收文日期");
        dateField.setFieldValue(dateObj);
        detail.getFields().add(dateField);
        //6.来文单位
        OldOaDetailField fromField = new OldOaDetailField();
        fromField.setFieldName("来文单位");
        fromField.setFieldValue(fromObj);
        detail.getFields().add(fromField);
        //7.关键词
        OldOaDetailField keyField = new OldOaDetailField();
        keyField.setFieldName("关键词");
        keyField.setFieldValue(keyObj);
        detail.getFields().add(keyField);
        //8.正文名称
        OldOaDetailField contentField = new OldOaDetailField();
        contentField.setFieldName("正文名称");
        contentField.setFieldValue(contentObj);
        detail.getFields().add(contentField);
    }

    /**
     * 设置发文办理流程需要展示的字段
     * @param detail
     * @param detailJson
     */
    private void setUpFaWenBanLiDetailFields(OldOAToDoDetail detail, Map<String, Object> detailJson) {
        Object applyObj = detailJson.get("djr");
        Object typeObj = detailJson.get("fwlx");
        Object titleObj = detailJson.get("sendTitle");
        Object toObj = detailJson.get("sendZsdw");
        Object keyObj = detailJson.get("sendKey");
        Object fromObj = detailJson.get("sendfwbm");
        Object dateObj = detailJson.get("subDate");
        Object contentObj = detailJson.get("zwmc");

        //1.申请人
        OldOaDetailField applyField = new OldOaDetailField();
        applyField.setFieldName("申请人");
        applyField.setFieldValue(applyObj);
        detail.getFields().add(applyField);
        //2.发文类型
        OldOaDetailField typeField = new OldOaDetailField();
        typeField.setFieldName("发文类型");
        typeField.setFieldValue(typeObj);
        detail.getFields().add(typeField);
        //3.发文标题
        OldOaDetailField titleField = new OldOaDetailField();
        titleField.setFieldName("发文标题");
        titleField.setFieldValue(titleObj);
        detail.getFields().add(titleField);
        //4.主送单位
        OldOaDetailField toField = new OldOaDetailField();
        toField.setFieldName("主送单位");
        toField.setFieldValue(toObj);
        detail.getFields().add(toField);
        //5.关键词
        OldOaDetailField keyField = new OldOaDetailField();
        keyField.setFieldName("关键词");
        keyField.setFieldValue(keyObj);
        detail.getFields().add(keyField);
        //6.发文部门
        OldOaDetailField fromField = new OldOaDetailField();
        fromField.setFieldName("发文部门");
        fromField.setFieldValue(fromObj);
        detail.getFields().add(fromField);
        //7.发文日期
        OldOaDetailField dateField = new OldOaDetailField();
        dateField.setFieldName("发文日期");
        dateField.setFieldValue(dateObj);
        detail.getFields().add(dateField);
        //8.正文名称
        OldOaDetailField contentField = new OldOaDetailField();
        contentField.setFieldName("正文名称");
        contentField.setFieldValue(contentObj);
        detail.getFields().add(contentField);
    }

    /**
     * 获取年度计划查询信息
     * @param empNo 工号
     * @param year 年度
     * @param pageNo 第几页
     * @param pageSize 每页多少条数据
     * @return
     * @throws Exception
     */
    public List<PlanVo> getAYXZ_yearPlan(String empNo,String year,String opNo,int pageNo,int pageSize) throws Exception{
        List<PlanVo> list=null;
        String service_url;
        if(StringUtils.isEmpty(opNo)){
            service_url=OldServiceConstant.AYXZ_YEAR_PLAN_URL+"/"+empNo+"/"+year;
        }else{
            service_url=OldServiceConstant.AYXZ_YEAR_PLAN_URL+"/"+empNo+"/"+year+"/"+opNo;
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("pageNo",pageNo);
        param.put("pageSize",pageSize);
        String result=HttpClientUtil.httpGetRequest(service_url,param);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONArray array = (JSONArray) r1.get("data");
            if (array != null && !array.isEmpty()) {
                list = JSON.parseArray(array.toString(), PlanVo.class);
            }
        }
        return list;
    }

    /**
     * 获取月度计划查询信息
     * @param empNo 工号
     * @param year 年度
     * @param month 月份
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<PlanVo> getAYXZ_monthPlan(String empNo,String year,String month,String opNo,int pageNo,int pageSize) throws Exception{
        List<PlanVo> list=null;
        String service_url;
        if(StringUtils.isEmpty(opNo)){
            service_url=OldServiceConstant.AYXZ_MONTH_PLAN_URL+"/"+empNo+"/"+year+"/"+month;
        }else{
            service_url=OldServiceConstant.AYXZ_MONTH_PLAN_URL+"/"+empNo+"/"+year+"/"+month+"/"+opNo;
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("pageNo",pageNo);
        param.put("pageSize",pageSize);
        String result=HttpClientUtil.httpGetRequest(service_url,param);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONArray array = (JSONArray) r1.get("data");
            if (array != null && !array.isEmpty()) {
                list = JSON.parseArray(array.toString(), PlanVo.class);
            }
        }
        return list;
    }

    /**
     * 获取周计划查询信息
     * @param empNo 工号
     * @param year 年度
     * @param week 多少周
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<PlanVo> getAYXZ_weekPlan(String empNo,String year,String week,String opNo,int pageNo,int pageSize) throws Exception{
        List<PlanVo> list=null;
        String service_url;
        if(StringUtils.isEmpty(opNo)){
            service_url=OldServiceConstant.AYXZ_WEEK_PLAN_URL+"/"+empNo+"/"+year+"/"+week;
        }else{
            service_url=OldServiceConstant.AYXZ_WEEK_PLAN_URL+"/"+empNo+"/"+year+"/"+week+"/"+opNo;
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("pageNo",pageNo);
        param.put("pageSize",pageSize);
        String result=HttpClientUtil.httpGetRequest(service_url,param);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONArray array = (JSONArray) r1.get("data");
            if (array != null && !array.isEmpty()) {
                list = JSON.parseArray(array.toString(), PlanVo.class);
            }
        }
        return list;
    }

    /**
     * 获取个人工作信息
     * @param empNo 工号
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<PlanVo> getAYXZ_selfWork(String empNo,String opNo,int pageNo,int pageSize) throws Exception{
        List<PlanVo> list=null;
        String service_url;
        if(StringUtils.isEmpty(opNo)){
            service_url=OldServiceConstant.AYXZ_SELF_PLAN_URL+"/"+empNo;
        }else{
            service_url=OldServiceConstant.AYXZ_SELF_PLAN_URL+"/"+empNo+"/"+opNo;
        }
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("pageNo",pageNo);
        param.put("pageSize",pageSize);
        String result=HttpClientUtil.httpGetRequest(service_url,param);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONArray array = (JSONArray) r1.get("data");
            if (array != null && !array.isEmpty()) {
                list = JSON.parseArray(array.toString(), PlanVo.class);
            }
        }
        return list;
    }

    /**
     * 获取ayxz转义集合
     * @param type 待转义类型
     * @return
     * @throws Exception
     */
    public Map<String,String> getAYXZ_conver(String type) throws Exception{
        Map<String,String> map=new HashMap<>();
        String service_url=OldServiceConstant.AYXZ_CONVER_URL+"/"+type;
        String result=HttpClientUtil.httpGetRequest(service_url);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONObject array = (JSONObject) r1.get("data");
            if (array != null && !array.isEmpty()) {
                map = JSON.parseObject(array.toString(),Map.class);
            }
        }
        return map;
    }

    /**
     * 获取单个工作或计划详情
     * @param opId
     * @param opType
     * @return
     * @throws Exception
     */
    public PlanVo getAYXZ_planWorkDetail(String opId,String opType) throws Exception{
        PlanVo planVo=null;
        String service_url=OldServiceConstant.AYXZ_PLAN_WORK_DETAIL_URL+"/"+opType+"/"+opId;
        String result=HttpClientUtil.httpGetRequest(service_url);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONArray array = (JSONArray) r1.get("data");
            if (array != null && !array.isEmpty()) {
                planVo = JSON.parseObject(array.toString(), PlanVo.class);
            }
        }
        return planVo;
    }

    /**
     * 修改个人工作
     * @param planVo
     * @return
     * @throws Exception
     */
    public Map<String,String> updateAYXZ_selfWork(PlanVo planVo) throws Exception{
        Map<String, Object> headers=new HashMap<>();
        headers.put("Content-Type","application/json");
        Map<String,String> map=new HashMap<>();
        String service_url=OldServiceConstant.AYXZ_UPDATE_SELF_WORK_URL+"/"+planVo.getOpId();
        String result=HttpClientUtil.httpPostRequest(service_url,headers,JSON.toJSONString(planVo));
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONObject array = (JSONObject) r1.get("data");
            if (array != null && !array.isEmpty()) {
                map = JSON.parseObject(array.toString(),Map.class);
            }
        }
        return map;
    }


    /**
     * 修改月度计划
     * @param planVo
     * @return
     * @throws Exception
     */
    public Map<String,String> updateAYXZ_monthPlan(PlanVo planVo) throws Exception{
        Map<String, Object> headers=new HashMap<>();
        headers.put("Content-Type","application/json");
        Map<String,String> map=new HashMap<>();
        String service_url=OldServiceConstant.AYXZ_UPDATE_MONTH_PLAN_URL+"/"+planVo.getOpId();
        String result=HttpClientUtil.httpPostRequest(service_url,headers,JSON.toJSONString(planVo));
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONObject array = (JSONObject) r1.get("data");
            if (array != null && !array.isEmpty()) {
                map = JSON.parseObject(array.toString(),Map.class);
            }
        }
        return map;
    }

    /**
     * 选入本周
     * @param opId
     * @return
     * @throws Exception
     */
    public Map<String,String> changeAYXZ_thisWeek(String opId) throws Exception{
        Map<String,String> map=new HashMap<>();
        String service_url=OldServiceConstant.AYXZ_SELTO_THISWEEK_URL+"/"+opId;
        String result=HttpClientUtil.httpPostRequest(service_url);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONObject array = (JSONObject) r1.get("data");
            if (array != null && !array.isEmpty()) {
                map = JSON.parseObject(array.toString(),Map.class);
            }
        }
        return map;
    }

    /**
     * 选入下周
     * @param opId
     * @return
     * @throws Exception
     */
    public Map<String,String> changeAYXZ_nextWeek(String opId) throws Exception{
        Map<String,String> map=new HashMap<>();
        String service_url=OldServiceConstant.AYXZ_SELTO_NEXTWEEK_URL+"/"+opId;
        String result=HttpClientUtil.httpPostRequest(service_url);
        JSONObject r1=JSONObject.parseObject(result);
        if (r1 != null && !r1.isEmpty()) {
            JSONObject array = (JSONObject) r1.get("data");
            if (array != null && !array.isEmpty()) {
                map = JSON.parseObject(array.toString(),Map.class);
            }
        }
        return map;
    }
//    public static void main(String[] args) {
//        String service_url="http://101.37.171.186:8081/ayxz/dorado/yearPlan/admin/2018";
//        Map<String, Object> param = new HashMap<String, Object>();
//        param.put("pageNo",1);
//        param.put("pageSize",10);
//        try {
//            String result=HttpClientUtil.httpGetRequest(service_url,param);
//            System.out.println(result);
//        } catch (URISyntaxException e) {
//            e.printStackTrace();
//        }
//    }
}
