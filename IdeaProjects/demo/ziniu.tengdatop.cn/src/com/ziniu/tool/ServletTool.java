package com.ziniu.tool;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.ziniu.crux.Global;
import com.ziniu.pojo.OnlineInfo;
/**
 * 工具层-容器操作
 * @author 1138789752@qq.com
 * @version 2017-10-30 13:16:31
 * */
public final class ServletTool {
	/**
	 * 解析请求路径
	 * @param request 请求对象
	 * */
	public static String getURI(HttpServletRequest request) {
		return ("------" + request.getRequestURI()).replace("------" + Global.CONTEXT, "");
	}
	/**
	 * 设置会话参数
	 * @param request 请求对象
	 * @param name 参数名称
	 * @param value 参数设置
	 * */
	public static void setAttribute(HttpServletRequest request, String name, Object value) {
		if (name != null) {
			if (value != null) {
				request.getSession().setAttribute(name, value);
			} else {
				request.getSession().removeAttribute(name);
			}
		}
	}
	/**
	 * 获取会话参数
	 * @param request 请求对象
	 * @param name 参数名称
	 * @param clazz 参数类型
	 * */
	@SuppressWarnings("unchecked")
	public static <T> T getAttribute(HttpServletRequest request, String name, Class<T> clazz) {
		if (name != null) {
			return (T) request.getSession().getAttribute(name);
		}
		return null;
	}
	/**
	 * 设置会话用户
	 * @param request 请求对象
	 * @param online 在线用户
	 * */
	public static void setOnline(HttpServletRequest request, OnlineInfo online) {
		if (online != null) {
			HttpSession session = request.getSession();
			session.setAttribute(Global.KEY_SESSION_ONLINE, online);
		}
	}
	/**
	 * 获取在线用户
	 * @param request 请求对象
	 * */
	public static OnlineInfo getOnline(HttpServletRequest request) {
		return (OnlineInfo) request.getSession().getAttribute(Global.KEY_SESSION_ONLINE);
	}
	/**
	 * 销毁会话对象
	 * @param request 请求对象
	 * */
	public static void destroy(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute(Global.KEY_SESSION_ONLINE);
		session.invalidate();
		session = null;
	}
}