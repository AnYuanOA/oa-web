package com.anyuan.oa.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class WeChatUtil {
    private static final String APPID="wx42c2b2080fd58ff9";

    private static final String APPSECRET="a1eeab18ed1e785741946e3c29499a0c";

    private static String apiUrlStr = "https://api.weixin.qq.com/sns/jscode2session?appid="+APPID+"&secret="+APPSECRET+"&grant_type=authorization_code&js_code=";

    //小程序api接口封装
    public static String getConvert(String urlStr){
        urlStr=apiUrlStr+urlStr;
        String data = null;
        try {
            URL url = new URL(urlStr);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            //连接超时
            connection.setConnectTimeout(20000);
            //读取数据超时
            connection.setReadTimeout(19000);
            connection.connect();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));
            String line;
            StringBuilder stringBuilder = new StringBuilder();
            while ((line = bufferedReader.readLine())!=null) {
                stringBuilder.append(line);
            }
            bufferedReader.close();
            connection.disconnect();
            data = stringBuilder.toString();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return data;
    }
}
