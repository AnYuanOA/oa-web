package com.anyuan.oa.model.response;

import com.anyuan.oa.model.request.OldOALeaveRequest;

/**
 * Created by pengkan on 2018/2/9.
 */
public class OldOALeaveResponse extends OldOALeaveRequest{
    /**
     * 业务主键ID
     */
    private int buzPKID;
    /**
     * 业务数据是否保存成功
     */
    private boolean buzDataSaveSucceed;

    private String djr;

    private String currentUserChnName;

    private String currentUserID;

    private String workflowTemplateID;

    private String uploadedFileID;

    private String uploadedFileName;

    private String createTime;


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

    public String getDjr() {
        return djr;
    }

    public void setDjr(String djr) {
        this.djr = djr;
    }

    public String getCurrentUserChnName() {
        return currentUserChnName;
    }

    public void setCurrentUserChnName(String currentUserChnName) {
        this.currentUserChnName = currentUserChnName;
    }

    public String getCurrentUserID() {
        return currentUserID;
    }

    public void setCurrentUserID(String currentUserID) {
        this.currentUserID = currentUserID;
    }

    public String getWorkflowTemplateID() {
        return workflowTemplateID;
    }

    public void setWorkflowTemplateID(String workflowTemplateID) {
        this.workflowTemplateID = workflowTemplateID;
    }

    public String getUploadedFileID() {
        return uploadedFileID;
    }

    public void setUploadedFileID(String uploadedFileID) {
        this.uploadedFileID = uploadedFileID;
    }

    public String getUploadedFileName() {
        return uploadedFileName;
    }

    public void setUploadedFileName(String uploadedFileName) {
        this.uploadedFileName = uploadedFileName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
