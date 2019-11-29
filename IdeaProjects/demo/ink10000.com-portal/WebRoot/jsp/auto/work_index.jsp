<%@ page language="java" import="
com.mc.portal.pojo.OnlineInfo,
com.mc.portal.pojo.WorkConfig" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
OnlineInfo online = (OnlineInfo) request.getAttribute("online");
WorkConfig template = (WorkConfig) request.getAttribute("config");
String[] version = (String[]) request.getAttribute("version");
Long[] count = (Long[]) request.getAttribute("count");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, template.name)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
<style type="text/css">
.am-panel{margin-bottom:0;}
.am-panel-bd>p{margin:0 0 0.5rem 0;width:49%;float:left;}
.am-panel-bd>p:last-child{margin:0;}
.am-panel-bd .am-btn{line-height:100%;vertical-align:middle;display:inline;}
.am-panel-bd .meta{margin-top:0.5rem;font-size:1.6rem;font-style:normal;color:#999;}
.am-panel-bd .body{font-size:1.7rem;font-style:normal;}
.am-avg-md-8{border:1px solid #FBD0AE;}
.am-avg-md-8 li{margin-left:-1px;border-right:1px solid #FBD0AE;border-left:1px solid #FBD0AE;}
.am-avg-md-8 li:first-child{border-left:none;}
.am-avg-md-8 li:last-child{border-right:none;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "auto/work/index.htm", "auto/work/exit.htm")%>
		<div class="am-g">
			<div class="am-panel am-panel-warning">
				<div class="am-panel-hd"><i class="<%=icon("map-signs")%>"></i> 空间介绍</div>
				<div class="am-panel-bd am-cf">
					<p><i class="meta">空间名称：</i><i class="body"><%=template.name%>&nbsp;<a href="auto/work/config.htm?id=<%=template.id%>" class="am-btn am-btn-xs am-btn-warning">配置</a></i></p>
					<p><i class="meta">持有用户：</i><i class="body"><%=online.name%></i></p>
					<p><i class="meta">本人角色：</i><i class="body"><%=template.trash && template.modify ? "持有者" : (template.modify ? "参与者" : "游客") %></i></p>
					<p><i class="meta">联合主键：</i><i class="body"><%=template.template.getContext().MeshKeySupport ? "支持" : "不支持"%></i></p>
					<p><i class="meta">驼峰命名：</i><i class="body"><%=template.template.getContext().HumpNamingSupport ? "支持" : "不支持"%></i></p>
					<p><i class="meta">版本序号：</i><i class="body" data-am-popover="{content:'确认修改项目了<%=version[0]%>次',trigger:'hover',theme:'sm warning'}"><%=version[1]%></i></p>
					<p><i class="meta">创建时间：</i><i class="body"><%=version[2]%></i></p>
					<p style="width:100%;"><i class="meta">签名票据：</i><i class="body"><u class="am-text-danger"><%=version[3]%></u><%=template.trash && template.modify ? "&nbsp;<a class=\"am-btn am-btn-xs am-btn-warning\" onclick=\"keyt(this)\">重置</a>" : ""%></i></p>
				</div>
			</div>
			<div class="am-margin-top-xs am-btn-group am-btn-group-justify">
				<a href="auto/work/config.htm?id=<%=template.id%>" class="am-btn am-btn-warning <%=icon("cog")%>"> 空间配置</a>
				<a href="auto/work/library.htm?id=<%=template.id%>" class="am-btn am-btn-warning <%=icon("link")%>"> 空间依赖</a>
				<a href="_/doc/demo.zip" class="am-btn am-btn-warning <%=icon("cloud-download")%>" target="_blank"> 本地开发</a>
				<a href="auto/template/load.htm" class="am-btn am-btn-warning <%=icon("cloud-upload")%>"> 上传模板</a>
				<a href="auto/work/exit.htm" class="am-btn am-btn-warning <%=icon("power-off")%>"> 退出空间</a>
			</div>
			<ul class="am-margin-vertical-xs am-padding am-avg-md-8 am-text-center">
				<li><a href="auto/member/list.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("user-secret")%>"></i><br>成员管理<br><%=count[1]%></a></li>
				<li><a href="auto/template/list.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("dropbox")%>"></i><br>模板配置<br><%=count[4]%></a></li>
				<li><a href="auto/project/list.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("product-hunt")%>"></i><br>工作项目<br><%=count[0]%></a></li>
				<li><a href="auto/table/list.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("object-group")%>"></i><br>对象管理<br><%=count[2]%></a></li>
				<li><a href="auto/driver/list.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("database")%>"></i><br>驱动管理<br><%=count[3]%></a></li>
				<li><a href="auto/module/list.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("modx")%>"></i><br>模块管理<br><%=count[5]%></a></li>
				<li><a href="auto/genre/index.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("certificate")%>"></i><br>数据类型<br><%=count[6]%></a></li>
				<li><a href="auto/field/count.htm" class="am-text-warning"><i class="am-icon-btn <%=icon("file-word-o")%>"></i><br>字段统计<br><%=count[7]%></a></li>
			</ul>
			<div class="am-u-md-6 am-padding-0">
				<div class="am-panel am-panel-warning">
					<div class="am-panel-hd am-cf" data-am-collapse="{target:'#task'}"><i class="<%=icon("map-signs")%>"></i> 待办事项<i class="<%=icon("caret-down")%> am-fr"></i></div>
					<div class="am-panel-bd am-in" id="task">
						<ul class="am-list">
							<li>
								<div class="meta"> Posted on 25/1/2120 by 呵呵呵</div>
								<div class="body">基兰和狗熊出现在不同阵营时。基兰会获得BUFF，“装甲熊憎恨者”。狗熊会获得BUFF，“时光老人憎恨者”。</div>
								<div class="am-cf"><a class="am-btn am-btn-xs am-btn-warning am-fr">完成了</a></div>
							</li>
							<li>
								<div class="meta"> Posted on 25/1/2120 by 呵呵呵</div>
								<div class="body">基兰和狗熊出现在不同阵营时。基兰会获得BUFF，“装甲熊憎恨者”。狗熊会获得BUFF，“时光老人憎恨者”。</div>
								<div class="am-cf"><a class="am-btn am-btn-xs am-btn-warning am-fr">完成了</a></div>
							</li>
							<li>
								<div class="meta"> Posted on 25/1/2120 by 呵呵呵</div>
								<div class="body">基兰和狗熊出现在不同阵营时。基兰会获得BUFF，“装甲熊憎恨者”。狗熊会获得BUFF，“时光老人憎恨者”。</div>
								<div class="am-cf"><a class="am-btn am-btn-xs am-btn-warning am-fr">完成了</a></div>
							</li>
							<li class="am-text-center"><a href="task/index.htm" class="am-text-warning">查看更多</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="am-u-md-6 am-padding-right-0 am-padding-left-xs">
				<div class="am-panel am-panel-warning">
					<div class="am-panel-hd am-cf" data-am-collapse="{target:'#feedback'}"><i class="<%=icon("map-signs")%>"></i> 意见反馈<i class="<%=icon("caret-down")%> am-fr"></i></div>
					<div class="am-panel-bd am-in" id="feedback">
						？？？？
					</div>
				</div>
			</div>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript">
function keyt(o){
	if(!window.confirm("你确认要重置密钥吗")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}auto/work/keyt.htm",
		data:{id:<%=template.id%>},
		dataType:"json",
		async:false,
		success:function(res){
			var token=res.token;
			if(token){
				$(o).parent("i").find("u").html(token);
			}else{
				JAlert(res.state);
			}
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
</script>
</body>
</html>