package com.anyuan.oa.model.request;

import com.anyuan.oa.model.response.OldOAAppButton;

/**
 * Created by pengkan on 2018/2/8.
 */
public class OldOAProcessWorkflowRequest {
    /**
     * 未知意义  预测为true/false两个值  意见？
     */
    private String oaSPYJ;
    /**
     * 对应 in_sp_id
     */
    private int oaSPID;
    /**
     * 对应 buzPKID
     */
    private int appOId;
    /**
     * 流程当前步骤ID
     */
    private String currentStepId;
    /**
     * 审批人id及用户名
     */
    private String appFieldName;
    /**
     * 0
     */
    private int appOValue;

    private OldOAAppButton button;
    /**
     * 流程名称
     */
    private String workflowName;
    /**
     * 流程标题
     */
    private String workflowTitle;

    public String getOaSPYJ() {
        return oaSPYJ;
    }

    public void setOaSPYJ(String oaSPYJ) {
        this.oaSPYJ = oaSPYJ;
    }

    public int getOaSPID() {
        return oaSPID;
    }

    public void setOaSPID(int oaSPID) {
        this.oaSPID = oaSPID;
    }

    public int getAppOId() {
        return appOId;
    }

    public void setAppOId(int appOId) {
        this.appOId = appOId;
    }

    public int getAppOValue() {
        return appOValue;
    }

    public void setAppOValue(int appOValue) {
        this.appOValue = appOValue;
    }

    public OldOAAppButton getButton() {
        return button;
    }

    public void setButton(OldOAAppButton button) {
        this.button = button;
    }

    public String getWorkflowName() {
        return workflowName;
    }

    public void setWorkflowName(String workflowName) {
        this.workflowName = workflowName;
    }

    public String getWorkflowTitle() {
        return workflowTitle;
    }

    public void setWorkflowTitle(String workflowTitle) {
        this.workflowTitle = workflowTitle;
    }

    public String getCurrentStepId() {
        return currentStepId;
    }

    public void setCurrentStepId(String currentStepId) {
        this.currentStepId = currentStepId;
    }

    public String getAppFieldName() {
        return appFieldName;
    }

    public void setAppFieldName(String appFieldName) {
        this.appFieldName = appFieldName;
    }
}
