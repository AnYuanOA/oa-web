package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/2/2.
 */
public class OldOAToDoListResponse {
    private List<OldOAToDoItem> wfList;
    private int success;
    private String mes;

    public List<OldOAToDoItem> getWfList() {
        return wfList;
    }

    public void setWfList(List<OldOAToDoItem> wfList) {
        this.wfList = wfList;
    }

    public int getSuccess() {
        return success;
    }

    public void setSuccess(int success) {
        this.success = success;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }
}
