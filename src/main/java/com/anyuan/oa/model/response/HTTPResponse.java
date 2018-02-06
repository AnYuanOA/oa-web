package com.anyuan.oa.model.response;

import com.alibaba.fastjson.JSON;
import org.apache.http.cookie.Cookie;

import java.util.List;

public class HTTPResponse {
    /**
     * http请求成功
     */
    public static final int SUCCESS = 200;
    private int code;
    private String result;
    private boolean complete;
    private List<Cookie> cookies;

    public HTTPResponse(){
        this.code = 400;
        this.result = null;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public boolean isComplete() {
        return complete;
    }

    public void setComplete(boolean complete) {
        this.complete = complete;
    }

    public List<Cookie> getCookies() {
        return cookies;
    }

    public void setCookies(List<Cookie> cookies) {
        this.cookies = cookies;
    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
