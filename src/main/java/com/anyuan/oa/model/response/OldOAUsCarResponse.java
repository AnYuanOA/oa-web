package com.anyuan.oa.model.response;

import com.anyuan.oa.model.request.OldOAUsCarRequest;

/**
 * Created by pengkan on 2018/2/10.
 */
public class OldOAUsCarResponse extends OldOAUsCarRequest{

    private String workflowTemplateID;
    private int buzPKID;
    private boolean buzDataSaveSucceed;
    private String currentUserID;
    private String currentUserChnName;
    private String djr;

    public String getWorkflowTemplateID() {
        return workflowTemplateID;
    }

    public void setWorkflowTemplateID(String workflowTemplateID) {
        this.workflowTemplateID = workflowTemplateID;
    }

    public int getBuzPKID() {
        return buzPKID;
    }

    public void setBuzPKID(int buzPKID) {
        this.buzPKID = buzPKID;
    }

    public boolean isBuzDataSaveSucceed() {
        return buzDataSaveSucceed;
    }

    public void setBuzDataSaveSucceed(boolean buzDataSaveSucceed) {
        this.buzDataSaveSucceed = buzDataSaveSucceed;
    }

    public String getCurrentUserID() {
        return currentUserID;
    }

    public void setCurrentUserID(String currentUserID) {
        this.currentUserID = currentUserID;
    }

    public String getCurrentUserChnName() {
        return currentUserChnName;
    }

    public void setCurrentUserChnName(String currentUserChnName) {
        this.currentUserChnName = currentUserChnName;
    }

    public String getDjr() {
        return djr;
    }

    public void setDjr(String djr) {
        this.djr = djr;
    }
}
