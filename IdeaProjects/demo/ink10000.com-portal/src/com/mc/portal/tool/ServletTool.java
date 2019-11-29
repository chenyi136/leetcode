package com.mc.portal.tool;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.InetAddress;
import java.net.URLEncoder;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mc.portal.crux.Global;
import com.mc.portal.pojo.OnlineInfo;
/**
 * 工具层-容器操作
 * @author 1138789752@qq.com
 * @version 2017-10-30 13:16:31
 * */
public final class ServletTool {
	/**
	 * 获取请求代理
	 * @param request 请求对象
	 * */
	public static String[] getAgent(HttpServletRequest request) {
		String agent = request.getHeader("User-Agent");
		if (agent != null) {
			agent = agent.toLowerCase();
			if (agent.indexOf("msie") != -1) {
				return new String[] { agent, "ie" };
			} else if (agent.indexOf("opera") > 0) {
				return new String[] { agent, "opera" };
			} else if (agent.indexOf("firefox") > 0) {
				return new String[] { agent, "firefox" };
			} else if (agent.indexOf("webkit") > 0) {
				return new String[] { agent, "webkit" };
			} else if (agent.indexOf("gecko") > 0 && agent.indexOf("rv:11") > 0) {
				return new String[] { agent, "gecko" };
			} else {
				return new String[] { agent, "unknow" };
			}
		}
		return new String[] { "", "unknow" };
	}
	/**
	 * 获取远程地址
	 * @param request 请求对象
	 * */
	public static String getAddr(HttpServletRequest request) {
		String[] header = new String[] { "X-Forwarded-For", "Proxy-Client-IP", "WL-Proxy-Client-IP", "HTTP_CLIENT_IP", "HTTP_X_FORWARDED_FOR" };
		for (String head : header) {
			String temp = request.getHeader(head);
			if (temp != null && !temp.equals("") && !temp.equalsIgnoreCase("unknown")) {
				return temp;
			}
		}
		String res = request.getRemoteAddr();
		if (res.equals("127.0.0.1") || res.equals("0:0:0:0:0:0:0:1")) {
			try {
				return InetAddress.getLocalHost().getHostAddress();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		int index = -1;
		if (res != null && res.length() > 15 && (index = res.indexOf(",")) != -1) {
			return res.substring(0, index);
		}
		return res;
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
	 * 执行下载任务
	 * @param request 请求对象
	 * @param response 响应对象
	 * @param data 字节数据
	 * @param file 文件数据
	 * @param name 下载名称
	 * */
	public static void getDown(HttpServletRequest request, HttpServletResponse response, byte[] data, File file, String name) throws Exception {
		if (data == null && (file == null || !file.exists() || !file.isFile() || !file.canRead() || name == null)) {
			response.sendError(404);
			return;
		}
		response.setContentType("application/octet-stream");
		response.setHeader("Content-disposition", "attachment;filename=" + (getAgent(request)[1].equals("firefox") ? new String(name.getBytes("UTF-8"), "ISO8859-1") : URLEncoder.encode(name, "UTF-8")));
		BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
		if (data == null) {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			response.setHeader("Content-Length", String.valueOf(bis.available()));
			byte[] temp = new byte[Global.FILE_CHUNK_SIZE];
			int length = 0;
			while ((length = bis.read(temp)) != -1) {
				bos.write(temp, 0, length);
			}
			bis.close();
		}else{
			response.setHeader("Content-Length", String.valueOf(data.length));
			bos.write(data);
		}
		bos.flush();
		bos.close();
	}
	/**
	 * 获取在线用户
	 * @param request 请求对象
	 * */
	public static OnlineInfo getOnline(HttpServletRequest request) {
		return (OnlineInfo) request.getSession().getAttribute(Global.KEY_SESSION_ONLINE);
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
			session.setAttribute(Global.KEY_JUMP_TOKEN, online.id);
		}
	}
	/**
	 * 获取物理路径
	 * @param request 请求对象
	 * @param context 上下文对象
	 * @param uri 请求路径
	 * */
	public static String getPath(HttpServletRequest request, ServletContext context, String uri) {
		if (request != null && context == null) {
			context = request.getSession().getServletContext();
		}
		if (context != null && uri != null) {
			if (!uri.startsWith("/")) {
				uri = "/" + uri;
			}
			String res = context.getRealPath(uri).replace("\\","/");
			return res.endsWith("/") ? res : res + "/";
		}
		return null;
	}
	/**
	 * 解析请求路径
	 * @param request 请求对象
	 * */
	public static String getURI(HttpServletRequest request) {
		return ("------" + request.getRequestURI()).replace("------" + Global.CONTEXT, "");
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