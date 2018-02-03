package com.anyuan.oa.controller.base;

import com.anyuan.oa.dao.UserMapper;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.response.OldServiceResponse;
import com.anyuan.oa.model.User;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {

    @Resource
    private UserMapper userMapper;
    @Autowired
    private OldOAService oldOAService;

    @RequestMapping("/loginAnyuanUser")
    @ResponseBody
    public Map<String, Object> login(User paramUser, HttpServletRequest request, HttpServletResponse response) {
        User weUser = userMapper.findUserByOpenId(paramUser.getOpenId());
        if (ObjectUtils.isEmpty(weUser)) {
            //第一次进行绑定
            //验证用户名密码
            User oaUser = userMapper.findUserByAccount(paramUser.getAccount());
            if (ObjectUtils.isEmpty(oaUser)) {
                return coverErrorMessage(ConstantUtil.NO_ACCOUNT);
            } else if (!oaUser.getPassword().equals(MD5Util.MD5(paramUser.getPassword()))) {
                return coverErrorMessage(ConstantUtil.ERROR_ACCOUNT);
            } else {
                //插入绑定表数据记录
                userMapper.insertWeChatUser(paramUser);
                return loginOldOA(paramUser, request);
            }
        } else {
            //校验用户登录绑定信息
            if (!weUser.getUserName().equals(paramUser.getAccount())
                    || !weUser.getOpenId().equals(paramUser.getOpenId())
                    || !weUser.getPassword().equals(MD5Util.MD5(paramUser.getPassword()))) {
                return coverErrorMessage(ConstantUtil.ERROR_ACCOUNT);
            } else {
                return loginOldOA(paramUser, request);
            }
        }
    }

    /***
     * 登录老系统
     * @param paramUser
     * @param request
     * @return
     */
    private Map<String, Object> loginOldOA(User paramUser, HttpServletRequest request) {
        //登录老OA平台
        try {
            OldServiceResponse<OldAccessToken> loginResponse = oldOAService.login(paramUser.getUserName(), paramUser.getPassword());
            if(loginResponse.isSuccess()){
                //验证通过，写入session会话
                request.getSession().setAttribute(ConstantUtil.OLD_OA_ACCESS_TOKEN, loginResponse.getData());
                return coverSuccessData(ConstantUtil.LOGIN_SESSION_ID);
            }else{
                return coverErrorMessage(ConstantUtil.ERROR_ACCOUNT);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }
}
