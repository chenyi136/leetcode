<%@ page language="java" import="
java.util.Map,
com.ziniu.crux.Global,
com.ziniu.entity.core.Media" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, Map<Integer, Media>> media = (Map<String, Map<Integer, Media>>) request.getAttribute("media");
%>
<div class="leftpanel">
	<ul class="nav nav-pills nav-stacked">
		<%if (media.size() < 1) {%><li><a href="program/load.htm"><i class="fa fa-home"></i>快速设置</a></li>
		<%} else {%>
		<li><a href="index.htm"><i class="fa fa-home"></i>舆情概览</a></li>
		<li class="parent">
			<a href="javascript:;"><i class="fa fa-suitcase"></i>实时舆情</a>
			<ul class="children">
			<%
				for (String key : media.keySet()) {
					String value = Global.HYPER_MEDIA_TYPE.get(key);
					if (value != null) {
						out.print("<li><a href=\"analyze/" + key.toLowerCase() + ".htm\">" + value + "</a></li>");
					}
				}
			%>
			</ul>
		</li>
		<li class="parent">
			<a href="javascript:;"><i class="fa fa-envelope-o"></i>舆情分析</a>
			<ul class="children">
				<li><a href="trace/index.htm">我的收藏</a></li>
				<li><a href="keyword/index.htm">词语分析</a></li>
				<li><a href="media/index.htm">来源分析</a></li>
			</ul>
		</li>
		<%}%>
		<li class="parent">
			<a href="javascript:;"><i class="fa fa-suitcase"></i>个人中心</a>
			<ul class="children">
				<li><a href="account/profile.htm">个人资料</a></li>
			</ul>
		</li>
	</ul>
</div>