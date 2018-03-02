package com.anyuan.oa.controller;


import com.anyuan.oa.controller.base.BaseController;
import com.anyuan.oa.dao.UserMapper;
import com.anyuan.oa.model.User;
import com.anyuan.oa.model.response.OldOAUser;
import com.anyuan.oa.model.response.OldServiceResponse;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.service.SessionHelper;
import com.anyuan.oa.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource
    private UserMapper userMapper;
    @Autowired
    private OldOAService oldOAService;

    @RequestMapping("/showAllUser")
    @ResponseBody
    public Map<String, Object> showAllUser() {
        try {
            List<User> list = userMapper.findAllUser();
            return coverSuccessData(list);
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    @RequestMapping("/getSelfUser")
    @ResponseBody
    public Map<String,Object> getSelfUser(User user){
        try {
            User selfUser=userMapper.findUserByOpenId(user.getOpenId());
            return coverSuccessData(selfUser);
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /**
     * 获取老OA系统用户信息
     * @param request
     * @return
     * @throws IOException
     */
    @RequestMapping("/getOldOAUserInfo")
    @ResponseBody
    public Map<String, Object> getOldOAUserInfo(HttpServletRequest request) throws IOException{
        OldServiceResponse<OldOAUser> response = oldOAService.getUserInfo(SessionHelper.getInstance().getAccessToken(request));
        if(response.isSuccess()){
            return coverSuccessData(response.getData());
        }else {
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }
}
