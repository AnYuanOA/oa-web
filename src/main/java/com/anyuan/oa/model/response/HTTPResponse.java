package com.anyuan.oa.model.response;

import com.alibaba.fastjson.JSON;

public class HTTPResponse {
    /**
     * http请求成功
     */
    public static final int SUCCESS = 200;
    private int code;
    private String result;

    protected HTTPResponse(){
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

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}
