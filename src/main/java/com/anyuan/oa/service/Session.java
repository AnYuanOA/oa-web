package com.anyuan.oa.service;

import com.anyuan.oa.model.OldAccessToken;
import com.anyuan.oa.utils.ConstantUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/6.
 */
public class Session {
    private String id;
    /**
     * 已登录标识
     */
    private String loginedKey;

    private Map<String, Object> attributes;

    private Session() {}
    protected Session(String id) {
        this.id = id;
        this.attributes = new HashMap<String, Object>();
    }

    public void setAttribute(String key, Object value) {
        attributes.put(key, value);
    }

    public Object getAttribute(String key) {
        return attributes.get(key);
    }

    public String getId() {
        return this.id;
    }

    public String getLoginedKey() {
        return loginedKey;
    }

    public void setLoginedKey(String loginedKey) {
        this.loginedKey = loginedKey;
    }
}
