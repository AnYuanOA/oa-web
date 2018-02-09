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
     * 0
     */
    private int appOValue;

    private OldOAAppButton button;

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
}
