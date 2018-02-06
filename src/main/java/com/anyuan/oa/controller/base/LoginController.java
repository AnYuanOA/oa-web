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
        try {
            //老系统登录接口请求验证
            OldServiceResponse<OldAccessToken> loginOldResponse=loginOldOA(paramUser);
            if(loginOldResponse.isSuccess()){
                //验证通过，写入session会话
                request.getSession().setAttribute(ConstantUtil.OLD_OA_ACCESS_TOKEN, loginOldResponse.getData());
                User weUser = userMapper.findUserByOpenId(paramUser.getOpenId());
                if(ObjectUtils.isEmpty(weUser)){
                    //第一次绑定
                    //登录鉴权通过，写入绑定表
                    userMapper.insertWeChatUser(paramUser);
                }else{
                    //验证用户名是否一致，避免拿别人的账号登录
                    if(!weUser.getUserName().equals(paramUser.getAccount())){
                        return coverErrorMessage(ConstantUtil.ERROR_ACCOUNT);
                    }
                    //已存在绑定用户
                    paramUser.setId(weUser.getId());
                    userMapper.updateWeChatUser(paramUser);
                }
                return coverSuccessData(ConstantUtil.LOGIN_SESSION_ID);
            }else{
                return coverErrorMessage(loginOldResponse.getError_description());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /***
     * 登录老系统
     * @param paramUser
     * @return
     */
    private OldServiceResponse<OldAccessToken> loginOldOA(User paramUser) throws Exception{
        //登录老OA平台
        return oldOAService.login(paramUser.getUserName(), paramUser.getPassword());
    }
}
