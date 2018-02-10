package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/2/7.
 */
public class OldOAToDoInfoResponse {
    /**
     * 流程图SVG格式字符串
     */
    private String workflowSvg;
    /**
     * 流程初始化信息
     */
    private OldOAToDoStartInfo startInfo;
    /**
     * 用车类型
     */
    private List<OldOAUsingType> usingTypes;
    /**
     * 请假类型
     */
    private List<OldOARestType> restTypes;
    /**
     * 流程步骤列表
     */
    private List<OldOAToDoStepInfo> stepList;

    public String getWorkflowSvg() {
        return workflowSvg;
    }

    public void setWorkflowSvg(String workflowSvg) {
        this.workflowSvg = workflowSvg;
    }

    public OldOAToDoStartInfo getStartInfo() {
        return startInfo;
    }

    public void setStartInfo(OldOAToDoStartInfo startInfo) {
        this.startInfo = startInfo;
    }

    public List<OldOAUsingType> getUsingTypes() {
        return usingTypes;
    }

    public void setUsingTypes(List<OldOAUsingType> usingTypes) {
        this.usingTypes = usingTypes;
    }

    public List<OldOARestType> getRestTypes() {
        return restTypes;
    }

    public void setRestTypes(List<OldOARestType> restTypes) {
        this.restTypes = restTypes;
    }

    public List<OldOAToDoStepInfo> getStepList() {
        return stepList;
    }

    public void setStepList(List<OldOAToDoStepInfo> stepList) {
        this.stepList = stepList;
    }
}
