package com.anyuan.oa.service;

import com.anyuan.oa.utils.ConstantUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/6.
 */
public class SessionHelper {
    private static SessionHelper instance = new SessionHelper();

    private Map<String, Session> sessionMap;

    private SessionHelper(){
        sessionMap = new HashMap<String, Session>();
    }

    public static SessionHelper getInstance() {
        return instance;
    }

    public Session getSession(HttpServletRequest httpServletRequest) {
        String JSESSIONID = (String) httpServletRequest.getSession().getAttribute(ConstantUtil.JSESSIONID);
        Session session = sessionMap.get(JSESSIONID);
        if(session == null){
            session = new Session(JSESSIONID);
            sessionMap.put(JSESSIONID, session);
        }
        return session;
    }
}
