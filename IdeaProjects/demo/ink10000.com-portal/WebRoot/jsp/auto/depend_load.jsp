<%@ page language="java" import="
com.mc.core.entity.auto.Depend,
com.mc.core.view.JTreeView" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<JTreeView> nodes = (List<JTreeView>) request.getAttribute("nodes");
Depend pages = (Depend) request.getAttribute("pages");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, pages.getClazz())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/js/plugin/ztree/css/zTreeStyle/zTreeStyle.css">
	<link rel="stylesheet" type="text/css" href="_/my/jform.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request)%>
		<form class="am-g am-form am-form-horizontal" action="auto/depend/save.htm" method="post" id="j_form">
			<div class="am-u-md-12 am-margin-bottom-xs am-padding-0" data-am-alert>
				<div class="am-alert am-alert-success">
					<i class="am-close am-close-spin">&times;</i>
					默认依赖(06)：Core, SuperDao, SuperEntity, SuperService, SuperServiceImpl, CryptoTool<br>
					通信对象(08)：SuperPojo, Account, Appinfo, Black, Dirty, Friend, Group, Message<br>
					通信接口(15)：SuperRest, AccountRest, AppinfoRest, BlackRest, DirtyRest, FriendRest, GroupRest, MessageRest, AccountRestImpl, AppinfoRestImpl, BlackRestImpl, DirtyRestImpl, FriendRestImpl, GroupRestImpl, MessageRestImpl<br>
					构建模板(19)：DaoImplTemplate, DaoMapperTemplate, DaoTemplate, EntityTemplate, impl, ServiceImplTemplate, ServiceTemplate, TemplateConfig, PortalDaoImplTemplateImpl, PortalDaoMapperTemplateImpl, PortalDaoTemplateImpl, PortalEntityTemplateImpl, PortalServiceImplTemplateImpl, PortalServiceTemplateImpl, TacitDaoImplTemplateImpl, TacitDaoMapperTemplateImpl, TacitDaoTemplateImpl, TacitEntityTemplateImpl, TacitServiceImplTemplateImpl, TacitServiceTemplateImpl
				</div>
			</div>
			<div class="am-u-md-6">
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.setClazz(null), pages.getClazz())%>
				<%=Form.input(pages.setTotal(null).setField(null), pages.getTotal())%>
				<%=Form.button(request, pages.setId(null), pages.getId(), new Object[][] { { pages.setEntry(null).ClazzFieldName, pages.getEntry().replace("\"", "\\\"") }, { pages.setTotal(null).ClazzFieldName, pages.getTotal() } })%>
			</div>
			<div class="am-u-md-6">
				<div class="am-form-success am-form-icon am-form-feedback am-form-group">
					<div class="am-u-md-3 am-form-label am-text-right">类库列表</div>
					<div class="am-u-md-9"><ul style="height:185px;" class="ztree" id="tree"></ul></div>
				</div>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.core.min-3.5.21.js"></script>
<script type="text/javascript" src="_/js/plugin/ztree/jquery.ztree.excheck.min-3.5.21.js"></script>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
var nodes=<%=JsonTool.write(nodes)%>;
var tree;
var setting={
	view:{showIcon:false},
	data:{simpleData:{enable:true}},
	check:{
		enable:true,
		nocheckInherit:false
	}
};
$(document).ready(function(){
	$.fn.zTree.init($("#tree"),setting,nodes);
	tree=$.fn.zTree.getZTreeObj("tree");
	tree.setting.check.chkboxType={"Y":"ps","N":"ps"};
	nodes=tree.getCheckedNodes();
	if(nodes&&nodes.length>0){
		for(var i=0;i<nodes.length;i++){
			if(nodes[i].hasOwnProperty("halfCheck")){
				delete nodes[i].halfCheck;
				tree.updateNode(nodes[i]);
			}
		}
	}
	$("#j_form").submit(function(){
		var entry=[];
		var nodes=tree.getCheckedNodes();
		if(nodes&&nodes.length>0){
			for(var i=0;i<nodes.length;i++){
				if(nodes[i].id.indexOf("/")!=-1){
					entry[entry.length]=nodes[i].id;
				}
			}
		}
		if(!entry.length){
			JAlert("请先选择类库");
			return false;
		}
		$("#j_form [name='<%=pages.setEntry(null).ClazzFieldName%>']").val(JSON.stringify(entry));
		$("#j_form [name='<%=pages.setTotal(null).ClazzFieldName%>']").val(entry.length);
	});
});
</script>
</body>
</html>