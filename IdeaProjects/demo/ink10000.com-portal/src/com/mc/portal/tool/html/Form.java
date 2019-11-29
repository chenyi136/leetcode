package com.mc.portal.tool.html;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.mc.core.entity.SuperEntity;
import com.mc.portal.crux.Global;
public class Form extends First {
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * */
	public static String input(SuperEntity.Field field, Object value) {
		return input(field, "text", value, null);
	}
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * @param placeholder 提示文字
	 * */
	public static String input(SuperEntity.Field field, Object value, String placeholder) {
		return input(field, "text", value, placeholder);
	}
	/**
	 * @param field 操作字段
	 * @param type 控件类型
	 * @param value 字段赋值
	 * @param placeholder 提示文字
	 * */
	public static String input(SuperEntity.Field field, String type, Object value, String placeholder) {
		if (value == null) {
			value = "";
		}
		if (type.equals("url") && !value.toString().startsWith("http://") && !value.toString().startsWith("https://")) {
			value = "";
		}
		StringBuffer res = new StringBuffer();
		if (field.Empty) {
			res.append("<div class=\"am-form-group am-form-icon am-form-feedback\">");
			res.append("<div class=\"am-u-md-3 am-text-right\">" + field.getAlias() + "</div>");
		} else {
			res.append("<div class=\"am-form-group am-form-success am-form-icon am-form-feedback\">");
			res.append("<div class=\"am-u-md-3 am-form-label am-text-right\">" + field.getAlias() + "</div>");
		}
		res.append("<div class=\"am-u-md-9\"" + (field.Note != null && !field.Note.equals("") ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">");
		res.append("<input type=\"" + type + "\" class=\"am-form-field am-input-sm\"" + (!value.toString().equals("") ? " value=\"" + value + "\"" : ""));
		if (field.ClazzFieldName != null) {
			String temp = "";
			if (!field.Empty) {
				res.append(" required=\"required\"");
				temp += "必填";
			}
			if (field.FrameFieldLength > 0) {
				res.append(" maxlength=\"" + field.FrameFieldLength + "\"");
				temp += (temp.equals("") ? "" : "，") + "长度最多" + field.FrameFieldLength + "位";
			}
			if (placeholder != null) {
				temp += (temp.equals("") ? "" : "，") + placeholder;
			}
			if (type.equals("url")) {
				temp += (temp.equals("") ? "" : "，") + "网址格式，双击此处可访问";
			} else if (type.equals("number")) {
				temp += (temp.equals("") ? "" : "，") + "仅限数字";
			}
			if (!temp.equals("")) {
				res.append(" placeholder=\"" + temp + "\"");
			}
			res.append(" name=\"" + field.ClazzFieldName + "\"");
		} else {
			res.append(" readonly=\"readonly\"");
			if (placeholder != null) {
				res.append(" placeholder=\"" + placeholder + "\"");
			}
			if (field.FrameFieldName != null) {
				res.append(" id=\"" + field.FrameFieldName + "\"");
			}
		}
		res.append((type.equals("url") ? " ondblclick=\"JFile(this)\"" : "") + "></div></div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * @param placeholder 提示文字
	 * @param mime 文件类型
	 * */
	public static String file(SuperEntity.Field field, String value, String placeholder, String mime) {
		String temp = "";
		StringBuffer res = new StringBuffer();
		if (!field.Empty) {
			res.append("<div class=\"am-form-group am-form-success am-form-icon am-form-feedback\">");
			res.append("<div class=\"am-u-md-3 am-form-label am-text-right\">" + field.getAlias() + "</div>");
		} else {
			res.append("<div class=\"am-form-group am-form-icon am-form-feedback\">");
			res.append("<div class=\"am-u-md-3 am-text-right\">" + field.getAlias() + "</div>");
		}
		res.append("<div class=\"am-u-md-9 am-input-group\"" + (field.Note != null && !field.Note.equals("") ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">");
		res.append("<input type=\"text\" class=\"am-form-field\"" + (value != null ? " value=\"" + value + "\"" : ""));
		if (!field.Empty) {
			res.append(" required=\"required\"");
			temp += "必填";
		}
		res.append(" readonly=\"readonly\"");
		if (placeholder != null) {
			temp += (temp.equals("") ? "" : "，") + placeholder;
		}
		if (!temp.equals("")) {
			res.append(" placeholder=\"" + temp + "\"");
		}
		String key = field.FrameFieldName != null ? field.FrameFieldName : field.ClazzFieldName;
		res.append(" name=\"" + field.ClazzFieldName + "\" id=\"" + key + "\" ondblclick=\"JFile(this,true)\">");
		res.append("<b class=\"am-input-group-btn\">");
		res.append("<button type=\"button\" class=\"am-btn " + (field.Empty ? "am-btn-default" : "am-btn-success") + "\" onclick=\"javascript:$('#" + key + "').val('');\">删除文件</button>");
		res.append("<button type=\"button\" class=\"am-btn " + (field.Empty ? "am-btn-default" : "am-btn-success") + "\" onclick=\"JUpload(this,'" + (mime != null ? mime : "*") + "','" + key + "')\">选择文件</button>");
		res.append("</b></div></div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * @param placeholder 提示文字
	 * @param format 日期格式
	 * @param min 最小日期
	 * */
	public static String time(SuperEntity.Field field, String value, String placeholder, String format, String min) throws Exception {
		StringBuffer res = new StringBuffer();
		if (field.Empty) {
			res.append("<div class=\"am-form-group am-form-icon am-form-feedback\">");
			res.append("<div class=\"am-u-md-3 am-text-right\">" + field.getAlias() + "</div>");
		} else {
			res.append("<div class=\"am-form-group am-form-success am-form-icon am-form-feedback\">");
			res.append("<div class=\"am-u-md-3 am-form-label am-text-right\">" + field.getAlias() + "</div>");
		}
		res.append("<div class=\"am-u-md-9\"" + (field.Note != null && !field.Note.equals("") ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">");
		res.append("<input type=\"text\" class=\"am-form-field am-input-sm\"" + (value != null && !value.equals("") ? " value=\"" + value + "\"" : ""));
		if (field.ClazzFieldName != null) {
			String temp = "";
			if (!field.Empty) {
				res.append(" required=\"required\"");
				temp += "必填";
			}
			res.append(" readonly=\"readonly\"");
			if (placeholder != null) {
				temp += (temp.equals("") ? "" : "，") + placeholder;
			}
			if (!temp.equals("")) {
				res.append(" placeholder=\"" + temp + "\"");
			}
			res.append(" name=\"" + field.ClazzFieldName + "\"");
		} else {
			res.append(" readonly=\"readonly\"");
			if (placeholder != null) {
				res.append(" placeholder=\"" + placeholder + "\"");
			}
			if (field.FrameFieldName != null) {
				res.append(" id=\"" + field.FrameFieldName + "\"");
			}
		}
		res.append(" onclick=\"jeDate({dateCell:this,festival:true,format:'" + (format != null ? format : "YYYY-MM-DD") + "',isClick:true,isinitVal:false,isToday:true" + (min != null ? ",minDate:'" + min + "'" : "") + "})\"></div></div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param text 显示文字
	 * @param value 字段赋值
	 * */
	public static String radio(SuperEntity.Field field, String[] text, boolean value) {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-form-group am-form-success am-form-icon am-form-feedback\">");
		res.append("<div class=\"am-u-md-3 am-form-label am-text-right\">" + field.getAlias() + "</div>");
		res.append("<div class=\"am-u-md-9 am-btn-group j-radio\" data-am-button" + (field.Note != null && !field.Note.equals("") ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">");
		if (value) {
			res.append("<label class=\"am-btn am-btn-success am-active\"><input type=\"radio\" value=\"1\" checked=\"checked\" name=\"" + field.ClazzFieldName + "\"> " + text[0] + "</label>");
			res.append("<label class=\"am-btn am-btn-success\"><input type=\"radio\" value=\"0\" name=\"" + field.ClazzFieldName + "\"> " + text[1] + "</label>");
		} else {
			res.append("<label class=\"am-btn am-btn-success\"><input type=\"radio\" value=\"1\" name=\"" + field.ClazzFieldName + "\"> " + text[0] + "</label>");
			res.append("<label class=\"am-btn am-btn-success am-active\"><input type=\"radio\" value=\"0\" checked=\"checked\" name=\"" + field.ClazzFieldName + "\"> " + text[1] + "</label>");
		}
		res.append("</div></div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param values 赋值集合
	 * @param value 字段赋值
	 * @param items 选项数组
	 * */
	public static String checkbox(SuperEntity.Field field, List<?> values, String value, Object[][] items) {
		String name = field.ClazzFieldName + "s";
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-form-group am-form-success am-form-icon am-form-feedback\">");
		res.append("<div class=\"am-u-md-3 am-form-label am-text-right\">" + field.getAlias() + "</div>");
		res.append("<div class=\"am-u-md-9 am-btn-group" + (items.length > 64 ? " am-btn-group-xs" : " am-btn-group-sm") + " j-checkbox\" data-am-button" + (field.Note != null && !field.Note.equals("") ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">");
		if (values != null && values.size() > 0) {
			for (Object[] item : items) {
				if (values.contains(item[0])) {
					res.append("<label class=\"am-btn am-btn-success am-active\" title=\"" + item[1] + "\"><input type=\"checkbox\" value=\"" + item[0] + "\" checked=\"checked\" name=\"" + name + "\"> " + item[1] + "</label>");
				} else {
					res.append("<label class=\"am-btn am-btn-success\" title=\"" + item[1] + "\"><input type=\"checkbox\" value=\"" + item[0] + "\" name=\"" + name + "\"> " + item[1] + "</label>");
				}
			}
		} else {
			for (Object[] item : items) {
				res.append("<label class=\"am-btn am-btn-success\" title=\"" + item[1] + "\"><input type=\"checkbox\" value=\"" + item[0] + "\" name=\"" + name + "\"> " + item[1] + "</label>");
			}
		}
		res.append("<input type=\"hidden\"" + (value != null ? " value=\"" + value + "\"" : "") + " name=\"" + field.ClazzFieldName + "\"></div></div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param values 赋值集合
	 * @param value 字段赋值
	 * @param items 选项集合
	 * */
	public static String checkbox(SuperEntity.Field field, List<?> values, String value, Map<?, ?> items) {
		Object[][] datas = new Object[items.size()][2];
		int index = 0;
		for (Map.Entry<?, ?> item : items.entrySet()) {
			datas[index++] = new Object[] { item.getKey(), item.getValue() };
		}
		return checkbox(field, values, value, datas);
	}
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * @param items 选项数组
	 * */
	public static String select(SuperEntity.Field field, Object value, Object[][] items) {
		return select(field, value, items, false);
	}
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * @param items 选项数组
	 * @param multiple 是否多选
	 * */
	public static String select(SuperEntity.Field field, Object value, Object[][] items, boolean multiple) {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-form-group am-form-success am-form-icon am-form-feedback\">");
		res.append("<div class=\"am-u-md-3 am-form-label am-text-right\">" + field.getAlias() + "</div>");
		res.append("<div class=\"am-u-md-9\"" + (field.Note != null && !field.Note.equals("") ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">");
		res.append("<select" + (multiple ? " multiple=\"multiple\"" : "") + " data-am-selected=\"{btnSize:'sm',btnStyle:'success',btnWidth:'100%',searchBox:1}\"" + (field.ClazzFieldName != null ? " name=\"" + field.ClazzFieldName + "\">" : (field.FrameFieldName != null ? " id=\"" + field.FrameFieldName + "\"" : "") + ">"));
		if (field.Empty) {
			res.append("<option value=\"-1\">请选择</option>");
		}
		if (value != null) {
			if (multiple) {
				for (Object[] item : items) {
					res.append("<option value=\"" + item[0] + "\"" + (value.toString().indexOf(item[0].toString()) != -1 ? " selected=\"selected\"":"") + ">" + item[1] + "</option>");
				}
			} else {
				for (Object[] item : items) {
					res.append("<option value=\"" + item[0] + "\"" + (value.toString().equals(item[0].toString()) ? " selected=\"selected\"":"") + ">" + item[1] + "</option>");
				}
			}
		} else {
			for (Object[] item : items) {
				res.append("<option value=\"" + item[0] + "\">" + item[1] + "</option>");
			}
		}
		res.append("</select></div></div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * @param items 选项集合
	 * */
	public static String select(SuperEntity.Field field, Object value, Map<?, ?> items) {
		return select(field, value, items, false);
	}
	/**
	 * @param field 操作字段
	 * @param value 字段赋值
	 * @param items 选项集合
	 * @param multiple 是否多选
	 * */
	public static String select(SuperEntity.Field field, Object value, Map<?, ?> items, boolean multiple) {
		Object[][] datas = new Object[items.size()][2];
		int index = 0;
		for (Map.Entry<?, ?> item : items.entrySet()) {
			datas[index++] = new Object[] { item.getKey(), item.getValue() };
		}
		return select(field, value, datas, multiple);
	}
	/**
	 * @param field 操作字段
	 * @param rows 文本行数
	 * @param placeholder 提示文字
	 * @param value 字段赋值
	 * */
	public static String textarea(SuperEntity.Field field, int rows, String placeholder, Object value) {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-form-group" + (!field.Empty ? " am-form-success" : "") + " am-form-icon am-form-feedback\">");
		res.append("<div class=\"am-u-md-3" + (!field.Empty ? " am-form-label" : "") + " am-text-right\">" + field.getAlias() + "</div>");
		res.append("<div class=\"am-u-md-9\"" + (field.Note != null && !field.Note.equals("") ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">");
		res.append("<textarea class=\"am-form-field\" rows=\"" + rows + "\"");
		if (field.ClazzFieldName != null) {
			String temp = "";
			if (!field.Empty) {
				res.append(" required=\"required\"");
				temp += "必填";
			}
			if (field.FrameFieldLength > 0) {
				res.append(" maxlength=\"" + field.FrameFieldLength + "\"");
				temp += (temp.equals("") ? "" : "，") + "长度最多" + field.FrameFieldLength + "位";
			}
			if (placeholder != null) {
				temp += (temp.equals("") ? "" : "，") + placeholder;
			}
			if (!temp.equals("")) {
				res.append(" placeholder=\"" + temp + "\"");
			}
			res.append(" name=\"" + field.ClazzFieldName + "\"");
		} else {
			res.append(" readonly=\"readonly\"");
			if (placeholder != null) {
				res.append(" placeholder=\"" + placeholder + "\"");
			}
			if (field.FrameFieldName != null) {
				res.append(" id=\"" + field.FrameFieldName + "\"");
			}
		}
		res.append(">" + (value != null ? value : "") + "</textarea></div></div>");
		return res.toString();
	}
	/**
	 * @param request 请求对象
	 * @param field 主键字段
	 * @param value 主键赋值
	 * */
	public static String button(HttpServletRequest request, SuperEntity.Field field, Object value) throws Exception {
		return button(request, field, value, new Object[][] {}, new String[][] {});
	}
	/**
	 * @param request 请求对象
	 * @param field 主键字段
	 * @param value 主键赋值
	 * @param hiddens 隐藏字段
	 * */
	public static String button(HttpServletRequest request, SuperEntity.Field field, Object value, Object[][] hiddens) throws Exception {
		return button(request, field, value, hiddens, new String[][] {});
	}
	/**
	 * @param request 请求对象
	 * @param field 主键字段
	 * @param value 主键赋值
	 * @param hiddens 隐藏字段
	 * @param buttons 操作按钮
	 * */
	public static String button(HttpServletRequest request, SuperEntity.Field field, Object value, Object[][] hiddens, String[]... buttons) throws Exception {
		String paging = request.getParameter(Global.KEY_JUMP_PAGING);
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-form-group am-text-right\">");
		if (paging != null && !paging.equals("")) {
			res.append("<input type=\"hidden\" value=\"" + paging + "\" name=\"" + Global.KEY_JUMP_PAGING + "\">");
		}
		if (value != null) {
			res.append("<input type=\"hidden\" value=\"" + value + "\" name=\"" + field.ClazzFieldName + "\">");
		}
		if (hiddens != null && hiddens.length > 0) {
			for (Object[] hidden : hiddens) {
				if (hidden[1] != null && !hidden[1].toString().equals("")) {
					res.append("<input type=\"hidden\" value=\"" + hidden[1] + "\" name=\"" + hidden[0] + "\">");
				}
			}
		}
		if (buttons != null && buttons.length > 0) {
			for (String[] button : buttons) {
				if (button[0].indexOf("(") != -1) {
					res.append("<a class=\"am-btn am-btn-success " + button[1] + "\" onclick=\"" + button[0] + "\"> " + button[2] + "</a>");
				} else {
					res.append("<a href=\"" + button[0] + "\" class=\"am-btn am-btn-success " + button[1] + "\"" + (button[0].startsWith("http://") || button[0].startsWith("https://") ? " target=\"_blank\"" : "") + "> " + button[2] + "</a>");
				}
			}
		}
		res.append("<button type=\"button\" class=\"am-btn am-btn-success " + icon("reply") + "\" onclick=\"javascript:history.back();\"> 返回</button>");
		res.append("<button type=\"reset\" class=\"am-btn am-btn-success " + icon("circle-o") + "\"> 清空</button>");
		res.append("<button type=\"submit\" class=\"am-btn am-btn-success " + icon("save") + "\"> 提交</button>");
		res.append("</div>");
		return res.toString();
	}
}