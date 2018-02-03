package com.anyuan.oa.controller;

import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.model.response.HTTPResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public Map<String, Object> getToDoList(String lastTime, HttpServletRequest request) throws IOException {
        if(lastTime==null){
            lastTime = "";
        }
        HTTPResponse response = oldOAService.getToDoList((OldAccessToken) request.getSession().getAttribute(ConstantUtil.OLD_OA_ACCESS_TOKEN));
        if(response.getCode() == HTTPResponse.SUCCESS){

        }else{
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
        return null;
    }
}
