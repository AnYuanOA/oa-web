package com.anyuan.oa.controller.base;

import com.anyuan.oa.utils.ConstantUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * @author huyang8
 */
public class BaseController {

    /**
     * 封装接口调用成功公共方法
     * @param data
     * @param <T>
     * @return
     */
    protected <T> Map<String,Object> coverSuccessData(T data){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("code", ConstantUtil.SUCCESS_CODE);
        result.put("data",data);
        return result;
    }

    /**
     * 封装接口调用失败公共方法
     * @param message
     * @param <T>
     * @return
     */
    protected <T> Map<String,Object> coverErrorMessage(String message){
        Map<String,Object> result=new HashMap<String,Object>();
        result.put("code",ConstantUtil.ERROR_CODE);
        result.put("message",message);
        return result;
    }

    /**
     * 封装接口调用无权限公共方法
     * @param <T>
     * @return
     */
    protected <T> Map<String, Object> coverNoPermissionMessage() {
        Map<String, Object> result = new HashMap<String,Object>();
        result.put("code", ConstantUtil.NO_PERMISSION_CODE);
        result.put("message", ConstantUtil.NO_PERMISSION);
        return result;
    }

    /**
     * 封装接口调用公共方法
     * @param <T>
     * @return
     */
    protected <T> Map<String, Object> coverMessage(int code, String msg) {
        Map<String, Object> result = new HashMap<String,Object>();
        result.put("code", code);
        result.put("message", msg);
        return result;
    }
}
