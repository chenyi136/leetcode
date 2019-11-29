<%@ page language="java" import="
java.net.URLEncoder,
com.mc.core.crux.Legal,
com.mc.core.entity.auto.Inward" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Inward> datas = (List<Inward>) request.getAttribute("datas");
String token = (String) request.getAttribute("token");
Inward en = new Inward();
%>
<%!
public String major(String value) {
	StringBuffer res = new StringBuffer();
	res.append("<select" + (Legal.AUTO_INWARD_MAJOR.containsKey(value) ? " disabled=\"disabled\"" : "") + " name=\"major\">");
	for (Map.Entry<String, String> data : Legal.AUTO_INWARD_MAJOR.entrySet()) {
		res.append("<option value=\"" + data.getKey() + "\"" + (data.getKey().equals(value) ? " selected=\"selected\"" : "") + ">" + data.getValue() + "</option>");
	}
	res.append("</select>");
	return res.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
#j_table .am-table-compact li .am-input-sm{width:50%;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "auto/inward/")%>
		<div class="am-g" id="j_table">
			<table class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered am-table-compact">
				<thead>
					<tr class="am-primary">
						<th style="width:28px;"><label class="am-radio"><input type="radio" disabled="disabled" data-am-ucheck></label></th>
						<th><%=en.setName(null).getAlias()%></th>
						<th><%=en.setClazz(null).getAlias()%></th>
						<th><%=en.setMajor(null).getAlias()%></th>
						<th style="width:210px;">操作</th>
						<th style="width:450px;">选项</th>
					</tr>
					<tr style="display:table-row;"><td colspan="6"><p class="am-margin-0 am-text-danger">字段取值显示在<a href="auto/table/list.htm">对象管理</a>中【属性】的取值集合的下拉框中</p></td></tr>
				</thead>
				<tbody>
				<%
					out.print("<tr>");
					out.print("<td style=\"margin:0;padding:0;border:none;visibility:hidden;\" colspan=\"5\"></td>");
					out.print("<td rowspan=\"" + (datas.size() + 2) + "\">");
					out.print("<ul class=\"am-margin-0 am-list am-list-border\" id=\"entry\">");
					out.print("<li><input type=\"text\" style=\"width:100%;\" class=\"am-input-sm\" value=\"字段选项：\" disabled=\"disabled\"></li>");
					out.print("<li>");
					out.print("<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的键\" name=\"key\">");
					out.print("<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的值\" name=\"value\">");
					out.print("</li>");
					out.print("<li>");
					out.print("<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的键\" name=\"key\">");
					out.print("<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的值\" name=\"value\">");
					out.print("</li>");
					out.print("</ul>");
					out.print("</td>");
					out.print("</tr>");
					int index = 1;
					for (Inward data : datas) {
						out.print("<tr id=\"r" + index + "\">");
						out.print("<td><label class=\"am-radio\"><input type=\"radio\" value=\"" + data.getId() + "\" disabled=\"disabled\" data-am-ucheck name=\"id\"></label></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getName() + "\" maxlength=\"40\" placeholder=\"中文名称\" name=\"name\"></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getClazz() + "\" disabled=\"disabled\"></td>");
						out.print("<td>" + this.major(data.getMajor()) + "</td>");
						out.print("<td>");
						out.print("<div class=\"am-btn-group am-btn-group-xs\">");
						out.print("<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(" + index + ")\"> 删除</a>");
						out.print("<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"save(" + index + ")\"> 保存</a>");
						out.print("<a class=\"am-btn am-btn-default am-text-secondary\" onclick=\"load(" + index + ")\">选项 <i class=\"" + icon("angle-right") + "\"></i></a>");
						out.print("</div>");
						out.print("</td>");
						out.print("</tr>");
						index++;
					}
					String inward = "<tr id=\"r#i#\">";
					inward += "<td><label class=\"am-radio\"><input type=\"radio\" value=\"\" disabled=\"disabled\" data-am-ucheck name=\"id\"></label></td>";
					inward += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"40\" placeholder=\"中文名称\" name=\"name\"></td>";
					inward += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"40\" placeholder=\"对象类型\" name=\"clazz\"></td>";
					inward += "<td>" + this.major(null) + "</td>";
					inward += "<td>";
					inward += "<div class=\"am-btn-group am-btn-group-xs\">";
					inward += "<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(#i#)\"> 删除</a>";
					inward += "<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"save(#i#)\"> 保存</a>";
					inward += "<a class=\"am-btn am-btn-default am-text-secondary\" onclick=\"load(#i#)\">选项 <i class=\"" + icon("angle-right") + "\"></i></a>";
					inward += "</div>";
					inward += "</td>";
					inward += "</tr>";
					out.print(inward.replace("#i#", String.valueOf(index)));
				%>
				</tbody>
			</table>
			<div class="am-margin-top-xs am-btn-group"><a href="global/inward.htm?<%=Global.KEY_JUMP_TOKEN + "=" + URLEncoder.encode(token, "UTF-8")%>" class="am-btn am-btn-secondary <%=icon("file-code-o")%>" target="_blank"> 下载源码</a></div>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript">
var inward="<%=inward.replace("\"", "\\\"")%>";
function tacit(){
	var h="<li><input type=\"text\" style=\"width:100%;\" class=\"am-input-sm\" value=\"字段选项：\" disabled=\"disabled\"></li>";
	h+="<li>";
	h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的键\" name=\"key\">";
	h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的值\" name=\"value\">";
	h+="</li>";
	h+="<li>";
	h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的键\" name=\"key\">";
	h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的值\" name=\"value\">";
	h+="</li>";
	$("#entry").html(h);
}
function item(){
	$("#j_table tbody tr").unbind("keyup change click");
	$("#j_table tbody tr:last").on("keyup change click",function(){
		var tr=$(this);
		tr.siblings().removeAttr("class");
		tr.addClass("am-text-warning");
		if($("#entry input[type='hidden']").val()){
			tacit();
		}
	});
}
function drop(i){
	var id=$("#r"+i).find("[name='id']").val();
	if(!id||!window.confirm("确认删除吗？")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/inward/drop.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			$("#r"+i).remove();
			tacit();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function save(i){
	var en=new Object();
	en.id=$("#r"+i+" [name='id']").val();
	en.name=$("#r"+i+" [name='name']").val();
	en.major=$("#r"+i+" [name='major']").val();
	if(!en.name){
		$("#r"+i+" [name='name']").focus();
		return;
	}
	if(!en.id){
		en.clazz=$("#r"+i+" [name='clazz']").val();
		if(!en.clazz){
			$("#r"+i+" [name='clazz']").focus();
			return;
		}
	}
	if(!en.id||en.id==$("#entry input[type='hidden']").val()){
		en.entry={};
		$.each($("#entry li"),function(){
			var o=$(this);
			var key=o.find("[name='key']").val();
			var value=o.find("[name='value']").val();
			if(key&&value){
				en.entry[key]=value;
			}
		});
		en.entry=JSON.stringify(en.entry);
	}
	if(!en.id&&!en.entry){
		en.entry="{}";
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/inward/save.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			if(res.id){
				$("#r"+i+" [name='id']").val(res.id);
				$("#r"+i+" [name='clazz']").attr({value:res.clazz,disabled:true});
				$("#r"+i+" [name='major']").attr("disabled",true);
				$("#j_table tbody").append(inward.replace(/#i#/g,++i));
				$("#r"+i+" [name='id']").uCheck("enable");
				$("#entry").parent("td").attr("rowspan",$("#j_table tbody tr").length);
				item();
				load(i-1);
			}else{
				load(i);
			}
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function load(i){
	var tr=$("#r"+i);
	var id=tr.find("[name='id']").val();
	if(!id){
		tacit();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/inward/load.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var data=res.data;
			var h="<li>";
			h+="<input type=\"hidden\" value=\""+id+"\">";
			h+="<input type=\"text\" style=\"width:100%;\" class=\"am-input-sm\" value=\"字段选项："+res.name+"（"+res.clazz+"）\" disabled=\"disabled\">";
			h+="</li>";
			for(key in data){
				h+="<li>";
				h+="<input type=\"text\" class=\"am-input-sm\" value=\""+key+"\" maxlength=\"20\" placeholder=\"选项的键\" name=\"key\">";
				h+="<input type=\"text\" class=\"am-input-sm\" value=\""+data[key]+"\" maxlength=\"20\" placeholder=\"选项的值\" name=\"value\">";
				h+="</li>";
			}
			h+="<li>";
			h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的键\" name=\"key\">";
			h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的值\" name=\"value\">";
			h+="</li>";
			h+="<li>";
			h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的键\" name=\"key\">";
			h+="<input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"选项的值\" name=\"value\">";
			h+="</li>";
			$("#entry").html(h);
			tr.siblings().removeAttr("class");
			tr.addClass("am-text-warning");
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	item();
});
</script>
</body>
</html>