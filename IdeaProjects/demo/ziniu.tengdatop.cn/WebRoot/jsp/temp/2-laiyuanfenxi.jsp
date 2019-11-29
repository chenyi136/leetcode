<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>来源分析</title>
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
						<div class="stream_analysis_wrap">
							<div class="panel report_search_box">
								<div class="panel-body clear">
									<div class="left">
										<label class="vm">
											<input type="radio" class="vm" name="111" checked="checked">
											<span class="vm">今天</span>
										</label>
										<label class="vm">
											<input type="radio" class="vm" name="111">
											<span class="vm">昨天</span>
										</label>
										<label class="vm">
											<input type="radio" class="vm" name="111">
											<span class="vm">7天</span>
										</label>
										<label class="vm">
											<input type="radio" class="vm" name="111">
											<span class="vm">15天</span>
										</label>
										<label class="vm">
											<input type="radio" class="vm" name="111">
											<span class="vm">30天</span>
										</label>
										<input type="text" style="margin-left:50px;" class="datepicker public_input" placeholder="mm/dd/yyyy">
										<span>至</span>
										<input type="text" class="datepicker public_input" placeholder="mm/dd/yyyy">
									</div>
									<div class="right">
										<span>显示方案：</span>
										<select class="public_select ml5">
											<option>深圳怡康</option>
										</select>
										<!-- <select class="public_select ml5">
											<option>全部</option>
											<option>正面</option>
											<option>中立</option>
											<option>敏感</option>
										</select> -->
									</div>
								</div>
							</div>
							<div class="spaceallnum_mediumint">
								<table style="margin:0;padding:0;width:100%;border:0;">
									<tr>
										<th>搜索引擎</th>
										<th>新闻</th>
										<th>微博</th>
										<th>论坛</th>
										<th>问答</th>
										<th>微信</th>
										<th>博客</th>
									</tr>
									<tr>
										<td>1000</td>
										<td>1000</td>
										<td>1000</td>
										<td>1000</td>
										<td>1000</td>
										<td>1000</td>
										<td>1000</td>
									</tr>
								</table>
							</div>
							<div class="analyze_box">
								<div class="title">来源分析</div>
								<div style="width:100%;height:445px;" id="bar_1"></div>
							</div>
							<div class="examine_box">
								<table style="margin:0;padding:0;width:100%;border:0;">
									<tr>
										<th class="ta-l">
											<span>来源类型：</span>
											<select class="public_select ml5">
												<option>搜索引擎</option>
												<option>新闻</option>
											</select>
										</th>
										<th style="width:8%;">今天</th>
										<th style="width:8%;">昨天</th>
										<th style="width:8%;">7天</th>
										<th style="width:8%;">15天</th>
										<th style="width:8%;">30天</th>
										<th style="width:8%;">关键词数</th>
										<th style="width:8%;">正面总数</th>
										<th style="width:8%;">中立总数</th>
										<th style="width:8%;">负面总数</th>
										<th style="width:8%;">无效总数</th>
									</tr>
									<tr>
										<td class="c333 ta-l">全部</td>
										<td>306</td>
										<td>480</td>
										<td>520</td>
										<td>650</td>
										<td>890</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
										<td>50</td>
									</tr>
									<tr>
										<td class="c333 ta-l"><span class="c999">Top 1</span>（搜索引擎）百度PC</td>
										<td>100</td>
										<td>110</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
									</tr>
									<tr>
										<td class="c333 ta-l"><span class="c999">top1</span>（新闻）中国新闻网</td>
										<td>100</td>
										<td>110</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
									</tr>
									<tr>
										<td class="c333 ta-l"><span class="c999">top2</span>百度移动</td>
										<td>100</td>
										<td>110</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										
									</tr>
									<tr>
										<td class="c333 ta-l"><span class="c999">top3</span>搜狗PC</td>
										<td>100</td>
										<td>110</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
									</tr>
									<tr>
										<td class="c333 ta-l"><span class="c999">top4</span>搜狗移动</td>
										<td>100</td>
										<td>110</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
									</tr>
									<tr>
										<td class="c333 ta-l"><span class="c999">top5</span>神马</td>
										<td>100</td>
										<td>110</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
										<td>10</td>
									</tr>
								</table>
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
jQuery(document).ready(function(){
	jQuery(".datepicker").datepicker();
});
var option={
	title:{text:""},
	tooltip:{trigger:"axis"},
	legend:{
		data:["搜索引擎","新闻","微博","论坛","问答","微信","博客"],
		orient:"vertical",
		right:0,
		top:100
	},
	grid:{
		left:"3%",
		right:"10%",
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
			name:"搜索引擎",
			type:"line",
			stack:"总量",
			data:[1200,1302,1001,1034,900,2030,2010,2010]
		},
		{
			name:"新闻",
			type:"line",
			stack:"总量",
			data:[2020,1082,1910,2304,2900,3300,3010,2010]
		},
		{
			name:"微博",
			type:"line",
			stack:"总量",
			data:[1050,2320,2001,1504,1090,3030,4100,2010]
		},
		{
			name:"论坛",
			type:"line",
			stack:"总量",
			data:[3200,3302,3001,3304,3900,3300,3020,2010]
		},
		{
			name:"问答",
			type:"line",
			stack:"总量",
			data:[8200,9302,9001,9340,1290,1330,1320,2010]
		},
		{
			name:"微信",
			type:"line",
			stack:"总量",
			data:[8200,9302,9001,9340,1290,1330,1320,2010]
		},
		{
			name:"博客",
			type:"line",
			stack:"总量",
			data:[8200,9302,9001,9340,1290,1330,1320,2010]
		}
	]
};
echarts.init(document.getElementById("bar_1")).setOption(option);
</script>
</body>
</html>