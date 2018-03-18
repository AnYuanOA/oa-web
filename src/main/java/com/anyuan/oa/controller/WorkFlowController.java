package com.anyuan.oa.controller;

import com.alibaba.fastjson.JSON;
import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.request.OldOALeaveRequest;
import com.anyuan.oa.model.request.OldOAProcessWorkflowRequest;
import com.anyuan.oa.model.request.OldOALeaveRequest;
import com.anyuan.oa.model.request.OldOAUsCarRequest;
import com.anyuan.oa.model.response.*;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.service.Session;
import com.anyuan.oa.service.SessionHelper;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.OldServiceConstant;
import com.anyuan.oa.utils.WorkflowName;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/2.
 */

@Controller
@RequestMapping("/workflow")
public class WorkFlowController extends BaseController{
    @Autowired
    private OldOAService oldOAService;

    /***
     * 获取待办列表
     * @param lastTime  上一次请求返回的最后一个事项 APPID 没有可不传
     * @param request
     */
    @RequestMapping("/getToDoList")
    @ResponseBody
    public Map<String, Object> getToDoList(String lastTime, HttpServletRequest request) throws IOException {
        if(lastTime==null){
            lastTime = "";
        }
        OldServiceResponse<OldOAToDoListResponse> response = oldOAService.getToDoList(SessionHelper.getInstance().getAccessToken(request), lastTime);
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else{
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /**
     * 获取待阅列表
     * @param currentPage 页码，从1开始
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getToReadList")
    @ResponseBody
    public Map<String, Object> getToReadList(String currentPage, HttpServletRequest request) throws IOException {
        if(currentPage==null){
            currentPage = "1";
        }
        OldServiceResponse<OldOAToReadListResponse> response = oldOAService.getToReadList(SessionHelper.getInstance().getAccessToken(request), Integer.parseInt(currentPage));
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else {
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /**
     * 获取待办流程详情
     * @param appID 业务ID
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getToDoDetail")
    @ResponseBody
    public Map<String, Object> getToDoDetail(String appID, String workflowName, HttpServletRequest request) throws IOException {
        if(appID!=null){
            OldServiceResponse<OldOAToDoDetailResponse> response = oldOAService.getToDoDetail(SessionHelper.getInstance().getAccessToken(request), appID, workflowName);
            if(response.isSuccess()){
                return coverSuccessData(response.getData());
            }else{
                return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
            }
        }else{
            return coverErrorMessage(ConstantUtil.APPID_EMPTY);
        }
    }

    /**
     * 获取流程基础信息
     * @param workflowName 流程名称  请假：IHRM_AttendanceLeave  用车：IOA_Vehicle
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getToDoInfo")
    @ResponseBody
    public Map<String, Object> getToDoInfo(String workflowName, HttpServletRequest request) throws IOException{
        if(workflowName!=null && workflowName.trim().length()>0){
            if(workflowName.equals(WorkflowName.LEAVE.getValue()) || workflowName.equals(WorkflowName.USCAR.getValue())){
                OldServiceResponse<OldOAToDoInfoResponse> response = oldOAService.getToDoInfo(SessionHelper.getInstance().getAccessToken(request), workflowName);
                if(response.isSuccess()){
                    return coverSuccessData(response.getData());
                }else{
                    return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
                }
            }else{
                return coverErrorMessage(ConstantUtil.WORKFLOW_NOT_SUPPORT);
            }
        }else{
            return coverErrorMessage(ConstantUtil.WORKFLOWNAME_EMPTY);
        }
    }

    /**
     * 获取请假类型
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getRestTypeList")
    @ResponseBody
    public Map<String, Object> getRestTypeList(HttpServletRequest request) throws IOException {
        OldServiceResponse<List<OldOARestType>> response = oldOAService.getRestTypeList(SessionHelper.getInstance().getAccessToken(request));
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else {
            return coverErrorMessage(response.getError_description());
        }
    }

    /**
     * 获取用车类型
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getUsingTypeList")
    @ResponseBody
    public Map<String, Object> getUsingTypeList(HttpServletRequest request) throws IOException {
        OldServiceResponse<List<OldOAUsingType>> response = oldOAService.getUsingTypeList(SessionHelper.getInstance().getAccessToken(request));
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else {
            return coverErrorMessage(response.getError_description());
        }
    }

    /**
     * 提交请假申请流程
     * @param oldOALeaveRequest 参数
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/submitLeave")
    @ResponseBody
    public Map<String, Object> submitLeave(OldOALeaveRequest oldOALeaveRequest, HttpServletRequest request) throws IOException {
        if(oldOALeaveRequest!=null) {
            OldServiceResponse response = oldOAService.submitLeaveWorkflow(SessionHelper.getInstance().getAccessToken(request), oldOALeaveRequest);
            if (response.isSuccess()) {
                return coverSuccessData(response.getData());
            } else {
                return coverErrorMessage(response.getError_description());
            }
        }else{
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
    }

    /**
     * 提交用车申请流程
     * @param oldOAUsCarRequest 参数
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/submitUsingCar")
    @ResponseBody
    public Map<String, Object> submitUsingCar(OldOAUsCarRequest oldOAUsCarRequest, HttpServletRequest request) throws IOException{
        if(oldOAUsCarRequest != null){
            OldServiceResponse response = oldOAService.submitUsingCarWorkflow(SessionHelper.getInstance().getAccessToken(request), oldOAUsCarRequest);
            if(response.isSuccess()){
                return coverSuccessData(response.getData());
            }else{
                return coverErrorMessage(response.getError_description());
            }
        }else {
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
    }

    /**
     * 办理流程
     * @param oldOAProcessWorkflowRequest
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/processWorkflow")
    @ResponseBody
    public Map<String, Object> processWorkflow(OldOAProcessWorkflowRequest oldOAProcessWorkflowRequest, HttpServletRequest request,String operationButton) throws IOException {
        OldOAAppButton oldOAAppButton=JSON.parseObject(operationButton, OldOAAppButton.class);
        if(oldOAProcessWorkflowRequest != null&&oldOAAppButton!=null){
            oldOAProcessWorkflowRequest.setButton(oldOAAppButton);
            OldServiceResponse response = oldOAService.submitWorkflow(SessionHelper.getInstance().getAccessToken(request),
                    oldOAProcessWorkflowRequest.getButton(),
                    oldOAProcessWorkflowRequest.getWorkflowName(),
                    oldOAProcessWorkflowRequest.getWorkflowTitle(),
                    oldOAProcessWorkflowRequest.getOaSPID(),
                    oldOAProcessWorkflowRequest.getAppOId(),
                    oldOAProcessWorkflowRequest.getCurrentStepId(),
                    oldOAProcessWorkflowRequest.getAppFieldName());
            if(response.isSuccess()){
                return coverSuccessData(response.getData());
            }else {
                return coverErrorMessage(response.getError_description());
            }
        }else {
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
    }

    /**
     * 获取下一步审批信息
     * @param buttonId     审批操作ID
     * @param workflowName 流程名称
     * @param currentStepId 当前步骤ID
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getAcceptUserList")
    @ResponseBody
    public Map<String, Object> getAcceptUserList(String buttonId, String workflowName, String currentStepId, HttpServletRequest request) throws IOException {
        if(buttonId!=null && workflowName!=null){
            OldServiceResponse<List<OldOAToDoAcceptUserInfo>> response = oldOAService.getAcceptUserList(
                    SessionHelper.getInstance().getAccessToken(request),
                    buttonId,
                    workflowName,
                    currentStepId);
            if(response.isSuccess()){
                return coverSuccessData(response.getData());
            }else {
                return coverErrorMessage(response.getError_description());
            }
        }else {
            return coverErrorMessage(ConstantUtil.REQUEST_PARAM_ERROR);
        }
    }
}
