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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
    public Map<String, Object> getToDoDetail(String appID, HttpServletRequest request) throws IOException {
        if(appID!=null){
            OldServiceResponse<OldOAToDoDetailResponse> response = oldOAService.getToDoDetail(SessionHelper.getInstance().getAccessToken(request), appID);
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
            if(workflowName.equals(OldServiceConstant.WORKFLOW_NAME_LEAVE) || workflowName.equals(OldServiceConstant.WORKFLOW_NAME_USCAR)){
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
     * @param param 参数，json字符串
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/submitLeave")
    @ResponseBody
    public Map<String, Object> submitLeave(String param, HttpServletRequest request) throws IOException {
        OldOALeaveRequest requestParam = JSON.parseObject(param, OldOALeaveRequest.class);
        if(requestParam!=null) {
            OldServiceResponse response = oldOAService.submitLeaveWorkflow(SessionHelper.getInstance().getAccessToken(request), requestParam);
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
     * @param param 参数 json字符串
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/submitUsingCar")
    @ResponseBody
    public Map<String, Object> submitUsingCar(String param, HttpServletRequest request) throws IOException{
        OldOAUsCarRequest requestParam = JSON.parseObject(param, OldOAUsCarRequest.class);
        if(requestParam != null){
            OldServiceResponse response = oldOAService.submitUsingCarWorkflow(SessionHelper.getInstance().getAccessToken(request), requestParam);
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
     * @param param 参数 json字符串
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/processWorkflow")
    @ResponseBody
    public Map<String, Object> processWorkflow(String param, HttpServletRequest request) throws IOException {
        OldOAProcessWorkflowRequest requestParam = JSON.parseObject(param, OldOAProcessWorkflowRequest.class);
        if(requestParam != null){
            OldServiceResponse response = oldOAService.submitWorkflow(SessionHelper.getInstance().getAccessToken(request),
                    requestParam.getButton(),
                    requestParam.getWorkflowName(),
                    requestParam.getWorkflowTitle(),
                    requestParam.getOaSPID(),
                    requestParam.getAppOId());
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
