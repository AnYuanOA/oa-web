package com.anyuan.oa.controller;

import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.model.response.OldOAMessage;
import com.anyuan.oa.model.response.OldOAMessageType;
import com.anyuan.oa.model.response.OldServiceResponse;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.service.SessionHelper;
import com.anyuan.oa.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by pengkan on 2018/3/1.
 */
@Controller
@RequestMapping("/news")
public class NewsController extends BaseController{
    @Autowired
    private OldOAService oldOAService;

    /**
     * 查询新闻消息类型列表
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getMessageTypeList")
    @ResponseBody
    public Map<String, Object> getMessageTypeList(HttpServletRequest request) throws IOException {
        OldServiceResponse<List<OldOAMessageType>> response = oldOAService.getMessageTypeList(
                SessionHelper.getInstance().getAccessToken(request));
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else{
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /**
     * 根据类型查询新闻消息列表
     * @param mainType   类型ID
     * @param pageIndex  当前页码
     * @param pageSize   每页数据条数
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getMessageListWithType")
    @ResponseBody
    public Map<String, Object> getMessageListWithType(
            String mainType, int pageIndex, int pageSize, HttpServletRequest request) throws IOException {
        if(mainType == null){
            mainType = "";
        }
        if(pageIndex < 0){
            pageIndex = 0;
        }
        if(pageSize <= 0){
            pageSize = 10;
        }
        OldServiceResponse<List<OldOAMessage>> response = oldOAService.getMessageListWithType(
                mainType, pageIndex, pageSize, SessionHelper.getInstance().getAccessToken(request));
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else{
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }
}
