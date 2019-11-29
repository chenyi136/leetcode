<%@ page language="java" import="
java.util.Map,
com.mc.core.entity.blog.Catena" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, String> items = (Map<String, String>) request.getAttribute("items");
Catena pages = new Catena();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "blog/catena/task.htm")%>
		<ul class="am-avg-sm-10 am-list am-list-bordered am-text-center am-text-truncate">
			<li><a data-am-popover="{content:'<%=items.size()%>',trigger:'hover'}" onclick="save(this)"><i class="<%=icon("save")%>"></i></a></li>
			<li id="plus"><a onclick="insert()"><i class="<%=icon("plus")%>"></i></a></li>
			<%
				for (Map.Entry<String, String> item : items.entrySet()) {
					out.print("<li><a lang=\"" + item.getKey() + "\">" + item.getValue() + "</a></li>");
				}
			%>
		</ul>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建视频任务</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(pages.setName(null), true)%>
				<%=Popup.input(pages.setDouban(null).setEmpty(false))%>
				<%=Popup.button(null)%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
var timer=null;
function init(){
	$(".am-avg-sm-10 a").unbind("click dblclick").click(function(){
		window.clearTimeout(timer);
		var href=$(this).attr("lang");
		if(href){
			timer=window.setTimeout(function(){
				JTarget(href,[new Date().getTime()],"get","cache");
			},300);
		}
	}).dblclick(function(){
		window.clearTimeout(timer);
		if(window.confirm("确认删除吗？")){
			$(this).parent().remove();
		}
	});
}
function insert(){
	$("#load [type='reset']").click();
	$("#load").modal();
}
function save(o){
	var body={};
	$.each($(".am-avg-sm-10 a[lang]"),function(){
		var o=$(this);
		body[o.attr("lang")]=o.text();
	});
	$.ajax({
		type:"post",
		url:"${ROOT}blog/catena/task.htm",
		data:JSON.stringify(body),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			$(o).popover("setContent",$(".am-avg-sm-10 a[lang]").length);
			$(".am-avg-sm-10 a").removeClass("am-text-danger");
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	init();
	$("#load form").submit(function(){
		var o=$(this);
		var href=o.find("[name='douban']").val();
		if($(".am-avg-sm-10 a[lang='"+href+"']").length){
			o.closest(".am-popup").modal("close");
			return false;
		}
		o.closest(".am-popup").modal("close");
		$("#plus").after("<li><a lang=\""+href+"\" class=\"am-text-danger\">"+o.find("[name='name']").val()+"</a></li>");
		init();
		return false;
	});
});
</script>
</body>
</html>