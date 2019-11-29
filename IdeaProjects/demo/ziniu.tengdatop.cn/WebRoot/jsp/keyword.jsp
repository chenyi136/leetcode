<%@ page language="java" import="
java.util.Map,
java.util.List,
com.ziniu.entity.core.Keyword,
com.ziniu.pojo.SummaryLine,
com.ziniu.pojo.SummaryPie,
com.ziniu.tool.JsonTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Keyword keyword = (Keyword) request.getAttribute("keyword");
@SuppressWarnings("unchecked")
Map<String, SummaryPie> pie_keyword_trend = (Map<String, SummaryPie>) request.getAttribute("pie_keyword_trend");
SummaryLine line_keyword_day = (SummaryLine) request.getAttribute("line_keyword_day");
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
%>
<%!
public String engine(String id, String type, Integer keyword, String opt, Map<String, String> select) {
	StringBuffer res = new StringBuffer();
	res.append("<select class=\"public_select\"" + (id != null ? " id=\"" + id + "\"" : "") + " name=\"engine\" onchange=\"JSummaryList(this,'" + type + "'," + keyword + "," + opt + ")\">");
	for (Map.Entry<String, String> temp : select.entrySet()) {
		res.append("<option value=\"" + temp.getKey() + "\">" + temp.getValue() + "</option>");
	}
	res.append("</select>");
	return res.toString();
}
public String time(String id, String type, Integer keyword, String opt) {
	StringBuffer res = new StringBuffer();
	res.append("<select class=\"public_select\"" + (id != null ? " id=\"" + id + "\"" : "") + " name=\"time\" onchange=\"JSummaryList(this,'" + type + "'," + keyword + "," + opt + ")\">");
	res.append("<option value=\"time+001\">最近&nbsp;&nbsp;1天</option>");
	res.append("<option value=\"time+007\">最近&nbsp;&nbsp;7天</option>");
	res.append("<option value=\"time+015\">最近&nbsp;15天</option>");
	res.append("<option value=\"time+030\">最近&nbsp;30天</option>");
	res.append("<option value=\"time+090\">最近&nbsp;90天</option>");
	res.append("</select>");
	return res.toString();
}
%>
<!DOCTYPE html>
<html>
<head>
	<title>词语分析 - ${SITE}</title>
	<%@ include file="/jsp/_/meta.jsp"%>
<style type="text/css">
.keyword_analysis_wrap .statistics_box .data_box table tr th{border-top:none;}
</style>
</head>
<body>
<jsp:include page="/jsp/_/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/menu.htm"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="row">
					<jsp:include page="/program/list.htm"/>
					<div class="col-md-9">
						<div class="keyword_analysis_wrap">
							<div class="line_chart clear">
								<div style="width:35%;" class="left">
									<div style="margin-top:20px;" class="fz16 c333 pb10 ml10"><span class="ml10">词语分析：<%=keyword.getName()%></span></div>
									<div style="width:100%;height:280px;" id="pie_keyword_trend"></div>
								</div>
								<div style="width:65%;height:320px;" class="right" id="line_keyword_day"></div>
							</div>
							<div class="statistics_box">
								<div style="min-height:594px;" class="row">
									<div class="col-md-6">
										<div class="data_box">
											<div class="caption">按来源类型汇总表</div>
											<table style="margin:0;padding:0;width:100%;border:0;">
												<thead>
													<tr>
														<th>&nbsp;</th>
														<th>1天</th>
														<th>7天</th>
														<th>15天</th>
														<th>30天</th>
														<th>90天</th>
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
									</div>
									<div class="col-md-6">
										<div class="sector_box">
											<div class="caption">
												<span>按来源类型占比图</span>
												<%=time(null, "pie_engine_time", keyword.getId(), "opt2")%>
											</div>
											<div style="width:100%;height:450px;" id="pie_engine_time"></div>
										</div>
									</div>
								</div>
							</div>
							<div class="statistics_box">
								<div style="min-height:594px;" class="row">
									<div class="col-md-6">
										<div class="data_box">
											<div class="caption">
												<span>按来源媒体汇总表</span>
												<%=engine(null, "table_media_time", keyword.getId(), null, select)%>
											</div>
											<table style="margin:0;padding:0;width:100%;border:0;">
												<thead>
													<tr>
														<th>&nbsp;</th>
														<th>1天</th>
														<th>7天</th>
														<th>15天</th>
														<th>30天</th>
														<th>90天</th>
													</tr>
												</thead>
												<tbody id="table_media_time">
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
									</div>
									<div class="col-md-6">
										<div class="sector_box">
											<div class="caption">
												<span>按来源媒体占比图</span>
												<%=engine("pie_media_time_1", "pie_media_time", keyword.getId(), "opt2", select)%>
												<%=time("pie_media_time_2", "pie_media_time", keyword.getId(), "opt2") %>
											</div>
											<div style="width:100%;height:450px;" id="pie_media_time"></div>
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
	legend:{data:[],orient:"vertical",right:10,top:200},
	title:{},
	tooltip:{formatter:"{a} <br>{b}:{c} ({d}%)",trigger:"item"},
	series:[{center:["50%","50%"],data:[{name:"",value:0}],itemStyle:{emphasis:{shadowBlur:10,shadowOffsetX:0,shadowColor:"rgba(0,0,0,0.5)"}},name:"",radius:"80%",type:"pie"}]
};
var opt2={
	legend:{data:[],orient:"vertical",right:0,top:100},
	title:{},
	tooltip:{formatter:"{a} <br>{b}:{c} ({d}%)",trigger:"item"},
	series:[{center:["40%","60%"],data:[{name:"",value:0}],itemStyle:{emphasis:{shadowBlur:10,shadowOffsetX:0,shadowColor:"rgba(0,0,0,0.5)"}},name:"",radius:"73%",type:"pie"}]
};
var opt3={
	grid:{containLabel:true,bottom:"3%",left:"10%",right:"3%"},
	legend:{data:[],left:0,orient:"vertical",top:100},
	series:[{data:[],name:"",stack:"",type:"line"}],
	title:{text:""},
	toolbox:{},
	tooltip:{trigger:"axis"},
	xAxis:{boundaryGap:false,data:[],type:"category"},
	yAxis:{type:"value"}
};
$(document).ready(function(){
	opt1.series[0].name="按词语情感占比图";
	opt1.series[0].data=<%=JsonTool.write(pie_keyword_trend.values())%>;
	echarts.init(document.getElementById("pie_keyword_trend")).setOption(opt1);
	opt2.legend.data=<%=JsonTool.write(pie_engine_time.keySet())%>;
	opt2.series[0].name="按来源类型占比图";
	opt2.series[0].data=<%=JsonTool.write(pie_engine_time.values())%>;
	echarts.init(document.getElementById("pie_engine_time")).setOption(opt2);
	opt2.legend.data=<%=JsonTool.write(pie_media_time.keySet())%>;
	opt2.series[0].name="按来源媒体占比图";
	opt2.series[0].data=<%=JsonTool.write(pie_media_time.values())%>;
	echarts.init(document.getElementById("pie_media_time")).setOption(opt2);
	opt3.legend.data=<%=JsonTool.write(line_keyword_day.series.keySet())%>;
	opt3.series=<%=JsonTool.write(line_keyword_day.series.values())%>;
	opt3.xAxis.data=<%=JsonTool.write(line_keyword_day.xAxis)%>;
	echarts.init(document.getElementById("line_keyword_day")).setOption(opt3);var id=<%=keyword.getId()%>;
	if(id){
		var o=$("#j_program input[value='"+id+"'][name='keyword']");
		if(o.length){
			var p=o.closest(".panel");
			o.click();
			p.find(".panel-body").slideDown(200);
			p.find(".panel-minimize").removeClass("maximize");
		}
	}
	$("#j_program input[name='keyword']").click(function(){
		location.href="${ROOT}keyword/"+$(this).val()+".htm";
	});
});
</script>
</body>
</html>