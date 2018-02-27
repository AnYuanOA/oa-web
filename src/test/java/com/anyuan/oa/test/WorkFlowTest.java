package com.anyuan.oa.test;

import com.anyuan.oa.model.response.HTTPResponse;
import com.anyuan.oa.model.response.OldOAAppButton;
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
     * 提交用车申请
     */
    private static final String SUBMIT_USCAR_URL = "/workflow/submitUsingCar";
    /**
     * 办理流程
     */
    private static final String PROCESS_WORKFLOW_URL = "/workflow/processWorkflow";

    /**
     * 测试用openID
     */
    private static final String TEST_OPENID = "test6543219780";

    private static String sessionID;

    /**
     * 使用用户名密码登录
     */
//    @BeforeClass
    public static void login() {
        String url = BASE_URL + LOGIN_URL;
        Map<String, String> param = new HashMap<String, String>();
        param.put("userName", "jinher");//用户名
        param.put("openId", TEST_OPENID);//微信小程序openid
        param.put("password", "666666");//密码
        param.put("chatNick", "jinher");//微信昵称
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
    @BeforeClass
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

    @Test
    public void test2GetToReadList() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_TOREAD_LIST_URL;
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, null, headers);
        System.out.println("ToReadList: " + response.getResult());
    }

    @Test
    public void test3GetToDoDetail() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + GET_TODO_DETAIL_URL;
        Map<String, String> params = new HashMap<String, String>();
        params.put("appID", "40956");
        Map<String, String> headers = getCommomHeaders();
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, params, headers);
        System.out.println("TodoDetail: " + response.getResult());
    }

    /**
     * 办理流程
     * @throws IOException
     */
    @Test
    public void test10ProcessWorkflow() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + PROCESS_WORKFLOW_URL;
        Map<String, String> headers = getCommomHeaders();
        Map<String, Object> params = new HashMap<String, Object>();
        OldOAAppButton button = new OldOAAppButton();
        button.setAppID("40956");
        button.setButtonId("6");
        button.setButtonValue("转下一步");
        params.put("button", button);//对应详情接口 data.operation.appButton
        params.put("workflowName", "IHRM_AttendanceLeave");//对应详情接口 data.detail.workflowTemplateID
        params.put("workflowTitle", "jinher休假申请（2017-11-29)");//对应详情接口 data.detail.workflowTitle
        params.put("oaSPID", "45");//对应详情接口 data.detail.in_sp_id
        params.put("appOId", "147");//对应详情接口 data.detail.buzPKID
        Map<String, String> realParams = new HashMap<String, String>();
        realParams.put("param", JSON.toJSONString(params));
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, realParams, headers);
        System.out.println("ProcessWorkflow: " + response.getResult());
    }

    /**
     * 办理流程
     * @throws IOException
     */
    @Test
    public void test10ProcessWorkflow() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + PROCESS_WORKFLOW_URL;
        Map<String, String> headers = getCommomHeaders();
        Map<String, Object> params = new HashMap<String, Object>();
        OldOAAppButton button = new OldOAAppButton();
        button.setAppID("40956");
        button.setButtonId("6");
        button.setButtonValue("转下一步");
        params.put("button", button);//对应详情接口 data.operation.appButton
        params.put("workflowName", "IHRM_AttendanceLeave");//对应详情接口 data.detail.workflowTemplateID
        params.put("workflowTitle", "jinher休假申请（2017-11-29)");//对应详情接口 data.detail.workflowTitle
        params.put("oaSPID", "45");//对应详情接口 data.detail.in_sp_id
        params.put("appOId", "147");//对应详情接口 data.detail.buzPKID
        Map<String, String> realParams = new HashMap<String, String>();
        realParams.put("param", JSON.toJSONString(params));
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, realParams, headers);
        System.out.println("ProcessWorkflow: " + response.getResult());
    }

    /**
     * 办理流程
     * @throws IOException
     */
    @Test
    public void test10ProcessWorkflow() throws IOException {
        assert sessionID!=null;
        String url = BASE_URL + PROCESS_WORKFLOW_URL;
        Map<String, String> headers = getCommomHeaders();
        Map<String, Object> params = new HashMap<String, Object>();
        OldOAAppButton button = new OldOAAppButton();
        button.setAppID("40956");
        button.setButtonId("6");
        button.setButtonValue("转下一步");
        params.put("button", button);//对应详情接口 data.operation.appButton
        params.put("workflowName", "IHRM_AttendanceLeave");//对应详情接口 data.detail.workflowTemplateID
        params.put("workflowTitle", "jinher休假申请（2017-11-29)");//对应详情接口 data.detail.workflowTitle
        params.put("oaSPID", "45");//对应详情接口 data.detail.in_sp_id
        params.put("appOId", "147");//对应详情接口 data.detail.buzPKID
        Map<String, String> realParams = new HashMap<String, String>();
        realParams.put("param", JSON.toJSONString(params));
        HTTPResponse response = HTTPUtil.sendPostWithEncodeForm(url, realParams, headers);
        System.out.println("ProcessWorkflow: " + response.getResult());
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
