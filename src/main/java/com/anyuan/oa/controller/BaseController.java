package com.anyuan.oa.controller;

import java.util.HashMap;
import java.util.Map;

public class BaseController {

    protected <T> Map<String,Object> coverResultMap(String key,T data){
        Map<String,Object> resultMap=new HashMap<String,Object>();
        resultMap.put(key,data);
        return resultMap;
    }


}
