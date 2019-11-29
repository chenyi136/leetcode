<%@ page language="java" import="
java.util.Map,
java.util.List,
com.ziniu.pojo.SummaryLine,
com.ziniu.tool.JsonTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, String[]> table_engine_total = (Map<String, String[]>) request.getAttribute("table_engine_total");
SummaryLine line_engine_day = (SummaryLine) request.getAttribute("line_engine_day");
@SuppressWarnings("unchecked")
List<String[]> table_media_total = (List<String[]>) request.getAttribute("table_media_total");
%>
<!DOCTYPE html>
<html>
<head>
	<title>来源分析 - ${SITE}</title>
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
						<div class="stream_analysis_wrap">
							<div class="spaceallnum_mediumint">
								<table style="margin:0;padding:0;width:100%;border:0;">
								<%
									StringBuffer head = new StringBuffer("<tr>");
									StringBuffer body = new StringBuffer("<tr>");
									for (Map.Entry<String, String[]> data : table_engine_total.entrySet()) {
										String[] value = data.getValue();
										head.append("<th>" + value[0] + "</th>");
										body.append("<td>" + value[1] + "</td>");
									}
									head.append("</tr>");
									body.append("</tr>");
									out.print(head.toString());
									out.print(body.toString());
								%>
								</table>
							</div>
							<div class="analyze_box">
								<div class="title">按来源类型走势图</div>
								<div style="width:100%;height:445px;" id="line_engine_day"></div>
							</div>
							<div class="examine_box">
								<table style="margin:0;padding:0;width:100%;border:0;">
									<thead>
										<tr>
											<th class="ta-l">
												<span>来源类型：</span>
												<select class="public_select ml5" name="engine" onchange="JSummaryList(this,'table_media_total')">
												<%
													for (Map.Entry<String, String[]> data : table_engine_total.entrySet()) {
														out.print("<option value=\"" + data.getKey() + "\">" + data.getValue()[0] + "</option>");
													}
												%>
												</select>
											</th>
											<th style="width:7%;">1天</th>
											<th style="width:7%;">7天</th>
											<th style="width:7%;">15天</th>
											<th style="width:7%;">30天</th>
											<th style="width:7%;">90天</th>
											<th style="width:7%;">180天</th>
											<th style="width:7%;">360天</th>
											<th style="width:7%;">正面</th>
											<th style="width:7%;">中立</th>
											<th style="width:7%;">负面</th>
											<th style="width:7%;">无效</th>
											<th style="width:7%;">总数</th>
										</tr>
									</thead>
									<tbody id="table_media_total">
									<%
										for (int i = 0; i < table_media_total.size(); i++) {
											String[] data = table_media_total.get(i);
											out.print("<tr>");
											out.print(i > 0 ? "<td class=\"c333 ta-l\"><span class=\"c999\">Top " + i + "</span> " + data[0] + "</td>" : "<td class=\"c333 ta-l\">" + data[0] + "</td>");
											for (int j = 1; j < data.length; j++) {
												out.print("<td>" + (data[j] != null ? data[j] : 0) + "</td>");
											}
											out.print("</tr>");
										}
									%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/_/copy.jsp"/>
		</div>
	</div>
</section>
<script type="text/javascript">
$(document).ready(function(){
	var opt={
		grid:{bottom:"3%",containLabel:true,left:"3%",right:"10%"},
		legend:{data:<%=JsonTool.write(line_engine_day.series.keySet())%>,orient:"vertical",right:0,top:100},
		series:<%=JsonTool.write(line_engine_day.series.values())%>,
		title:{text:""},
		toolbox:{},
		tooltip:{trigger:"axis"},
		xAxis:{boundaryGap:false,data:<%=JsonTool.write(line_engine_day.xAxis)%>,type:"category"},
		yAxis:{type:"value"}
	};
	echarts.init(document.getElementById("line_engine_day")).setOption(opt);
});
</script>
</body>
</html>