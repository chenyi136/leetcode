<%@ page language="java" import="
java.util.Map,
com.ziniu.crux.Global,
com.ziniu.entity.core.Media,
com.ziniu.pojo.AnalyzePage,
com.ziniu.tool.JsonTool" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, Media> media = (Map<Integer, Media>) request.getAttribute("media");
AnalyzePage pages = (AnalyzePage) request.getAttribute("pages");
String title = (String) request.getAttribute("title");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title%>.实时舆情 - ${SITE}</title>
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
					<jsp:include page="/program/list.htm"/>
					<div class="col-md-9" id="j_search">
						<div style="margin:0;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>时间范围：</span>
								<label class="vm">
									<input type="radio" class="vm" value="24" name="created">
									<span class="vm">24小时</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="48" name="created">
									<span class="vm">48小时</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="168" name="created">
									<span class="vm">7天</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="360" name="created">
									<span class="vm">15天</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="720" name="created">
									<span class="vm">30天</span>
								</label>
								<span style="margin-left:40px;">最近</span>
								<input type="text" style="width:80px;" class="public_input" maxlength="3" name="created">
								<span>小时</span>
							</div>
						</div>
						<div style="margin:0;border-top:none;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>排列方式：</span>
								<label>
									<input type="radio" class="vm" value="SCREEN_DESC" name="queue">
									<span class="vm">按发布时间降序</span>
								</label>
								<label>
									<input type="radio" class="vm" value="SCREEN_ASC" name="queue">
									<span class="vm">按发布时间升序</span>
								</label>
								<label>
									<input type="radio" class="vm" value="CREATED_DESC" name="queue">
									<span class="vm">按抓取时间降序</span>
								</label>
								<label>
									<input type="radio" class="vm" value="CREATED_ASC" name="queue">
									<span class="vm">按抓取时间升序</span>
								</label>
							</div>
						</div>
						<div style="margin:0;border-top:none;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>来源媒体：</span>
								<%
									for (Media data : media.values()) {
										out.print("<label>");
										out.print("<input type=\"checkbox\" class=\"vm\" value=\"" + data.getId() + "\" name=\"media\">");
										out.print("<span class=\"vm\">" + data.getName() + "</span>");
										out.print("</label>");
									}
								%>
							</div>
						</div>
						<div style="margin:0;border-top:none;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>情感判断：</span>
								<%
									for (Map.Entry<String, String> data : Global.HYPER_ANALYZE_TREND.entrySet()) {
										out.print("<label>");
										out.print("<input type=\"checkbox\" class=\"vm\" value=\"" + data.getKey() + "\" name=\"trend\">");
										out.print("<span class=\"vm\">" + data.getValue() + "</span>");
										out.print("</label>");
									}
								%>
							</div>
						</div>
						<div class="microblog_wrap">
							<div class="lists_box" id="list">
								<div class="handle">搜索结果</div>
								<div id="pagelink"><ul></ul></div>
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
var color={"ZHENGMIAN":"btn-warning","ZHONGLI":"btn-success","FUMIAN":"btn-danger","WUXIAO":"btn-default"};
var trend=<%=JsonTool.write(Global.HYPER_ANALYZE_TREND)%>;
var pages=<%=JsonTool.write(pages)%>;
function param(){
	pages.keyword=[];
	$.each($("#j_program [type='checkbox'][name='keyword']:checked"),function(){
		pages.keyword[pages.keyword.length]=$(this).val();
	});
	pages.created=$("#j_search [type='text'][name='created']").val();
	if(!pages.created){
		pages.created=$("#j_search [type='radio'][name='created']:checked").val();
	}
	pages.queue=$("#j_search [type='radio'][name='queue']:checked").val();
	pages.media=[];
	$.each($("#j_search [type='checkbox'][name='media']"),function(){
		var o=$(this);
		if(o.is(":checked")){
			pages.media[pages.media.length]=o.val();
		}
	});
	pages.trend=[];
	$.each($("#j_search [type='checkbox'][name='trend']"),function(){
		var o=$(this);
		if(o.is(":checked")){
			pages.trend[pages.trend.length]=o.val();
		}
	});
}
function affirm(id,value){
	if(!window.confirm(value?"一旦无效判断设置成功后就不可撤回，你确认要执行吗":"一旦你情感判断修改成功后就不可撤回，你确认要执行吗")){
		return;
	}
	var temp=$("#"+id+" .public_select.vm").val();
	$.ajax({
		type:"post",
		url:"${ROOT}analyze/affirm.htm",
		data:{id:id,trend:(value?value:temp)},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(state);
				return;
			}
			if(value){
				$("#"+id+" .btn.btn-default.ml5").removeAttr("onclick").html("已无效了");
			}
			value=value?value:temp;
			$("#"+id+" .public_select.vm").removeAttr("onchange").attr("disabled",true);
			$("#"+id+" div.operation div.left:first span").removeAttr("class").attr("class","btn "+color[value]+" mr5").html(trend[value]);
		},
		error:function(){
			window.alert("请求失败！请稍后重试");
		}
	});
}
function entry(data){
	var res="";
	res+="<div class=\"clear operation\">";
	res+="<div class=\"left\"><span class=\"btn "+color[data.trend]+" mr5\">"+trend[data.trend]+"</span></div>";
	res+="<div class=\"left link ml5\">";
	res+="<p class=\"clear\">";
	res+="<a href=\""+data.address+"\" class=\"btn btn-info left\" target=\"_blank\">查看原文</a>";
	res+="<span class=\"left\">"+data.address+"</span>";
	res+="</p>";
	res+="</div>";
	if(data.screen){
		res+="<div class=\"left\"><span class=\"btn btn-info btn-bordered mr5\">发布时间："+data.screen+"</span></div>";
	}
	res+="<div class=\"right\">";
	res+="<span class=\"vm\">搜索关键词：</span>";
	res+="<span class=\"vm mr30\">"+data.keyword+"</span>";
	res+="<span class=\"vm\">情感判定：</span>";
	if(data.affirm){
		res+="<select class=\"public_select vm\" disabled=\"disabled\">";
		res+="<option>"+trend[data.trend]+"</option>";
		res+="</select>";
	}else{
		res+="<select class=\"public_select vm\" onchange=\"affirm('"+data.id+"')\">";
		res+="<option value=\"ZHENGMIAN\""+(data.trend=="ZHENGMIAN"?" selected=\"selected\"":"")+">正面</option>";
		res+="<option value=\"ZHONGLI\""+(data.trend=="ZHONGLI"?" selected=\"selected\"":"")+">中立</option>";
		res+="<option value=\"FUMIAN\""+(data.trend=="FUMIAN"?" selected=\"selected\"":"")+">负面</option>";
		res+="</select>";
	}
	res+="<a class=\"btn btn-default\" lang=\""+(data.store?0:1)+"\" onclick=\"JTraceStore(this,'"+data.id+"')\">"+(data.store?"移除收藏":"加入收藏")+"</a>";
	res+=data.trend=="WUXIAO"?"<a class=\"btn btn-default ml5\">已无效了</a>":"<a class=\"btn btn-default ml5\" onclick=\"affirm('"+data.id+"','WUXIAO')\">设置无效</a>";
	res+="<a href=\"trace/"+data.id+".htm\" class=\"btn btn-info ml5\" target=\"_blank\">舆情追踪</a>";
	res+="</div>";
	res+="</div>";
	return res;
}
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
	param();
	if(!pages.media.length){
		pages.media=[-1];
	}
	if(!pages.trend.length){
		pages.trend=["-1"];
	}
	pages.place=now?now:1;
	$.ajax({
		type:"post",
		url:"${ROOT}analyze/list.htm",
		data:JSON.stringify(pages),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
		async:false,
		beforeSend:function(){
			$("#list .message_box").remove();
			$("#list .handle").after("<div style=\"text-align:center;\" class=\"message_box\">加载数据中...</div>");
			$("#list #pagelink ul").html("");
		},
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				$("#list .handle").html("搜索结果");
				$("#list .message_box").remove();
				$("#list .handle").after("<div style=\"text-align:center;\" class=\"message_box\">"+state+"</div>");
				$("#list #pagelink ul").html("");
				return;
			}
			$("#list .handle").html("搜索结果（共"+res.total+"条）");
			var datas=res.datas;
			var html="";
			for(var i=0;i<datas.length;i++){
				var data=datas[i];
				html+="<div class=\"message_box\" id=\""+data.id+"\">";
				html+="<div class=\"clear\">";
				html+="<div class=\"title left\">"+data.title+"</div>";
				html+="<div class=\"right\">";
				html+="<span class=\"btn btn-info btn-bordered mr5\">"+data.media+"</span>";
				html+="<span class=\"btn btn-info btn-bordered\">抓取时间："+data.created+"</span>";
				html+="</div>";
				html+="</div>";
				html+="<div class=\"content\">"+data.content+"</div>";
				html+=entry(data);
				html+="</div>";
			}
			$("#list .message_box").remove();
			$("#list .handle").after(html);
			page(res.coords,res.place);
		},
		error:function(){
			$("#list .handle").html("搜索结果");
			$("#list .message_box").remove();
			$("#list .handle").after("<div style=\"text-align:center;\" class=\"message_box\">请求失败！请稍后重试</div>");
			$("#list #pagelink ul").html("");
		}
	});
}
$(document).ready(function(){
	var kw=$("#j_program input[name='keyword']:first");;
	if(kw.length){
		var p=kw.closest(".panel");
		p.find(".panel-body").slideDown(200);
		p.find(".panel-minimize").removeClass("maximize");
	}
	if(pages.created){
		var o=$("#j_search input[value='"+pages.created+"'][name='created']");
		if(o.length){
			o.click();
		}else{
			o=$("#j_search input[type='text'][name='created']");
			if(o.length){
				o.val(pages.created);
			}
		}
	}
	if(pages.queue){
		var o=$("#j_search input[value='"+pages.queue+"'][name='queue']");
		if(o.length){
			o.click();
		}
	}
	if(pages.media&&pages.media.length&&$("#j_search input[name='media']").length){
		for(var i=0;i<pages.media.length;i++){
			$("#j_search input[value='"+pages.media[i]+"'][name='media']").click();
		}
	}
	if(pages.trend&&pages.trend.length&&$("#j_search input[name='trend']").length){
		for(var i=0;i<pages.trend.length;i++){
			$("#j_search input[value='"+pages.trend[i]+"'][name='trend']").click();
		}
	}
	$("#j_program input[name='keyword'],#j_search input[name='queue'],#j_search input[name='media'],#j_search input[name='trend']").click(function(){
		search();
	});
	$("#j_search input[type='radio'][name='created']").click(function(){
		$("#j_search input[type='text'][name='created']").val("");
		search();
	});
	$("#j_search input[type='text'][name='created']").keyup(function(){
		var o=$(this);
		var v=parseInt(o.val(),10);
		if(v){
			var os=document.getElementsByName("created");
			for(var i=0;i<os.length;i++){
				os[i].checked="";
			}
			o.val(v);
		}else{
			document.getElementsByName("created")[0].checked="checked";
			o.val("");
		}
		search();
	});
	search();
});
</script>
</body>
</html>
<!--【来源网页】从【搜索引擎结果页】转换成【网站直接结果页】时则需对【网页分析】进行重新判断情感（正面、中立、无效）
【来源网页】无效了则就让对应的【网页分析】已无效了、已确认了、不追踪了
【网页分析】已确认了就不能重新判断情感（正面、中立、无效），但可以设置失效
【网页分析】无效了则不再进行【网页追踪】
【网页分析】修改了情感判断（正面、中立、无效）下拉框就算已确认了
【网页分析】设置失效时则已确认了、不追踪了-->