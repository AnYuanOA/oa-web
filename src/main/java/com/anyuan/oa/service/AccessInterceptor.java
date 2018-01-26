package com.anyuan.oa.service;

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
        //拦截请求校验session
        String accessKey = (String) httpServletRequest.getAttribute("accessKey");
        HttpSession session = httpServletRequest.getSession();
        String sessionAccessValue = (String) session.getAttribute(accessKey);
        //如果有登录的session，则允许请求
        if (!StringUtils.isEmpty(sessionAccessValue)) {
            //重新写入session
            session.removeAttribute(accessKey);
            session.setAttribute(accessKey, EncryptUtil.encrypt(accessKey));
            return true;
        } else {
            //验证不通过则返回登录页面
            httpServletResponse.sendRedirect("/access/noPermission");
            return false;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
