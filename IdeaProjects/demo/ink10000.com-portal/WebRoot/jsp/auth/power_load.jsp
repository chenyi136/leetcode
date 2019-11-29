<%@ page language="java" import="com.mc.core.entity.auth.Power" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Global.PowerItem> items = (List<Global.PowerItem>) request.getAttribute("items");
Power[] parent = (Power[]) request.getAttribute("parent");
Power pages = (Power) request.getAttribute("pages");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getName())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="auth/power/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=pages.getId() != null ? Form.input(pages.setId(null).setField(null).setAlias("权限代号"), pages.getId()) : Form.input(pages.setId(null).setField("id2").setAlias("权限代号").setEmpty(true), null)%>
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.setIcon(null), pages.getIcon() != null ? pages.getIcon() : "am-icon-circle-o")%>
				<%=Form.input(pages.setRoute(null), pages.getRoute())%>
				<%=Form.input(pages.setQueue(null).setField(null), pages.getQueue())%>
				<div class="am-form-group am-form-success am-form-icon am-form-feedback">
					<div class="am-u-md-3 am-form-label am-text-right"><%=pages.setParent(null).getAlias()%></div>
					<div class="am-u-md-9">
						<select data-am-selected="{btnStyle:'success',btnWidth:'49.5%',searchBox:1}" id="parent1" onchange="next()">
						<%
							out.print("<option value=\"-1\" lang=\"[]\">请选择</option>");
							String key = parent[0] != null ? parent[0].getId() : "";
							List<Global.PowerItem> next = null;
							for (Global.PowerItem item : items) {
								if (item.id.equals(pages.getId())) {
									continue;
								}
								if (item.id.equals(key)) {
									next = item.next;
									out.print("<option value=\"" + item.id + "\" lang=\"" + JsonTool.write(next).replace("\"", "'") + "\" selected=\"selected\">" + item.name + "</option>");
								} else {
									out.print("<option value=\"" + item.id + "\" lang=\"" + JsonTool.write(item.next).replace("\"", "'") + "\">" + item.name + "</option>");
								}
							}
						%>
						</select>
						<select data-am-selected="{btnStyle:'success',btnWidth:'49.5%',searchBox:1}" id="parent2">
						<%
							out.print("<option value=\"-1\">请选择</option>");
							if (next != null && next.size() > 0) {
								key = parent[1] != null ? parent[1].getId() : "";
								for (Global.PowerItem item : next) {
									if (item.id.equals(pages.getId())) {
										continue;
									}
									out.print("<option value=\"" + item.id + "\"" + (item.id.equals(key) ? " selected=\"selected\"" : "") + ">" + item.name + "</option>");
								}
							}
						%>
						</select>
					</div>
				</div>
			</div>
			<div class="am-u-md-6">
				<%=Form.radio(pages.setForbid(null), new String[] { "是", "否" }, pages.getForbid() != null ? pages.getForbid() : false)%>
				<%=Form.radio(pages.setTacit(null), new String[] { "是", "否" }, pages.getForbid() != null ? pages.getTacit() : false)%>
				<%=Form.radio(pages.setMenu(null), new String[] { "是", "否" }, pages.getForbid() != null ? pages.getMenu() : false)%>
				<%=Form.radio(pages.setQuick(null), new String[] { "是", "否" }, pages.getForbid() != null ? pages.getQuick() : false)%>
				<%=Form.button(request, pages.setId(null), pages.getId(), new Object[][] { { pages.setLevel(null).ClazzFieldName, pages.getLevel() != null ? pages.getLevel() : 1 }, { pages.setParent(null).ClazzFieldName, !pages.doIsEmpty(pages.getParent()) ? pages.getParent() : "-1" } })%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
var key="<%=parent[1] != null ? parent[1].getId() : ""%>";
function next(){
	var items=null;
	eval("items="+$("#parent1 option:selected").attr("lang"));
	var h="<option value=\"-1\">请选择</option>";
	for(var i=0;i<items.length;i++){
		var item=items[i];
		if(item.id=="<%=pages.getId()%>"){
			continue;
		}
		h+="<option value=\""+item.id+"\""+(item.id==key?" selected=\"selected\"":"")+">"+item.name+"</option>";
	}
	$("#parent2").html(h);
}
$(document).ready(function(){
	$("#j_form").submit(function(){
		var level=3;
		var parent=$("#parent2").val();
		if(parent=="-1"){
			level=2;
			parent=$("#parent1").val();
			if(parent=="-1"){
				level=1;
			}
		}
		$("#j_form [name='level']").val(level);
		$("#j_form [name='parent']").val(parent);
	});
});
</script>
</body>
</html>