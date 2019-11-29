<%@ page language="java" import="
java.util.Map,
java.util.List,
com.mc.core.tool.JsonTool,
com.mc.portal.crux.Global,
com.mc.portal.tool.html.First,
com.mc.portal.tool.html.Form,
com.mc.portal.tool.html.Popup,
com.mc.portal.tool.html.Search" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
public static String icon(String key) throws Exception {
	return First.icon(key);
}
public String title(HttpServletRequest request, String... names) {
	com.mc.core.entity.auth.Power[] datas = (com.mc.core.entity.auth.Power[]) request.getAttribute(Global.KEY_JUMP_POWER);
	if (datas == null) {
		return "";
	}
	StringBuffer res = new StringBuffer();
	for (com.mc.core.entity.auth.Power data : datas) {
		if (data != null && !data.getId().equals("portal_admin_index")) {
			res.insert(0, "." + data.getName());
		}
	}
	res.deleteCharAt(0);
	if (names != null && names.length > 0) {
		for (String name : names) {
			if (name != null && !name.equals("")) {
				res.insert(0, name + " - ");
				break;
			}
		}
	}
	return res + " - " + request.getServletContext().getAttribute("SITE");
}
public String crumb(HttpServletRequest request, String... prefixs) throws Exception {
	StringBuffer res = new StringBuffer();
	String power = null;
	com.mc.core.entity.auth.Power[] datas = (com.mc.core.entity.auth.Power[]) request.getAttribute(Global.KEY_JUMP_POWER);
	com.mc.core.entity.auth.Power enjoy = null;
	res.append("<ol class=\"am-breadcrumb\">{home}");
	if (datas != null) {
		for (com.mc.core.entity.auth.Power data : datas) {
			if (data == null) {
				continue;
			}
			if ((data.getMenu() || data.getTacit()) && data.getRoute().endsWith(".htm")) {
				res.append("<li><a href=\"" + data.getRoute() + "\" class=\"" + data.getIcon() + "\">" + data.getName() + "</a></li>");
				enjoy = data;
				if (data.getMenu()) {
					power = data.getRoute();
				}
			} else {
				res.append("<li><i class=\"" + data.getIcon() + "\">" + data.getName() + "</i></li>");
			}
		}
	}
	res.append("</ol>");
	if (enjoy != null && res.indexOf("<li>", res.indexOf(enjoy.getRoute())) == -1) {
		res.append("<i class=\"" + icon("map-signs") + "\" onclick=\"JEnjoy('" + enjoy.getId() + "')\"></i>");
	}
	res.append("<input type=\"hidden\" value=\"" + (power != null ? power : "admin/index.htm") + "\" id=\"j_power\">");
	res.append("<hr class=\"am-margin-vertical-xs\">");
	if (res.indexOf("daily/index.htm") != -1) {
		return res.toString().replace("{home}", res.indexOf("admin/index.htm") == -1 ? "<li><a href=\"admin/index.htm\" class=\"" + icon("home") + "\">首页</a></li>" : "");
	}
	return res.toString().replace("{home}", res.indexOf("admin/index.htm") == -1 ? "<li><a href=\"admin/index.htm\" class=\"" + icon("home") + "\">首页</a></li>" : "").replace("</i></li></ol>", "</i> <i class=\"" + icon("at") + "\" onclick=\"JDaily(true," + JsonTool.write(prefixs).replace("\"", "'") + ",10)\"></i></ol>").replace("</a></li></ol>", "</a> <i class=\"" + icon("at") + "\" onclick=\"JDaily(true," + JsonTool.write(prefixs).replace("\"", "'") + ",10)\"></i></li></ol>");
}
public String radio(String name, boolean value) {
	StringBuffer res = new StringBuffer();
	if (value) {
		res.append("<label class=\"am-radio-inline\"><input type=\"radio\" value=\"1\" checked=\"checked\" data-am-ucheck name=\"" + name + "\"> 是</label>");
		res.append("<label class=\"am-radio-inline\"><input type=\"radio\" value=\"0\" data-am-ucheck name=\"" + name + "\"> 否</label>");
	} else {
		res.append("<label class=\"am-radio-inline\"><input type=\"radio\" value=\"1\" data-am-ucheck name=\"" + name + "\"> 是</label>");
		res.append("<label class=\"am-radio-inline\"><input type=\"radio\" value=\"0\" checked=\"checked\" data-am-ucheck name=\"" + name + "\"> 否</label>");
	}
	return res.toString();
}
public String replace(String data) {
	if (data == null || data.equals("")) {
		return "";
	}
	return data.replace("&", "&amp;").replace(">", "&gt;").replace("<", "&lt;").replace("\"", "&quot;").replace("'", "&apos;");
}
%>