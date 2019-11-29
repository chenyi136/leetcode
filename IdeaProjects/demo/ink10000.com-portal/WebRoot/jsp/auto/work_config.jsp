<%@ page language="java" import="
java.util.LinkedHashMap,
com.mc.core.entity.auto.Work,
com.mc.core.template.DaoImplTemplate,
com.mc.core.template.DaoMapperTemplate,
com.mc.core.template.DaoTemplate,
com.mc.core.template.EntityTemplate,
com.mc.core.template.ServiceImplTemplate,
com.mc.core.template.ServiceTemplate,
com.mc.core.template.TemplateConfig" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, String[]> clazz = (Map<Integer, String[]>) request.getAttribute("clazz");
Work pages = (Work) request.getAttribute("pages");
TemplateConfig.Context template = JsonTool.read(pages.getConfig(), TemplateConfig.Context.class);
String[] interfaces = new String[] { EntityTemplate.class.getName(), DaoTemplate.class.getName(), DaoImplTemplate.class.getName(), DaoMapperTemplate.class.getName(), ServiceTemplate.class.getName(), ServiceImplTemplate.class.getName() };
StringBuffer result = new StringBuffer();
result.append("点击【测试配置】进行测试，占位符有：{ModuleName}代表模块代号、{ClassName}代表对象类名\n");
result.append("点击【上传模板】上传实现了相应接口的模板类文件后，请刷新本页面\n");
result.append("点击【本地开发】下载本地开发所需要的资源文件\n\n");
result.append("模板接口类有：\n");
result.append("\t" + interfaces[0] + "\n");
result.append("\t" + interfaces[1] + "\n");
result.append("\t" + interfaces[2] + "\n");
result.append("\t" + interfaces[3] + "\n");
result.append("\t" + interfaces[4] + "\n");
result.append("\t" + interfaces[5] + "\n\n");
result.append("接口实现类有（默认）：\n");
Map<Integer, String> EntityClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> DaoClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> DaoImplClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> DaoMapperXMLInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> ServiceClassInterface = new LinkedHashMap<Integer, String>();
Map<Integer, String> ServiceImplClassInterface = new LinkedHashMap<Integer, String>();
for (Map.Entry<Integer, String[]> en : clazz.entrySet()) {
	String[] value = en.getValue();
	if (value[1].indexOf(interfaces[0]) != -1) {
		EntityClassInterface.put(en.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[1]) != -1) {
		DaoClassInterface.put(en.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[2]) != -1) {
		DaoImplClassInterface.put(en.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[3]) != -1) {
		DaoMapperXMLInterface.put(en.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[4]) != -1) {
		ServiceClassInterface.put(en.getKey(), value[0]);
	}
	if (value[1].indexOf(interfaces[5]) != -1) {
		ServiceImplClassInterface.put(en.getKey(), value[0]);
	}
	if (value[2].equals("true")) {
		result.append("\t" + value[0] + "\n");
	}
}
result.deleteCharAt(result.length() - 1);
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getName())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
<style type="text/css">
#j_form input{text-decoration:underline;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="auto/work/config.htm" method="post" id="j_form">
			<div class="am-u-md-12 am-padding-0">
				<textarea rows="14" class="am-margin-bottom" readonly="readonly" id="result"><%=result%></textarea>
				<%=Form.button(request, pages.setId(null), pages.getId(), null, new String[][]{ { "config()", icon("eye"), "测试配置" }, { "auto/template/load.htm", icon("codepen"), "上传模板" }, { "_/doc/demo.zip", icon("code-fork"), "本地开发" }, { "tacit()", icon("history"), "还原配置" } })%>
			</div>
			<div class="am-u-md-6">
				<%=Form.input(new Work.Field("文件所属顶层包名", true, "BasePackageName", null, null, 80, "文件所属顶层包名是所有由模板类生成的类或文件所在包的父级包"), template.BasePackageName)%>
				<%=Form.select(pages.setFkEntityClass(null).setAlias("实体类模板生成类").setNote("选择实现了" + EntityTemplate.class.getName() + "接口的用于生成实体类的模板类"), pages.getFkEntityClass(), EntityClassInterface)%>
				<%=Form.input(new Work.Field("实体类相对的包名", true, "EntityClassPackageNameTemplate", null, null, 80, "文件所属顶层包名与实体类相对的包名组合为实体类所在的包路径"), template.EntityClassPackageNameTemplate)%>
				<%=Form.input(new Work.Field("实体类名称的模板", false, "EntityClassSimpleNameTemplate", null, null, 80, "用于生成实体类的类名.java的模板"), template.EntityClassSimpleNameTemplate)%>
				<%=Form.select(pages.setFkDaoClass(null).setAlias("持久类模板生成类").setNote("选择实现了" + DaoTemplate.class.getName() + "接口的用于生成持久层接口类的模板类"), pages.getFkDaoClass(), DaoClassInterface)%>
				<%=Form.input(new Work.Field("持久类相对的包名", true, "DaoClassPackageNameTemplate", null, null, 80, "文件所属顶层包名与持久类相对的包名组合为持久层接口类所在的包路径"), template.DaoClassPackageNameTemplate)%>
				<%=Form.input(new Work.Field("持久类名称的模板", false, "DaoClassSimpleNameTemplate", null, null, 80, "用于生成持久层接口类的类名.java的模板"), template.DaoClassSimpleNameTemplate)%>
				<%=Form.select(pages.setFkDaoImplClass(null).setAlias("持久实现类生成类").setNote("选择实现了" + DaoImplTemplate.class.getName() + "接口的用于生成持久层接口实现类的模板类"), pages.getFkDaoImplClass(), DaoImplClassInterface)%>
				<%=Form.input(new Work.Field("持久实现类的包名", true, "DaoImplClassPackageNameTemplate", null, null, 80, "文件所属顶层包名与持久实现类的包名组合为持久层接口实现类所在的包路径"), template.DaoImplClassPackageNameTemplate)%>
				<%=Form.input(new Work.Field("持久实现类的名称", false, "DaoImplClassSimpleNameTemplate", null, null, 80, "用于生成持久层接口实现类的类名.java的模板"), template.DaoImplClassSimpleNameTemplate)%>
				<%=Form.select(pages.setFkDaoMapperXml(null).setAlias("持久映射文件模板").setNote("选择实现了" + DaoMapperTemplate.class.getName() + "接口的用于生成持久层映射文件的模板类"), pages.getFkDaoMapperXml(), DaoMapperXMLInterface)%>
				<%=Form.input(new Work.Field("持久映射文件包名", true, "DaoMapperXMLPackageNameTemplate", null, null, 80, "文件所属顶层包名与持久映射文件包名组合为持久层映射文件所在的包路径"), template.DaoMapperXMLPackageNameTemplate)%>
				<%=Form.input(new Work.Field("持久映射文件名称", false, "DaoMapperXMLSimpleNameTemplate", null, null, 80, "用于生成持久层映射文件的文件名.xml的模板"), template.DaoMapperXMLSimpleNameTemplate)%>
				<%=Form.select(pages.setFkServiceClass(null).setAlias("业务类模板生成类").setNote("选择实现了" + ServiceTemplate.class.getName() + "接口的用于生成业务层接口类的模板类"), pages.getFkServiceClass(), ServiceClassInterface)%>
				<%=Form.input(new Work.Field("业务类相对的包名", true, "ServiceClassPackageNameTemplate", null, null, 80, "文件所属顶层包名与业务类相对的包名组合为业务层接口类所在的包路径"), template.ServiceClassPackageNameTemplate)%>
				<%=Form.input(new Work.Field("业务类名称的模板", false, "ServiceClassSimpleNameTemplate", null, null, 80, "用于生成业务层接口类的类名.java的模板"), template.ServiceClassSimpleNameTemplate)%>
				<%=Form.select(pages.setFkServiceImplClass(null).setAlias("业务实现类模板类").setNote("选择实现了" + ServiceImplTemplate.class.getName() + "接口的用于生成业务层接口实现类的模板类"), pages.getFkServiceImplClass(), ServiceImplClassInterface)%>
				<%=Form.input(new Work.Field("业务实现类的包名", true, "ServiceImplClassPackageNameTemplate", null, null, 80, "文件所属顶层包名与业务实现类的包名组合为业务层接口实现类所在的包路径"), template.ServiceImplClassPackageNameTemplate)%>
				<%=Form.input(new Work.Field("业务实现类的名称", false, "ServiceImplClassSimpleNameTemplate", null, null, 80, "用于生成业务层接口实现类的类名.java的模板"), template.ServiceImplClassSimpleNameTemplate)%>
			</div>
			<div class="am-u-md-6">
				<%=Form.input(new Work.Field("用于测试模块代号", true, "ModuleName", null, null, 40, null), "trade")%>
				<%=Form.input(new Work.Field("用于测试对象类名", true, "ClassName", null, null, 40, null), "Demo")%>
				<%=Form.input(new Work.Field("低精度小数点位数", false, "FloatDotLength", null, null, 2, "低精度小数的小数点位数"), "number", template.FloatDotLength, "必须大于或等于0")%>
				<%=Form.input(new Work.Field("高精度小数点位数", false, "DecimalDotLength", null, null, 2, "高精度小数的小数点位数"), "number", template.DecimalDotLength, "必须大于或等于0")%>
				<%=Form.radio(new Work.Field("是否支持联合主键", false, "MeshKeySupport", null, null, 1, null), new String[] { "支持", "不支持" }, template.MeshKeySupport)%>
				<%=Form.radio(new Work.Field("属性驼峰命名支持", false, "HumpNamingSupport", null, null, 1, "是否支持代码中属性的驼峰命名"), new String[] { "支持", "不支持" }, template.HumpNamingSupport)%>
				<%=Form.radio(new Work.Field("默认取值处理方式", false, "TacitValueType", null, null, 1, "决定字段的默认设值是填充到代码中还是表结构中"), new String[] { "用于表结构中", "用于代码中" }, template.TacitValueType)%>
				<%=Form.radio(new Work.Field("取值集合处理方式", false, "ItemValueType", null, null, 1, "决定字段的取值标识是填充到代码中还是表结构中"), new String[] { "用于表结构中", "用于代码中" }, template.ItemValueType)%>
				<%=Form.radio(new Work.Field("整数没有符号支持", false, "UnsignedNumberSupport", null, null, 1, "对整数类型的字段是否无符号支持"), new String[] { "支持", "不支持" }, template.UnsignedNumberSupport)%>
				<%=Form.radio(new Work.Field("小数没有符号支持", false, "UnsignedFloatSupport", null, null, 1, "对小数类型的字段是否无符号支持"), new String[] { "支持", "不支持" }, template.UnsignedFloatSupport)%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div style="display:none;" id="placeholder"><%=result%></div>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
function config(){
	var en=new Object();
	$.each($("#j_form [name]"),function(){
		var o=$(this);
		en[o.attr("name")]=o.val();
	});
	if(!en.ClassName){
		JAlert("请输入用于测试对象类名");
		$("#j_form [name='ClassName']").focus();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/work/config.htm",
		data:en,
		dataType:"html",
		async:false,
		success:function(res){
			$("#result").val(res);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function tacit(){
	if(!window.confirm("你确认要还原模板配置到原始默认的吗")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/work/tacit.htm",
		data:{id:<%=pages.getId()%>},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			window.location=location.href;
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	$("#j_form [name='ModuleName'],#j_form [name='ClassName']").keyup(function(){
		$("#result").val($("#placeholder").html());
	});
	$("#j_form").submit(function(){
		$("#j_form [name='ClassName']").val("");
	});
});
</script>
</body>
</html>