package com.mc.portal.tool.html;
import java.math.BigDecimal;
import java.util.Map;
import com.mc.core.entity.SuperEntity;
public class Popup extends First {
	public static String input(SuperEntity.Field field) {
		return input(field, false, false);
	}
	public static String input(SuperEntity.Field field, boolean top) {
		return input(field, top, false);
	}
	public static String input(SuperEntity.Field field, boolean top, boolean readonly) {
		String temp = "";
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"" + (!top ? "am-margin-top-xs " : "") + "am-input-group" + (!field.Empty ? " am-input-group-success" : "") + "\">");
		res.append("<b class=\"am-input-group-label\">" + field.getAlias() + "</b>");
		res.append("<input type=\"" + (field.ClazzFieldType != null && (field.ClazzFieldType == Integer.class || field.ClazzFieldType == Long.class || field.ClazzFieldType == BigDecimal.class) ? "number" : "text") + "\" class=\"am-form-field\"");
		if (readonly) {
			if (field.Empty) {
				res.append(" readonly=\"readonly\"");
			} else {
				res.append(" required=\"required\"");
				res.append(" readonly=\"readonly\"");
				res.append(" placeholder=\"必填\"");
			}
		} else {
			if (!field.Empty) {
				res.append(" required=\"required\"");
				temp = "必填";
			}
			if (field.FrameFieldLength > 0) {
				res.append(" maxlength=\"" + field.FrameFieldLength + "\"");
				temp += (temp.equals("") ? "" : "，") + "长度最多" + field.FrameFieldLength + "位";
			}
			if (field.Note != null) {
				temp += (temp.equals("") ? "" : "，") + field.Note;
			}
			if (!temp.equals("")) {
				res.append(" placeholder=\"" + temp + "\"");
			}
		}
		res.append(" name=\"" + field.ClazzFieldName + "\"></div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param format 日期格式
	 * @param min 最小日期
	 * */
	public static String time(SuperEntity.Field field, String format, String min) {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-margin-top-xs am-input-group" + (!field.Empty ? " am-input-group-success" : "") + "\">");
		res.append("<b class=\"am-input-group-label\">" + field.getAlias() + "</b>");
		res.append("<input type=\"text\" class=\"am-form-field\"");
		res.append(!field.Empty ? " required=\"required\" readonly=\"readonly\" placeholder=\"必填\"" : " readonly=\"readonly\"");
		res.append(" name=\"" + field.ClazzFieldName + "\" onclick=\"jeDate({dateCell:this,festival:true,format:'" + (format != null ? format : "YYYY-MM-DD") + "',isClick:true,isToday:true" + (min != null ? ",minDate:'" + min + "'" : "") + ",zIndex:10000})\"></div>");
		return res.toString();
	}
	public static String file(SuperEntity.Field field, boolean top, String mime) {
		String temp = "";
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"" + (!top ? "am-margin-top-xs " : "") + "am-input-group" + (!field.Empty ? " am-input-group-success" : "") + "\">");
		res.append("<b class=\"am-input-group-label\">" + field.getAlias() + "</b>");
		res.append("<input type=\"text\" class=\"am-form-field\"");
		if (!field.Empty) {
			res.append(" required=\"required\"");
			temp = "必填";
		}
		res.append(" readonly=\"readonly\"");
		if (!temp.equals("")) {
			res.append(" placeholder=\"" + temp + "\"");
		}
		String key = field.FrameFieldName != null ? field.FrameFieldName : field.ClazzFieldName;
		res.append(" name=\"" + field.ClazzFieldName + "\" id=\"" + key + "\" ondblclick=\"JFile(this,true)\">");
		res.append("<b class=\"am-input-group-btn\">");
		res.append("<a class=\"am-btn" + (!field.Empty ? " am-btn-success" : "") + "\" onclick=\"javascript:$('#" + key + "').val('');\">删除文件</a>");
		res.append("<a class=\"am-btn" + (!field.Empty ? " am-btn-success" : "") + "\" onclick=\"JUpload(this,'" + (mime != null ? mime : "*") + "','" + key + "')\">选择文件</a>");
		res.append("</b></div>");
		return res.toString();
	}
	public static String select(SuperEntity.Field field, Object[][] items, boolean top) {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"" + (!top ? "am-margin-top-xs " : "") + "am-input-group am-input-group-success\">");
		res.append("<b class=\"am-input-group-label\">" + field.getAlias() + "</b>");
		res.append("<select style=\"width:100%;border-color:#5EB95E;\" name=\"" + field.ClazzFieldName + "\">");
		if (field.Empty) {
			res.append("<option value=\"-1\">请选择</option>");
		}
		for (Object[] item : items) {
			res.append("<option value=\"" + item[0] + "\">" + item[1] + "</option>");
		}
		res.append("</select></div>");
		return res.toString();
	}
	public static String select(SuperEntity.Field field, Map<?, ?> items, boolean top) {
		Object[][] datas = new Object[items.size()][2];
		int index = 0;
		for (Map.Entry<?, ?> item : items.entrySet()) {
			datas[index++] = new Object[] { item.getKey(), item.getValue() };
		}
		return select(field, datas, top);
	}
	public static String textarea(SuperEntity.Field field, int height) {
		return textarea(field, height, false, false);
	}
	public static String textarea(SuperEntity.Field field, int height, boolean top) {
		return textarea(field, height, top, false);
	}
	public static String textarea(SuperEntity.Field field, int height, boolean top, boolean readonly) {
		String temp = "";
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"" + (!top ? "am-margin-top-xs " : "") + "am-input-group" + (!field.Empty ? " am-input-group-success" : "") + "\">");
		res.append("<b class=\"am-input-group-label\">" + field.getAlias() + "</b>");
		res.append("<textarea style=\"width:100%;height:" + height + "px;\" class=\"am-form-field\"");
		if (readonly) {
			res.append(" readonly=\"readonly\"");
			res.append(" name=\"" + field.ClazzFieldName + "\"");
		} else {
			if (!field.Empty) {
				res.append(" required=\"required\"");
				temp = "必填";
			}
			if (field.FrameFieldLength > 0) {
				res.append(" maxlength=\"" + field.FrameFieldLength + "\"");
				temp += (temp.equals("") ? "" : "，") + "长度最多" + field.FrameFieldLength + "位";
			}
			if (!temp.equals("")) {
				res.append(" placeholder=\"" + temp + "\"");
			}
			res.append(" name=\"" + field.ClazzFieldName + "\"");
		}
		res.append("></textarea></div>");
		return res.toString();
	}
	public static String button(SuperEntity.Field primary) throws Exception {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-margin-top-xs\">");
		if (primary != null) {
			res.append("<input type=\"hidden\" name=\"" + primary.ClazzFieldName + "\">");
		}
		res.append("<div class=\"am-u-md-6 am-padding-right-sm am-padding-left-0\"><button type=\"reset\" class=\"am-btn am-btn-success am-btn-block\">清空</button></div>");
		res.append("<div class=\"am-u-md-6 am-padding-horizontal-0\"><button type=\"submit\" class=\"am-btn am-btn-success am-btn-block\">提交</button></div>");
		res.append("</div>");
		return res.toString();
	}
}