package com.anyuan.oa.utils;

/**
 * Created by pengkan on 2018/2/7.
 */
public class OldServiceConstant {

    private static final String URL = ServerConstant.OLD_AY_HOST;

    private static final String AYXZ_URL=ServerConstant.AYXZ_HOST;

    /**
     * 基础URL
     */
    private static final String BASE_URL = URL + "/bapi/api";
    /**
     * OA基础API
     */
    private static final String OA_BASE_URL = URL + "/oapi/api";
    /**
     * 基础业务URL
     */
    private static final String BASE_URL_BUZAPI = URL + "/aymapi/api";



    /**
     * 登录URI
     */
    private static final String TOKEN_URI = URL + "/bapi/Token";
    /**
     * 待办列表URI
     */
    private static final String TODO_URI = "/WorkFlow/getMyWFList";
    /***
     * 待阅列表
     */
    private static final String TOREAD_URI = "/WorkFlow/GetWaitReadInfos";
    /**
     * 待办详情URI
     * */
    private static final String TODO_DETAIL_URI = "/HRC6RestApply/Detail";
    /**
     * 获取流程详细信息
     */
    private static final String WORKFLOW_OPERATION_INFO = "/WorkFlow/getWFDetailInfoNew";
    /**
     * 获取流程附件列表
     */
    private static final String WORKFLOW_ATTACHS = "/HRC6RestApply/GetAttachs";
    /**
     * 获取流程办理列表
     * */
    private static final String WORKFLOW_DEALT_INFO = "/workflow/getWFDealtInfo";
    /**
     * 获取流程图svg字符串
     */
    private static final String WORKFLOW_SVGSTR_URI = "/WorkFlow/GetFlowSvgNodeStr";
    /**
     * 获取流程初始信息
     */
    private static final String WORKFLOW_START_INFO_URI = "/WorkFlow/getWokFlowStartInfo";
    /**
     * 获取用车类型
     */
    private static final String WORKFLOW_GET_USCARTYPE_URI = "/HRC6CarUsingApply/GetUsingTypes";
    /**
     * 获取请假类型
     */
    private static final String WORKFLOW_GET_RESTTYPE_URI = "/HRC6RestApply/GetRestTypes";
    /**
     * 获取流程步骤
     */
    private static final String WORKFLOW_GET_STEPLIST_URI = "/WorkFlow/GetWFStepInfo";
    /**
     * 新增请假申请
     */
    private static final String WORKFLOW_ADDLEAVE_URI = "/HRC6RestApply/Add";
    /**
     * 新增用车申请
     */
    private static final String WORKFLOW_ADDUSCAR_URI = "/HRC6CarUsingApply/Add";
    /**
     * 办理流程
     */
    private static final String WORKFLOW_PROCESS_URI = "/WorkFlow/WorkFlowDeal";
    /**
     * 消息类型列表
     */
    private static final String MESSAGE_TYPE_LIST_URI = "/oaPortalMsgType/Get";
    /**
     * 根据类型获取消息列表
     */
    private static final String MESSAGE_BY_TYPE_URI = "/oaPortalMsg/GetListByMainType";
    /**
     * 获取用户信息
     */
    private static final String USER_INFO_URI = "/Common/GetMyInfo";
    /**
     * 成品会签流程详情
     */
    private static final String WORKFLOW_FINISHED_PRODUCT_URI = "/Ay/W023";
    /**
     * 预审修改稿会签
     */
    private static final String WORKFLOW_FIRST_AUDIT_URI = "/Ay/W022";
    /**
     * 现场踏勘
     */
    private static final String WORKFLOW_XIANCHANG_URI = "/Ay/W019";
    /**
     * 顾客财产
     */
    private static final String WORKFLOW_GUKECAICHAN_URI = "/Ay/W017";
    /**
     * 项目计划
     */
    private static final String WORKFLOW_XIANGMU_URI = "/Ay/W013";

    /**
     * 授权类型
     */
    public static final String GRANT_TYPE = "password";
    /**
     * 客户端ID
     */
    public static final String CLIENT_ID = "imWebBrowser";


    /**
     * 获取token或刷新token
     */
    public static final String TOKEN_URL = TOKEN_URI;
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
    /**
     * 获取消息类型列表
     */
    public static final String MESSAGE_TYPE_LIST_URL = OA_BASE_URL + MESSAGE_TYPE_LIST_URI;
    /**
     * 根据消息类型获取消息列表
     */
    public static final String MESSAGE_BY_TYPE_URL = OA_BASE_URL + MESSAGE_BY_TYPE_URI;
    /**
     * 获取用户个人信息
     */
    public static final String USER_INFO_URL = BASE_URL + USER_INFO_URI;
    /**
     * 成品会签流程详情
     */
    public static final String WORKFLOW_FINISHED_PRODUCT_URL = BASE_URL_BUZAPI + WORKFLOW_FINISHED_PRODUCT_URI;
    /**
     * 预审修改稿会签
     */
    public static final String WORKFLOW_FIRST_AUDIT_URL = BASE_URL_BUZAPI + WORKFLOW_FIRST_AUDIT_URI;
    /**
     * 现场踏勘
     */
    public static final String WORKFLOW_XIANCHANG_URL = BASE_URL_BUZAPI + WORKFLOW_XIANCHANG_URI;
    /**
     * 顾客财产
     */
    public static final String WORKFLOW_GUKECAICHAN_URL = BASE_URL_BUZAPI + WORKFLOW_GUKECAICHAN_URI;
    /**
     * 项目计划
     */
    public static final String WORKFLOW_XIANGMU_URL = BASE_URL_BUZAPI + WORKFLOW_XIANGMU_URI;
    /**
     * 项目计划变更
     */
    public static final String WORKFLOW_XIANGMUBIANGENG_URL = BASE_URL_BUZAPI + "/Ay/W014";
    /**
     * 项目成员变更
     */
    public static final String WORKFLOW_XIANGMUCHENGYUANBIANGENG_URL = BASE_URL_BUZAPI + "/Ay/W012";
    /**
     * 项目成员
     */
    public static final String WORKFLOW_XIANGMUCHENGYUAN_URL = BASE_URL_BUZAPI + "/Ay/W011";
    /**
     * 项目开工通知单变更
     */
    public static final String WORKFLOW_XIANGMUKAIGONGBIANGENG_URL = BASE_URL_BUZAPI + "/Ay/W008";
    /**
     * 项目开工通知单
     */
    public static final String WORKFLOW_XIANGMUKAIGONG_URL = BASE_URL_BUZAPI + "/Ay/W001";
    /**
     * 合同变更
     */
    public static final String WORKFLOW_HETONGBIANGENG_URL = BASE_URL_BUZAPI + "/Ay/W006";
    /**
     * 合同申请
     */
    public static final String WORKFLOW_HETONG_URL = BASE_URL_BUZAPI + "/Ay/W005";
    /**
     * 项目风险分析
     */
    public static final String WORKFLOW_XIANGMUFENGXIAN_URL = BASE_URL_BUZAPI + "/Ay/W007";
    /**
     * 新闻中心
     */
    public static final String WORKFLOW_NEWSCENTER_URL = BASE_URL + "/HRC6MessageApprove/Detail";
    /**
     * 用车申请
     */
    public static final String WORKFLOW_USCAR_URL = BASE_URL + "/HRC6CarUsingApply/Detail";
    /**
     * 请示办理
     */
    public static final String WORKFLOW_QINGSHI_URL = BASE_URL + "/GWC6AskDoc/Detail";
    /**
     * 收文办理
     */
    public static final String WORKFLOW_SHOUWEN_URL = BASE_URL + "/GWC6AccteptDoc/Detail";
    /**
     * 发文办理
     */
    public static final String WORKFLOW_FAWEN_URL = BASE_URL + "/GWC6SendDoc/Detail";

    /**
     * 年度计划
     */
    public static final String AYXZ_YEAR_PLAN_URL=AYXZ_URL+"/ayxz/dorado/yearPlan";

    /**
     * 月计划
     */
    public static final String AYXZ_MONTH_PLAN_URL=AYXZ_URL+"/ayxz/dorado/monthPlan";

    /**
     * 周计划
     */
    public static final String AYXZ_WEEK_PLAN_URL=AYXZ_URL+"/ayxz/dorado/weekPlan";

    /**
     * 个人工作
     */
    public static final String AYXZ_SELF_PLAN_URL=AYXZ_URL+"/ayxz/dorado/grPlan";

    /**
     * ayxz转化数据接口url
     */
    public static final String AYXZ_CONVER_URL=AYXZ_URL+"/ayxz/dorado/getData";
}
