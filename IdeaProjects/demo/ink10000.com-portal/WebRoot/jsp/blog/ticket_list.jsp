<%@ page language="java" import="
com.mc.core.entity.blog.Ticket,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, String> lotterys = (Map<String, String>) request.getAttribute("lotterys");
PageBody pages = (PageBody) request.getAttribute("pages");
Ticket en = new Ticket();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
#j_table tbody td.guess{background:#6E7B8B;}
#j_table tbody td>u{text-decoration:none;color:#F00;}
#j_table tbody td>i{font-style:normal;color:#00F;}
#load input[name='digit']{width:14.28%;text-align:center;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "blog/ticket/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setFkLottery(null).setAlias("彩票期号"), 1)%>
			<%=Search.button(true, true, 9)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setFkLottery(null).setAlias("彩票期号"), en.setDigit1(null), en.setDigit2(null), en.setDigit3(null), en.setDigit4(null), en.setDigit5(null), en.setDigit6(null), en.setDigit7(null), en.setPrice(null), en.setPrize(null), en.setCreated(null))%>
		<%=Search.paging(false, false, new String[][] { { "collect()", icon("leanpub"), "汇总" }, { "load()", icon("clone"), "创建" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=modal"/>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建我的彩票</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.select(en.setFkLottery(null), lotterys, true)%>
				<div class="am-margin-top-xs am-input-group am-input-group-success">
					<b class="am-input-group-label">彩票号码</b>
					<input type="number" class="am-form-field" required="required" max="35" name="digit">
					<input type="number" class="am-form-field" required="required" max="35" name="digit">
					<input type="number" class="am-form-field" required="required" max="35" name="digit">
					<input type="number" class="am-form-field" required="required" max="35" name="digit">
					<input type="number" class="am-form-field" required="required" max="35" name="digit">
					<input type="number" class="am-form-field" required="required" max="35" name="digit">
					<input type="number" class="am-form-field" required="required" max="35" name="digit">
				</div>
				<%=Popup.input(en.setPrice(null))%>
				<%=Popup.button(null)%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function lottery(o,id,key){
	if($("#"+key+"-"+id).length){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}blog/ticket/lottery.htm",
		data:{id:key},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var data=res.data;
			var h="<tr id=\""+key+"-"+id+"\"><td colspan=\"2\"></td>";
			for(var i=0;i<data.length;i++){
				h+="<td>"+data[i]+"</td>";
			}
			h+="<td colspan=\"4\"></td></tr>";
			$(o).parents("tr").after(h);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function collect(){
	$.ajax({
		type:"post",
		url:"${ROOT}blog/ticket/collect.htm",
		dataType:"html",
		async:false,
		success:function(res){
			$("#j_modal h4").html("我的彩票汇总");
			$("#j_modal .am-modal-bd").html(res);
			$("#j_modal").modal({
				closeViaDimmer:0,
				width:400,
				height:"auto"
			});
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function load(){
	$("#load [type='reset']").click();
	$("#load").modal();
}
$(document).ready(function(){
	$("#load select").height($("#load .am-input-group-label").height());
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr"+(data.trash?" class=\"am-text-success\"":"")+">";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.fk_lottery+"</td>";
			h+="<td"+(data.guess1?" class=\"guess\"":"")+">"+data.digit1+"</td>";
			h+="<td"+(data.guess2?" class=\"guess\"":"")+">"+data.digit2+"</td>";
			h+="<td"+(data.guess3?" class=\"guess\"":"")+">"+data.digit3+"</td>";
			h+="<td"+(data.guess4?" class=\"guess\"":"")+">"+data.digit4+"</td>";
			h+="<td"+(data.guess5?" class=\"guess\"":"")+">"+data.digit5+"</td>";
			h+="<td"+(data.guess6?" class=\"guess\"":"")+">"+data.digit6+"</td>";
			h+="<td"+(data.guess7?" class=\"guess\"":"")+">"+data.digit7+"</td>";
			h+="<td>"+data.price+"</td>";
			h+="<td>"+(data.prize?"<u>"+data.prize+"</u>":data.prize)+"</td>";
			h+="<td>"+data.created+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(["+data.id+"])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("eye")%>\" onclick=\"lottery(this,"+data.id+",'"+data.fk_lottery+"')\"> 开奖</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
	$("#load form").submit(function(){
		var en=new Object();
		$.each($("#load [name='digit']"),function(i){
			en["digit"+(i+1)]=$(this).val();
		});
		en.fkLottery=$("#load [name='fkLottery']").val();
		en.price=$("#load [name='price']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}blog/ticket/save.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				$("#load").modal("close");
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
		return false;
	});
});
</script>
</body>
</html>