package com.mc.portal.tool.html;
import java.util.Map;
import com.mc.core.entity.SuperEntity;
import com.mc.core.tool.JsonTool;
public class Search extends First {
	/**
	 * @param field 操作字段
	 * @param lang 处理类型，取值为0=等于、1=模糊、2=定制
	 * */
	public static String input(SuperEntity.Field field, int lang) {
		return input(field, lang, 3, false);
	}
	/**
	 * @param field 操作字段
	 * @param lang 处理类型，取值为0=等于、1=模糊、2=定制
	 * @param width 控件宽度
	 * */
	public static String input(SuperEntity.Field field, int lang, int width) {
		return input(field, lang, width, false);
	}
	/**
	 * @param field 操作字段
	 * @param lang 处理类型，取值为0=等于、1=模糊、2=定制
	 * @param width 控件宽度
	 * @param readonly 是否只读
	 * */
	public static String input(SuperEntity.Field field, int lang, int width, boolean readonly) {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-u-md-" + width + " am-padding-right-xs am-padding-left-0 am-input-group am-input-group-secondary\">");
		res.append("<b class=\"am-padding-horizontal-sm am-input-group-label\">" + field.getAlias() + "</b>");
		res.append("<input type=\"text\" class=\"am-form-field\"" + (readonly ? " readonly=\"readonly\"" : "") + " lang=\"" + lang + "\" name=\"" + field.FrameFieldName + "\">");
		res.append("</div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param format 日期格式
	 * @param min 最小日期
	 * @param lang 处理类型，取值为0=等于、1=模糊、2=定制
	 * */
	public static String time(SuperEntity.Field field, String format, String min, int lang) throws Exception {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-u-md-2 am-padding-right-xs am-padding-left-0 am-input-group am-input-group-secondary am-form-icon\">");
		res.append("<i style=\"z-index:3;\" class=\"" + icon("calendar") + "\"></i>");
		res.append("<input type=\"text\" style=\"border-color:#3BB4F2;\" class=\"am-form-field\" readonly=\"readonly\" lang=\"" + lang + "\" placeholder=\"" + field.getAlias() + "\" name=\"" + field.FrameFieldName + "\" onclick=\"jeDate({dateCell:this,festival:true,format:'" + (format != null ? format : "YYYY-MM-DD") + "',isClick:true,isToday:true,maxDate:jeDate.now(0)" + (min != null ? ",minDate:'" + min + "'" : "") + "})\">");
		res.append("</div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param items 下拉选项
	 * @param lang 处理类型，取值为0=等于、1=模糊、2=定制
	 * */
	public static String select(SuperEntity.Field field, Object[][] items, int... lang) {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-u-md-2 am-padding-right-xs am-padding-left-0\">");
		res.append("<select data-am-selected=\"{btnStyle:'secondary',btnWidth:'100%',searchBox:1}\" lang=\"" + (lang != null && lang.length > 0 ? lang[0] : 0) + "\" name=\"" + field.FrameFieldName + "\">");
		res.append("<option value=\"-1\">-- " + field.getAlias() + " --</option>");
		for (Object[] item : items) {
			res.append("<option value=\"" + item[0] + "\">" + item[1] + "</option>");
		}
		res.append("</select>");
		res.append("</div>");
		return res.toString();
	}
	/**
	 * @param field 操作字段
	 * @param items 下拉选项
	 * @param lang 处理类型，取值为0=等于、1=模糊、2=定制
	 * */
	public static String select(SuperEntity.Field field, Map<?, ?> items, int... lang) {
		Object[][] datas = new Object[items.size()][2];
		int index = 0;
		for (Map.Entry<?, ?> item : items.entrySet()) {
			datas[index++] = new Object[] { item.getKey(), item.getValue() };
		}
		return select(field, datas, lang);
	}
	/**
	 * @param submit 是提交吗
	 * @param reset 是清空吗
	 * @param width 操作宽度
	 * @param hiddens 隐藏参数
	 * */
	public static String button(boolean submit, boolean reset, int width) throws Exception {
		StringBuffer res = new StringBuffer();
		if (submit && reset) {
			res.append("<div class=\"am-u-md-" + width + " am-padding-horizontal-0\">");
			res.append("<a type=\"reset\" class=\"am-margin-right-xs am-btn am-btn-secondary " + icon("circle-o") + "\"> 清空</a>");
			res.append("<a type=\"submit\" class=\"am-btn am-btn-secondary " + icon("search") + "\"> 搜索</a>");
			res.append("</div>");
		} else if (submit && !reset) {
			res.append("<div class=\"am-u-md-" + width + " am-padding-horizontal-0\"><a type=\"submit\" class=\"am-btn am-btn-secondary " + icon("search") + "\"> 搜索</a></div>");
		} else if (!submit && reset) {
			res.append("<div class=\"am-u-md-" + width + " am-padding-horizontal-0\"><a type=\"reset\" class=\"am-btn am-btn-secondary " + icon("circle-o") + "\"> 清空</a></div>");
		} else {
			res.append("<div class=\"am-u-md-" + width + " am-padding-horizontal-0\"></div>");
		}
		return res.toString();
	}
	/**
	 * @param width 操作宽度
	 * @param size 每页条数
	 * @param order 排序字段
	 * @param queue 排序方式
	 * @param image 图片预览
	 * @param fields 展示字段
	 * */
	public static String table(int width, long size, String order, boolean queue, boolean image, SuperEntity.Field... fields) throws Exception {
		int pixel = 0;
		switch (width) {
			case 1: pixel = 70 * width; break;
			case 2: pixel = 70 * width + 5; break;
			case 3:
			case 4: pixel = 70 * width; break;
			case 5: pixel = 70 * width - 15; break;
			case 6: pixel = 70 * width - 25; break;
			case 7: pixel = 70 * width - 30; break;
			case 8: pixel = 70 * width - 35; break;
		}
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-g am-padding-top-xs\" id=\"j_table\">");
		res.append("<table class=\"am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered\"" + (image ? " data-am-widget=\"gallery\" data-am-gallery=\"{pureview:1}\"" : "") + ">");
		res.append("<thead>");
		res.append("<tr class=\"am-primary\">");
		res.append("<th><label class=\"am-checkbox\"><input type=\"checkbox\" data-am-ucheck lang=\"ids\"></label></th>");
		for (SuperEntity.Field field : fields) {
			res.append("<th" + (field.Note != null ? " data-am-popover=\"{content:'" + field.Note + "',trigger:'hover',theme:'sm'}\"" : "") + ">" + field.getAlias() + (field.FrameFieldName != null ? "<i class=\"" + (field.FrameFieldName.equals(order) ? (queue ? icon("long-arrow-up") : icon("long-arrow-down")) : icon("arrows-v")) + "\" tabindex=\"" + field.FrameFieldName + "\"></i>" : "") + "</th>");
		}
		if (pixel > 0) {
			res.append("<th style=\"width:" + pixel + "px;\">操作</th>");
		}
		res.append("</tr>");
		res.append("<tr>");
		res.append("<td><label class=\"am-checkbox\"><input type=\"checkbox\" data-am-ucheck lang=\"ids\"></label></td>");
		res.append("<td colspan=\"" + (fields.length + (width > 0 ? 1 : 0)) + "\">");
		res.append("<div class=\"am-input-group am-input-group-sm am-input-group-secondary\">");
		res.append("<b class=\"am-input-group-label\">选中</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"check\">");
		res.append("<b class=\"am-input-group-label\">条/当前</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"show\">");
		res.append("<b class=\"am-input-group-label\">条/总计</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"total\">");
		res.append("<b class=\"am-input-group-label\">条/每页</b>");
		res.append("<input type=\"number\" class=\"am-form-field\" value=\"" + size + "\" min=\"1\" lang=\"size\">");
		res.append("<b class=\"am-input-group-label\">条/总计</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"tabs\">");
		res.append("<b class=\"am-input-group-label\">页/跳到</b>");
		res.append("<input type=\"number\" class=\"am-form-field\" lang=\"now\">");
		res.append("<b class=\"am-input-group-label\">页</b>");
		res.append("</div>");
		res.append("</td>");
		res.append("</tr>");
		res.append("</thead>");
		
		res.append("<tbody></tbody>");
		res.append("<tfoot>");
		res.append("<tr>");
		res.append("<td><label class=\"am-checkbox\"><input type=\"checkbox\" data-am-ucheck lang=\"ids\"></label></td>");
		res.append("<td colspan=\"" + (fields.length + (width > 0 ? 1 : 0)) + "\">");
		res.append("<div class=\"am-input-group am-input-group-sm am-input-group-secondary\">");
		res.append("<b class=\"am-input-group-label\">选中</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"check\">");
		res.append("<b class=\"am-input-group-label\">条/当前</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"show\">");
		res.append("<b class=\"am-input-group-label\">条/总计</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"total\">");
		res.append("<b class=\"am-input-group-label\">条/每页</b>");
		res.append("<input type=\"number\" class=\"am-form-field\" value=\"" + size + "\" min=\"1\" lang=\"size\">");
		res.append("<b class=\"am-input-group-label\">条/总计</b>");
		res.append("<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" lang=\"tabs\">");
		res.append("<b class=\"am-input-group-label\">页/跳到</b>");
		res.append("<input type=\"number\" class=\"am-form-field\" lang=\"now\">");
		res.append("<b class=\"am-input-group-label\">页</b>");
		res.append("</div>");
		res.append("</td>");
		res.append("</tr>");
		res.append("</tfoot>");
		res.append("</table>");
		res.append("</div>");
		return res.toString();
	}
	/**
	 * @param width 操作宽度
	 * @param size 每页条数
	 * @param order 排序字段
	 * @param queue 排序方式
	 * @param fields 展示字段
	 * */
	public static String table(int width, long size, String order, boolean queue, SuperEntity.Field... fields) throws Exception {
		return table(width, size, order, queue, false, fields);
	}
	/**
	 * @param drop 有删除吗
	 * @param save 有创建吗
	 * @param buttons 按钮集合
	 * @param fields 导出字段
	 * */
	public static String paging(boolean drop, boolean save, String[][] buttons, String[][] fields) throws Exception {
		StringBuffer res = new StringBuffer();
		res.append("<div class=\"am-g am-padding-top-xs\">");
		res.append("<div class=\"am-u-md-6 am-padding-0\">");
		if (drop || save || buttons != null && buttons.length > 0 || fields != null && fields.length > 0) {
			res.append("<div class=\"am-btn-group\">");
			if (drop) {
				res.append("<a class=\"am-btn am-btn-danger " + icon("trash-o") + "\" onclick=\"JPageDrop()\"> 删除</a>");
			}
			if (save) {
				res.append("<a class=\"am-btn am-btn-secondary " + icon("pencil-square-o") + "\" onclick=\"JPageLoad()\"> 创建</a>");
			}
			if (fields != null && fields.length > 0) {
				res.append("<a class=\"am-btn am-btn-secondary " + icon("file-excel-o") + "\" onclick=\"JPageExcel()\"> 另存</a>");
			}
			if (buttons != null && buttons.length > 0) {
				for (String[] button : buttons) {
					if (button[0].indexOf("(") != -1) {
						res.append("<a class=\"am-btn am-btn-secondary " + button[1] + "\" onclick=\"" + button[0] + "\"> " + button[2] + "</a>");
					} else {
						res.append("<a href=\"" + button[0] + "\" class=\"am-btn am-btn-secondary " + button[1] + "\"" + (button[0].startsWith("http://") || button[0].startsWith("https://") ? " target=\"_blank\"" : "") + "> " + button[2] + "</a>");
					}
				}
			}
			res.append("</div>");
		}
		res.append("</div>");
		res.append("<div class=\"am-u-md-6 am-padding-0\"><ul class=\"am-margin-0 am-pagination am-pagination-right\" id=\"j_bar\"></ul></div>");
		res.append("</div>");
		
		if (fields != null && fields.length > 0) {
			String[] head = fields[0];//对象类名、表格名称、排序字段、是否保护、附加条件、导出动作
			res.append("<div class=\"am-modal am-modal-prompt\" id=\"j_excel\">");
			res.append("<div class=\"am-modal-dialog\">");
			res.append("<div class=\"am-modal-hd\">请选择导出到表格的列<i class=\"am-close am-close-spin\" data-am-modal-close>&times;</i></div>");
			res.append("<div class=\"am-modal-bd\">");
			res.append("<input type=\"hidden\" value=\"0\" lang=\"open\">");
			res.append("<form action=\"share/excel.htm\" method=\"post\" target=\"_blank\">");
			res.append("<input type=\"hidden\" value=\"" + head[0] + "\" name=\"entry\">");
			res.append("<input type=\"hidden\" value=\"" + head[1] + "\" name=\"name\">");
			res.append("<input type=\"hidden\" value=\"" + head[2] + "\" name=\"order\">");
			res.append("<input type=\"hidden\" value=\"" + head[3] + "\" name=\"code\">");
			res.append("<input type=\"hidden\" value=\"" + (head[4] != null ? head[4] : "") + "\" name=\"early\">");
			res.append("<input type=\"hidden\" name=\"rows\">");
			res.append("<input type=\"hidden\" name=\"href\">");
			res.append("<table>");
			res.append("<tr>");
			res.append("<td colspan=\"5\">");
			res.append("<input type=\"radio\" value=\"0\"" + (head[5].equals("0") ? " checked=\"checked\"" : "") + " name=\"query\"> 导出选中数据");
			res.append("<input type=\"radio\" value=\"1\"" + (head[5].equals("1") ? " checked=\"checked\"" : "") + " name=\"query\"> 导出未选数据");
			res.append("<input type=\"radio\" value=\"2\"" + (head[5].equals("2") ? " checked=\"checked\"" : "") + " name=\"query\"> 导出全部数据");
			res.append("</td>");
			res.append("</tr>");
			for (int i = 1; i < fields.length; i++) {
				String[] field = fields[i];
				if (i % 5 == 1) {
					res.append("<tr>");
				}
				res.append("<td>");
				if (field[0].equals("1")) {//是否选中、列的宽度、导出属性、导出字段、列的标题、附加处理
					res.append("<input type=\"checkbox\" value=\"" + JsonTool.write(field).replace("\"", "'") + "\" checked=\"checked\"> " + field[4]);
					res.append("<input type=\"hidden\" value=\"" + field[1] + "\" name=\"width\">");
					res.append("<input type=\"hidden\" value=\"" + field[2] + "\" name=\"clazz\">");
					res.append("<input type=\"hidden\" value=\"" + field[3] + "\" name=\"frame\">");
					res.append("<input type=\"hidden\" value=\"" + field[4] + "\" name=\"title\">");
					res.append("<input type=\"hidden\" value=\"" + (field[5] != null ? field[5] : "")+ "\" name=\"custom\">");
				} else {
					res.append("<input type=\"checkbox\" value=\"" + JsonTool.write(field).replace("\"", "'") + "\"> " + field[4]);
					res.append("<input type=\"hidden\" name=\"width\">");
					res.append("<input type=\"hidden\" name=\"clazz\">");
					res.append("<input type=\"hidden\" name=\"frame\">");
					res.append("<input type=\"hidden\" name=\"title\">");
					res.append("<input type=\"hidden\" name=\"custom\">");
				}
				res.append("</td>");
				if (i % 5 == 0) {
					res.append("</tr>");
				}
			}
			if ((fields.length - 1) % 5 != 0) {
				for (int i = (fields.length - 1) % 5; i < 5; i++) {
					res.append("<td>&nbsp;</td>");
				}
				res.append("</tr>");
			}
			res.append("</table>");
			res.append("</form>");
			res.append("</div>");
			res.append("<div class=\"am-modal-footer\">");
			res.append("<a class=\"am-modal-btn\" data-am-modal-cancel>取消</a>");
			res.append("<a class=\"am-modal-btn\" data-am-modal-confirm>提交</a>");
			res.append("</div>");
			res.append("</div></div>");
		}
		return res.toString();
	}
}