package com.anyuan.oa.utils;

import com.alibaba.fastjson.JSON;
import com.anyuan.oa.model.response.HTTPResponse;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/1.
 */
public class HTTPUtil {
    /**
     * 向指定 URL 发送POST方法的请求,ContentType = application/urlencodedform
     *
     * @param url
     *            发送请求的 URL
     * @param param
     *            请求参数
     *
     * @return 所代表远程资源的响应结果
     */
    public static HTTPResponse sendPostWithEncodeForm(String url, Map<String, String> param, Map<String, String> headers) throws IOException {
        HttpPost postRequest = new HttpPost(url);
        List<NameValuePair> npvs = new ArrayList<NameValuePair>();
        if(param != null){
            for(Map.Entry<String, String> entry : param.entrySet()) {
                npvs.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
            }
        }
        if(headers != null){
            for(Map.Entry<String, String> entry : headers.entrySet()){
                postRequest.setHeader(entry.getKey(), entry.getValue());
            }
        }
        postRequest.setEntity(new UrlEncodedFormEntity(npvs));
        return execute(postRequest);
    }

    /***
     * 向指定 URL 发送POST方法的请求,ContentType = application/json
     * @param url
     * @param param  json字符串
     * @return
     */
    public static HTTPResponse sendPostWithJson(String url, Map<String, Object> param, Map<String, String> headers) throws IOException {
        HttpPost postRequest = new HttpPost(url);
        postRequest.addHeader("Content-type","application/json; charset=utf-8");
        postRequest.setHeader("Accept", "application/json");
        if(headers != null){
            for(Map.Entry<String, String> entry : headers.entrySet()){
                postRequest.setHeader(entry.getKey(), entry.getValue());
            }
        }
        postRequest.setEntity(new StringEntity(JSON.toJSONString(param), Charset.forName("UTF-8")));
        return execute(postRequest);
    }

    private static HTTPResponse execute(HttpPost post) throws IOException {
        CloseableHttpClient client = HttpClients.createDefault();
        HTTPResponse result = new HTTPResponse();
        CloseableHttpResponse response = client.execute(post);
        try {
            HttpEntity entity = response.getEntity();
            result.setCode(response.getStatusLine().getStatusCode());
            result.setResult(EntityUtils.toString(entity));
            EntityUtils.consume(entity);
        } finally {
            response.close();
        }
        return result;
    }
}

