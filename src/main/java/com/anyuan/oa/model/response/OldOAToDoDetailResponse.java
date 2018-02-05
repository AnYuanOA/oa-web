package com.anyuan.oa.model.response;

import java.util.List;

/**
 * Created by pengkan on 2018/2/5.
 */
public class OldOAToDoDetailResponse {
    private OldOAToDoDetail detail;
    private OldOAToDoOperation operation;
    private List<OldOAToDoDealt> dealtList;
    private List<OldOAAttachment> attachmentList;

    public OldOAToDoDetail getDetail() {
        return detail;
    }

    public void setDetail(OldOAToDoDetail detail) {
        this.detail = detail;
    }

    public OldOAToDoOperation getOperation() {
        return operation;
    }

    public void setOperation(OldOAToDoOperation operation) {
        this.operation = operation;
    }

    public List<OldOAToDoDealt> getDealtList() {
        return dealtList;
    }

    public void setDealtList(List<OldOAToDoDealt> dealtList) {
        this.dealtList = dealtList;
    }

    public List<OldOAAttachment> getAttachmentList() {
        return attachmentList;
    }

    public void setAttachmentList(List<OldOAAttachment> attachmentList) {
        this.attachmentList = attachmentList;
    }
}
