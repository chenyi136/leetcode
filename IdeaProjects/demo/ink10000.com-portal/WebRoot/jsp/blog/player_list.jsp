<%@ page language="java" import="
com.mc.core.crux.Legal,
com.mc.core.entity.blog.Player,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<String, String> catena = (Map<String, String>) request.getAttribute("catena");
@SuppressWarnings("unchecked")
Map<String, String> label = (Map<String, String>) request.getAttribute("label");
PageBody pages = (PageBody) request.getAttribute("pages");
Player en = new Player();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "blog/player/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.input(en.setFkCatena(null).setAlias("所属系列"), 2)%>
			<%=Search.select(new Player.Field("能播放吗", false, null, null, "play", 0, null), new Object[][] { { 0, "否" }, { 1, "是" } }, 2)%>
			<%=Search.select(new Player.Field("视频类型", false, null, null, "type", 0, null), Legal.BLOG_CATENA_TYPE, 2)%>
			<%=Search.button(true, true, 2)%>
		</div>
		<%=Search.table(2, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setName(null), en.setFkCatena(null), new Player.Field("文件大小", false, null, null, null, 0, null),en.setTrack(null), en.setRate(null), en.setAttach(null), new Player.Field("创建时间", false, null, null, null, 0, null))%>
		<%=Search.paging(true, false, new String[][] { { "javascript:$('#lead').modal();", icon("clone"), "导入" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="attach">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">更新附加参数</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(en.setName(null), true)%>
				<%=Popup.input(new Player.Field("分辨率宽", true, "width", Integer.class, null, 0, null))%>
				<%=Popup.input(new Player.Field("分辨率高", true, "height", Integer.class, null, 0, null))%>
				<%=Popup.time(new Player.Field("上映日期", true, "screen", null, null, 0, null), null, null)%>
				<%=Popup.input(new Player.Field("豆瓣评分", true, "score", Integer.class, null, 0, null))%>
				<%=Popup.input(new Player.Field("豆瓣影评", true, "douban", null, null, 0, null))%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<div class="am-popup j_popup" id="lead">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">导入短视文件</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.select(en.setFkCatena(null), label, true)%>
				<%=Popup.select(new Player.Field("存储盘符", false, "tray", null, null, 0, null), new Object[][] { { "F:", "西部硬盘" }, { "G:", "希捷硬盘" }, { "A:", "虚拟硬盘" } }, false)%>
				<%=Popup.input(new Player.Field("文件路径", false, "path", null, null, 0, null))%>
				<%=Popup.button(null)%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function attach(id){
	var data=null;
	var tr=$("#j_table input[value='"+id+"']").closest("tr");
	eval("data="+tr.find("td[lang='attach']").attr("tabindex"));
	$("#attach [type='reset']").click();
	$("#attach [name='id']").val(id);
	$("#attach [name='name']").val(tr.find("td[lang='name']").text());
	$("#attach [name='width']").val(data.width);
	$("#attach [name='height']").val(data.height);
	$("#attach [name='screen']").val(data.screen);
	$("#attach [name='score']").val(data.score);
	$("#attach [name='douban']").val(data.douban);
	$("#attach").modal();
}
$(document).ready(function(){
	$("#lead select").height($("#lead .am-input-group-label").height());
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr"+(data.trash?" class=\"am-text-success\"":"")+">";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td class=\"am-text-left\" lang=\"name\"><a href=\"<%=Global.CLOUD%>catena/"+data.fkCatena[0]+".htm\" target=\"_blank\">"+data.name+"</a></td>";
			h+="<td>"+data.fkCatena[1]+"</td>";
			h+="<td data-am-popover=\"{content:'文件大小："+data.entry[0]+"',trigger:'hover',theme:'sm'}\">"+data.entry[1]+"</td>";
			h+="<td>"+data.track+"</td>";
			h+="<td>"+data.rate+"比特/毫秒</td>";
			h+="<td lang=\"attach\" tabindex=\""+data.attach[0]+"\">"+data.attach[1]+"</td>";
			h+="<td data-am-popover=\"{content:'更新时间："+data.edited+"',trigger:'hover',theme:'sm'}\">"+data.entry[2]+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"JPageDrop(['"+data.id+"'])\"> 删除</a>";
			h+="<a class=\"am-btn am-btn-default <%=icon("gg")%> am-text-secondary\" onclick=\"attach('"+data.id+"')\"> 参数</a>";
			h+="</div>";
			h+="</td>";
			h+="</tr>";
		}
		$("#j_table tbody").html(h);
	});
	$("#attach form").submit(function(){
		var o=$(this);
		var en=new Object();
		en.id=o.find("[name='id']").val();
		en.name=o.find("[name='name']").val();
		en.width=o.find("[name='width']").val();
		en.height=o.find("[name='height']").val();
		en.screen=o.find("[name='screen']").val();
		en.score=o.find("[name='score']").val();
		en.douban=o.find("[name='douban']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}blog/player/attach.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				o.closest(".am-popup").modal("close");
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
	$("#lead form").submit(function(){
		var en=new Object();
		en.fkCatena=$("#lead [name='fkCatena']").val();
		en.tray=$("#lead [name='tray']").val();
		en.path=$("#lead [name='path']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}blog/player/lead.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				$("#lead").modal("close");
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