package com.mc.portal.tool.html;
import java.util.LinkedHashMap;
import java.util.Map;
public class First {
	public static final Map<String, String> ICONS = new LinkedHashMap<String, String>();
	static {
		ICONS.put("angle-right", "箭头");
		ICONS.put("arrow-circle-o-right", "箭头");
		ICONS.put("arrows-alt", "全屏");
		ICONS.put("arrows-v", "排序");
		ICONS.put("at", "日志");
		ICONS.put("calendar", "日期");
		ICONS.put("caret-down", "下拉");
		ICONS.put("certificate", "类型");
		ICONS.put("check", "对勾");
		ICONS.put("check-circle-o", "选中");
		ICONS.put("circle-o", "清空");
		ICONS.put("clone", "导入");
		ICONS.put("cloud-download", "下载");
		ICONS.put("cloud-upload", "上传");
		ICONS.put("code-fork", "开发");
		ICONS.put("codepen", "重建");
		ICONS.put("cog", "设置");
		ICONS.put("database", "驱动");
		ICONS.put("dollar", "赞助");
		ICONS.put("dropbox", "模板");
		ICONS.put("empire", "命名");
		ICONS.put("eye", "查看");
		ICONS.put("file-code-o", "源码");
		ICONS.put("file-excel-o", "导出");
		ICONS.put("file-word-o", "统计");
		ICONS.put("gg", "拉取");
		ICONS.put("history", "还原");
		ICONS.put("home", "首页");
		ICONS.put("houzz", "属性");
		ICONS.put("image", "图像");
		ICONS.put("instagram", "取值");
		ICONS.put("key", "密钥");
		ICONS.put("leanpub", "汇总");
		ICONS.put("link", "依赖");
		ICONS.put("list", "菜单");
		ICONS.put("long-arrow-down", "降序");
		ICONS.put("long-arrow-up", "升序");
		ICONS.put("mail-forward", "进入");
		ICONS.put("map-signs", "快捷");
		ICONS.put("modx", "模块");
		ICONS.put("object-group", "对象");
		ICONS.put("pencil-square-o", "编辑");
		ICONS.put("plus", "追加");
		ICONS.put("power-off", "退出");
		ICONS.put("product-hunt", "项目");
		ICONS.put("qq", "扣扣");
		ICONS.put("question-circle", "反馈");
		ICONS.put("refresh", "刷新");
		ICONS.put("reply", "返回");
		ICONS.put("save", "提交");
		ICONS.put("search", "搜索");
		ICONS.put("send-o", "发送");
		ICONS.put("shopping-bag", "导包");
		ICONS.put("street-view", "等级");
		ICONS.put("tasks", "任务");
		ICONS.put("times", "错误");
		ICONS.put("trash-o", "删除");
		ICONS.put("user", "用户");
		ICONS.put("user-plus", "加人");
		ICONS.put("user-secret", "成员");
		ICONS.put("weibo", "微博");
		ICONS.put("weixin", "微信");
	}
	public static String icon(String key) throws Exception {
		if (!ICONS.containsKey(key)) {
			throw new Exception("请求参数非法 = " + key);
		}
		return "am-icon-" + key;
	}
}