package com.anyuan.oa.filter;

import com.alibaba.fastjson.JSON;
import com.anyuan.oa.utils.servlet.LoggerResponseWrapper;
import org.apache.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

/**
 * Created by pengkan on 2018/2/8.
 */
public class LoggerFilter implements Filter{

    private static Logger logger = Logger.getLogger(LoggerFilter.class);

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        LoggerResponseWrapper resP = new LoggerResponseWrapper(res);

        chain.doFilter(request, resP);//处理请求前后分界线

        //记录请求日志
        List<Map<String, Object>> headers = getHeaders(req);
        List<Map<String, Object>> parameters = getParameters(req);
        byte[] bytes = resP.getBytes();
        logger.info("============ 接口访问日志 ============");
        logger.info("from: " + req.getRemoteAddr());
        logger.info("uri: " + req.getRequestURI());
        logger.info("headers: " + JSON.toJSONString(headers));
        logger.info("parameter: " + JSON.toJSONString(parameters));
        logger.info("response: " + new String(bytes, "utf-8"));
        logger.info("====================================");

        res.getOutputStream().write(bytes);
    }

    /**
     * 获取格式化的请求头信息
     * @param request
     * @return
     */
    private List<Map<String, Object>> getHeaders(HttpServletRequest request) {
        List<Map<String, Object>> headers = new ArrayList<Map<String, Object>>();
        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String headerName = headerNames.nextElement();
            Map<String, Object> headerMap = new HashMap<String, Object>();
            String header = request.getHeader(headerName);
            headerMap.put(headerName, header);
            headers.add(headerMap);
        }
        return headers;
    }

    /**
     * 获取格式化的请求参数信息
     * @param request
     * @return
     */
    private List<Map<String, Object>> getParameters(HttpServletRequest request) {
        List<Map<String, Object>> parameters = new ArrayList<Map<String, Object>>();
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String parameterName = parameterNames.nextElement();
            Map<String, Object> parameterMap = new HashMap<String, Object>();
            Object parameter = request.getParameter(parameterName);
            parameterMap.put(parameterName, parameter);
            parameters.add(parameterMap);
        }
        return parameters;
    }

    public void destroy() {

    }
}
