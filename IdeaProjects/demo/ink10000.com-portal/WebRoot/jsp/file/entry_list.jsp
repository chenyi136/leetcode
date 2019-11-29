<%@ page language="java" import="
com.mc.core.entity.file.Entry,
com.mc.portal.pojo.PageBody" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
PageBody pages = (PageBody) request.getAttribute("pages");
Entry en = new Entry();
Object[][] tray = new Object[][] {
	{ "A:", "虚拟硬盘" },
	{ "D:", "电脑硬盘" },
	{ "F:", "西部硬盘" },
	{ "G:", "希捷硬盘" }
};
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
.j_block td{height:28px;line-height:100%;vertical-align:middle;}
.j_block td input{width:100%;height:24px;line-height:100%;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "file/entry/")%>
		<div class="am-g" id="j_search">
			<%=Search.input(en.setName(null), 1)%>
			<%=Search.input(en.setAddress(null), 1)%>
			<%=Search.input(en.setId(null).setAlias("实体标识"), 0, 2)%>
			<%=Search.select(en.setTray(null), tray)%>
			<%=Search.button(true, true, 2)%>
		</div>
		<%=Search.table(1, pages.getSize(), pages.getOrder(), pages.getQueue(), en.setId(null), en.setName(null), en.setAddress(null), en.setLength(null), en.setCreated(null))%>
		<%=Search.paging(false, false, new String[][] { { "collect(true)", icon("leanpub"), "汇总" }, { "prompt()", icon("check-circle-o"), "检测" } }, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<c:import url="${ROOT}global/part.htm?code=popup"/>
<div class="am-modal am-modal-prompt" id="verify">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">检测文件实体<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div class="am-modal-bd"><input type="text" class="am-modal-prompt-input" placeholder="请输入文件路径前缀"></div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>
<div class="am-modal am-modal-prompt j_block" id="collect">
	<div style="width:60%;" class="am-modal-dialog">
		<div style="padding-top:5px;" class="am-modal-hd">文件汇总统计<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div style="padding-bottom:5px;" class="am-modal-bd">
			<table class="am-table-striped am-table-hover">
				<thead>
					<tr class="am-primary">
						<th style="width:250px;">存储路径</th>
						<th>实体总数</th>
						<th>文件总数</th>
						<th style="width:250px;">存储路径</th>
						<th>实体总数</th>
						<th>文件总数</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div class="am-modal-footer"><a class="am-btn am-modal-btn" data-am-modal-confirm>确定</a></div>
	</div>
</div>
<script type="text/javascript" src="_/my/jpage.js"></script>
<script type="text/javascript">
function verify(prefix){
	$.ajax({
		type:"post",
		url:"${ROOT}file/entry/verify.htm",
		data:{prefix:prefix},
		dataType:"html",
		async:false,
		success:function(res){
			$("#j_popup .am-popup-title").html("检测文件结果");
			$("#j_popup .am-popup-bd").html(res);
			$("#j_popup").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function prompt(){
	$("#verify").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var v=n.data;
			if(v){
				verify(v);
			}
		},
		onCancel:function(n){}
	});
}
function collect(open,o){
	if(open){
		var keys=new Array();
		keys[keys.length]=["/歌曲库/国内歌曲/","D:"];
		keys[keys.length]=["/歌曲库/国外歌曲/","D:"];
		keys[keys.length]=["/软件库/开发/java/",null];
		keys[keys.length]=["/视频库/电视/","F:"];
		keys[keys.length]=["/视频库/电影/","G:"];
		keys[keys.length]=["/视频库/动画/","G:"];
		keys[keys.length]=["/视频库/开放/","G:"];
		keys[keys.length]=["/视频库/其他/陈翔六点半/","G:"];
		/* 
		keys[keys.length]=["/视频库/纪录/故宫100/","F:"];
		keys[keys.length]=["/视频库/纪录/如果国宝会说话/","F:"];
		keys[keys.length]=["/视频库/纪录/书香/","F:"];
		keys[keys.length]=["/视频库/纪录/维度数学漫步/","F:"];
		keys[keys.length]=["/视频库/纪录/微观小世界/","F:"]; */
		$.ajax({
			type:"post",
			url:"${ROOT}file/entry/collect.htm",
			data:JSON.stringify(keys),
			dataType:"json",
			contentType:"application/json;charset=UTF-8",
			async:false,
			success:function(res){
				var state=res.state;
				if(state!="OK"){
					window.alert(state);
					return;
				}
				var h="";
				var s="";
				var datas=res.datas;
				for(var i=0;i<datas.length;i++){
					var data=datas[i];
					if(i%2==0){
						if(i>0){
							h+="</tr>";
						}
						h+="<tr>";
					}
					h+="<td><input value=\""+data[0]+data[1]+"\" onchange=\"collect(false,this)\"></td>";
					h+="<td>"+data[2]+"</td>";
					h+="<td>"+data[3]+"</td>";
					s+=" AND address NOT LIKE '"+data[1]+"%'";
				}
				if(datas.length%2!=0){
					h+="<td colspan=\"3\">&nbsp</td></tr>";
				}
				var total=res.total;
				h+="<tr><td colspan=\"6\"><input value=\"SELECT COUNT(id) FROM file_entry WHERE"+s.substring(4)+";\" readonly=\"readonly\" onclick=\"javascript:$(this).select();\"></td></tr>";
				h+="<tr><td colspan=\"2\">数据总数："+total[0]+"</td><td colspan=\"2\">实体总数："+total[1]+"</td><td colspan=\"2\">文件总数："+total[2]+"</td></tr>";
				$("#collect tbody").html(h);
				$("#collect").modal();
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
	}else{
		o=$(o);
		var path=o.val();
		if(!path||path.indexOf("A:/")!=-1){
			return;
		}
		$.ajax({
			type:"post",
			url:"${ROOT}file/entry/collect.htm",
			data:JSON.stringify([[path]]),
			dataType:"json",
			contentType:"application/json;charset=UTF-8",
			async:false,
			success:function(res){
				var state=res.state;
				if(state!="OK"){
					window.alert(state);
					return;
				}
				o.parent("td").next("td").next("td").html(res.total);
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
	}
}
$(document).ready(function(){
	JPageInit(<%=JsonTool.write(pages)%>,function(datas){
		var h="";
		for(var i=0;i<datas.length;i++){
			var data=datas[i];
			h+="<tr>";
			h+="<td><label class=\"am-checkbox\"><input type=\"checkbox\" value=\""+data.id+"\" name=\"ids\"></label></td>";
			h+="<td>"+data.id+"</td>";
			h+="<td>"+data.name+"</td>";
			h+="<td class=\"am-text-left\">"+data.tray+data.address+"</td>";
			h+="<td data-am-popover=\"{content:'文件大小："+data.length[0]+"',trigger:'hover',theme:'sm'}\">"+data.length[1]+"</td>";
			h+="<td>"+data.created+"</td>";
			h+="<td>";
			h+="<div class=\"am-btn-group am-btn-group-xs\">";
			h+="<a class=\"am-btn am-btn-default <%=icon("check-circle-o")%> am-text-secondary\" onclick=\"verify('"+data.address+"')\"> 检测</a>";
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