<%@ page language="java" import="
com.ziniu.crux.Global,
com.ziniu.pojo.AnalyzePage,
com.ziniu.tool.JsonTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%AnalyzePage pages = (AnalyzePage) request.getAttribute("pages");%>
<!DOCTYPE html>
<html>
<head>
	<title>我的收藏 - ${SITE}</title>
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
						<div style="margin:0;" class="early_warning_wrap">
							<table style="margin:0;padding:0;width:100%;border:0;">
								<thead>
									<tr>
										<th>来源媒体</th>
										<th>原文标题</th>
										<th>关键字</th>
										<th>情感判定</th>
										<th>是否追踪</th>
										<th>发布时间</th>
										<th>抓取时间</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="list"></tbody>
							</table>
						</div>
						<div id="pagelink"><ul></ul></div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/_/copy.jsp"/>
		</div>
	</div>
</section>
<script type="text/javascript">
var color={"ZHENGMIAN":"btn-warning","ZHONGLI":"btn-success","FUMIAN":"btn-danger","WUXIAO":"btn-default"};
var trend=<%=JsonTool.write(Global.HYPER_ANALYZE_TREND)%>;
var pages=<%=JsonTool.write(pages)%>;
function page(coords,place){
	var html="";
	if(coords<8){
		for(var i=1;i<=coords;i++){
			html+=i==place?"<li class=\"thisclass\">"+i+"</li>":"<li><a href=\"javascript:search("+i+");\">"+i+"</a></li>";
		}
	}else{
		if(place>1){
			html+="<li><a href=\"javascript:search(1);\">首页</a></li>";
		}
		if(place<=3){
			for(var i=1;i<=5;i++){
				html+=i==place?"<li class=\"thisclass\">"+i+"</li>":"<li><a href=\"javascript:search("+i+");\">"+i+"</a></li>";
			}
			html+="<li>...</li>";
		}else if(place>=coords-2){
			html+="<li>...</li>";
			for(var i=coords-4;i<=coords;i++){
				html+=i==place?"<li class=\"thisclass\">"+i+"</li>":"<li><a href=\"javascript:search("+i+");\">"+i+"</a></li>";
			}
		}else{
			html+="<li>...</li>";
			for(var i=place-2;i<=place+2;i++){
				html+=i==place?"<li class=\"thisclass\">"+i+"</li>":"<li><a href=\"javascript:search("+i+");\">"+i+"</a></li>";
			}
			html+="<li>...</li>";
		}
		if(place<coords){
			html+="<li><a href=\"javascript:search("+coords+");\">尾页</a></li>";
		}
	}
	$("#pagelink ul").html(html);
}
function search(now){
	if(now&&pages.place==now){
		return;
	}
	pages.place=now?now:1;
	$.ajax({
		type:"post",
		url:"${ROOT}trace/index.htm",
		data:JSON.stringify(pages),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
		async:false,
		beforeSend:function(){
			$("#list").html("<tr><td colspan=\"8\">加载数据中...</td></tr>");
		},
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				$("#list").html("<tr><td colspan=\"8\">"+state+"</td></tr>");
				return;
			}
			var datas=res.datas;
			var html="";
			for(var i=0;i<datas.length;i++){
				var data=datas[i];
				html+="<tr>";
				html+="<td>"+data.media+"</td>";
				html+="<td>"+data.title+"</td>";
				html+="<td>"+data.keyword+"</td>";
				html+="<td><span class=\"btn "+color[data.trend]+" mr5\">"+trend[data.trend]+"</span></td>";
				html+="<td>"+(data.trace?"是":"否")+"</td>";
				html+="<td>"+data.screen+"</td>";
				html+="<td>"+data.created+"</td>";
				html+="<td><a class=\"btn btn-default\" onclick=\"JTraceStore(this,'"+data.id+"')\">移除收藏</a><a href=\"trace/"+data.id+".htm\" class=\"btn btn-info ml5\" target=\"_blank\">舆情追踪</a><a href=\""+data.address+"\" class=\"btn btn-info ml5\" target=\"_blank\">查看原文</a></td>";
				html+="</tr>";
			}
			$("#list").html(html);
			page(res.coords,res.place);
		},
		error:function(){
			$("#list").html("<tr><td colspan=\"8\">请求失败！请稍后重试</td></tr>");
		}
	});
}
$(document).ready(function(){
	search();
});
</script>
</body>
</html>