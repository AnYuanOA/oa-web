package com.anyuan.oa.controller.base;

import com.anyuan.oa.dao.UserMapper;
import com.anyuan.oa.model.User;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.EncryptUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author huyang8
 */
@Controller
@RequestMapping("/login")
@SessionAttributes({""})
public class LoginController extends BaseController {

    @Resource
    private UserMapper userMapper;

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
            } else if (!oaUser.getPassword().equals(paramUser.getPassword())) {
                return coverErrorMessage(ConstantUtil.ERROR_ACCOUNT);
            } else {
                //插入绑定表数据记录
                userMapper.insertWeChatUser(paramUser);
                //验证通过，写入session会话
                HttpSession session = request.getSession();
                String keyAfter = paramUser.getOpenId() + "_" + paramUser.getAccount();
                String sessionKey = "sessionKey_" + keyAfter;
                String sessionValue = EncryptUtil.encrypt(sessionKey);
                session.setAttribute(sessionKey, sessionValue);
                return coverSuccessData(sessionKey);
            }
        } else {
            //校验用户登录绑定信息
            if (!weUser.getUserName().equals(paramUser.getAccount())
                    || !weUser.getPassword().equals(paramUser.getPassword())) {
                return coverErrorMessage(ConstantUtil.ERROR_ACCOUNT);
            } else {
                //验证通过
                return coverSuccessData(weUser);
            }
        }
    }
}
