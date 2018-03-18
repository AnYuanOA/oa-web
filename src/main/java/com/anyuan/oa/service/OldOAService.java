package com.anyuan.oa.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.TypeReference;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.request.OldOALeaveRequest;
import com.anyuan.oa.model.request.OldOAProcessWorkflowRequest;
import com.anyuan.oa.model.request.OldOAUsCarRequest;
import com.anyuan.oa.model.response.*;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.HTTPUtil;
import com.anyuan.oa.utils.OldServiceConstant;
import com.anyuan.oa.utils.WorkflowName;
import com.anyuan.oa.utils.thread.HTTPTask;
import com.anyuan.oa.utils.thread.HTTPTaskCallback;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
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
        param.put("count", 100);
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
        param.put("PageSize", 100);
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
        if(WorkflowName.LEAVE.getValue().equals(workflowName)){
            detail = JSON.parseObject(result, OldOAToDoDetail.class);
        }else if(WorkflowName.USCAR.getValue().equals(workflowName)){
            if(detailJson.get("applyUsingType") != null) {
                detail.setAttLT_Name((String) detailJson.get("applyUsingType"));
            }
            if(detailJson.get("usingReason") != null){
                detail.setAttL_Reason((String) detailJson.get("usingReason"));
            }
        }else if(WorkflowName.CHENGPIN.getValue().equals(workflowName) ||
                WorkflowName.YUSHENXIUGAIGAO.getValue().equals(workflowName)
                ){
            if(detailJson.get("baogaomingcheng") != null){
                detail.setAttLT_Name((String) detailJson.get("baogaomingcheng"));
            }
            if(detailJson.get("xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xiangmumingcheng"));
            }
        }else if(WorkflowName.XIANCHANGTAKAN.getValue().equals(workflowName)){
            if(detailJson.get("takanqingkuang") != null){
                detail.setAttLT_Name((String) detailJson.get("takanqingkuang"));
            }
            if(detailJson.get("xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xiangmumingcheng"));
            }
        }else if(WorkflowName.GUKECAICHAN.getValue().equals(workflowName)){
            if(detailJson.get("gukecaichanneirong") != null){
                detail.setAttLT_Name((String) detailJson.get("gukecaichanneirong"));
            }
            if(detailJson.get("xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xiangmumingcheng"));
            }
        }else if(WorkflowName.XIANGMUJIHUA.getValue().equals(workflowName)){
            if(detailJson.get("gongzuofanwei") != null){
                detail.setAttLT_Name((String) detailJson.get("gongzuofanwei"));
            }
            if(detailJson.get("xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xiangmumingcheng"));
            }
        }else if(WorkflowName.XIANGMUJIHUABIANGENG.getValue().equals(workflowName) ||
                WorkflowName.XIANGMUZUCHENGYUANBIANGENG.getValue().equals(workflowName) ||
                WorkflowName.XIANGMUKAIGONGTONGZHIDANBIANGENG.getValue().equals(workflowName)){
            if(detailJson.get("biangengshuoming") != null){
                detail.setAttLT_Name((String) detailJson.get("biangengshuoming"));
            }
            if(detailJson.get("xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xiangmumingcheng"));
            }
        }else if(WorkflowName.XIANGMUZUCHENGYUAN.getValue().equals(workflowName)){
            if(detailJson.get("xmtd_sm") != null){
                detail.setAttLT_Name((String) detailJson.get("xmtd_sm"));
            }
            if(detailJson.get("xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xiangmumingcheng"));
            }
        }else if(WorkflowName.XIANGMUKAIGONGTONGZHIDAN.getValue().equals(workflowName)){
            if(detailJson.get("xiangguanyaoqiu") != null){
                detail.setAttLT_Name((String) detailJson.get("xiangguanyaoqiu"));
            }
            if(detailJson.get("xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xiangmumingcheng"));
            }
        }else if(WorkflowName.HETONGBIANGENGSHENQING.getValue().equals(workflowName)){
            if(detailJson.get("biangengshuoming") != null){
                detail.setAttLT_Name((String) detailJson.get("biangengshuoming"));
            }
            if(detailJson.get("hetongbiaoti") != null){
                detail.setAttL_Reason((String) detailJson.get("hetongbiaoti"));
            }
        }else if(WorkflowName.HETONGHUIQIANSHENQING.getValue().equals(workflowName)){
            if(detailJson.get("yezhuxuqiu") != null){
                detail.setAttLT_Name((String) detailJson.get("yezhuxuqiu"));
            }
            if(detailJson.get("hetongbiaoti") != null){
                detail.setAttL_Reason((String) detailJson.get("hetongbiaoti"));
            }
        }else if(WorkflowName.XIANGMUFENGXIANFENXI.getValue().equals(workflowName)){
            if(detailJson.get("xiangmugaikuang") != null){
                detail.setAttLT_Name((String) detailJson.get("xiangmugaikuang"));
            }
            if(detailJson.get("xmfx_xiangmumingcheng") != null){
                detail.setAttL_Reason((String) detailJson.get("xmfx_xiangmumingcheng"));
            }
        }else if(WorkflowName.XINWENZHONGXIN.getValue().equals(workflowName)){
            if(detailJson.get("moduleTypeName") != null){
                detail.setAttLT_Name((String) detailJson.get("moduleTypeName"));
            }
            if(detailJson.get("messageTitle") != null){
                detail.setAttL_Reason((String) detailJson.get("messageTitle"));
            }
        }else if(WorkflowName.QINGSHIBANLI.getValue().equals(workflowName)){
            if(detailJson.get("askType") != null){
                detail.setAttLT_Name((String) detailJson.get("askType"));
            }
            if(detailJson.get("askTitle") != null){
                detail.setAttL_Reason((String) detailJson.get("askTitle"));
            }
        }else if(WorkflowName.SHOUWENBANLILIUCHENG.getValue().equals(workflowName)){
            if(detailJson.get("acceptType") != null){
                detail.setAttLT_Name((String) detailJson.get("acceptType"));
            }
            if(detailJson.get("acceptTitle") != null){
                detail.setAttL_Reason((String) detailJson.get("acceptTitle"));
            }
        }else if(WorkflowName.FAWENBANLILIUCHENG.getValue().equals(workflowName)){
            if(detailJson.get("sendKey") != null){
                detail.setAttLT_Name((String) detailJson.get("sendKey"));
            }
            if(detailJson.get("sendTitle") != null){
                detail.setAttL_Reason((String) detailJson.get("sendTitle"));
            }
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
                stepParam.put("isNewFlag", 0);
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
                        serviceResponse = submitWorkflow(token,
                                startInfo.getAppButton().get(0),
                                WorkflowName.LEAVE.getValue(),
                                requestParam.getWorkflowTitle(),
                                addRes.getIn_sp_id(),
                                addRes.getBuzPKID(),
                                null,
                                requestParam.getAppFieldName());
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
                        serviceResponse = submitWorkflow(token,
                                startInfo.getAppButton().get(0),
                                WorkflowName.USCAR.getValue(),
                                requestParam.getWorkflowTitle(),
                                addRes.getIn_sp_id(),
                                addRes.getBuzPKID(),
                                null,
                                requestParam.getAppFieldName());
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
                                             String appFieldName) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", button.getButtonId());
        stepParam.put("appID", button.getAppID()!=null?Integer.parseInt(button.getAppID()):0);
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", "1.0");
        stepParam.put("businessId", "");
        stepParam.put("condition", "");
        stepParam.put("isNewFlag", "5".equals(button.getButtonId())?1:0);
        HTTPResponse stepResponse = HTTPUtil.sendPostWithJson(stepUrl, stepParam, headers);
        Map<String, Object> stepJson = JSON.parseObject(stepResponse.getResult(), new TypeReference<Map<String, Object>>() {
        });
        if ((Integer) stepJson.get("success") == 1 || "9".equals(button.getButtonId())) {
            List<OldOAToDoStepInfo> stepList = JSON.parseArray(JSON.toJSONString(stepJson.get("wfNextStepList")), OldOAToDoStepInfo.class);
            if (stepList.size()>0 || "9".equals(button.getButtonId())) {
                //获取第一个审批步骤，组装参数，并执行流程办理任务
                int currentIndex = 0;
                if(currentStepId != null  && !currentStepId.equals("null")){
                    for(int i=0; i<stepList.size(); i++){
                        OldOAToDoStepInfo tmp = stepList.get(i);
                        if(currentStepId.equals(tmp.getNextStepID())){
                            currentIndex = i;
                            break;
                        }
                    }
                    if(stepList.size() > currentIndex+1){
                        currentIndex++;
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
                        step!=null?step.getNextStepName():null
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
            String nextStepName) {
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
        buttonParams.put("isNewFlag", buttonId==9?1:0);
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
        buttonParams.put("version", "1.0");
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
    public OldServiceResponse<List<OldOAToDoAcceptUserInfo>> getAcceptUserList(
            OldAccessToken token,
            String buttonId,
            String workflowName,
            String currentStepId) throws IOException {
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", buttonId);
        stepParam.put("appID", 0);
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", "1.0");
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
                    if (stepList.size() > currentIndex + 1) {
                        currentIndex++;
                    }
                }
                OldOAToDoStepInfo step = stepList.get(currentIndex);
                serviceResponse.setSuccess(true);
                serviceResponse.setData(step.getAcceptUserInfo());
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
     * @return
     * @throws IOException
     */
    public OldServiceResponse<List<OldOAToDoStepInfo>> getStepList(OldAccessToken token, String buttonId, String workflowName) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", buttonId);
        stepParam.put("appID", 0);
        stepParam.put("appTID", workflowName);
        stepParam.put("appVersion", "1.0");
        stepParam.put("businessId", "");
        stepParam.put("condition", "");
        stepParam.put("isNewFlag", 0);
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
}
