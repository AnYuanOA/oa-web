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
        Map<String, String> headers = getHeaders(token);
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
        Map<String, String> headers = getHeaders(token);
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
        Map<String, String> headers = getHeaders(token);
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
        Map<String, String> headers = getHeaders(token);
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
        Map<String, String> headers = getHeaders(token);
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
        Map<String, String> headers = getHeaders(token);
        HTTPResponse result = HTTPUtil.sendPostWithJson(url, param, headers);
        return result;
    }

    private Map<String, String> getHeaders(OldAccessToken token) {
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("Authorization", "Bearer " + token.getAccess_token());
        return headers;
    }
}
