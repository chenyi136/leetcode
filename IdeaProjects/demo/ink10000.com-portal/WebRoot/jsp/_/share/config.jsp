<%@ page language="java" import="com.mc.core.entity.site.Config" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
List<Config> datas1 = (List<Config>) request.getAttribute("datas1");
@SuppressWarnings("unchecked")
List<Config> datas2 = (List<Config>) request.getAttribute("datas2");
Config en = new Config();
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
.am-input-group-btn>.am-btn{border-color:#3BB4F2;}
#j_table table{padding:0;border-bottom:none;}
#j_table table td{max-width:400px;min-width:120px;}
#j_table .am-table-compact td:first-child{width:320px;}
#j_table .am-table-compact td:last-child{width:145px;}
#j_table textarea{width:100%;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "config/")%>
		<div class="am-g" id="j_table">
			<div style="width:450px;" class="am-margin-bottom-xs am-input-group">
				<b class="am-input-group-btn">
					<a class="am-btn am-btn-secondary <%=icon("pencil-square-o")%>" onclick="load()"> 创建</a>
					<a class="am-btn am-btn-secondary <%=icon("cloud-upload")%>" id="upload"> 上传</a>
				</b>
				<input type="text" style="border-color:#3BB4F2;" class="am-form-field" placeholder="请输入关键字来筛选条目" id="word">
				<form style="display:none;" action="config/index.htm" method="post" enctype="multipart/form-data" target="frame" id="file">
					<input type="file" name="octet">
					<input type="text" value="file" name="type">
				</form>
				<iframe style="display:none;" name="frame" id="frame"></iframe>
			</div>
			<table class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover am-table-centered am-table-compact am-text-break">
				<tbody>
					<tr>
						<td class="am-text-left" colspan="3">
							<a href="https://www.aliyun.com/" target="_blank">阿里云</a>
							<a href="https://help.aliyun.com/product/31815.html" target="_blank">阿里存储</a>
							<a href="https://help.aliyun.com/product/29412.html" target="_blank">邮件推送</a>
							<a href="https://help.aliyun.com/product/44282.html" target="_blank">短信服务</a>
							<a href="https://docs.open.alipay.com/" target="_blank">阿里支付</a>
							<a href="https://cloud.tencent.com/" target="_blank">腾讯云</a>
							<a href="https://cloud.tencent.com/document/product/269" target="_blank">云通信</a>
							<a href="https://mp.weixin.qq.com/" target="_blank">公众平台</a>
							<a href="https://open.weixin.qq.com/" target="_blank">开放平台</a>
							<a href="https://pay.weixin.qq.com/index.php/core/home/login" target="_blank">微信支付</a>
							<a href="https://cloud.baidu.com/" target="_blank">百度云</a>
							<a href="https://ziyuan.baidu.com/site/index" target="_blank">百度资源</a>
							<a href="https://tongji.baidu.com/web/welcome/login" target="_blank">百度统计</a>
							<a href="https://ce.baidu.com/" target="_blank">百度云测</a>
							<a href="https://zn.baidu.com/" target="_blank">站内搜索</a>
							<a href="https://developer.baidu.com/" target="_blank">百度开发</a>
							<a href="https://qiao.baidu.com/" target="_blank">百度商桥</a>
							<a href="http://union.baidu.com/customerLogin.html" target="_blank">百度联盟</a>
							<a href="http://tool.chinaz.com/" target="_blank">站长工具</a>
							<a href="https://www.qiniu.com/" target="_blank">七牛云</a>
						</td>
					</tr>
					<tr><td colspan="3"><p class="am-margin-0 am-text-danger">文本参数（参数名称、参数取值）</p></td></tr>
					<%
						int[] index = new int[] { 1, 1 };
						String[] temp = new String[] { "", "" };
						for (Config data : datas1) {
							out.print("<tr lang=\"" + data.getId() + "\" id=\"a" + index[0] + "\">");
							out.print("<td class=\"am-text-left\">" + data.getName() + "</td>");
							out.print("<td>" + replace(data.getEntry()).replace("\n", "<br>") + "</td>");
							out.print("<td>");
							out.print("<div class=\"am-btn-group am-btn-group-xs\">");
							out.print("<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(" + index[0] + ")\"> 删除</a>");
							out.print("<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"load(" + index[0] + ")\"> 编辑</a>");
							out.print("</div>");
							out.print("</td>");
							out.print("</tr>");
							index[0]++;
						}
						temp[0] += "<tr id=\"a#i#\">";
						temp[0] += "<td class=\"am-text-left\"></td>";
						temp[0] += "<td></td>";
						temp[0] += "<td>";
						temp[0] += "<div class=\"am-btn-group am-btn-group-xs\">";
						temp[0] += "<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(#i#)\"> 删除</a>";
						temp[0] += "<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"load(#i#)\"> 编辑</a>";
						temp[0] += "</div>";
						temp[0] += "</td>";
						temp[0] += "</tr>";
					%>
					<tr id="center"><td colspan="3"><p class="am-margin-0 am-text-danger">文件参数（参数名称、文件名称）</p></td></tr>
					<%
						for (Config data : datas2) {
							out.print("<tr lang=\"" + data.getId() + "\" id=\"b" + index[1] + "\">");
							out.print("<td class=\"am-text-left\">" + data.getName() + "</td>");
							out.print("<td><a href=\"config/index.htm?id=" + data.getId() + "\" target=\"_blank\">" + data.getOctet() + "</a></td>");
							out.print("<td>");
							out.print("<div class=\"am-btn-group am-btn-group-xs\">");
							out.print("<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(" + index[1] + ",true)\"> 删除</a>");
							out.print("<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"load(" + index[1] + ",true)\"> 编辑</a>");
							out.print("</div>");
							out.print("</td>");
							out.print("</tr>");
							index[1]++;
						}
						temp[1] += "<tr id=\"b#i#\">";
						temp[1] += "<td class=\"am-text-left\">-</td>";
						temp[1] += "<td></td>";
						temp[1] += "<td>";
						temp[1] += "<div class=\"am-btn-group am-btn-group-xs\">";
						temp[1] += "<a class=\"am-btn am-btn-default " + icon("trash-o") + " am-text-danger\" onclick=\"drop(#i#,true)\"> 删除</a>";
						temp[1] += "<a class=\"am-btn am-btn-default " + icon("pencil-square-o") + " am-text-secondary\" onclick=\"load(#i#,true)\"> 编辑</a>";
						temp[1] += "</div>";
						temp[1] += "</td>";
						temp[1] += "</tr>";
					%>
				</tbody>
			</table>
		</div>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建工作空间</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(en.setName(null), true)%>
				<%=Popup.input(en.setOctet(null), false, true)%>
				<%=Popup.textarea(en.setEntry(null).setLength(400), 210)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
var index=[<%=index[0]%>,<%=index[1]%>];
var temp=["<%=temp[0].replace("\"", "\\\"")%>","<%=temp[1].replace("\"", "\\\"")%>"];
function load(i,get){
	if(!i){
		$("#load [type='reset']").click();
		$("#load [name='id']").val("a"+index[0]);
		$("#load [name='entry']").attr({required:"required"});
		$("#load [name='entry']").removeAttr("readonly");
		$("#load").modal();
		return;
	}
	var tr=null;
	var en=new Object();
	if(get){
		tr=$("#b"+i);
		en.type="get";
		en.id=tr.attr("lang");
		$("#load [name='entry']").attr({readonly:"readonly"});
		$("#load [name='entry']").removeAttr("required");
	}else{
		tr=$("#a"+i);
		en.type="load";
		en.id=tr.attr("lang");
		$("#load [name='entry']").attr({required:"required"});
		$("#load [name='entry']").removeAttr("readonly");
	}
	$.ajax({
		type:"post",
		url:"${ROOT}config/index.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var data=res.data;
			$("#load [name='id']").val(tr.attr("id"));
			$("#load [name='name']").val(data.name);
			$("#load [name='octet']").val(data.octet);
			$("#load [name='entry']").val(data.entry);
			$("#load").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function drop(i,get){
	if(!window.confirm("确认删除吗？")){
		return;
	}
	var tr=$(get?"#b"+i:"#a"+i);
	$.ajax({
		type:"post",
		url:"${ROOT}config/index.htm",
		data:{type:"drop",id:tr.attr("lang")},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			tr.remove();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	$("#load form").submit(function(){
		var tr=$("#"+$("#load [name='id']").val());
		var en=new Object();
		en.type="save";
		en.id=tr.attr("lang");
		en.name=$("#load [name='name']").val();
		en.entry=$("#load [name='entry']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}config/index.htm",
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
				if(res.id){
					tr=$(temp[0].replace(/#i#/g,index[0]++));
					tr.attr("lang",res.id);
					$("#center").before(tr);
				}
				tr.find("td:eq(0)").html(en.name);
				if(en.entry){
					tr.find("td:eq(1)").html(en.entry.replace(/\n/g,"<br>"));
				}
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
		return false;
	});
	$("#upload").click(function(){
		$("#file [name='octet']").click();
	});
	$("#word").keyup(function(){
		var v=$(this).val();
		if(v){
			$("#j_table tr").hide();
			$("#j_table tr td[colspan]").parent("tr").show();
			$("#j_table tr td:contains("+v+")").parent("tr").show();
		}else{
			$("#j_table tr").show();
		}
	});
	$("#file [name='octet']").change(function(){
		if($(this).val()){
			$("#file").submit();
		}
	}).click();
	$("#frame").load(function(){
		try{
			if(!window.attachEvent){
				var frame=document.getElementById("frame");
				var res={};
				if(frame.contentWindow){
					res.text=frame.contentWindow.document.body?frame.contentWindow.document.body.innerHTML:null;
					res.xml=frame.contentWindow.document.XMLDocument?frame.contentWindow.document.XMLDocument:frame.contentWindow.document;
				}else if(frame.contentDocument){
					res.text=frame.contentDocument.document.body?frame.contentDocument.document.body.innerHTML:null;
					res.xml=frame.contentDocument.document.XMLDocument?frame.contentDocument.document.XMLDocument:frame.contentDocument.document;
				}
				var data=null;
				eval("data="+res.text);
				if(data.state=="OK"){
					var tr=$(temp[1].replace(/#i#/g,index[1]++));
					tr.attr("lang",data.id);
					tr.find("td:eq(1)").html("<a href=\"config/index?id="+data.id+"\" target=\"_blank\">"+data.octet+"</a>");
					$("#center").after(tr);
				}else{
					JAlert(data.state);
				}
			}
		}catch(ev){
			JAlert("上传文件失败");
		}
	});
});
</script>
</body>
</html>