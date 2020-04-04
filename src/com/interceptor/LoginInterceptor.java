package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.entity.People;
import com.exception.AccessForbiddenException;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 1.通过request对象获取Session对象
		HttpSession session = request.getSession();
		
		// 2.尝试从Session域中获取Admin对象
		String username = (String) session.getAttribute("username");
		
		// 3.判断admin对象是否为空
		if(username == null) {
			
			// 4.抛出异常
			throw new AccessForbiddenException("请先登录");
			
		}
		
		// 5.如果Admin对象不为null，则返回true放行
		return true;
	}

}
