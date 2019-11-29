<%@ page language="java" import="com.mc.core.entity.auth.Apply" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Apply en = new Apply();%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request)%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/my/jpage.css">
<style type="text/css">
.j_block .am-btn-group{margin:1px;width:100%;}
.j_block .am-btn-group .am-btn{width:50%;}
</style>
</head>
<body>
<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=head"/>
<div class="am-cf" id="j_hold">
	<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=menu"/>
	<div id="j_right">
		<%=crumb(request, "apply/")%>
		<div class="am-g j_block" id="apply">
			<table class="am-table-striped am-table-hover">
				<thead>
					<tr class="am-primary">
						<th>序号</th>
						<th>中文名称</th>
						<th>账号标识</th>
						<th>登录账号</th>
						<th>绑定邮箱</th>
						<th>手机号码</th>
						<th>注册时间</th>
						<th>更新时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<%=Search.paging(false, false, new String[][] {
			{ "load()", icon("pencil-square-o"), "创建" },
			{ "list(this,['http://www.baofeng.com/','http://www.kugou.com/','https://account.36kr.com/#/login','https://account.xiaomi.com/pass/serviceLogin','https://mail.sina.com.cn/','https://passport.bilibili.com/login','https://passport.csdn.net/account/login','https://web2.qq.com/','https://www.smartoct.com/member/login','https://www.youku.com/','https://wx.qq.com/'])", icon("link"), "娱乐" },
			{ "list(this,['https://www.ctfile.com/','https://i.xunlei.com/xluser/login.html','https://pan.baidu.com/'])", icon("link"), "下载" },
			{ "list(this,['https://account.aliyun.com/login/login.htm','https://dev.getui.com/#/login','https://github.com/login','https://login.oracle.com/oaam_server/login.do','https://sso.qiniu.com/'])", icon("link"), "开发" },
			{ "list(this,['https://auth.alipay.com/login/index.htm','https://kyfw.12306.cn/otn/login/init','https://login.taobao.com/member/login.jhtml','https://mybank.icbc.com.cn/icbc/newperbank/perbank3/frame/frame_index.jsp','https://passport.jd.com/new/login.aspx','https://pbsz.ebank.cmbchina.com/CmbBank_GenShell/UI/GenShellPC/Login/Login.aspx','https://perbank.abchina.com/EbankSite/startup.do','https://www.95579.com/'])", icon("link"), "交易" },
			{ "list(this,['https://login.zhipin.com/','https://passport.58.com/login/','https://passport.ganji.com/login.php','https://passport.zhaopin.com/account/login','https://www.51job.com/','https://www.dajie.com/','https://www.liepin.com/'])", icon("link"), "求职" },
			{ "list(this,['http://i.firefoxchina.cn/','http://mail.sina.com.cn/','http://www.iciba.com/','http://www.bjrbj.gov.cn/csibiz/indinfo/login.jsp','https://account.wps.cn/','https://i.360.cn/login/','https://passport.ksyun.com/','https://pinyin.sogou.com/','https://www.bjjzz.gov.cn/'])", icon("link"), "工具" },
			{ "list(this,['/'])", icon("link"), "全部" }
		}, null)%>
		<c:import url="${ROOT}global/part.htm?id=${KEY_JUMP_TOKEN}&code=copy"/>
	</div>
</div>
<div class="am-popup j_popup" id="load">
	<div class="am-popup-inner">
		<div class="am-popup-hd">
			<h4 class="am-popup-title">创建我的应用</h4>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div class="am-popup-bd">
			<form>
				<%=Popup.input(en.setName(null), true)%>
				<%=Popup.input(en.setAddress(null))%>
				<%=Popup.input(en.setMark(null))%>
				<%=Popup.input(en.setUsername(null))%>
				<%=Popup.input(en.setEmail(null))%>
				<%=Popup.input(en.setPhone(null))%>
				<%=Popup.input(en.setPassword(null))%>
				<%=Popup.input(en.setDefray(null))%>
				<%=Popup.input(en.setDevice(null))%>
				<%=Popup.time(en.setOccur(null), null, null)%>
				<%=Popup.button(en.setId(null))%>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
var prefixs=null;
function load(id){
	if(!id){
		$("#load [type='reset']").click();
		$("#load [name='id']").val("");
		$("#load").modal();
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}apply/index.htm",
		data:{type:"load",id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			var data=res.data;
			$("#load [name='id']").val(id);
			$("#load [name='name']").val(data.name);
			$("#load [name='address']").val(data.address);
			$("#load [name='mark']").val(data.mark);
			$("#load [name='username']").val(data.username);
			$("#load [name='email']").val(data.email);
			$("#load [name='phone']").val(data.phone);
			$("#load [name='password']").val(data.password);
			$("#load [name='defray']").val(data.defray);
			$("#load [name='device']").val(data.device);
			$("#load [name='occur']").val(data.occur);
			$("#load").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function list(o,address){
	$.ajax({
		type:"post",
		url:"${ROOT}apply/index.htm",
		data:{type:"list",prefixs:address},
		dataType:"json",
		async:false,
		success:function(res){
			if(o){
				$(o).siblings().removeClass("am-text-danger");
				$(o).addClass("am-text-danger");
			}
			prefixs=address;
			var state=res.state;
			if(state!="OK"){
				$("#apply tbody").html("<tr><td colspan=\"9\">"+state+"</td></tr>");
				return;
			}
			var datas=res.datas;
			var h="";
			for(var i=0;i<datas.length;i++){
				var data=datas[i];
				h+="<tr>";
				h+="<td>"+(i+1)+"</td>";
				h+="<td><a href=\""+data.address+"\" target=\"_blank\">"+data.name+"</a></td>";
				h+="<td>"+(data.mark?data.mark:"-")+"</td>";
				h+="<td>"+(data.username?data.username:"-")+"</td>";
				h+="<td>"+(data.email?data.email:"-")+"</td>";
				h+="<td>"+(data.phone?data.phone:"-")+"</td>";
				h+="<td>"+(data.occur?data.occur:"-")+"</td>";
				h+="<td>"+data.edited+"</td>";
				h+="<td>";
				h+="<div class=\"am-btn-group am-btn-group-xs\">";
				h+="<a class=\"am-btn am-btn-default <%=icon("trash-o")%> am-text-danger\" onclick=\"drop("+data.id+")\"> 删除</a>";
				h+="<a class=\"am-btn am-btn-default <%=icon("pencil-square-o")%> am-text-secondary\" onclick=\"load("+data.id+")\"> 编辑</a>";
				h+="</div>";
				h+="</td>";
				h+="</tr>";
			}
			$("#apply tbody").html("<tr>"+h+"</tr>");
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function drop(id){
	if(!window.confirm("确认删除吗？")){
		return;
	}
	$.ajax({
		type:"post",
		url:"${ROOT}apply/index.htm",
		data:{type:"drop",id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			list(null,prefixs);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
$(document).ready(function(){
	$(".am-btn-group .am-icon-link:eq(0)").click();
	$("#load form").submit(function(){
		var en=new Object();
		en.type="save";
		en.id=$("#load [name='id']").val();
		en.name=$("#load [name='name']").val();
		en.address=$("#load [name='address']").val();
		en.mark=$("#load [name='mark']").val();
		en.username=$("#load [name='username']").val();
		en.email=$("#load [name='email']").val();
		en.phone=$("#load [name='phone']").val();
		en.password=$("#load [name='password']").val();
		en.defray=$("#load [name='defray']").val();
		en.device=$("#load [name='device']").val();
		en.occur=$("#load [name='occur']").val();
		$.ajax({
			type:"post",
			url:"${ROOT}apply/index.htm",
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
				list(null,prefixs);
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