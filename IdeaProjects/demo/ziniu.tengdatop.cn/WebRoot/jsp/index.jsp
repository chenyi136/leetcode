<%@ page language="java" import="
java.util.List,
java.util.Map,
com.ziniu.crux.Global,
com.ziniu.entity.core.Summary,
com.ziniu.pojo.AnalyzeInfo,
com.ziniu.pojo.SummaryLine,
com.ziniu.pojo.SummaryPie,
com.ziniu.tool.JsonTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, Long> header = (Map<String, Long>) request.getAttribute("header");
@SuppressWarnings("unchecked")
Map<String, String> select = (Map<String, String>) request.getAttribute("select");
@SuppressWarnings("unchecked")
List<String[]> table_engine_time = (List<String[]>) request.getAttribute("table_engine_time");
@SuppressWarnings("unchecked")
Map<String, SummaryPie> pie_engine_time = (Map<String, SummaryPie>) request.getAttribute("pie_engine_time");
@SuppressWarnings("unchecked")
Map<Integer, String[]> table_media_time = (Map<Integer, String[]>) request.getAttribute("table_media_time");
@SuppressWarnings("unchecked")
Map<String, SummaryPie> pie_media_time = (Map<String, SummaryPie>) request.getAttribute("pie_media_time");
@SuppressWarnings("unchecked")
List<String> table_media_total = (List<String>) request.getAttribute("table_media_total");
SummaryLine line_engine_day = (SummaryLine) request.getAttribute("line_engine_day");
SummaryLine line_media_day = (SummaryLine) request.getAttribute("line_media_day");
@SuppressWarnings("unchecked")
List<AnalyzeInfo> table_analyze_newly = (List<AnalyzeInfo>) request.getAttribute("table_analyze_newly");
@SuppressWarnings("unchecked")
List<Summary> table_spirit_positive = (List<Summary>) request.getAttribute("table_spirit_positive");
@SuppressWarnings("unchecked")
List<Summary> table_spirit_negative = (List<Summary>) request.getAttribute("table_spirit_negative");
%>
<%!
public String get(Map<String, Long> data, String key) {
	Object res = data.get(key);
	if (res != null) {
		return res.toString();
	}
	return "0";
}
public String engine(String id, String type, String opt, boolean total, Map<String, String> select) {
	StringBuffer res = new StringBuffer();
	res.append("<select class=\"public_select\"" + (id != null ? " id=\"" + id + "\"" : "") + " name=\"engine\" onchange=\"JSummaryList(this,'" + type + "',null," +opt + ")\">");
	if (total) {
		res.append("<option value=\"-1\">不限</option>");
	}
	for (Map.Entry<String, String> temp : select.entrySet()) {
		res.append("<option value=\"" + temp.getKey() + "\">" + temp.getValue() + "</option>");
	}
	res.append("</select>");
	return res.toString();
}
public String time(String id, String type, String opt) {
	StringBuffer res = new StringBuffer();
	res.append("<select class=\"public_select\"" + (id != null ? " id=\"" + id + "\"" : "") + " name=\"time\" onchange=\"JSummaryList(this,'" + type + "',null," + opt + ")\">");
	res.append("<option value=\"time+001\">最近&nbsp;&nbsp;1天</option>");
	res.append("<option value=\"time+007\">最近&nbsp;&nbsp;7天</option>");
	res.append("<option value=\"time+015\">最近&nbsp;15天</option>");
	res.append("<option value=\"time+030\">最近&nbsp;30天</option>");
	res.append("<option value=\"time+090\">最近&nbsp;90天</option>");
	res.append("<option value=\"time+180\">最近180天</option>");
	res.append("<option value=\"time+360\">最近360天</option>");
	res.append("</select>");
	return res.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>舆情概览 - ${SITE}</title>
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
					<div class="col-md-5">
						<div class="general_view_wrap">
							<div class="branches">
								<div class="left"><img src="_/images/general_view_wrap_icon1.png" class="vm"></div>
								<div class="left ml10"><span>舆情总量（条）</span></div>
								<div class="right"><%=get(header, "global+0-total+000")%></div>
							</div>
							<div class="statistics_box">
								<div class="title">
									<span>按来源类型占比图</span>
									<%=time(null, "index_pie_engine_time", "opt1") %>
								</div>
								<div class="table-responsive">
									<table class="table mb30">
										<thead>
											<tr>
												<th>&nbsp;</th>
												<th>1天</th>
												<th>7天</th>
												<th>15天</th>
												<th>30天</th>
												<th>90天</th>
												<th>180天</th>
												<th>360天</th>
											</tr>
										</thead>
										<tbody>
										<%
											for (String[] data : table_engine_time) {
												out.print("<tr>");
												for (String temp : data) {
													out.print("<td>" + (temp != null ? temp : 0) + "</td>");
												}
												out.print("</tr>");
											}
										%>
										</tbody>
									</table>
								</div>
								<div style="width:100%;height:450px;" id="index_pie_engine_time"></div>
							</div>
							<div class="statistics_box">
								<div class="title clear">
									<div class="left">
										<span>按来源媒体占比图</span>
										<%=engine("index_table_media_time_1", "index_table_media_time", "opt1", false, select)%>
										<%=time("index_pie_media_time_1", "index_pie_media_time", "opt1")%>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table mb30">
										<thead>
											<tr>
												<th>&nbsp;</th>
												<th>1天</th>
												<th>7天</th>
												<th>15天</th>
												<th>30天</th>
												<th>90天</th>
												<th>180天</th>
												<th>360天</th>
											</tr>
										</thead>
										<tbody id="index_table_media_time">
										<%
											for (String[] data : table_media_time.values()) {
												out.print("<tr>");
												for (String temp : data) {
													out.print("<td>" + (temp != null ? temp : 0) + "</td>");
												}
												out.print("</tr>");
											}
										%>
										</tbody>
									</table>
								</div>
								<div style="width:100%;height:450px;" id="index_pie_media_time"></div>
							</div>
							<div class="statistics_box">
								<div class="title clear">
									<div class="left">
										<span>按正面评价排名</span>
										<%=engine(null, "index_table_media_total", null, true, select)%>
									</div>
								</div>
								<div class="ranking" id="index_table_media_total">
								<%
									String[] color = new String[] { "btn-warning", "btn-success", "btn-danger", "btn-default" };
									for (int i = 0; i < table_media_total.size(); i++) {
										out.print("<div class=\"lists clear\">");
										out.print("<div class=\"left\">" + table_media_total.get(i) + "</div>");
										out.print("<div class=\"right\"><span class=\"btn " + (i < 3 ? color[i] : color[3]) + "\">No." + (i + 1) + "</span></div>");
										out.print("</div>");
									}
								%>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-7">
						<div class="general_view_wrap">
							<div class="clear">
								<div style="width:50%;float:left;" class="branches">
									<div class="left"><img src="_/images/general_view_wrap_icon2.png" class="vm"></div>
									<div class="left ml10"><span>舆情新增（条）</span></div>
									<div class="right"><%=get(header, "global+0-newly+000")%></div>
								</div>
								<div style="width:50%;float:left;" class="branches">
									<div class="left"><img src="_/images/general_view_wrap_icon3.png" class="vm"></div>
									<div class="left ml10"><span>负面新增（条）</span></div>
									<div class="right"><%=get(header, "global+0-negative+000")%></div>
								</div>
							</div>
							<div class="volume_box">
								<div class="clear title"><div class="left"><span>按来源类型走势图</span></div></div>
								<div style="width:100%;height:445px;" id="index_line_engine_day"></div>
							</div>
							<div class="volume_box">
								<div class="clear title">
									<div class="left">
										<span>按来源媒体走势图</span>
										<%=engine(null, "index_line_media_day", "opt2", false, select)%>
									</div>
								</div>
								<div style="width:100%;height:445px;" id="index_line_media_day"></div>
							</div>
							<div class="message_box clear">
								<div style="width:100%" class="matter">
									<div class="handle clear"><div class="left"><span>最新舆情分析</span></div></div>
									<dl>
									<%
										for (AnalyzeInfo data : table_analyze_newly) {
											out.print("<dt>");
											out.print("<ins>");
											out.print("<div class=\"clear\">");
											if (data.trend.equals("ZHENGMIAN")) {
												out.print("<div class=\"left\"><span class=\"btn btn-warning\">" + Global.HYPER_ANALYZE_TREND.get(data.trend) + "</span></div>");
											} else if (data.trend.equals("ZHONGLI")) {
												out.print("<div class=\"left\"><span class=\"btn btn-success\">" + Global.HYPER_ANALYZE_TREND.get(data.trend) + "</span></div>");
											} else if (data.trend.equals("FUMIAN")) {
												out.print("<div class=\"left\"><span class=\"btn btn-danger\">" + Global.HYPER_ANALYZE_TREND.get(data.trend) + "</span></div>");
											}
											out.print("<div class=\"right\"><span class=\"btn btn-info\">来源：" + data.media + " 关键字：" + data.keyword + "</span></div>");
											out.print("</div>");
											out.print("<div class=\"clear\">");
											out.print("<div class=\"title\" title=\"" + data.title.replace("\"", "“") + "\">" + data.title.substring(0, Math.min(40, data.title.length())) + "</div>");
											out.print("<div class=\"time\">" + data.created + "</div>");
											out.print("</div>");
											out.print("</ins>");
											out.print("</dt>");
										}
									%>
									</dl>
								</div>
							</div>
							<div class="source_box clear">
								<div style="width:50%;" class="vocabulary_box">
									<div style="margin-left:0;" class="info">
										<div class="title">高频正面词汇</div>
										<div class="lexicon">
										<%
											for (Summary data : table_spirit_positive) {
												String temp = Global.HYPER_SPIRIT_POSITIVE.get(data.getFkSpirit());
												if (temp != null) {
													out.print("<span class=\"btn btn-warning\">" + temp + "</span>");
												}
											}
										%>
										</div>
									</div>
								</div>
								<div style="width:50%;" class="vocabulary_box">
									<div class="info">
										<div class="title">高频负面词汇</div>
										<div class="lexicon">
										<%
											for (Summary data : table_spirit_negative) {
												String temp = Global.HYPER_SPIRIT_NEGATIVE.get(data.getFkSpirit());
												if (temp != null) {
													out.print("<span class=\"btn btn-danger\">" + temp + "</span>");
												}
											}
										%>
										</div>
									</div>
								</div>
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
var opt1={
	legend:{data:[],orient:"vertical",right:20,top:100},
	title:{},
	tooltip:{formatter:"{a} <br>{b}：{c} ({d}%)",trigger:"item"},
	series:[{center:["50%","60%"],data:[{name:"",value:0}],itemStyle:{emphasis:{shadowBlur:10,shadowColor:"rgba(0,0,0,0.5)",shadowOffsetX:0}},name:"",radius:"73%",type:"pie"}]
};
var opt2={
	grid:{containLabel:true,bottom:"3%",left:"3%",right:"14%"},
	legend:{data:[],orient:"vertical",right:0,top:100},
	series:[{data:[],name:"",stack:"",type:"line"}],
	title:{text:""},
	toolbox:{},
	tooltip:{trigger:"axis"},
	xAxis:{boundaryGap:false,data:[],type:"category"},
	yAxis:{type:"value"}
};
$(document).ready(function(){
	opt1.legend.data=<%=JsonTool.write(pie_engine_time.keySet())%>;
	opt1.series[0].name="按来源类型占比图";
	opt1.series[0].data=<%=JsonTool.write(pie_engine_time.values())%>;
	echarts.init(document.getElementById("index_pie_engine_time")).setOption(opt1);
	opt1.series[0].name="按来源媒体占比图";
	opt1.legend.data=<%=JsonTool.write(pie_media_time.keySet())%>;
	opt1.series[0].data=<%=JsonTool.write(pie_media_time.values())%>;
	echarts.init(document.getElementById("index_pie_media_time")).setOption(opt1);
	opt2.legend.data=<%=JsonTool.write(line_engine_day.series.keySet())%>;
	opt2.series=<%=JsonTool.write(line_engine_day.series.values())%>;
	opt2.xAxis.data=<%=JsonTool.write(line_engine_day.xAxis)%>;
	echarts.init(document.getElementById("index_line_engine_day")).setOption(opt2);
	opt2.legend.data=<%=JsonTool.write(line_media_day.series.keySet())%>;
	opt2.series=<%=JsonTool.write(line_media_day.series.values())%>;
	opt2.xAxis.data=<%=JsonTool.write(line_media_day.xAxis)%>;
	echarts.init(document.getElementById("index_line_media_day")).setOption(opt2);
});
</script>
</body>
</html>