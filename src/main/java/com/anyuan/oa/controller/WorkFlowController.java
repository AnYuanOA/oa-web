package com.anyuan.oa.controller;

import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.response.*;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.service.SessionHelper;
import com.anyuan.oa.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
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
}
