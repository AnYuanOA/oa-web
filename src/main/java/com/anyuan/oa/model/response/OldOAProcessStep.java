package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/2/9.
 */
public class OldOAProcessStep {
    private String mes;
    private int success;
    private List<OldOAToDoStepInfo> wfNextStepList;

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public List<OldOAToDoStepInfo> getWfNextStepList() {
        return wfNextStepList;
    }

    public void setWfNextStepList(List<OldOAToDoStepInfo> wfNextStepList) {
        this.wfNextStepList = wfNextStepList;
    }
}
