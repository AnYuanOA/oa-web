package com.anyuan.oa.service.interceptor;

import com.anyuan.oa.service.Session;
import com.anyuan.oa.service.SessionHelper;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.EncryptUtil;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AccessInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String url = httpServletRequest.getRequestURI();
        if (url.contains("/login") || url.contains("/access")) {
            //如果是登录请求默认不拦截，直接走登录的controller进行登录处理
            //如果是无权限进行操作的，直接走无权限controller处理
            return true;
        }


        //新接口请求session校验
        String newRequestSessionId=httpServletRequest.getRequestedSessionId();
        httpServletRequest.getSession().setAttribute(ConstantUtil.JSESSIONID, newRequestSessionId);
        Session newSession = SessionHelper.getInstance().getSession(httpServletRequest);
        String newLoginedKey = newSession.getLoginedKey();
        if(!StringUtils.isEmpty(newLoginedKey)&&newLoginedKey.equals(ConstantUtil.LOGIN_SESSION_ID)){
            return true;
        }


        //拦截请求校验sessionId
        String JSESSIONID = httpServletRequest.getHeader(ConstantUtil.JSESSIONID);
        if(JSESSIONID == null){
            JSESSIONID = httpServletRequest.getHeader(ConstantUtil.JSESSIONID.toLowerCase());
        }
        httpServletRequest.getSession().setAttribute(ConstantUtil.JSESSIONID, JSESSIONID);
        Session session = SessionHelper.getInstance().getSession(httpServletRequest);
        String loginedKey = session.getLoginedKey();
        //如果有登录的session，则允许请求
        if (!StringUtils.isEmpty(loginedKey)&&loginedKey.equals(ConstantUtil.LOGIN_SESSION_ID)) {
            return true;
        } else {
            //验证不通过则返回无权限页面
            httpServletResponse.sendRedirect("/web-service/access/noPermission");
            return false;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
