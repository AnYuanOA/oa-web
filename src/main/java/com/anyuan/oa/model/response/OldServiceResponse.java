package com.anyuan.oa.model.response;

import com.alibaba.fastjson.JSON;

/**
 * Created by pengkan on 2018/2/1.
 */
public class OldServiceResponse<T> {
    /**
     * 请求是否成功
     */
    private boolean success;
    /**
     * 错误类型
     */
    private String error;
    /**
     * 错误描述
     */
    private String error_description;
    /***
     * 返回内容
     */
    private T data;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getError_description() {
        return error_description;
    }

    public void setError_description(String error_description) {
        this.error_description = error_description;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    @Override
    public String toString(){
        return JSON.toJSONString(this);
    }
}
