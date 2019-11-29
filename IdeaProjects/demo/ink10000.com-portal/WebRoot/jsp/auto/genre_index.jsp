<%@ page language="java" import="com.mc.core.entity.auto.Genre" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Genre> datas = (List<Genre>) request.getAttribute("datas");
Genre en = new Genre();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "auto/genre/")%>
		<div class="am-g" id="j_table">
			<table class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered am-table-compact">
				<thead>
					<tr class="am-primary">
						<th style="width:28px;"><label class="am-radio"><input type="radio" disabled="disabled" data-am-ucheck></label></th>
						<th><%=en.setName(null).getAlias()%></th>
						<th data-am-popover="{content:'代码中属性的类型',trigger:'hover',theme:'sm'}"><%=en.setClazz(null).getAlias()%></th>
						<th data-am-popover="{content:'映射文件中的数据类型',trigger:'hover',theme:'sm'}"><%=en.setMapper(null).getAlias()%></th>
						<th data-am-popover="{content:'表结构中的存储类型',trigger:'hover',theme:'sm'}"><%=en.setFrame(null).getAlias()%></th>
						<th><%=en.setFixed(null).getAlias()%></th>
						<th><%=en.setLength(null).getAlias()%></th>
						<th style="width:145px;">操作</th>
					</tr>
					<tr style="display:table-row;"><td colspan="8"><p class="am-margin-0 am-text-danger">类型配置显示在<a href="auto/table/list.htm">对象管理</a>中【属性】的数据类型的下拉框中</p></td></tr>
				</thead>
				<tbody>
				<%
					int index = 1;
					for (Genre data : datas) {
						out.print("<tr id=\"r" + index + "\">");
						out.print("<td><label class=\"am-radio\"><input type=\"radio\" value=\"" + data.getId() + "\" disabled=\"disabled\" data-am-ucheck name=\"id\"></label></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getName() + "\" maxlength=\"40\" placeholder=\"类型名称\" name=\"name\"></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getClazz() + "\" maxlength=\"20\" placeholder=\"对象类型\" name=\"clazz\"></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getMapper() + "\" maxlength=\"20\" placeholder=\"映射类型\" name=\"mapper\"></td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getFrame() + "\" maxlength=\"20\" placeholder=\"结构类型\" name=\"frame\"></td>");
						out.print("<td>" + this.radio("fixed" + index, data.getFixed()) + "</td>");
						out.print("<td><input type=\"text\" class=\"am-input-sm\" value=\"" + data.getLength() + "\" maxlength=\"10\" placeholder=\"默认长度\" name=\"length\"></td>");
						out.print("<td>");
						out.print("<div class=\"am-btn-group am-btn-group-xs\">");
						if (data.getTacit()) {
							out.print("<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger am-disabled\"> 删除</a>");
						} else {
							out.print("<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(" + index + ")\"> 删除</a>");
						}
						out.print("<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"save(" + index + ")\"> 保存</a>");
						out.print("</div>");
						out.print("</td>");
						out.print("</tr>");
						index++;
					}
					String genre = "<tr id=\"r#i#\">";
					genre += "<td><label class=\"am-radio\"><input type=\"radio\" value=\"\" disabled=\"disabled\" data-am-ucheck name=\"id\"></label></td>";
					genre += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"40\" placeholder=\"类型名称\" name=\"name\"></td>";
					genre += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"对象类型\" name=\"clazz\"></td>";
					genre += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"映射类型\" name=\"mapper\"></td>";
					genre += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"20\" placeholder=\"结构类型\" name=\"frame\"></td>";
					genre += "<td>" + this.radio("fixed#i#", false) + "</td>";
					genre += "<td><input type=\"text\" class=\"am-input-sm\" maxlength=\"10\" placeholder=\"默认长度\" name=\"length\"></td>";
					genre += "<td>";
					genre += "<div class=\"am-btn-group am-btn-group-xs\">";
					genre += "<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(#i#)\"> 删除</a>";
					genre += "<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"save(#i#)\"> 保存</a>";
					genre += "</div>";
					genre += "</td>";
					genre += "</tr>";
					out.print(genre.replace("#i#", String.valueOf(index)));
				%>
				</tbody>
			</table>
			<div class="am-margin-top-xs am-btn-group"><a class="am-btn am-btn-secondary <%=icon("history")%>" onclick="tacit()"> 还原配置</a></div>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript">
var genre="<%=genre.replace("\"", "\\\"")%>";
function drop(i){
	var tr=$("#r"+i);
	var id=tr.find("[name='id']").val();
	if(!id){
		return;
	}
	if(!window.confirm("确认删除吗？")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/genre/drop.htm",
		data:{id:id},
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
function save(i){
	var tr=$("#r"+i);
	var en=new Object();
	en.id=tr.find("[name='id']").val();
	en.name=tr.find("[name='name']").val().trim();
	en.clazz=tr.find("[name='clazz']").val().trim();
	en.mapper=tr.find("[name='mapper']").val();
	en.frame=tr.find("[name='frame']").val().trim();
	en.fixed=tr.find("[name='fixed"+i+"']:checked").val();
	en.length=parseInt(tr.find("[name='length']").val(),10);
	if(!en.name){
		tr.find("[name='name']").focus();
		return;
	}
	if(!en.clazz){
		tr.find("[name='clazz']").focus();
		return;
	}
	if(!en.mapper){
		tr.find("[name='mapper']").focus();
		return;
	}
	if(!en.frame){
		tr.find("[name='frame']").focus();
		return;
	}
	if(isNaN(en.length)||en.length<0){
		tr.find("[name='length']").focus();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/genre/save.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			tr.find("[name='id']").val(res.id);
			$("#j_table tbody").append(genre.replace(/#i#/g,++i));
			$("#r"+i+" [name='id'],#g"+i+" [name='fixed"+i+"']").uCheck("enable");
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function tacit(){
	if(!window.confirm("你确认要还原数据类型到原始默认的吗")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/genre/tacit.htm",
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
</script>
</body>
</html>