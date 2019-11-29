<%@ page language="java" import="com.mc.core.entity.site.Daily" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Daily en = new Daily();%>
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
		<%=crumb(request, "daily/")%>
		<div class="am-g j_block" id="j_daily">
			<table class="am-table-striped am-table-hover">
				<thead>
					<tr class="am-primary">
						<th>日志名称</th>
						<th>请求方式</th>
						<th>来源标识</th>
						<th>来源页面</th>
						<th>影响条数</th>
						<th>执行毫秒</th>
						<th>创建时间</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
			<input type="hidden" value="['/']">
		</div>
		<%=Search.paging(false, false, null, new String[][] {
			{ en.getClass().getName(), "我的日志", en.setCreated(null).FrameFieldName, "1", null, "2" },
			{ "1", "1", en.setName(null).ClazzFieldName, en.setName(null).FrameFieldName, en.setName(null).getAlias(), null },
			{ "1", "4", en.setAddress(null).ClazzFieldName, en.setAddress(null).FrameFieldName, en.setAddress(null).getAlias(), "2-" + Global.ROOT + "{key}" },
			{ "0", "6", en.setArgs(null).ClazzFieldName, en.setArgs(null).FrameFieldName, en.setArgs(null).getAlias(), null },
			{ "1", "1", en.setType(null).ClazzFieldName, en.setType(null).FrameFieldName, en.setType(null).getAlias(), null },
			{ "1", "1", en.setTitle(null).ClazzFieldName, en.setTitle(null).FrameFieldName, en.setTitle(null).getAlias(), null },
			{ "1", "4", en.setRefer(null).ClazzFieldName, en.setRefer(null).FrameFieldName, en.setRefer(null).getAlias(), "2-" + Global.ROOT + "{key}" },
			{ "0", "1", en.setSize(null).ClazzFieldName, en.setSize(null).FrameFieldName, en.setSize(null).getAlias(), null },
			{ "1", "1", en.setTrack(null).ClazzFieldName, en.setTrack(null).FrameFieldName, en.setTrack(null).getAlias(), null },
			{ "0", "1", en.setForbid(null).ClazzFieldName, en.setForbid(null).FrameFieldName, en.setForbid(null).getAlias(), "4-boolean" },
			{ "1", "2", en.setCreated(null).ClazzFieldName, en.setCreated(null).FrameFieldName, en.setCreated(null).getAlias(), null },
		})%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	JDaily(null,null,20,1);
});
</script>
</body>
</html>