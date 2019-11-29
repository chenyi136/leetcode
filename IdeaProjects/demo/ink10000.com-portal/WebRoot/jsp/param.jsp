<%@ page language="java" import="
com.mc.core.entity.auth.Account,
com.mc.portal.pojo.OnlineInfo" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
OnlineInfo.Config template = (OnlineInfo.Config) request.getAttribute("template");
if (template.LEAF_MAX_SIZE > Global.LEAF_MAX_SIZE) {
	template.LEAF_MAX_SIZE = Global.LEAF_MAX_SIZE;
}
if (template.LEAF_DEF_SIZE > template.LEAF_MAX_SIZE) {
	template.LEAF_DEF_SIZE = template.LEAF_MAX_SIZE;
}
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="admin/param.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.radio(new Account.Field("保存最后访问页面", false, "KEEY_LOCAL_ADDRESS", null, null, 1, "是否保存最后访问页面的地址到本地缓存中"), new String[] { "是", "否" }, template.KEEY_LOCAL_ADDRESS)%>
				<%=Form.radio(new Account.Field("显示底部意见反馈", false, "SHOW_BOTTOM_FEEDBACK", null, null, 1, "是否在每个页面底部显示意见反馈输入框"), new String[] { "是", "否" }, template.SHOW_BOTTOM_FEEDBACK)%>
				<%=Form.radio(new Account.Field("显示分页请求参数", false, "SHOW_JUMP_PAGING", null, null, 1, "是否在地址栏中显示被加密的分页请求参数"), new String[] { "是", "否" }, template.SHOW_JUMP_PAGING)%>
				<%=Form.radio(new Account.Field("是分页显示报纸吗", false, "SHOW_PAGE_SHEET", null, null, 1, "是否在图片报纸详细页中分页一张张显示图片"), new String[] { "是", "否" }, template.SHOW_PAGE_SHEET)%>
				<%=Form.select(new Account.Field("页面广告推荐模式", false, "ADVERT_GROOM_MODE", null, null, 1, "云享部落中设置是否显示推荐广告"), template.ADVERT_GROOM_MODE, new Object[][] { { "DE", "系统默认" }, {"OK", "用户显示" }, { "NO", "用户隐藏" } })%>
			</div>
			<div class="am-u-md-6">
				<%=Form.input(new Account.Field("分页每页默认条数", false, "LEAF_DEF_SIZE", null, null, 4, "此值不小于1条且不大于站点分页每页最大条数（" + Global.LEAF_MAX_SIZE + "条）"), "number", template.LEAF_DEF_SIZE, null)%>
				<%=Form.input(new Account.Field("分页每页最大条数", false, "LEAF_MAX_SIZE", null, null, 4, "此值不小于分页每页默认条数且不大于站点分页每页最大条数（" + Global.LEAF_MAX_SIZE + "条）"), "number", template.LEAF_MAX_SIZE, null)%>
				<%=Form.input(new Account.Field("分页快捷增减条数", false, "LEAF_MOVE_SIZE", null, null, 4, "此值不小于1条且不大于分页每页最大条数"), "number", template.LEAF_MOVE_SIZE, null)%>
				<%=Form.input(new Account.Field("编程代码显示样式", false, null, null, null, 40, null), template.CODE_SHOW_STYLE)%>
				<%=Form.button(request, null, null, new Object[][] { { "CODE_SHOW_STYLE", template.CODE_SHOW_STYLE }, { "refer", request.getHeader("referer") } })%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	if(<%=template.ADVERT_GROOM_MODE.equals("DE")%>){
		var os=$("#j_form [name='ADVERT_GROOM_MODE'] option");
		os[1].disabled=true;
		os[2].disabled=true;
	}
	$("#j_form").submit(function(){
		var v1=parseInt($("#j_form [name='LEAF_MAX_SIZE']").val(),10);
		if(v1><%=Global.LEAF_MAX_SIZE%>){
			v1=<%=Global.LEAF_MAX_SIZE%>;
			$("#j_form [name='LEAF_MAX_SIZE']").val(v1);
		}
		var v2=parseInt($("#j_form [name='LEAF_DEF_SIZE']").val(),10);
		if(v2>v1){
			v2=v1;
			$("#j_form [name='LEAF_DEF_SIZE']").val(v1);
		}
		if(parseInt($("#j_form [name='LEAF_MOVE_SIZE']").val(),10)>v2){
			$("#j_form [name='LEAF_MOVE_SIZE']").val(v2);
		}
	});
});
</script>
</body>
</html>