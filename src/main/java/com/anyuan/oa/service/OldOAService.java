package com.anyuan.oa.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.response.*;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.HTTPUtil;
import com.anyuan.oa.utils.thread.HTTPTask;
import com.anyuan.oa.utils.thread.HTTPTaskCallback;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/1.
 */
@Component("oldOAService")
public class OldOAService {
    /**
     * 基础URL
     */
    private static final String BASE_URL = "http://101.37.171.186/bapi/";
    /**
     * 基础业务URL
     */
    private static final String BASE_URL_BUZAPI = "http://101.37.171.186/aymapi/";
    /**
     * 登录URI
     */
    private static final String TOKEN_URL = "Token";
    /**
     * 待办列表URI
     */
    private static final String TODO_URL = "api/WorkFlow/getMyWFList";
    /***
     * 待阅列表
     */
    private static final String TOREAD_URL = "api/WorkFlow/GetWaitReadInfos";
    /**
     * 待办详情URI
     * */
    private static final String TODO_DETAIL_URL = "api/HRC6RestApply/Detail";
    /**
     * 获取流程详细信息
     */
    private static final String WORKFLOW_OPERATION_INFO = "api/WorkFlow/getWFDetailInfoNew";
    /**
     * 获取流程附件列表
     */
    private static final String WORKFLOW_ATTACHS = "api/HRC6RestApply/GetAttachs";
    /**
     * 获取流程办理列表
     * */
    private static final String WORKFLOW_DEALT_INFO = "api/workflow/getWFDealtInfo";
    /**
     * 待办附件列表URI
     * */
    private static final String TODO_ATTACHMENT_URL = "api/C6DjAttachs/GetDJAttachsByDJBH";
    /**
     * 获取下移步骤URI
     */
    private static final String TODO_NEXT_STEP_URL = "api/WorkFlow/GetWorkflowNextSteps";
    /**
     * 获取下一步审批人URI
     */
    private static final String TODO_NEXT_APPROVERS_URL = "api/WorkFlow/GetWorkflowNextApprovers";

    /**
     * 授权类型
     */
    private static final String GRANT_TYPE = "password";
    /**
     * 客户端ID
     */
    private static final String CLIENT_ID = "imWebBrowser";

    @Resource(name = "taskExecutor")
    private ThreadPoolTaskExecutor taskExecutor;

    /**
     * 登录 (返回的accessToken保存在session中，供后续接口调用使用)
     * @param username 用户名
     * @param password 密码
     * */
    public OldServiceResponse<OldAccessToken> login(String username, String password) throws IOException {
        String url = BASE_URL + TOKEN_URL;
        Map<String, String> param = new HashMap<String, String>();
        param.put("grant_type", GRANT_TYPE);
        param.put("username", username);
        param.put("password", password);
        param.put("client_id", CLIENT_ID);
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
        String url = BASE_URL + TODO_URL;
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
        String url  =BASE_URL + TOREAD_URL;
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
     * */
    public OldServiceResponse<OldOAToDoDetailResponse> getToDoDetail(OldAccessToken token, String appID) throws IOException {
        final Object lock = new Object();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //待办详情请求结果
        final HTTPResponse detailResponse = new HTTPResponse();
        //待办当前允许操作请求结果
        final HTTPResponse operationResponse = new HTTPResponse();
        //待办流程已办理节点请求结果
        final HTTPResponse dealtResponse = new HTTPResponse();

        //待办流程详情任务
        String detaillUrl = BASE_URL + TODO_DETAIL_URL;
        Map<String, Object> detailParam = new HashMap<String, Object>();
        detailParam.put("AppID", appID);
        HTTPTask detailTask = new HTTPTask(detaillUrl, detailParam, headers, new HTTPTaskCallback() {
            public void requestComplete(HTTPResponse response) {
                completeWithResponse(detailResponse, response);
                synchronized (lock) {
                    if(operationResponse.isComplete() && dealtResponse.isComplete()){
                        lock.notify();
                    }
                }
            }
        });

        //待办流程当前操作任务
        String operationUrl = BASE_URL + WORKFLOW_OPERATION_INFO;
        HTTPTask operationTask = new HTTPTask(operationUrl, appID, headers, new HTTPTaskCallback() {
            public void requestComplete(HTTPResponse response) {
                completeWithResponse(operationResponse, response);
                synchronized (lock) {
                    if(detailResponse.isComplete() && dealtResponse.isComplete()){
                        lock.notify();
                    }
                }
            }
        });

        //待办流程已办理节点任务
        String dealtUrl = BASE_URL + WORKFLOW_DEALT_INFO;
        HTTPTask dealtTask = new HTTPTask(dealtUrl, appID, headers, new HTTPTaskCallback() {
            public void requestComplete(HTTPResponse response) {
                completeWithResponse(dealtResponse, response);
                synchronized (lock) {
                    if(detailResponse.isComplete() && operationResponse.isComplete()){
                        lock.notify();
                    }
                }
            }
        });

        //并发执行任务
        OldServiceResponse<OldOAToDoDetailResponse> serviceResponse = new OldServiceResponse<OldOAToDoDetailResponse>();
        try {
            synchronized (lock) {
                taskExecutor.execute(detailTask);
                taskExecutor.execute(operationTask);
                taskExecutor.execute(dealtTask);
                lock.wait();
            }
        }catch (InterruptedException e) {
            e.printStackTrace();
            serviceResponse.setSuccess(false);
            serviceResponse.setError(ConstantUtil.RESPONSE_EXCEPTION);
            serviceResponse.setError_description(ConstantUtil.RESPONSE_EXCEPTION);
        }

        if(detailResponse.getCode()==HTTPResponse.SUCCESS && operationResponse.getCode()==HTTPResponse.SUCCESS && dealtResponse.getCode()==HTTPResponse.SUCCESS){
            Map<String, Object> detailJson = JSON.parseObject(detailResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            Map<String, Object> operationJson = JSON.parseObject(operationResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            Map<String, Object> dealtJson = JSON.parseObject(dealtResponse.getResult(), new TypeReference<Map<String, Object>>(){});
            if((Boolean)detailJson.get("isSucceed") && (Integer)operationJson.get("success")==1 && (Integer)dealtJson.get("success")==1){
                OldOAToDoDetail detail = JSON.parseObject(JSON.toJSONString(detailJson.get("executedModel")), OldOAToDoDetail.class);
                OldOAToDoOperation operation = JSON.parseObject(JSON.toJSONString(operationJson), OldOAToDoOperation.class);
                List<OldOAToDoDealt> dealtList = JSON.parseArray(JSON.toJSONString(dealtJson.get("wfDealtList")), OldOAToDoDealt.class);
                String attachsUrl = BASE_URL + WORKFLOW_ATTACHS;
                Map<String, Object> attachsParam = new HashMap<String, Object>();
                attachsParam.put("attL_ID", detail.getAttL_ID());
                HTTPResponse attachResponse = HTTPUtil.sendPostWithJson(attachsUrl, attachsParam, headers);
                Map<String, Object> attachJson = JSON.parseObject(attachResponse.getResult(), new TypeReference<Map<String, Object>>(){});
                if((Boolean) attachJson.get("isSucceed")){
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
        HTTPTask infoTask = getStartInfoTask(OldServiceConstant.WORKFLOW_NAME_LEAVE,
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
                                OldServiceConstant.WORKFLOW_NAME_LEAVE,
                                requestParam.getWorkflowTitle(),
                                addRes.getIn_sp_id(),
                                addRes.getBuzPKID());
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
        HTTPTask infoTask = getStartInfoTask(OldServiceConstant.WORKFLOW_NAME_USCAR,
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
                                OldServiceConstant.WORKFLOW_NAME_USCAR,
                                requestParam.getWorkflowTitle(),
                                addRes.getIn_sp_id(),
                                addRes.getBuzPKID());
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
     * @return
     */
    public OldServiceResponse submitWorkflow(OldAccessToken token,
                                             OldOAAppButton button,
                                             String workflowName,
                                             String workflowTitle,
                                             int in_sp_id,
                                             int buzPKID) throws IOException{
        OldServiceResponse serviceResponse = new OldServiceResponse();
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        //请求获取审批步骤接口
        String stepUrl = OldServiceConstant.WORKFLOW_GET_STEPLIST_URL;
        Map<String, Object> stepParam = new HashMap<String, Object>();
        stepParam.put("ButtonType", button.getButtonId());
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
                OldOAToDoStepInfo step = stepList.get(0);
                button.setAppFlag("2");
                button.setAppID("0");
                button.setAppIdea("同意");
                button.setAppTID(workflowName);
                button.setAppTitle(workflowTitle);
                OldOAProcessStep stepInfo = new OldOAProcessStep();
                stepInfo.setSuccess(1);
                List<OldOAToDoStepInfo> stepInfoList = new ArrayList<OldOAToDoStepInfo>();
                stepInfoList.add(step);
                stepInfo.setWfNextStepList(stepInfoList);
                button.setNextStepList(stepInfo);
                button.setPromptContent("同意");
                button.setSmsTransactFlag("0");
                OldOAProcessWorkflowRequest param = new OldOAProcessWorkflowRequest();
                param.setOaSPYJ("true");
                param.setOaSPID(in_sp_id);
                param.setAppOId(buzPKID);
                param.setAppOValue(0);
                param.setButton(button);
                String processUrl = OldServiceConstant.WORKFLOW_PROCESS_URL;
                HTTPResponse processResponse = HTTPUtil.sendPostWithJson(processUrl, param, headers);
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
     * 判断是否是请假流程
     * @param workflowName 流程名称
     * @return
     */
    private boolean isLeaveWorkflow(String workflowName) {
        return OldServiceConstant.WORKFLOW_NAME_LEAVE.equals(workflowName);
    }

    /**
     * 判断是否是用车申请流程
     * @param workflowName 流程名称
     * @return
     */
    private boolean isCarWorkflow(String workflowName) {
        return OldServiceConstant.WORKFLOW_NAME_USCAR.equals(workflowName);
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
     * 获取待办附件列表 (返回值不作任何处理，直接交给客户端)
     * @param token 保存在session中的accessToken
     * @param appOValue 上两个接口返回的字段
     * @param wfTemplateDJSN 上两个接口返回的字段
     * */
    public HTTPResponse getToDoAttachment(OldAccessToken token, String appOValue, String wfTemplateDJSN) throws IOException {
        String url = BASE_URL + TODO_ATTACHMENT_URL;
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("DJBH", appOValue);
        param.put("DJSN", wfTemplateDJSN);
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse result = HTTPUtil.sendPostWithJson(url, param, headers);
        return result;
    }

    /**
     * 获取目标待办事项下一审批步骤 (返回值不作任何处理，直接交给客户端)
     * @param token 保存在session中的accessToken
     * @param appID 待办项ID
     * @param appTID 类型ID？ 待办列表有返回此字段
     * */
    public HTTPResponse getToDoNextStep(OldAccessToken token, String appID, String appTID) throws IOException {
        String url = BASE_URL + TODO_NEXT_STEP_URL;
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("ButtonType", 6);
        param.put("appID", appID);
        param.put("appTID", appTID);
        param.put("appVersion", "1.0");
        param.put("businessId", "");
        param.put("condition", "");
        param.put("isNewFlag", 1);
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse result = HTTPUtil.sendPostWithJson(url, param, headers);
        return result;
    }

    /**
     * 获取目标步骤审批人
     * @param token
     * @param appID
     * @param appTID
     * @param nextStepID 步骤ID
     */
    public HTTPResponse getToDoNextStepApprovers(OldAccessToken token, String appID, String appTID, String nextStepID) throws IOException {
        String url = BASE_URL + TODO_NEXT_APPROVERS_URL;
        Map<String, Object> param = new HashMap<String, Object>();
        param.put("ButtonType", 6);
        param.put("appID", appID);
        param.put("appTID", appTID);
        param.put("appVersion", "1.0");
        param.put("businessId", "");
        param.put("condition", "");
        param.put("isNewFlag", 1);
        param.put("nextStepID", nextStepID);
        Map<String, String> headers = HTTPUtil.getAuthHeaders(token);
        HTTPResponse result = HTTPUtil.sendPostWithJson(url, param, headers);
        return result;
    }
}
