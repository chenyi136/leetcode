<%@ page language="java" import="
com.mc.core.entity.blog.Movie,
com.mc.portal.pojo.FigureItem" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, String> catena = (Map<String, String>) request.getAttribute("catena");
Movie pages = (Movie) request.getAttribute("pages");
pages.setAlias(pages.getAlias().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "));
pages.setDirect(parse(pages.getDirect()));
pages.setWriter(parse(pages.getWriter()));
pages.setActor(parse(pages.getActor()));
if (pages.getAlias().equals("[]")) {
	pages.doFieldValue(pages.setAlias(null).ClazzFieldName, null);
}
if (pages.getDirect().equals("[]")) {
	pages.doFieldValue(pages.setDirect(null).ClazzFieldName, null);
}
if (pages.getWriter().equals("[]")) {
	pages.doFieldValue(pages.setWriter(null).ClazzFieldName, null);
}
if (pages.getActor().equals("[]")) {
	pages.doFieldValue(pages.setActor(null).ClazzFieldName, null);
}
%>
<%!private String parse(String data) throws Exception {
	StringBuffer res = new StringBuffer();
	List<FigureItem> items = JsonTool.list(data, FigureItem.class);
	for (FigureItem item : items) {
		res.append(" / " + item.name);
	}
	return res.length() > 0 ? res.substring(3) : null;
}%>
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
		<form class="am-g am-form am-form-horizontal" action="blog/movie/save.htm" method="post" id="j_form">
			<div class="am-u-md-6">
				<%=Form.input(pages.setName(null), pages.getName())%>
				<%=Form.input(pages.setEnglish(null), pages.getEnglish().equals("-") ? null : pages.getEnglish())%>
				<%=Form.input(pages.setAlias(null).setField(null).setNote(pages.getAlias()), pages.getAlias())%>
				<%=Form.input(pages.setDirect(null).setField(null).setNote(pages.getDirect()), pages.getDirect())%>
				<%=Form.input(pages.setWriter(null).setField(null).setNote(pages.getWriter()), pages.getWriter())%>
				<%=Form.input(pages.setActor(null).setField(null).setNote(pages.getActor()), pages.getActor())%>
				<%=Form.input(pages.setStyle(null).setField(null).setNote(null), pages.getStyle().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "))%>
				<%=Form.input(pages.setZone(null).setField(null).setNote(null), pages.getZone().replace("[", "").replace("]", "").replace("\"", "").replace(",", " / "))%>
				<%=Form.time(pages.setScreen(null).setNote(null), pages.getScreen().equals("-") ? "2012-06-01" : pages.getScreen(), pages.setScreen(null).Note, null, null)%>
				<%=Form.input(pages.setWidth(null).setField(null), pages.getWidth())%>
				<%=Form.input(pages.setHeight(null).setField(null), pages.getHeight())%>
				<%=Form.input(pages.setTrack(null).setField(null), pages.getTrack())%>
				<%=Form.input(pages.setRate(null).setField(null), pages.getRate())%>
			</div>
			<div class="am-u-md-6">
				<%=Form.select(pages.setFkCatena(null).setAlias("所属系列"), pages.getFkCatena(), catena)%>
				<%=Form.input(pages.setAddress(null).setEmpty(true), pages.getAddress())%>
				<%=Form.input(pages.setImdb(null), "url", pages.getImdb().equals("-") ? null : (pages.getImdb().equals("javascript:;") ? "https://www.imdb.com/" : pages.getImdb()), null)%>
				<%=Form.input(pages.setDouban(null), "url", pages.getDouban().equals("-") ? null : (pages.getDouban().equals("javascript:;") ? "https://movie.douban.com/" : pages.getDouban()), null)%>
				<%=Form.input(pages.setScore(null).setLength(2), "number", pages.getScore(), null)%>
				<%=Form.input(pages.setMaoyan(null), "url", pages.getMaoyan().equals("-") ? null : (pages.getMaoyan().equals("javascript:;") ? "https://piaofang.maoyan.com/" : pages.getMaoyan()), null)%>
				<%=Form.input(pages.setJudge(null).setField(null), pages.getJudge())%>
				<%=Form.radio(pages.setTrash(null), new String[] { "是", "否" }, pages.getTrash() != null ? pages.getTrash() : false) %>
				<%=Form.textarea(pages.setBrief(null), 10, null, pages.getBrief().equals("-") ? null : pages.getBrief())%>
				<%=Form.button(request, pages.setId(null), pages.getId())%>
			</div>
		</form>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<script type="text/javascript" src="_/my/jform.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#j_form").submit(function(){
		var o=$("#j_form [name='<%=pages.setImdb(null).ClazzFieldName%>']");
		var v=o.val();
		if(v.indexOf("https://www.imdb.com/")==-1){
			o.focus();
			return false;
		}
		if(v=="https://www.imdb.com/"){
			o.val("javascript:;");
		}
		o=$("#j_form [name='<%=pages.setDouban(null).ClazzFieldName%>']");
		v=o.val();
		if(v.indexOf("https://movie.douban.com/")==-1&&v.indexOf("https://baike.baidu.com/")==-1){
			o.focus();
			return false;
		}
		o=$("#j_form [name='<%=pages.setMaoyan(null).ClazzFieldName%>']");
		var v=o.val();
		if(v.indexOf("https://piaofang.maoyan.com/")==-1){
			o.focus();
			return false;
		}
		if(v=="https://piaofang.maoyan.com/"){
			o.val("javascript:;");
		}
	});
});
</script>
</body>
</html>