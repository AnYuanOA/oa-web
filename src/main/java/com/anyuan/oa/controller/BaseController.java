package com.anyuan.oa.controller;

import java.util.HashMap;
import java.util.Map;

/**
 * @author huyang8
 */
public class BaseController {

    /**
     * 封装前端数据公共方法
     * @param key
     * @param data
     * @param <T>
     * @return
     */
    protected <T> Map<String,Object> coverResultMap(String key,T data){
        Map<String,Object> resultMap=new HashMap<String,Object>();
        resultMap.put(key,data);
        return resultMap;
    }

}
