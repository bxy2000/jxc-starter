package com.bosic.jxc.web.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bosic.jxc.domain.Resource;
import com.bosic.jxc.domain.User;
import com.bosic.jxc.service.UserService;

public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	private UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uri = request.getRequestURI();
		
		// 如果是资源文件或者是登录、退出则放行
		if (uri.indexOf("assets") > 0 || uri.indexOf("login") > 0 || uri.indexOf("logout") > 0) {
			return true;
		}
		
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			// 如果未登录则返回到登录页面
			response.sendRedirect(request.getContextPath() + "/account/login");
			return false;
		} else {
			// 否则，将功能菜单内容返回 ！！！！！！！！！！！！！！！！
			// 这样做的目的：不用在每个控制器的action中都加载导航数据了
			List<Resource> resources = userService.findResources(user.getId());
			request.setAttribute("_resources_", resources);
			return true;
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
