package com.anyuan.oa.test;

import com.anyuan.oa.model.response.HTTPResponse;
import com.anyuan.oa.utils.HTTPUtil;
import org.apache.http.cookie.Cookie;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by pengkan on 2018/2/6.
 */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class WorkFlowTest {
    private static final String BASE_URL = "http://localhost:8080";

    /***
     * 登录
     */
    private static final String LOGIN_URL = "/login/loginAnyuanUser";
    /***
     * 使用openID登录
     */
    private static final String LOGIN_OPENID_URL = "/login/loginWithOpenID";
    /***
     * 获取待办列表
     */
    private static final String GET_TODO_LIST_URL = "/workflow/getToDoList";

    /**
     * 测试用openID
     */
    private static final String TEST_OPENID = "test123456";

    private static String sessionID;


    @BeforeClass
    public static void login() {
        String url = BASE_URL + LOGIN_URL;
        Map<String, String> param = new HashMap<String, String>();
        param.put("userName", "jinher");
        param.put("openId", TEST_OPENID);
        param.put("password", "666666");
        param.put("chatNick", "Test");
        try {
            HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, param, null);
            for (Cookie cookie : response.getCookies()) {
                if("JSESSIONID".equals(cookie.getName())){
                    sessionID = cookie.getValue();
                    break;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void test1LoginWithOpenID() throws IOException {

    }

    @Test
    public void test2GetToDoList() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_TODO_LIST_URL;
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, null, headers);
        System.out.println(response);
    }

    @AfterClass
    public static void clear() {
        sessionID = null;
    }

    private Map<String, String> getCommomHeaders() {
        Map<String, String> headers = new HashMap<String, String>();
        headers.put("JSESSIONID", sessionID);
        return headers;
    }
}
