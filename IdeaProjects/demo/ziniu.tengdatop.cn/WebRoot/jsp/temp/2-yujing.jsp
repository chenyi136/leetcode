<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>预警</title>
	<%@ include file="/jsp/meta.jsp"%>
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/jsp/menu.jsp"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default report_search_box">
							<div class="panel-body clear">
								<div style="width:20%;" class="left">
									<span>敏感信息列表</span>
									<select class="public_select">
										<option>搜索引擎</option>
									</select>
								</div>
								<div style="width:50%;text-align:center;" class="left">
									<span>每页显示</span>
									<select class="public_select">
										<option value="10">10条</option>
										<option value="20">20条</option>
									</select>
									<span style="margin-left:10px;">1/10页|共15条</span>
									<span class="sort_box">
										<input type="text" class="public_input" placeholder="22">
										<button>go</button>
									</span>
								</div>
							</div>
							<div class="report_paging_box">
								<a href="#" style="border-radius:3px 0 0 3px;"><img src="comm/images/left.png" style="width:10px;"></a>
								<a href="#" style="border-radius:0 3px 3px 0;" class="hover"><img src="comm/images/right.png" style="width:10px;"></a>
							</div>
						</div>
						<div class="early_warning_wrap">
							<table style="margin:0;padding:0;width:100%;border:0;">
								<tr>
									<th style="width:10%;">关键词</th>
									<th>标题</th>
									<th style="width:7%;">媒体来源</th>
									<th style="width:7%;">媒体渠道</th>
									<th style="width:6%;">在第几页</th>
									<th style="width:6%;">在第几个</th>
									<th style="width:6%;">链接</th>
									<th style="width:6%;">情感度</th>
									<th style="width:10%;">发布时间</th>
									<th style="width:6%;">作者</th>
									<th style="width:6%;">删除</th>
									<th style="width:16%;">7日声量</th>
								</tr>
								<tr>
									<td>深圳怡康医院黑不黑</td>
									<td class="title">【曝光】长沙长江医院怎么...</td>
									<td>百度PC</td>
									<td>天涯资讯</td>
									<td>122</td>
									<td>3</td>
									<td><a href="#" class="btn btn-warning">查看</a></td>
									<td>敏感</td>
									<td>2017-12-02</td>
									<td>admin</td>
									<td><a href="#" class="delete">删除</a></td>
									<td style="padding:0;"><div style="width:100%;height:60px;" id="bar_1"></div></td>
								</tr>
								<tr>
									<td>深圳怡康医院黑不黑</td>
									<td class="title">【曝光】长沙长江医院怎么...</td>
									<td>百度PC</td>
									<td>天涯资讯</td>
									<td>122</td>
									<td>3</td>
									<td><a href="#" class="btn btn-warning">查看</a></td>
									<td>敏感</td>
									<td>2017-12-02</td>
									<td>admin</td>
									<td><a href="#" class="delete">删除</a></td>
									<td style="padding:0;"><div style="width:100%;height:60px;" id="bar_2"></div></td>
								</tr>
								<tr>
									<td>深圳怡康医院黑不黑</td>
									<td class="title">【曝光】长沙长江医院怎么...</td>
									<td>百度PC</td>
									<td>天涯资讯</td>
									<td>122</td>
									<td>3</td>
									<td><a href="#" class="btn btn-warning">查看</a></td>
									<td>敏感</td>
									<td>2017-12-02</td>
									<td>admin</td>
									<td><a href="#" class="delete">删除</a></td>
									<td style="padding:0;"><div style="width:100%;height:60px;" id="bar_3"></div></td>
								</tr>
								<tr>
									<td>深圳怡康医院黑不黑</td>
									<td class="title">【曝光】长沙长江医院怎么...</td>
									<td>百度PC</td>
									<td>天涯资讯</td>
									<td>122</td>
									<td>3</td>
									<td><a href="#" class="btn btn-warning">查看</a></td>
									<td>敏感</td>
									<td>2017-12-02</td>
									<td>admin</td>
									<td><a href="#" class="delete">删除</a></td>
									<td style="padding:0;"><div style="width:100%;height:60px;" id="bar_4"></div></td>
								</tr>
								<tr>
									<td>深圳怡康医院黑不黑</td>
									<td class="title">【曝光】长沙长江医院怎么...</td>
									<td>百度PC</td>
									<td>天涯资讯</td>
									<td>122</td>
									<td>3</td>
									<td><a href="#" class="btn btn-warning">查看</a></td>
									<td>敏感</td>
									<td>2017-12-02</td>
									<td>admin</td>
									<td><a href="#" class="delete">删除</a></td>
									<td style="padding:0;"><div style="width:100%;height:60px;" id="bar_5"></div></td>
								</tr>
								<tr>
									<td>深圳怡康医院黑不黑</td>
									<td class="title">【曝光】长沙长江医院怎么...</td>
									<td>百度PC</td>
									<td>天涯资讯</td>
									<td>122</td>
									<td>3</td>
									<td><a href="#" class="btn btn-warning">查看</a></td>
									<td>敏感</td>
									<td>2017-12-02</td>
									<td>admin</td>
									<td><a href="#" class="delete">删除</a></td>
									<td style="padding:0;"><div style="width:100%;height:60px;" id="bar_6"></div></td>
								</tr>
								<tr>
									<td>深圳怡康医院黑不黑</td>
									<td class="title">【曝光】长沙长江医院怎么...</td>
									<td>百度PC</td>
									<td>天涯资讯</td>
									<td>122</td>
									<td>3</td>
									<td><a href="#" class="btn btn-warning">查看</a></td>
									<td>敏感</td>
									<td>2017-12-02</td>
									<td>admin</td>
									<td><a href="#" class="delete">删除</a></td>
									<td style="padding:0;"><div style="width:100%;height:60px;" id="bar_7"></div></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/copy.jsp"/>
		</div>
	</div>
</section>
<jsp:include page="/jsp/footer.jsp"/>
<script type="text/javascript">
echarts.init(document.getElementById("bar_1")).setOption({
	grid:{left:"-25px",right:"5px",bottom:"-25px",top:"0%",containLabel:true},
	xAxis:[{show:false,boundaryGap:false,data:["","","","","","",""]}],
	yAxis:[{show:false}],
	series:[{type:"line",areaStyle:{normal:{}},data:[120,132,101,134,90,230,210]}]
});
echarts.init(document.getElementById("bar_2")).setOption({
	grid:{left:"-25px",right:"5px",bottom:"-25px",top:"0%",containLabel:true},
	xAxis:[{show:false,boundaryGap:false,data:["","","","","","",""]}],
	yAxis:[{show:false}],
	series:[{type:"line",areaStyle:{normal:{}},data:[120,132,101,134,90,230,210]}]
});
echarts.init(document.getElementById("bar_3")).setOption({
	grid:{left:"-25px",right:"5px",bottom:"-25px",top:"0%",containLabel:true},
	xAxis:[{show:false,boundaryGap:false,data:["","","","","","",""]}],
	yAxis:[{show:false}],
	series:[{type:"line",areaStyle:{normal:{}},data:[120,132,101,134,90,230,210]}]
});
echarts.init(document.getElementById("bar_4")).setOption({
	grid:{left:"-25px",right:"5px",bottom:"-25px",top:"0%",containLabel:true},
	xAxis:[{show:false,boundaryGap:false,data:["","","","","","",""]}],
	yAxis:[{show:false}],
	series:[{type:"line",areaStyle:{normal:{}},data:[120,132,101,134,90,230,210]}]
});
echarts.init(document.getElementById("bar_5")).setOption({
	grid:{left:"-25px",right:"5px",bottom:"-25px",top:"0%",containLabel:true},
	xAxis:[{show:false,boundaryGap:false,data:["","","","","","",""]}],
	yAxis:[{show:false}],
	series:[{type:"line",areaStyle:{normal:{}},data:[120,132,101,134,90,230,210]}]
});
echarts.init(document.getElementById("bar_6")).setOption({
	grid:{left:"-25px",right:"5px",bottom:"-25px",top:"0%",containLabel:true},
	xAxis:[{show:false,boundaryGap:false,data:["","","","","","",""]}],
	yAxis:[{show:false}],
	series:[{type:"line",areaStyle:{normal:{}},data:[120,132,101,134,90,230,210]}]
});
echarts.init(document.getElementById("bar_7")).setOption({
	grid:{left:"-25px",right:"5px",bottom:"-25px",top:"0%",containLabel:true},
	xAxis:[{show:false,boundaryGap:false,data:["","","","","","",""]}],
	yAxis:[{show:false}],
	series:[{type:"line",areaStyle:{normal:{}},data:[120,132,101,134,90,230,210]}]
});
jQuery(document).ready(function(){
	jQuery(".datepicker").datepicker();
});
</script>
</body>
</html>