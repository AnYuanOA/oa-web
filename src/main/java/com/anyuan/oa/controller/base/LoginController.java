package com.anyuan.oa.controller.base;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.anyuan.oa.dao.UserMapper;
import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.model.response.OldServiceResponse;
import com.anyuan.oa.model.User;
import com.anyuan.oa.service.OldOAService;
import com.anyuan.oa.service.OpenFireService;
import com.anyuan.oa.service.Session;
import com.anyuan.oa.service.SessionHelper;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.WeChatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
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
                paramUser.setwPassword(paramUser.getPassword());
                //openfire通讯接口嵌套
                OpenFireService.createOrUpdateUser(paramUser);
                //查询是否已有登录绑定账号
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
                //验证通过，写入session会话
                String sessionId = request.getSession().getId();
                request.getSession().setAttribute(ConstantUtil.JSESSIONID, sessionId);
                SessionHelper.getInstance().getSession(request).setLoginedKey(ConstantUtil.LOGIN_SESSION_ID);
                SessionHelper.getInstance().getSession(request).setAttribute(ConstantUtil.OLD_OA_ACCESS_TOKEN, loginOldResponse.getData());
                return coverSuccessData(sessionId);
            }else{
                return coverErrorMessage(loginOldResponse.getError_description());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
        }
    }

    /***
     * 根据openID登录
     * @param openId
     * @param request
     * @return
     */
    @RequestMapping("/loginWithOpenID")
    @ResponseBody
    public Map<String, Object> loginWithOpenID(String openId, HttpServletRequest request) {
        if(openId!=null){
            User weUser = userMapper.findUserByOpenId(openId);
            if(!ObjectUtils.isEmpty(weUser)){
                //老系统登录接口请求验证
                try {
                    OldServiceResponse<OldAccessToken> loginOldResponse = loginOldOA(weUser.getAccount(), weUser.getwPassword());
                    if(loginOldResponse.isSuccess()){
                        //验证通过，写入session会话
                        String sessionId = request.getSession().getId();
                        request.getSession().setAttribute(ConstantUtil.JSESSIONID, sessionId);
                        SessionHelper.getInstance().getSession(request).setLoginedKey(ConstantUtil.LOGIN_SESSION_ID);
                        SessionHelper.getInstance().getSession(request).setAttribute(ConstantUtil.OLD_OA_ACCESS_TOKEN, loginOldResponse.getData());
                        return coverSuccessData(sessionId);
                    }else{
                        return coverErrorMessage(loginOldResponse.getError_description());
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    return coverErrorMessage(ConstantUtil.RESPONSE_EXCEPTION);
                }
            }else{
                return coverMessage(ConstantUtil.USER_NOT_BIND_CODE, ConstantUtil.USER_NOT_BIND);
            }
        }else {
            return coverErrorMessage(ConstantUtil.OPENID_EMPTY);
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

    /***
     * 登录老系统
     * @param account  通过微信绑定存储的用户名
     * @param wPassword   通过微信绑定存储的密码
     * @return
     * @throws IOException
     */
    private OldServiceResponse<OldAccessToken> loginOldOA(String account, String wPassword) throws IOException {
        return oldOAService.login(account, wPassword);
    }


    @RequestMapping("/getUserOpenId")
    @ResponseBody
    public Map<String, Object> getUserOpenId(String jsCode,HttpServletRequest request, HttpServletResponse response) {
        return coverSuccessData(JSON.parse(WeChatUtil.getConvert(jsCode)));
    }
}
