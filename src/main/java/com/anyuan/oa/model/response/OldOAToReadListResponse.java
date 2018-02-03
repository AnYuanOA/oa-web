package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/2/2.
 */
public class OldOAToReadListResponse {
    private List<OldOAToReadItem> waitList;
    private String waitAllCount;
    private boolean status;
    private String msg;

    public List<OldOAToReadItem> getWaitList() {
        return waitList;
    }

    public void setWaitList(List<OldOAToReadItem> waitList) {
        this.waitList = waitList;
    }

    public String getWaitAllCount() {
        return waitAllCount;
    }

    public void setWaitAllCount(String waitAllCount) {
        this.waitAllCount = waitAllCount;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
