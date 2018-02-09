package com.anyuan.oa.utils.thread;

import com.anyuan.oa.model.response.HTTPResponse;
import com.anyuan.oa.utils.ConstantUtil;
import com.anyuan.oa.utils.HTTPUtil;

import java.io.IOException;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/3.
 */
public class HTTPTask implements Runnable{

    private String url;
    private String method;
    private Object param;
    private Map<String, String> headers;
    private HTTPTaskCallback callback;

    /**
     * 构造方法
     * @param url
     * @param method HTTP方法 GET/POST
     * @param param  Map<String, Object> 或 String
     * @param headers
     * @param callback
     */
    public HTTPTask(String url, String method, Object param, Map<String, String> headers, HTTPTaskCallback callback){
        this.url = url;
        this.method = method;
        this.param = param;
        this.headers = headers;
        this.callback = callback;
    }

    public void run() {
        try {
            HTTPResponse result = null;
            if(ConstantUtil.HTTP_METHOD_GET.toLowerCase().equals(this.method.toLowerCase())){
                result = HTTPUtil.sendGet(url, headers);
            }else if(ConstantUtil.HTTP_METHOD_POST.toLowerCase().equals(this.method.toLowerCase())){
                result = HTTPUtil.sendPostWithJson(url, param, headers);
            }else {//默认使用POST
                result = HTTPUtil.sendPostWithJson(url, param, headers);
            }
            callback.requestComplete(result);
        } catch (IOException e) {
            callback.requestComplete(null);
            e.printStackTrace();
        }
    }
}
