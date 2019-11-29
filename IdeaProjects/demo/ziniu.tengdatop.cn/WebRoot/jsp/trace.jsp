<%@ page language="java" import="
java.util.HashMap,
java.util.Map,
java.util.List,
com.ziniu.crux.Global,
com.ziniu.entity.core.Analyze,
com.ziniu.entity.core.Hyper,
com.ziniu.entity.core.Keyword,
com.ziniu.entity.core.Media,
com.ziniu.entity.core.Trace,
com.ziniu.template.HyperHelper" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Analyze analyze = (Analyze) request.getAttribute("analyze");
Hyper hyper = (Hyper) request.getAttribute("hyper");
Keyword keyword = (Keyword) request.getAttribute("keyword");
@SuppressWarnings("unchecked")
List<Trace> datas = (List<Trace>) request.getAttribute("datas");
%>
<!DOCTYPE html>
<html>
<head>
	<title>舆情追踪 - ${SITE}</title>
	<%@ include file="/jsp/_/meta.jsp"%>
</head>
<body>
<jsp:include page="/jsp/_/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/menu.htm"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default report_search_box">
							<div class="panel-body clear">
								<div style="width:50%;" class="left"><span>关键字：<%=keyword.getName() + (analyze.getTrace() ? "" : "（注：不在追踪此文）")%></span></div>
								<div style="width:50%;text-align:right;" class="left">
									<a class="btn btn-default" lang="<%=analyze.getStore() ? 0 : 1%>" onclick="JTraceStore(this,'<%=analyze.getId()%>')"><%=analyze.getStore() ? "移除收藏" : "加入收藏"%></a>
									<%=analyze.getTrace() ? "<a class=\"btn btn-default\" onclick=\"JTraceStore(this)\">停止追踪</a>" : ""%>
									<a href="<%=hyper.getAddress()%>" class="btn btn-info" target="_blank">查看原文</a>
								</div>
							</div>
						</div>
						<div class="early_warning_wrap">
							<table style="margin:0;padding:0;width:100%;border:0;">
								<thead>
									<tr>
										<th>媒体类型</th>
										<th>来源媒体</th>
										<th>原文标题</th>
										<th>在第几页</th>
										<th>在第几个</th>
										<th>搜索引擎</th>
										<th>情感判定</th>
										<th>发布时间</th>
										<th>抓取时间</th>
									</tr>
								</thead>
								<tbody>
								<%
									Map<String, String> color = new HashMap<String, String>();
									color.put("ZHENGMIAN", "btn-warning");
									color.put("ZHONGLI", "btn-success");
									color.put("FUMIAN", "btn-danger");
									color.put("WUXIAO", "btn-default");
									for (Trace data : datas) {
										Media media = Global.HYPER_MEDIA_ENGINE.get(data.getFkMedia());
										if (media == null) {
											continue;
										}
										out.print("<tr>");
										out.print("<td>" + Global.HYPER_MEDIA_TYPE.get(media.getEngine()) + "</td>");
										out.print("<td>" + media.getName() + "</td>");
										out.print("<td>" + data.getTitle() + "</td>");
										out.print("<td>" + data.getCoords() + "</td>");
										out.print("<td>" + data.getPlace() + "</td>");
										out.print("<td>" + (data.getBlend() ? "是" : "否") + "</td>");
										out.print("<td><span class=\"btn " + color.get(data.getTrend()) + "\">" + Global.HYPER_ANALYZE_TREND.get(data.getTrend()) + "</span></td>");
										out.print("<td>" + (data.getScreen() != null ? HyperHelper.time(data.getScreen(), null) : "-") + "</td>");
										out.print("<td>" + HyperHelper.time(data.getCreated(), null) + "</td>");
										out.print("</tr>");
									}
								%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/_/copy.jsp"/>
		</div>
	</div>
</section>
<script type="text/javascript">
function trace(o){
	if(!window.confirm("一旦停止追踪设置成功后就不可撤回，你确认要执行吗")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}trace/affirm.htm",
		data:{id:"<%=analyze.getId()%>"},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(state);
				return;
			}
			$(o).remove();
		},
		error:function(){
			window.alert("请求失败！请稍后重试");
		}
	});
}
</script>
</body>
</html>