package com.anyuan.oa.utils;

/**
 * Created by pengkan on 2018/2/7.
 */
public class OldServiceConstant {
    /**
     * 基础URL
     */
    private static final String BASE_URL = "http://101.37.171.186/bapi/";
    /**
     * 基础业务URL
     */
    private static final String BASE_URL_BUZAPI = "http://101.37.171.186/aymapi/";
    /**
     * 登录URI
     */
    private static final String TOKEN_URI = "Token";
    /**
     * 待办列表URI
     */
    private static final String TODO_URI = "api/WorkFlow/getMyWFList";
    /***
     * 待阅列表
     */
    private static final String TOREAD_URI = "api/WorkFlow/GetWaitReadInfos";
    /**
     * 待办详情URI
     * */
    private static final String TODO_DETAIL_URI = "api/HRC6RestApply/Detail";
    /**
     * 获取流程详细信息
     */
    private static final String WORKFLOW_OPERATION_INFO = "api/WorkFlow/getWFDetailInfoNew";
    /**
     * 获取流程附件列表
     */
    private static final String WORKFLOW_ATTACHS = "api/HRC6RestApply/GetAttachs";
    /**
     * 获取流程办理列表
     * */
    private static final String WORKFLOW_DEALT_INFO = "api/workflow/getWFDealtInfo";
    /**
     * 获取流程图svg字符串
     */
    private static final String WORKFLOW_SVGSTR_URI = "api/WorkFlow/GetFlowSvgNodeStr";
    /**
     * 获取流程初始信息
     */
    private static final String WORKFLOW_START_INFO_URI = "api/WorkFlow/getWokFlowStartInfo";
    /**
     * 获取用车类型
     */
    private static final String WORKFLOW_GET_USCARTYPE_URI = "api/HRC6CarUsingApply/GetUsingTypes";
    /**
     * 获取请假类型
     */
    private static final String WORKFLOW_GET_RESTTYPE_URI = "api/HRC6RestApply/GetRestTypes";
    /**
     * 获取流程步骤
     */
    private static final String WORKFLOW_GET_STEPLIST_URI = "api/WorkFlow/GetWFStepInfo";
    /**
     * 新增请假申请
     */
    private static final String WORKFLOW_ADDLEAVE_URI = "api/HRC6RestApply/Add";
    /**
     * 新增用车申请
     */
    private static final String WORKFLOW_ADDUSCAR_URI = "api/HRC6CarUsingApply/Add";
    /**
     * 办理流程
     */
    private static final String WORKFLOW_PROCESS_URI = "api/WorkFlow/WorkFlowDeal";

    /**
     * 授权类型
     */
    public static final String GRANT_TYPE = "password";
    /**
     * 客户端ID
     */
    public static final String CLIENT_ID = "imWebBrowser";
    /**
     * 请假流程名称
     */
    public static final String WORKFLOW_NAME_LEAVE = "IHRM_AttendanceLeave";
    /**
     * 用车流程名称
     */
    public static final String WORKFLOW_NAME_USCAR = "IOA_Vehicle";

    /**
     * 获取token或刷新token
     */
    public static final String TOKEN_URL = BASE_URL + TOKEN_URI;
    /**
     * 获取待办列表
     */
    public static final String TODO_URL = BASE_URL + TODO_URI;
    /**
     * 获取待阅列表
     */
    public static final String TOREAD_URL = BASE_URL + TOREAD_URI;
    /**
     * 获取待办流程详情
     */
    public static final String TODO_DETAIL_URL = BASE_URL + TODO_DETAIL_URI;
    /**
     * 获取待办流程当前可执行操作任务
     */
    public static final String WORKFLOW_OPERATION_INFO_URL = BASE_URL + WORKFLOW_OPERATION_INFO;
    /**
     * 获取流程已办理节点信息
     */
    public static final String WORKFLOW_DEALT_INFO_URL = BASE_URL + WORKFLOW_DEALT_INFO;
    /**
     * 获取流程附件列表
     */
    public static final String WORKFLOW_ATTACHS_URL = BASE_URL + WORKFLOW_ATTACHS;
    /**
     * 获取流程图svg字符串
     */
    public static final String WORKFLOW_SVGSTR_URL = BASE_URL + WORKFLOW_SVGSTR_URI;
    /**
     * 获取流程初始信息
     */
    public static final String WORKFLOW_START_INFO_URL = BASE_URL + WORKFLOW_START_INFO_URI;
    /**
     * 获取用车类型
     */
    public static final String WORKFLOW_GET_USCARTYPE_URL = BASE_URL + WORKFLOW_GET_USCARTYPE_URI;
    /**
     * 获取请假类型
     */
    public static final String WORKFLOW_GET_RESTTYPE_URL = BASE_URL + WORKFLOW_GET_RESTTYPE_URI;
    /**
     * 获取流程审批步骤
     */
    public static final String WORKFLOW_GET_STEPLIST_URL = BASE_URL + WORKFLOW_GET_STEPLIST_URI;
    /**
     * 新增请假申请
     */
    public static final String WORKFLOW_ADDLEAVE_URL = BASE_URL + WORKFLOW_ADDLEAVE_URI;
    /**
     * 新增用车申请
     */
    public static final String WORKFLOW_ADDUSCAR_URL = BASE_URL + WORKFLOW_ADDUSCAR_URI;
    /**
     * 办理流程
     */
    public static final String WORKFLOW_PROCESS_URL = BASE_URL + WORKFLOW_PROCESS_URI;
}
