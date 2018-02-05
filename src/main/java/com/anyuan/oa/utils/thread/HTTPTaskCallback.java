package com.anyuan.oa.utils.thread;

import com.anyuan.oa.model.response.HTTPResponse;

/**
 * Created by pengkan on 2018/2/3.
 */
public interface HTTPTaskCallback {
    public void requestComplete(HTTPResponse response);
}
