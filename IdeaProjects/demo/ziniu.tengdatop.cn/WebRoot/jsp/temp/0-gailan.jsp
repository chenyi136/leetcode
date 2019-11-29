<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>概览</title>
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
					<div class="col-md-4">
						<div class="general_view_wrap">
							<div class="branches">
								<div class="left"><img src="comm/images/general_view_wrap_icon1.png" class="vm"></div>
								<div class="left ml10"><span>舆情总量（条）</span></div>
								<div class="right">200</div>
							</div>
							<div class="statistics_box">
								<div class="title">来源类型统计</div>
								<div class="table-responsive">
									<table class="table mb30">
										<thead>
											<tr>
												<th></th>
												<th>今天</th>
												<th>昨天</th>
												<th>7天</th>
												<th>15天</th>
												<th>30天</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>搜索引擎</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>新闻</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>微博</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>论坛</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>微信</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>问答</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>博客</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>视频</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>APP</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>论坛</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="statistics_box">
								<div class="title clear">
									<div class="left">
										来源媒体统计
										<select class="public_select ml10">
											<option>搜索引擎</option>
										</select>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table mb30">
										<thead>
											<tr>
												<th></th>
												<th>今天</th>
												<th>昨天</th>
												<th>7天</th>
												<th>15天</th>
												<th>30天</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>百度PC</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>百度移动</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>搜狗PC</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>搜狗移动</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>神马</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>360PC</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
											<tr>
												<td>360移动</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
												<td>1000</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="statistics_box">
								<div class="title clear">
									<div class="left">
										正面评价排名
										<select class="public_select ml10">
											<option>搜索引擎</option>
										</select>
									</div>
								</div>
								<div class="ranking">
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-danger">No.1</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-warning">No.2</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-info">No.3</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-default">No.4</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-default">No.5</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-default">No.6</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-default">No.7</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-default">No.8</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-default">No.9</span></div>
									</div>
									<div class="lists clear">
										<div class="left">媒体友好度</div>
										<div class="right"><span class="btn btn-default">No.10</span></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="general_view_wrap">
							<div class="clear">
								<div style="width:50%;float:left;" class="branches">
									<div class="left"><img src="comm/images/general_view_wrap_icon2.png" class="vm"></div>
									<div class="left ml10"><span>舆情新增（条）</span></div>
									<div class="right">50</div>
								</div>
								<div style="width:50%;float:left;" class="branches">
									<div class="left"><img src="comm/images/general_view_wrap_icon3.png" class="vm"></div>
									<div class="left ml10"><span>负面新增（条）</span></div>
									<div class="right">20</div>
								</div>
							</div>
							<div class="message_box clear">
								<div class="matter">
									<div class="handle clear">
										<div class="left">
											<span>最新舆情</span>
											<select class="public_select ml10">
												<option>搜索引擎</option>
											</select>
										</div>
										<div class="right"><a href="#">更多&gt;&gt;</a></div>
									</div>
									<dl>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面111</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
									</dl>
								</div>
								<div class="matter">
									<div class="handle clear">
										<div class="left">
											<span>最新舆情</span>
											<select class="public_select ml10">
												<option>搜索引擎</option>
											</select>
										</div>
										<div class="right"><a href="#">更多&gt;&gt;</a></div>
									</div>
									<dl>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面2222</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div class="clear">
													<div class="left"><span class="btn btn-danger">负面</span></div>
													<div class="right"><span class="btn btn-info">来源：今日爆点</span></div>
												</div>
												<div class="clear">
													<div class="title">【曝光】长沙长江医院怎么样?员工揭内幕...</div>
													<div class="time">2017.08.23 17:15</div>
												</div>
											</ins>
										</dt>
									</dl>
								</div>
							</div>
							<div class="volume_box">
								<div class="clear title">
									<div class="left">
										<span>舆情走势图（最近7天）</span>
										<select class="public_select ml10">
											<option>搜索引擎</option>
										</select>
									</div>
								</div>
								<div style="width:100%;height:445px;" id="bar_1"></div>
							</div>
							<div class="source_box clear">
								<div class="pie_chart">
									<div class="handle">
										<span>来源占比图</span>
										<select class="public_select ml10">
											<option>搜索引擎</option>
										</select>
										<select class="public_select ml5">
											<option>今天</option>
											<option>昨天</option>
											<option>7天</option>
											<option>15天</option>
											<option>30天</option>
										</select>
									</div>
									<div style="width:100%;height:452px;" id="bar_2"></div>
								</div>
								<div class="vocabulary_box">
									<div class="info">
										<div class="title">负面高频词汇</div>
										<div class="lexicon">
											<span class="btn btn-default">很好</span>
											<span class="btn btn-default">黑医院</span>
											<span class="btn btn-default">很贵</span>
											<span class="btn btn-default">很好</span>
											<span class="btn btn-default">黑医院</span>
											<span class="btn btn-default">很贵</span>
											<span class="btn btn-default">很好</span>
											<span class="btn btn-default">黑医院</span>
											<span class="btn btn-default">很贵</span>
											<span class="btn btn-default">很好</span>
											<span class="btn btn-default">黑医院</span>
											<span class="btn btn-default">很贵</span>
										</div>
									</div>
								</div>
								<div class="vocabulary_box">
									<div class="info">
										<div class="title">正面高频词汇</div>
										<div class="lexicon">
											<span class="btn btn-warning">很好</span>
											<span class="btn btn-warning">性价比高</span>
											<span class="btn btn-warning">很好</span>
											<span class="btn btn-warning">性价比高</span>
											<span class="btn btn-warning">很好</span>
											<span class="btn btn-warning">性价比高</span>
											<span class="btn btn-warning">很好</span>
											<span class="btn btn-warning">性价比高</span>
											<span class="btn btn-warning">很好</span>
											<span class="btn btn-warning">性价比高</span>
											<span class="btn btn-warning">很好</span>
											<span class="btn btn-warning">很好</span>
										</div>
									</div>
								</div>
							</div>
							
							
							
							
							
							
							
							
							
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
var option1={
	title:{text:""},
	tooltip:{trigger:"axis"},
	legend:{
		data:["百度PC","百度移动","搜狗PC","搜狗移动","神马","360PC","360移动"],
		orient:"vertical",
		right:0,
		top:100
	},
	grid:{
		left:"3%",
		right:"14%",
		bottom:"3%",
		containLabel:true
	},
	toolbox:{},
	xAxis:{
		type:"category",
		boundaryGap:false,
		data:["0","1","2","3","4","5","6","7"]
	},
	yAxis:{type:"value"},
	series:[
		{
			name:"百度PC",
			type:"line",
			stack:"总量",
			data:[1200,1302,1001,1034,900,2030,2010,2010]
		},
		{
			name:"百度移动",
			type:"line",
			stack:"总量",
			data:[2020,1082,1910,2304,2900,3300,3010,2010]
		},
		{
			name:"搜狗PC",
			type:"line",
			stack:"总量",
			data:[1050,2320,2001,1504,1090,3030,4100,2010]
		},
		{
			name:"搜狗移动",
			type:"line",
			stack:"总量",
			data:[3200,3302,3001,3304,3900,3300,3020,2010]
		},
		{
			name:"神马",
			type:"line",
			stack:"总量",
			data:[8200,9302,9001,9340,1290,1330,1320,2010]
		},
		{
			name:"360PC",
			type:"line",
			stack:"总量",
			data:[8200,9302,9001,9340,1290,1330,1320,2010]
		},
		{
			name:"360移动",
			type:"line",
			stack:"总量",
			data:[8200,9302,9001,9340,1290,1330,1320,2010]
		}
	]
};
echarts.init(document.getElementById("bar_1")).setOption(option1);
var option2={
	title:{},
	tooltip:{
		trigger:"item",
		formatter:"{a} <br>{b}:{c} ({d}%)"
	},
	legend:{
		orient:"vertical",
		right:20,
		top:100,
		data:["百度PC","百度移动","搜狗PC","搜狗移动","神马","360PC","360移动"]
	},
	series:[
		{
			name:"访问来源",
			type:"pie",
			radius:"73%",
			center:["50%","60%"],
			data:[
				{value:335,name:"百度PC"},
				{value:310,name:"百度移动"},
				{value:234,name:"搜狗PC"},
				{value:135,name:"搜狗移动"},
				{value:1548,name:"神马"},
				{value:148,name:"360PC"},
				{value:1248,name:"360移动"}
			],
			itemStyle:{
				emphasis:{
					shadowBlur:10,
					shadowOffsetX:0,
					shadowColor:"rgba(0,0,0,0.5)"
				}
			}
		}
	]
};
echarts.init(document.getElementById("bar_2")).setOption(option2);
jQuery(document).ready(function(){
	jQuery(".datepicker").datepicker();
});
</script>
</body>
</html>