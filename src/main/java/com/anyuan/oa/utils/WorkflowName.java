package com.anyuan.oa.utils;

/**
 * Created by pengkan on 2018/3/17.
 */
public enum WorkflowName {
    LEAVE("请假申请", "IHRM_AttendanceLeave"),
    USCAR("用车申请", "IOA_Vehicle"),
    CHENGPIN("成品会签", "63309e267a62463984cec54cfbca834e"),
    BAOGAOCHUBANYONGZHANG("报告初版用章申请", "983ab3fecdc34bc0b59229ccac969f54"),
    JINGYINGYONGZHANG("经营用章申请", "81d946d3ec274b779adb5ff366b4846b"),
    YUSHENXIUGAIGAO("预审修改稿会签", "4f710021bd364b1faa5bf8850f337294"),
    XIANCHANGTAKAN("现场踏勘记录", "33ece14aed3245acb3a27307d7fdc264"),
    GUKECAICHAN("顾客财产情况备忘录", "e57bdf929bfb4935bbfa634ce8660fe0"),
    XIANGMUJIHUA("项目计划", "c299d39abb914787984d35e89ef835b0"),
    XIANGMUJIHUABIANGENG("项目计划变更", "8daa627883c94c7cb009fec14956f901"),
    XIANGMUZUCHENGYUANBIANGENG("项目组成员变更审批表", "afc66c80cab54265b568fe293c8136b6"),
    XIANGMUZUCHENGYUAN("项目组成员审批表", "d8bd033c209a4c88a85c95f0294e58e3"),
    XIANGMUKAIGONGTONGZHIDANBIANGENG("项目开工通知单变更", "97296fb4c5df4f36a4a37c453e9c088a"),
    XIANGMUKAIGONGTONGZHIDAN("项目开工通知单", "6312a82a13434cc5821a3c75f297eb2d"),
    HETONGBIANGENGSHENQING("合同变更申请", "ae1cc84f707749f58fcd98655d7a5436"),
    HETONGHUIQIANSHENQING("合同会签申请", "625591c621494b1489a8138003f7a9b8"),
    XIANGMUFENGXIANFENXI("项目风险分析(产品要求评审)记录单", "cb332c5495c04d55a1db1dd1a517c916"),
    XINWENZHONGXIN("新闻中心", "IOA_Message1002"),
    QINGSHIBANLI("请示办理流程", "IOA_Ask"),
    SHOUWENBANLILIUCHENG("收文办理流程", "IOA_Accept"),
    FAWENBANLILIUCHENG("发文办理流程", "IOA_Send");

    private String name;
    private String value;

    private WorkflowName(String name, String value) {
        this.name = name;
        this.value = value;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return this.value;
    }
}
