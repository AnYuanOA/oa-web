package com.anyuan.oa.controller;

import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.response.OldOAToDoListResponse;
import com.anyuan.oa.model.response.OldServiceResponse;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.service.SessionHelper;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.model.response.HTTPResponse;
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
        OldServiceResponse<OldOAToDoListResponse> response = oldOAService.getToDoList((OldAccessToken) SessionHelper.getInstance().getSession(request).getAttribute(ConstantUtil.OLD_OA_ACCESS_TOKEN), lastTime);
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else{
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }
}
