package com.jxd.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @version 1.0
 * @ClassName Loginterceptor
 * @Description TODO
 * @Author Zhou Yang
 * @Date 2020/9/18 11:56
 */
public class Loginterceptor implements HandlerInterceptor {
    //拦截前处理
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
        HttpSession session = request.getSession();
        String uri = request.getRequestURI();
        //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if (uri.indexOf("login") >= 0) {
            return true;
        }
        if (uri.indexOf("checkLogin") >= 0) {
            return true;
        }
        Object sessionObj = session.getAttribute("loginUser");
        if (sessionObj != null) {
            return true;
        }
        response.sendRedirect("login");
        return false;
    }

    //拦截后处理
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView mav) throws
            Exception {
    }

    //全部完成后处理
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception e) throws
            Exception {
    }
}
