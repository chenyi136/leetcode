<%@ page language="java" import="
java.util.ArrayList,
com.mc.core.crux.Legal,
com.mc.core.entity.auto.Bound,
com.mc.core.entity.auto.Field,
com.mc.core.entity.auto.Inward,
com.mc.core.entity.auto.Table,
com.mc.portal.pojo.WorkConfig,
com.mc.portal.tool.JdbcTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
WorkConfig context = (WorkConfig) request.getAttribute("context");
Table table = (Table) request.getAttribute("table");
@SuppressWarnings("unchecked")
List<Field> fields = (List<Field>) request.getAttribute("fields");
@SuppressWarnings("unchecked")
List<Bound> bounds = (List<Bound>) request.getAttribute("bounds");
@SuppressWarnings("unchecked")
Map<Integer, String> obeys = (Map<Integer, String>) request.getAttribute("obeys");
String clazz = context.template.getContext().MeshKeySupport ? "checkbox" : "radio";
%>
<%!
public String action(String name, String value) {
	StringBuffer res = new StringBuffer();
	res.append("<select" + (value != null ? " disabled=\"disabled\"" : " name=\"" + name + "\"") + ">");
	for (Map.Entry<String, String> data : Legal.AUTO_BOUND_ACTION.entrySet()) {
		res.append("<option value=\"" + data.getKey() + "\"" + (data.getKey().equals(value) ? " selected=\"selected\"" : "") + ">" + data.getValue() + "</option>");
	}
	res.append("</select>");
	return res.toString();
}
public String bound(String value) {
	StringBuffer res = new StringBuffer();
	boolean flag = false;
	for (Map.Entry<String, String> data : Legal.AUTO_BOUND_TYPE.entrySet()) {
		flag = data.getKey().equals(value);
		res.append("<option value=\"" + data.getKey() + "\"" + (flag ? " selected=\"selected\"" : "") + ">" + data.getValue() + "</option>");
	}
	res.append("</select>");
	res.insert(0, "<select" + (flag ? " disabled=\"disabled\"" : " name=\"type\"") + ">");
	return res.toString();
}
public String inward(Map<Integer, Inward> opts, Integer value) {
	StringBuffer res = new StringBuffer();
	res.append("<select name=\"fkInward\">");
	res.append("<option value=\"-1\">请选择</option>");
	for (Map.Entry<Integer, Inward> data : opts.entrySet()) {
		res.append("<option value=\"" + data.getKey() + "\"" + (data.getKey().toString().equals(String.valueOf(value)) ? " selected=\"selected\"" : "") + ">" + data.getValue().getName() + "</option>");
	}
	res.append("</select>");
	return res.toString();
}
public String obey(Map<Integer, String> opts, Integer value) {
	StringBuffer res = new StringBuffer();
	res.append("<select" + (value != null ? " disabled=\"disabled\"" : " name=\"fkTableObey\" onchange=\"box0(this)\"") + ">");
	res.append("<option value=\"-1\">请选择</option>");
	if (opts != null) {
		for (Map.Entry<Integer, String> data : opts.entrySet()) {
			res.append("<option value=\"" + data.getKey() + "\"" + (value != null && value.intValue() == data.getKey() ? " selected=\"selected\"" : "") + ">" + data.getValue() + "</option>");
		}
	}
	res.append("</select>");
	return res.toString();
}
public String type(Map<String, String[]> opts, String value) {
	StringBuffer res = new StringBuffer();
	res.append("<select name=\"type\" onchange=\"task(this)\">");
	for (String data : opts.keySet()) {
		res.append("<option value=\"" + data + "\"" + (data.equals(value) ? " selected=\"selected\"" : "") + ">" + data + "</option>");
	}
	res.append("</select>");
	return res.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, table.getName() + "(" + table.getFrame() + ")")%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
#j_table a[lang][title]{color:#DD514C;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "auto/field/", "auto/bound/save.htm", "auto/bound/drop.htm")%>
		<div class="am-g" id="j_table">
			<table class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered am-table-compact am-text-nowrap">
				<thead>
					<tr class="am-primary">
						<th style="width:28px;"><label class="am-<%=clazz%>"><input type="<%=clazz%>" disabled="disabled" data-am-ucheck></label></th>
						<th>中文名称</th>
						<th data-am-popover="{content:'表结构中的字段名称，同一对象下不能重复',trigger:'hover',theme:'sm'}">表字段名</th>
						<th data-am-popover="{content:'代码类中的属性名称，同一对象下不能重复',trigger:'hover',theme:'sm'}">属性名称</th>
						<th style="min-width:100px;">数据类型</th>
						<th>是否为空</th>
						<th>字段长度</th>
						<th data-am-popover="{content:'该字段缺省时的默认值，在【空间配置】可决定默认值是填充到代码中或表结构中',trigger:'hover',theme:'sm'}">默认取值</th>
						<th style="min-width:160px;" data-am-popover="{content:'该字段可取值的集合，在【空间配置】可决定取值集合是填充到代码中或表结构中',trigger:'hover',theme:'sm'}">取值集合</th>
						<th style="min-width:160px;">备注说明</th>
						<th style="width:240px;">操作</th>
					</tr>
					<tr style="display:table-row;"><td colspan="12"><p class="am-margin-0 am-text-danger">自增长仅限整数类型；联合主键不自增长；主键不能为空；默认设值对主键、为空、BLOB类型字段无效；<br>默认设值如：0 | 0.00 | true | false | new Date() | new java.util.Date() | CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP；备注说明如：格式如【1970-01-01】、JSON格式、以英文逗号（;）隔开</p></td></tr>
				</thead>
				<tbody lang="field">
				<%
					int index = 1;
					List<String[]> cache = new ArrayList<String[]>();
					List<String> fixed = context.template.getFixedLengthType();
					for (Field data : fields) {
						cache.add(new String[] { String.valueOf(data.getId()), data.getName(), data.getFrame(), data.getType(), String.valueOf(data.getLength()) });
						out.print("<tr id=\"f" + index + "\">");
						out.print("<td><label class=\"am-" + clazz + "\"><input type=\"" + clazz + "\" value=\"" + data.getId() + "\"" + (data.getMajor() ? " checked=\"checked\"" : "") + " data-am-ucheck name=\"id\"></label></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getName() + "\" maxlength=\"40\" placeholder=\"中文名称\" name=\"name\"></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getFrame() + "\" maxlength=\"40\" placeholder=\"表字段名\" name=\"frame\"></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getClazz() + "\" maxlength=\"40\" placeholder=\"属性名称\" name=\"clazz\"></td>");
						out.print("<td>" + this.type(context.template.getTypeMap(), data.getType()) + "</td>");
						out.print("<td>" + this.radio("empty" + index, data.getEmpty()) + "</td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getLength() + "\"" + (fixed.contains(data.getType()) ? " readonly=\"readonly\"" : "") + " maxlength=\"10\" placeholder=\"字段长度\" name=\"length\"></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\"" + (!data.doIsEmpty(data.getTacit()) ? " value=\"" + data.getTacit().replace("\"", "&quot;") + "\"": "") + " maxlength=\"40\" placeholder=\"默认设值\" name=\"tacit\"></td>");
						out.print("<td>" + this.inward(context.inward, data.getFkInward()) + "</td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\"" + (!data.doIsEmpty(data.getNote()) ? " value=\"" + data.getNote() + "\"" : "") + " maxlength=\"200\" placeholder=\"备注说明\" name=\"note\"></td>");
						out.print("<td>");
						out.print("<div class=\"am-btn-group am-btn-group-xs\">");
						out.print("<input type=\"hidden\" value=\"" + data.getQueue() + "\" name=\"queue\">");
						out.print("<input type=\"hidden\" value=\"" + data.getFrame() + "\" lang=\"frame\">");
						out.print("<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(" + index + ")\"> 删除</a>");
						out.print("<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"save(" + index + ")\"> 保存</a>");
						out.print("<a class=\"am-btn am-btn-default " + icon("link") + " am-text-secondary\" lang=\"rely\"" + (!data.doIsEmpty(data.getRely()) ? " title=\"" + data.getRely() + "\"" : "") + " onclick=\"rely(" + index + ")\"></a>");
						out.print("<a class=\"am-btn am-btn-default " + icon("long-arrow-up") + " am-text-secondary\" onclick=\"queue(true," + index + ")\"></a>");
						out.print("<a class=\"am-btn am-btn-default " + icon("long-arrow-down") + " am-text-secondary\" onclick=\"queue(false," + index + ")\"></a>");
						out.print("</div>");
						out.print("</td>");
						out.print("</tr>");
						index++;
					}
					String field = "<tr id=\"f#i#\">";
					field += "<td><label class=\"am-" + clazz + "\"><input type=\"" + clazz + "\" value=\"\" data-am-ucheck name=\"id\"></label></td>";
					field += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"40\" placeholder=\"中文名称\" name=\"name\"></td>";
					field += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"40\" placeholder=\"表字段名\" name=\"frame\"></td>";
					field += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"40\" placeholder=\"属性名称\" name=\"clazz\"></td>";
					field += "<td>" + this.type(context.template.getTypeMap(), null) + "</td>";
					field += "<td>" + this.radio("empty#i#", true) + "</td>";
					field += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"10\" placeholder=\"字段长度\" name=\"length\"></td>";
					field += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"40\" placeholder=\"默认设值\" name=\"tacit\"></td>";
					field += "<td>" + this.inward(context.inward, null) + "</td>";
					field += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"200\" placeholder=\"备注说明\" name=\"note\"></td>";
					field += "<td>";
					field += "<div class=\"am-btn-group am-btn-group-xs\">";
					field += "<input type=\"hidden\" value=\"#i#\" name=\"queue\">";
					field += "<input type=\"hidden\" lang=\"frame\">";
					field += "<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(#i#)\"> 删除</a>";
					field += "<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"save(#i#)\"> 保存</a>";
					field += "<a class=\"am-btn am-btn-default " + icon("link") + " am-text-secondary\" lang=\"rely\" onclick=\"rely(#i#)\"></a>";
					field += "<a class=\"am-btn am-btn-default " + icon("long-arrow-up") + " am-text-secondary\" onclick=\"queue(true,#i#)\"></a>";
					field += "<a class=\"am-btn am-btn-default " + icon("long-arrow-down") + " am-text-secondary\" onclick=\"queue(false,#i#)\"></a>";
					field += "</div>";
					field += "</td>";
					field += "</tr>";
					out.print(field.replace("#i#", String.valueOf(index)));
				%>
				</tbody>
			</table>
			<table style="border-top:none;" class="am-margin-vertical-xs am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered am-table-compact am-text-nowrap">
				<thead>
					<tr class="am-primary">
						<th style="width:28px;"><label class="am-<%=clazz%>"><input type="<%=clazz%>" disabled="disabled" data-am-ucheck></label></th>
						<th>约束名称</th>
						<th style="min-width:100px;">约束类型</th>
						<th style="min-width:100px;">删除动作</th>
						<th style="min-width:100px;">更新动作</th>
						<th>主表字段</th>
						<th style="min-width:100px;">从表对象</th>
						<th>从表字段</th>
						<th style="width:70px;">操作</th>
					</tr>
					<tr style="display:table-row;"><td colspan="9"><p class="am-margin-0 am-text-danger">不支持多字段外键约束；创建外键时会自动创建普通索引；外键不能引用自身表相同的字段；全文索引仅限字符类型的字段</p></td></tr>
				</thead>
				<tbody lang="bound">
				<%
					index = 1;
							for (Bound data : bounds) {
								out.print("<tr id=\"b" + index + "\">");
								out.print("<td><label class=\"am-" + clazz + "\"><input type=\"" + clazz + "\" disabled=\"disabled\" data-am-ucheck></label></td>");
								out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getName() + "\" disabled=\"disabled\" lang=\"name\"></td>");
								out.print("<td>" + this.bound(data.getType()) + "</td>");
								out.print("<td>" + this.action("trash", data.getTrash()) + "</td>");
								out.print("<td>" + this.action("modify", data.getModify()) + "</td>");
								out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + JdbcTool.field(data.getFieldHost(), "", "") + "\" readonly=\"readonly\"></td>");
								if (data.getName().startsWith("fk_")) {
									out.print("<td>" + this.obey(obeys, data.getFkTableObey()) + "</td>");
									out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + JdbcTool.field(data.getFieldObey(), "", "") + "\" readonly=\"readonly\"></td>");
								} else {
									out.print("<td>" + this.obey(null, -1) + "</td>");
									out.print("<td><input type=\"text\" class=\"am-input-sm\" readonly=\"readonly\" placeholder=\"从表字段\"></td>");
								}
								out.print("<td>");
								out.print("<div class=\"am-btn-group am-btn-group-xs\">");
								out.print("<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"trash(" + index + "," + data.getId() + ")\"> 删除</a>");
								out.print("</div>");
								out.print("</td>");
								out.print("</tr>");
								index++;
							}
							String bound = "<tr id=\"b#i#\">";
							bound += "<td><label class=\"am-" + clazz + "\"><input type=\"" + clazz + "\" disabled=\"disabled\" data-am-ucheck></label></td>";
							bound += "<td><input type=\"text\" class=\"am-input-sm\" disabled=\"disabled\" placeholder=\"约束名称\" lang=\"name\"></td>";
							bound += "<td>" + this.bound(null) + "</td>";
							bound += "<td>" + this.action("trash", null) + "</td>";
							bound += "<td>" + this.action("modify", null) + "</td>";
							bound += "<td><input type=\"text\" class=\"am-input-sm\" readonly=\"readonly\" placeholder=\"主表字段\" lang=\"fieldHost\" onclick=\"box2(this,#i#," + table.getId() + ")\"></td>";
							bound += "<td>" + this.obey(obeys, null) + "</td>";
							bound += "<td><input type=\"text\" class=\"am-input-sm\" readonly=\"readonly\" placeholder=\"从表字段\" lang=\"fieldObey\" onclick=\"box2(this,#i#)\"></td>";
							bound += "<td>";
							bound += "<div class=\"am-btn-group am-btn-group-xs\">";
							bound += "<input type=\"hidden\" name=\"fieldHost\">";
							bound += "<input type=\"hidden\" name=\"fieldObey\">";
							bound += "<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"keep(#i#)\"> 保存</a>";
							bound += "</div>";
							bound += "</td>";
							bound += "</tr>";
							out.print(bound.replace("#i#", String.valueOf(index)));
				%>
				</tbody>
			</table>
			<div class="am-btn-group">
				<a class="am-btn am-btn-secondary <%=icon("key")%>" onclick="major()"> 主键</a>
				<a class="am-btn am-btn-secondary <%=icon("eye")%>" onclick="JBuildScript([${table.id}])"> 脚本</a>
				<a class="am-btn am-btn-secondary <%=icon("file-code-o")%>" onclick="JBuildCode([${table.id}])"> 源码</a>
				<a class="am-btn am-btn-secondary <%=icon("cloud-download")%>" onclick="JBuildDown([${table.id}])"> 下载</a>
				<a class="am-btn am-btn-secondary <%=icon("codepen")%>" onclick="JBuildTask([${table.id}])"> 重建</a>
				<a href="auto/genre/index.htm" class="am-btn am-btn-secondary <%=icon("certificate")%>"> 类型</a>
				<a href="auto/inward/index.htm" class="am-btn am-btn-secondary <%=icon("instagram")%>"> 取值</a>
				<a href="auto/field/count.htm" class="am-btn am-btn-secondary <%=icon("file-word-o")%>"> 统计</a>
				<a href="auto/table/load.htm?id=${table.id}" class="am-btn am-btn-secondary <%=icon("eye")%>"> 对象</a>
			</div>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<div class="am-modal am-modal-prompt" id="field">
	<div class="am-modal-dialog">
		<div class="am-modal-hd"></div>
		<div class="am-modal-bd"></div>
		<div class="am-modal-footer">
			<input type="hidden" name="i">
			<input type="hidden" name="name">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<div class="am-modal am-modal-prompt" id="rely">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">设置依赖类型<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd">
			<input type="hidden">
			<input type="text" class="am-modal-prompt-input" placeholder="比如：java.math.BigDecimal、java.util.Date">
		</div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jbuild.js"></script>
<script type="text/javascript">
var map=<%=JsonTool.write(context.template.getTypeMap()).replace("\"true\"", "true").replace("\"false\"", "false")%>
var field="<%=field.replace("\"", "\\\"")%>";
var bound="<%=bound.replace("\"", "\\\"")%>";
var cache=new Object();
cache[<%=table.getId()%>]=<%=JsonTool.write(cache)%>;
function major(){
	var vs=[];
	var type="";
	$.each($("[name='id']:checked"),function(){
		var tr=$(this).parents("tr");
		var v=$(this).val();
		if(v){
			if(tr.find("[name^='empty']:checked").val()=="1"){
				JAlert("主键字段不能为空");
				return;
			}
			vs[vs.length]=v;
			type=tr.find("[name='type']").val();
		}
	});
	if(!vs.length){
		JAlert("请先选择主键字段");
		return;
	}
	var grow=<%=context.template.getContext().MeshKeySupport%>||type.indexOf("INT")==-1?0:(window.confirm("主键自增吗")?1:0);
	$.ajax({
		type:"post",
		url:"${ROOT}auto/field/major.htm",
		data:{ids:vs,grow:grow,fkTable:<%=table.getId()%>},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			location.href=location.href;
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function task(o){
	var tr=$(o).parents("tr").find("[name='length']");
	var tmp=map[o.value];
	if(tmp[3]){
		tr.attr("readonly",true);
		tr.val(tmp[4]);
	}else{
		tr.attr("readonly",false);
		if(!parseInt(tr.val())){
			tr.val(tmp[4]);
		}
	}
}
function drop(i){
	var tr=$("#f"+i);
	var id=tr.find("[name='id']").val();
	if(!id){
		return;
	}
	if(!window.confirm("确认删除吗？")){
		return;
	}
	var en=new Object();
	en.id=id;
	en.frame=tr.find("[lang='frame']").val();
	en.fkTable=<%=table.getId()%>;
	$.ajax({
		type:"post",
		url:"${ROOT}auto/field/drop.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			delete cache[<%=table.getId()%>];
			tr.remove();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function save(i){
	var tr=$("#f"+i);
	var en=new Object();
	en.id=tr.find("[name='id']").val();
	en.name=tr.find("[name='name']").val().trim();
	en.frame=tr.find("[name='frame']").val().trim();
	en.clazz=tr.find("[name='clazz']").val().trim();
	en.type=tr.find("[name='type']").val();
	en.rely=tr.find("[lang='rely']").attr("title");
	en.empty=parseInt(tr.find("[name='empty"+i+"']:checked").val());
	en.length=parseInt(tr.find("[name='length']").val(),10);
	en.tacit=tr.find("[name='tacit']").val().trim();
	en.fkInward=tr.find("[name='fkInward']").val().trim();
	en.note=tr.find("[name='note']").val().trim();
	en.queue=tr.find("[name='queue']").val();
	en.fkTable=<%=table.getId()%>;
	if(!en.name){
		tr.find("[name='name']").focus();
		return;
	}
	if(!en.frame){
		tr.find("[name='frame']").focus();
		return;
	}
	if(!en.length&&!map[en.type][3]){
		tr.find("[name='length']").focus();
		return;
	}
	if(!en.clazz){
		if(<%=context.template.getContext().HumpNamingSupport%>){
			var tmp=en.frame.split("_");
			var vs="";
			for(var j=0;j<tmp.length;j++){
				vs+=j==0?tmp[j]:tmp[j].substring(0,1).toUpperCase()+tmp[j].substring(1);
			}
			if(!vs){
				tr.find("[name='clazz']").focus();
				return;
			}
			en.clazz=vs;
			tr.find("[name='clazz']").val(vs);
		}else{
			en.clazz=en.frame;
			tr.find("[name='clazz']").val(en.frame);
		}
	}
	if(!en.id){
		if(i==1){
			en.major=1;
			en.empty=0;
			tr.find("[name='id']").uCheck("check");
			tr.find("[name='empty"+i+"'][value='0']").uCheck("check");
		}else{
			en.major=0;
		}
	}
	if(tr.find("[name='id']:checked").length||en.empty==1||en.type.indexOf("BLOB")!=-1){
		en.tacit="";
		tr.find("[name='tacit']").val("");
	}
	if(!en.rely){
		en.rely="";
	}
	if(en.note&&en.note.indexOf("\"")!=-1){
		en.note=en.note.replace(/\"/g, "'");
		tr.find("[name='note']").val(en.note);
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/field/save.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				if(state=="UPDATE"){
					delete cache[<%=table.getId()%>];
					JAlert("更新字段成功");
				}else{
					JAlert(state);
				}
				return;
			}
			delete cache[<%=table.getId()%>];
			tr.find("[name='id']").val(res.id);
			tr.find("[name='type']").find("option[value='"+en.type+"']").attr("selected",true);
			tr.find("[lang='frame']").val(en.frame);
			$("#j_table tbody[lang='field']").append(field.replace(/#i#/g,++i));
			$("#f"+i+" [name='id'],#f"+i+" [name='empty"+i+"']").uCheck("enable");
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function rely(i){
	$("#rely input[type='hidden']").val(i);
	$("#rely input[type='text']").val($("#f"+i+" [lang='rely']").attr("title"));
	$("#rely").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var i=$("#rely input[type='hidden']").val();
			if(n.data){
				$("#f"+i+" [lang='rely']").attr("title",n.data);
			}else{
				$("#f"+i+" [lang='rely']").removeAttr("title");
			}
		},
		onCancel:function(n){}
	});
}
function queue(order,i){
	var now=$("#f"+i);
	if(!now.find("[name='id']").val()){
		return;
	}
	var him=order?now.prev():now.next();
	if(!him.is("tr")||!him.find("[name='id']").val()){
		return;
	}
	var datas=[];
	datas[0]=[now.find("[name='id']").val(),him.find("[name='queue']").val(),<%=table.getId()%>];
	datas[1]=[him.find("[name='id']").val(),now.find("[name='queue']").val()];
	$.ajax({
		type:"post",
		url:"${ROOT}auto/field/queue.htm",
		data:JSON.stringify(datas),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			now.find("[name='queue']").val(datas[0][1]);
			him.find("[name='queue']").val(datas[1][1]);
			if(order){
				him.before(now.clone());
			}else{
				him.after(now.clone());
			}
			now.remove();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function box0(o){
	var tr=$(o).parents("tr");
	tr.find("[lang='fieldObey']").val("");
	tr.find("[name='fieldObey']").val("");
}
function box1(o,i,name,title,datas){
	var value=";"+o.value;
	var type=$("#b"+i+" [name='type']").val()=="FOREIGN KEY"?"radio":"checkbox";
	var html="";
	for(var n=0;n<datas.length;n++){
		html+="<input type=\""+type+"\" value=\"{'id':'"+datas[n][0]+"','name':'"+datas[n][1]+"','frame':'"+datas[n][2]+"'}\""+(value.indexOf(";"+datas[n][2]+";")!=-1?" checked=\"checked\"":"")+" lang=\""+datas[n][2]+"\" name=\"frame\">"+datas[n][1]+"("+datas[n][2]+"+"+datas[n][3]+"+"+datas[n][4]+") ";
	}
	$("#field .am-modal-hd").html(title+"<i class=\"am-close am-close-spin\" data-am-modal-close>&times;</i>");
	$("#field .am-modal-bd").html(html);
	$("#field [name='i']").val(i);
	$("#field [name='name']").val(name);
	$("#field").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var res=[];
			var val="";
			$("#field [name='frame']:checked").each(function(){
				var vs=null;
				eval("vs="+$(this).val());
				res[res.length]=vs;
				val+=$(this).attr("lang")+";";
			});
			var i=$("#field [name='i']").val();
			var name=$("#field [name='name']").val();
			$("#b"+i+" [lang='"+name+"']").val(val);
			$("#b"+i+" [name='"+name+"']").val(JSON.stringify(res));
		},
		onCancel:function(n){
			var i=$("#field [name='i']").val();
			var name=$("#field [name='name']").val();
			$("#b"+i+" [lang='"+name+"']").val("");
			$("#b"+i+" [name='"+name+"']").val("");
		}
	});
}
function box2(o,i,id){
	var name=id?"fieldHost":"fieldObey";
	var title=id?"选择主表字段":"选择从表字段";
	var datas=cache[id];
	if(id){
		datas=cache[id];
	}else{
		id=$("#b"+i+" [name='fkTableObey']").val();
		if(id=="-1"){
			JAlert("请选择从表对象");
			$("#b"+i+" [name='fkTableObey']").focus();
			return;
		}
		datas=cache[id];
	}
	if(datas){
		box1(o,i,name,title,datas);
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/field/list.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			cache[id]=res.data;
			box1(o,i,name,title,res.data);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function trash(i,id){
	if(!window.confirm("确认删除吗？")){
		return;
	}
	var tr=$("#b"+i);
	var en=new Object();
	en.ids=[id];
	en.name=tr.find("[lang='name']").val();
	en.fkTableHost=<%=table.getId()%>;
	$.ajax({
		type:"post",
		url:"${ROOT}auto/bound/drop.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			tr.remove();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function keep(i){
	var tr=$("#b"+i);
	var en=new Object();
	en.type=tr.find("[name='type']").val();
	en.trash=tr.find("[name='trash']").val();
	en.modify=tr.find("[name='modify']").val();
	en.fieldHost=tr.find("[name='fieldHost']").val();
	en.fieldObey=tr.find("[name='fieldObey']").val();
	en.fkTableHost="<%=table.getId()%>";
	en.fkTableObey=tr.find("[name='fkTableObey']").val();
	if(!en.fieldHost){
		tr.find("[lang='fieldHost']").focus();
		return;
	}
	if(en.type=="FOREIGN KEY"){
		if(en.fkTableObey=="-1"){
			tr.find("[name='fkTableObey']").focus();
			return;
		}
		if(!en.fieldObey||en.fkTableHost==en.fkTableObey&&en.fieldHost==en.fieldObey){
			tr.find("[lang='fieldObey']").focus();
			return;
		}
	}else{
		if(en.trash!="NO ACTION"){
			en.trash=="NO ACTION";
			tr.find("[name='trash'] option:eq(0)").attr("selected",true);
		}
		if(en.modify!="NO ACTION"){
			en.modify=="NO ACTION";
			tr.find("[name='modify'] option:eq(0)").attr("selected",true);
		}
		if(en.fkTableObey!="-1"){
			tr.find("[name='fkTableObey'] option:eq(0)").attr("selected",true);
		}
		if(en.fieldObey){
			tr.find("[lang='fieldObey']").val("");
			tr.find("[name='fieldObey']").val("");
		}
		en.fieldObey=null;
		en.fkTableObey=null;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/bound/save.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			tr.find("[lang='name']").val(res.name);
			tr.find("[name='type']").attr("disabled",true);
			tr.find("[name='trash']").attr("disabled",true);
			tr.find("[name='modify']").attr("disabled",true);
			tr.find("[lang='fieldHost']").removeAttr("onclick");
			tr.find("[name='fkTableObey']").attr("disabled",true).removeAttr("onchange");
			tr.find("[lang='fieldObey']").removeAttr("onclick");
			tr.find(".am-btn-group").html("<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"trash("+i+","+res.id+")\"> 删除</a>");
			$("#j_table tbody[lang='bound']").append(bound.replace(/#i#/g,++i));
			$("#b"+i+" [type='radio']").uCheck("enable");
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
</script>
</body>
</html>