<%@ page language="java" import="
com.mc.core.entity.file.Lottery,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Lottery en = new Lottery();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
#j_table tbody td>u{text-decoration:none;color:#F00;}
#j_table tbody td>i{font-style:normal;color:#00F;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "file/lottery/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setId(null).setAlias("彩票期号"), 1)%>
			<%=Search.time(new Lottery.Field("开奖年份", false, null, null, "year", 0, null), "YYYY", "2003", 2)%>
			<%=Search.button(true, true, 7)%>
		</div>
		<%=Search.table(1, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setId(null).setAlias("彩票期号"), new Lottery.Field("开奖号码", false, null, null, null, 0, null), new Lottery.Field("奇号个数", false, null, null, null, 0, null).setNote("以红色号码、不限颜色进行奇号计数"), new Lottery.Field("三区比数", false, null, null, null, 0, null).setNote("以&lt=11、&gt=12且&lt;=22、&gt;=23进行分区计数"), new Lottery.Field("除余个数", false, null, null, null, 0, null).setNote("以÷3余0、÷3余1、÷3余2进行余数计数"), new Lottery.Field("号码总和", false, null, null, null, 0, null).setNote("以红色号码、不限颜色进行号码求和"), new Lottery.Field("号码均值", false, null, null, null, 0, null).setNote("以红色号码、不限颜色求平均值"), new Lottery.Field("号码方差", false, null, null, null, 0, null).setNote("以红色号码、不限颜色求方差值"))%>
		<%=Search.paging(false, false, new String[][] { { "verify()", icon("check-circle-o"), "检测" }, { "lead()", icon("clone"), "导入" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-modal am-modal-prompt" id="lead">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">导入幸运彩票<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd"><a href="http://kaijiang.500.com/shtml/ssq/19016.shtml" target="_blank">双色球</a>与<a href="http://kaijiang.500.com/shtml/dlt/19016.shtml" target="_blank">大乐透</a>开奖数据文件的名称必须包含ssq或dlt<br>开奖数据的格式为19001：01020304050607<input type="text" class="am-modal-prompt-input" placeholder="请输入文件路径"></div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function verify(){
	var o=$("#j_search [name='year']");
	var year=o.val();
	if(!year){
		o.click();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}file/lottery/verify.htm",
		data:{year:year},
		dataType:"json",
		async:false,
		success:function(res){
			JAlert(res.state,10000);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function lead(){
	$("#lead").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var v=n.data;
			if(!v){
				return;
			}
			$.ajax({
				type:"post",
				url:"${ROOT}file/lottery/lead.htm",
				data:{path:v},
				dataType:"json",
				async:false,
				success:function(res){
					var state=res.state;
					if(state!="OK"){
						JAlert(state);
						return;
					}
					JPageSend(JPage.now);
				},
				error:function(r,s,e){
					JAlert(r.status);
				}
			});
		},
		onCancel:function(n){}
	});
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.id+"</td>";
			h+="<td>"+data.digit+"</td>";
			h+="<td>"+data.odd+"</td>";
			h+="<td>"+data.area+"</td>";
			h+="<td>"+data.over+"</td>";
			h+="<td>"+data.total+"</td>";
			h+="<td>"+data.avg+"</td>";
			h+="<td>"+data.diff+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
});
</script>
</body>
</html>