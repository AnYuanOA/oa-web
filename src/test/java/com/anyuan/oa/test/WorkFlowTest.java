package com.anyuan.oa.test;

import com.alibaba.fastjson.JSON;
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
     * 获取待阅列表
     */
    private static final String GET_TOREAD_LIST_URL = "/workflow/getToReadList";
    /**
     * 获取待办详情
     */
    private static final String GET_TODO_DETAIL_URL = "/workflow/getToDoDetail";
    /**
     * 获取流程初始准备信息
     */
    private static final String GET_TODO_INFO_URL = "/workflow/getToDoInfo";
    /**
     * 获取请假类型列表
     */
    private static final String GET_RESTTYPELIST_URL = "/workflow/getRestTypeList";
    /**
     * 获取用车类型列表
     */
    private static final String GET_USINGTYPELIST_URL = "/workflow/getUsingTypeList";
    /**
     * 提交请假申请
     */
    private static final String SUBMIT_LEAVE_URL = "/workflow/submitLeave";

    /**
     * 测试用openID
     */
    private static final String TEST_OPENID = "test654321";

    private static String sessionID;

    /**
     * 使用用户名密码登录
     */
    @BeforeClass
    public static void login() {
        String url = BASE_URL + LOGIN_URL;
        Map<String, String> param = new HashMap<String, String>();
        param.put("userName", "pengkan");
        param.put("openId", TEST_OPENID);
        param.put("password", "123456");
        param.put("chatNick", "Pengkan");
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

    /**
     * 使用openID登录
     */
//    @BeforeClass
    public static void loginWithOpenID() {
        String url = BASE_URL + LOGIN_OPENID_URL;
        Map<String, String> param = new HashMap<String, String>();
        param.put("openId", TEST_OPENID);
        try {
            HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, param, null);
            for (Cookie cookie : response.getCookies()) {
                if("JSESSIONID".equals(cookie.getName())){
                    sessionID = cookie.getValue();
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取待办流程列表
     * @throws IOException
     */
    @Test
    public void test1GetToDoList() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_TODO_LIST_URL;
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, null, headers);
        System.out.println("TodoList: " + response.getResult());
    }

    /**
     * 获取待阅列表
     * @throws IOException
     */
    @Test
    public void test2GetToReadList() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_TOREAD_LIST_URL;
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, null, headers);
        System.out.println("ToReadList: " + response.getResult());
    }

    /**
     * 获取流程详情
     * @throws IOException
     */
    @Test
    public void test3GetToDoDetail() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_TODO_DETAIL_URL;
        Map<String, String> params = new HashMap<String, String>();
        params.put("appID", "40945");
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, params, headers);
        System.out.println("TodoDetail: " + response.getResult());
    }

//    @Test
//    public void test4GetLeaveInfo() throws IOException {
//        assert sessionID!=null;
//        String url = BASE_URL + GET_TODO_INFO_URL;
//        Map<String, String> headers = getCommomHeaders();
//        Map<String, String> params = new HashMap<String, String>();
//        params.put("workflowName", "IHRM_AttendanceLeave");
//        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, params, headers);
//        System.out.println("LeaveInfo: " + response.getResult());
//    }
//
//    @Test
//    public void test5GetUsCarInfo() throws IOException {
//        assert sessionID!=null;
//        String url = BASE_URL + GET_TODO_INFO_URL;
//        Map<String, String> headers = getCommomHeaders();
//        Map<String, String> params = new HashMap<String, String>();
//        params.put("workflowName", "IOA_Vehicle");
//        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, params, headers);
//        System.out.println("UsCarInfo: " + response.getResult());
//    }

    /**
     * 获取请假类型列表
     * @throws IOException
     */
    @Test
    public void test6GetRestTypeList() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_RESTTYPELIST_URL;
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, null, headers);
        System.out.println("RestTypeList: " + response.getResult());
    }

    /**
     * 获取用车类型列表
     * @throws IOException
     */
    @Test
    public void test7GetUsingTypeList() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_USINGTYPELIST_URL;
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, null, headers);
        System.out.println("UsingTypeList: " + response.getResult());
    }

    /**
     * 提交请假申请
     * @throws IOException
     */
    @Test
    public void test8AddLeaveProcess() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + SUBMIT_LEAVE_URL;
        Map<String, String> headers = getCommomHeaders();
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("appID", "");
        params.put("in_sp_id", 0);
        params.put("attL_ID", "");
        params.put("applyUserChnName", "pengkan");
        params.put("attLT_Name", "事假");
        params.put("attLT_ID", 2);
        params.put("rest_start_date", "2018-02-02");
        params.put("startType", "上午");
        params.put("rest_end_date", "2018-02-03");
        params.put("endType", "下午");
        params.put("rest_day_num", 2);
        params.put("attL_Reason", "测试");
        params.put("workflowTitle", "pengkan休假申请（2018-02-02)");
        params.put("isNew", true);
        Map<String, String> realParams = new HashMap<String, String>();
        realParams.put("param", JSON.toJSONString(params));
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, realParams, headers);
        System.out.println("AddLeaveProcess: " + response.getResult());
    }

    /**
     * 清理
     */
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
