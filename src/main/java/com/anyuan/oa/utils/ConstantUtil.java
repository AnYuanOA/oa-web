package com.anyuan.oa.utils;

public class ConstantUtil {
    public static final int ERROR_CODE = 500;
    /**
     * 无权限code
     */
    public static final int NO_PERMISSION_CODE = 10001;
    /**
     * 用户未绑定code
     */
    public static final int USER_NOT_BIND_CODE = 10002;

    public static final int SUCCESS_CODE = 200;

    public static final String LOGIN_SESSION_ID="_WE_CHAT_LOGIN_";

    public static final String NO_ACCOUNT = "用户不存在！";

    public static final String ERROR_ACCOUNT = "用户名或密码错误！";

    public static final String RESPONSE_EXCEPTION = "服务异常！";

    public static final String NO_PERMISSION = "您无权进行访问！";

    public static final String OPENID_EMPTY = "openID不能为空";

    public static final String USER_NOT_BIND = "未绑定用户";

    public static final String APPID_EMPTY = "appID不能为空";

    public static final String WORKFLOWNAME_EMPTY = "workflowName不能为空";

    public static final String WORKFLOW_NOT_SUPPORT = "不支持的流程名称";

    public static final String REQUEST_PARAM_ERROR = "请求参数格式不正确";

    /***
     * 老OA访问授权信息
     */
    public static final String OLD_OA_ACCESS_TOKEN = "OLD_OA_ACCESS_TOKEN";
    /**
     * sessionID标识
     */
    public static final String JSESSIONID = "JSESSIONID";
    /**
     * HTTP GET方法标识
     */
    public static final String HTTP_METHOD_GET = "GET";
    /**
     * HTTP POST方法标识
     */
    public static final String HTTP_METHOD_POST = "POST";
}
