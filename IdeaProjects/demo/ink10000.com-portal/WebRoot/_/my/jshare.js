function JAlert(m,t){
	switch(parseInt(m,10)){
		case 0:m="你发送的请求尚未响应";break;
		case 200:m="请先登录";break;
		case 400:m="你请求参数非法或无效请求";break;
		case 403:m="你没有访问或操作权限";break;
		case 404:m="你发送的请求或访问的资源不存在";break;
		case 405:m="你发送请求的方式不支持";break;
		case 500:m="请求失败！请稍后重试";break;
	}
	if(m){
		$("#j_alert").html("<div class=\"am-u-sm-centered am-u-md-6 am-alert am-alert-warning\" data-am-alert><a type=\"button\" class=\"am-close\">&times;</a><p>"+m+"</p></div>");
		$("#j_alert .am-alert").alert();
		window.setTimeout(function(){
			$("#j_alert .am-alert").alert("close");
		},t?t:1500);
	}
}
function JBase64(data){
	if(!data){
		return null;
	}
	data=encodeURI(JSON.stringify(data));
	var key="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	var cs=[0,0,0];
	var ks=[0,0,0,0];
	var i=0;
	var r="";
	do{
		cs[0]=data.charCodeAt(i++);
		cs[1]=data.charCodeAt(i++);
		cs[2]=data.charCodeAt(i++);
		ks[0]=cs[0]>>2;
		ks[1]=((cs[0]&3)<<4)|(cs[1]>>4);
		ks[2]=((cs[1]&15)<<2)|(cs[2]>>6);
		ks[3]=cs[2]&63;
		if(isNaN(cs[1])){
			ks[2]=ks[3]=64;
		}else if(isNaN(cs[2])){
			ks[3]=64;
		}
		r+=key.charAt(ks[0])+key.charAt(ks[1])+key.charAt(ks[2])+key.charAt(ks[3]);
		cs[0]=cs[1]=cs[2]=0;
		ks[0]=ks[1]=ks[2]=ks[3]=0;
	}while(i<data.length);
	return r;
}
function JChar(data){
	if(!data){
		return data;
	}
	return data.replace(/>/g,"&gt;").replace(/</g,"&lt;").replace(/\"/g,"&quot;").replace(/'/g,"\\'");
}
function JDaily(load,prefixs,size,now){
	if(load){
		if(!$("#j_daily").length){
			var h="<div class=\"am-modal am-modal-prompt j_block\" id=\"j_daily\">";
			h+="<div style=\"width:45%;\" class=\"am-modal-dialog\">";
			h+="<div style=\"padding-top:5px;\" class=\"am-modal-hd\">当前操作日志<i class=\"am-close am-close-spin\" data-am-modal-close>&times;</i></div>";
			h+="<div style=\"padding-bottom:5px;\" class=\"am-modal-bd\">";
			h+="<table class=\"am-table-striped am-table-hover\">";
			h+="<thead>";
			h+="<tr class=\"am-primary\">";
			h+="<th>日志名称</th>";
			h+="<th>请求方式</th>";
			h+="<th>来源标识</th>";
			h+="<th>来源页面</th>";
			h+="<th>影响条数</th>";
			h+="<th>执行毫秒</th>";
			h+="<th>创建时间</th>";
			h+="</tr>";
			h+="</thead>";
			h+="<tbody>";
			h+="</tbody>";
			h+="</table>";
			h+="</div>";
			h+="<div class=\"am-modal-footer\">";
			h+="<input type=\"hidden\">";
			h+="<ul class=\"am-margin-xs am-pagination am-pagination-centered\"></ul>";
			h+="</div>";
			h+="</div>";
			h+="</div>";
			$(document.body).append(h);
			if(!prefixs.length){
				var href=location.href.replace(window.WEB_CONFIG_ROOT,"");
				var index=href.indexOf("?");
				prefixs=[index!=-1?href.substring(0,index):href];
			}
			$("#j_daily input[type='hidden']").val(JSON.stringify(prefixs));
		}
		$("#j_daily").modal();
		JDaily(null,null,size,1);
	}else{
		if(!prefixs){
			eval("prefixs="+$("#j_daily input[type='hidden']").val());
		}
		var body=$("#j_daily tbody");
		var page=$("#j_daily .am-pagination");
		var jump=true;
		if(!page.length){
			page=$("#j_bar");
			jump=false;
		}
		$.ajax({
			type:"post",
			url:window.WEB_CONFIG_ROOT+"daily/index.htm",
			data:{prefixs:prefixs,size:size,now:now},
			dataType:"json",
			async:false,
			beforeSend:function(){
				body.html("<tr><td colspan=\"7\">加载数据中...</td></tr>");
				page.html("<li><a href=\"daily/index.htm\">我的日志</a></li>");
			},
			success:function(res){
				var state=res.state;
				if(state!="OK"){
					body.html("<tr><td colspan=\"7\">"+state+"</td></tr>");
					page.html(jump?"<li><a href=\"daily/index.htm\">我的日志</a></li>":"");
					return;
				}
				var datas=res.datas;
				var h="";
				for(var i=0;i<datas.length;i++){
					var data=datas[i];
					h+="<tr>";
					h+="<td>"+(data.address?"<a href=\""+data.address+(data.args?(typeof data.args=="string"?data.args:"?"+window.KEY_JUMP_PAGING+"="+JBase64(data.args)):"")+"\">"+data.name+"</a>":data.name)+"</td>";
					h+="<td>"+data.type+"</td>";
					h+="<td>"+data.remote+"</td>";
					h+="<td>"+(data.title?"<a href=\""+data.refer+"\">"+data.title+"</a>":"-")+"</td>";
					h+="<td>"+data.size+"</td>";
					h+="<td>"+data.track+" ms</td>";
					h+="<td>"+data.created+"</td>";
					h+="</tr>";
				}
				body.html(h);
				h=jump?"<li><a href=\"daily/index.htm\">我的日志</a></li>":"";
				var tabs=res.tabs;
				var now=res.now;
				if(tabs>=2){
					if(tabs<8){
						for(var i=1;i<=tabs;i++){
							h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JDaily(null,null,"+size+","+i+")\"")+">"+i+"</a></li>";
						}
					}else{
						if(now>1){
							h+="<li><a onclick=\"JDaily(null,null,"+size+",1)\" class=\"am-icon-fast-backward\"></a></li>";
							h+="<li><a onclick=\"JDaily(null,null,"+size+","+(now-1)+")\" class=\"am-icon-backward\"></a></li>";
						}
						if(now<=3){
							for(var i=1;i<=5;i++){
								h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JDaily(null,null,"+size+","+i+")\"")+">"+i+"</a></li>";
							}
							h+="<li class=\"am-disabled\"><a>...</a></li>";
						}else if(now>=tabs-2){
							h+="<li class=\"am-disabled\"><a>...</a></li>";
							for(var i=tabs-4;i<=tabs;i++){
								h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JDaily(null,null,"+size+","+i+")\"")+">"+i+"</a></li>";
							}
						}else{
							h+="<li class=\"am-disabled\"><a>...</a></li>";
							for(var i=now-2;i<=now+2;i++){
								h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JDaily(null,null,"+size+","+i+")\"")+">"+i+"</a></li>";
							}
							h+="<li class=\"am-disabled\"><a>...</a></li>";
						}
						if(now<tabs){
							h+="<li><a onclick=\"JDaily(null,null,"+size+","+(now+1)+")\" class=\"am-icon-forward\"></a></li>";
							h+="<li><a onclick=\"JDaily(null,null,"+size+","+tabs+")\" class=\"am-icon-fast-forward\"></a></li>";
						}
					}
				}
				page.html(h);
			},
			error:function(r,s,e){
				body.html("<tr><td colspan=\"7\">请求失败！错误码："+r.status+"</td></tr>");
				page.html(jump?"<li><a href=\"daily/index.htm\">我的日志</a></li>":"");
			}
		});
	}
}
function JDonate(load){
	if(load){
		if(!$("#j_donate").length){
			var h="<div class=\"am-modal am-modal-alert\" id=\"j_donate\">";
			h+="<div class=\"am-modal-dialog\">";
			h+="<div class=\"am-modal-hd\"><a href=\""+window.WEB_CONFIG_CLOUD+"donate/index.htm\" target=\"_blank\">谢谢你的赞助</a><i class=\"am-close am-close-spin\" data-am-modal-close>&times;</i></div>";
			h+="<div style=\"border:0;\" class=\"am-padding-0 am-modal-bd\">";
			h+="<b class=\"am-padding-xs am-u-md-6\"><img src=\"data/i/alibag.jpg\" class=\"am-img-thumbnail\"></b>";
			h+="<b class=\"am-padding-xs am-u-md-6\"><img src=\"data/i/alipay.jpg\" class=\"am-img-thumbnail\"></b>";
			h+="<div class=\"am-margin-xs am-form-group\"><input type=\"text\" class=\"am-form-field\" value=\"打开支付宝首页搜“526410865”领红包，领到大红包的小伙伴赶紧使用哦！\" readonly=\"readonly\" onfocus=\"javascript:$(this).select();\" onclick=\"javascript:$(this).select();\"></div>";
			h+="<div class=\"am-margin-xs am-form-group\"><input type=\"number\" class=\"am-form-field\" maxlength=\"80\" min=\"0.01\" max=\"99999999999999999.99\" placeholder=\"你的赞助金额\" name=\"money\"></div>";
			h+="<div class=\"am-margin-xs am-margin-bottom-0 am-form-group\"><input type=\"text\" class=\"am-form-field\" maxlength=\"80\" placeholder=\"你的联系方式\" name=\"contact\"></div>";
			h+="</div>";
			h+="<div class=\"am-modal-footer\"><a class=\"am-modal-btn am-icon-thumbs-up\" onclick=\"JDonate()\"> 支付了告诉我</a></div>";
			h+="</div>";
			h+="</div>";
			$(document.body).append(h);
		}
		$("#j_donate").modal();
	}else{
		var en=new Object();
		en.money=$("#j_donate [name='money']").val();
		en.contact=$("#j_donate [name='contact']").val();
		if(!en.money||!en.contact){
			return;
		}
		$.ajax({
			type:"post",
			url:window.WEB_CONFIG_ROOT+"global/donate.htm",
			data:en,
			dataType:"json",
			async:false,
			success:function(res){
				var state=res.state;
				if(state!="NO"){
					$("#j_donate [name='money']").val("");
					$("#j_donate [name='contact']").val("");
					JAlert(state);
				}
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
	}
}
function JEnjoy(id){
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"enjoy/save.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			JAlert(res.state);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function JEvent(type,o,id,total){
	if(type=="save"){
		if($("#j_event").length){
			$("#j_event [type='reset']").click();
		}else{
			var h="<div class=\"am-popup j_popup\" id=\"j_event\">";
			h+="<div class=\"am-popup-inner\">";
			h+="<div class=\"am-popup-hd\">";
			h+="<h4 class=\"am-popup-title\">创建待办事项</h4>";
			h+="<i class=\"am-close am-close-spin\" data-am-modal-close>&times;</i>";
			h+="</div>";
			h+="<div class=\"am-popup-bd\">";
			h+="<form>";
			h+="<div class=\"am-input-group am-input-group-success\">";
			h+="<b class=\"am-input-group-label\">来源路径</b>";
			h+="<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" name=\"address\">";
			h+="</div>";
			h+="<div class=\"am-margin-top-xs am-input-group am-input-group-success\">";
			h+="<b class=\"am-input-group-label\">截止日期</b>";
			h+="<input type=\"text\" class=\"am-form-field\" required=\"required\" readonly=\"readonly\" placeholder=\"必填\" name=\"close\" onclick=\"jeDate({dateCell:this,festival:true,format:'YYYY-MM-DD',isClick:true,isToday:true,minDate:jeDate.now(0),zIndex:10000})\">";
			h+="</div>";
			h+="<div class=\"am-margin-top-xs am-input-group am-input-group-success\">";
			h+="<b class=\"am-input-group-label\">事项描述</b>";
			h+="<textarea style=\"width:100%;height:320px;\" class=\"am-form-field\" required=\"required\" maxlength=\"400\" placeholder=\"必填，长度最多400位\" name=\"content\"></textarea>";
			h+="</div>";
			h+="<div class=\"am-margin-top-xs am-input-group\">";
			h+="<b class=\"am-input-group-label\">事项截图</b>";
			h+="<input type=\"text\" class=\"am-form-field\" readonly=\"readonly\" name=\"image\" id=\"j_event_image\" ondblclick=\"JFile(this,true)\">";
			h+="<b class=\"am-input-group-btn\">";
			h+="<button type=\"button\" class=\"am-btn\" onclick=\"javascript:$('#j_event_image').val('');\">删除文件</button>";
			h+="<button type=\"button\" class=\"am-btn\" onclick=\"JUpload(this,'image/*','j_event_image')\">选择文件</button>";
			h+="</b>";
			h+="</div>";
			h+="<div class=\"am-margin-top-xs\">";
			h+="<div class=\"am-u-md-6 am-padding-right-sm am-padding-left-0\"><button type=\"reset\" class=\"am-btn am-btn-success am-btn-block\">清空</button></div>";
			h+="<div class=\"am-u-md-6 am-padding-horizontal-0\"><button type=\"submit\" class=\"am-btn am-btn-success am-btn-block\">提交</button`></div>";
			h+="</div>";
			h+="</form>";
			h+="</div>";
			h+="</div>";
			h+="</div>";
			$(document.body).append(h);
			$("#j_event form").submit(function(){
				var en=new Object();
				en.type="save";
				en.address=$("#j_event [name='address']").val();
				en.close=$("#j_event [name='close']").val();
				en.content=$("#j_event [name='content']").val();
				en.image=$("#j_event [name='image']").val();
				if(!en.close){
					$("#j_event [name='close']").click();
					return false;
				}
				$.ajax({
					type:"post",
					url:window.WEB_CONFIG_ROOT+"event/index.htm",
					data:en,
					dataType:"json",
					async:false,
					success:function(res){
						$("#j_event").modal("close");
						var state=res.state;
						if(state=="OK"){
							var href=location.href;
							if(href.indexOf("admin/index.htm")!=-1||href.indexOf("event/index.htm")!=-1){
								window.location=location.href;
								return;
							}
							state="创建待办事项成功";
						}
						JAlert(state);
					},
					error:function(r,s,e){
						JAlert(r.status);
					}
				});
				return false;
			});
		}
		$("#j_event [name='address']").val(location.href);
		$("#j_event").modal();
	} else if(type=="state"){
		var words={"0":"待处理","1":"处理中","2":"已完成"};
		var color=["am-badge-warning","am-badge-success","am-badge-secondary"];
		var clazz=$(o).attr("class");
		var now=0;
		for(var i=0;i<color.length;i++){
			if(clazz.indexOf(color[i])!=-1){
				now=i;
				break;
			}
		}
		if(!window.confirm("将事项从"+(now==0?"从【待处理】设置为【处理中】":"从【处理中】设置为【已完成】")+"吗？")){
			return;
		}
		$.ajax({
			type:"post",
			url:window.WEB_CONFIG_ROOT+"event/index.htm",
			data:{type:"state",id:id},
			dataType:"json",
			async:false,
			success:function(res){
				var state=res.state;
				if(state!="OK"){
					JAlert(state);
					return;
				}
				now=res.now;
				if(now==2){
					$("#e"+id).hide(250);
				}else{
					o=$(o);
					o.removeClass(color[now-1]).addClass(color[now]);
					o.html(" "+words[now]);
				}
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
	}else if(type=="trash"||type=="delete"){
		if(!window.confirm(type=="trash"?"废弃待办事项吗？":"删除待办事项吗？")){
			return;
		}
		$.ajax({
			type:"post",
			url:window.WEB_CONFIG_ROOT+"event/index.htm",
			data:{type:type,id:id},
			dataType:"json",
			async:false,
			success:function(res){
				var state=res.state;
				if(state!="OK"){
					JAlert(state);
					return;
				}
				if(total&&type=="trash"){
					window.location=location.href;
				}else{
					$("#e"+id).hide(250);
				}
			},
			error:function(r,s,e){
				JAlert(r.status);
			}
		});
	}
}
function JFeedback(o){
	var content=$(o).val();
	if(!content){
		return;
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"feedback/index.htm",
		data:{type:"save",content:content,address:location.href},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state=="OK"){
				$(o).val("");
				state="意见反馈成功";
			}
			var href=location.href;
			if(href.indexOf("admin/index.htm")!=-1||href.indexOf("feedback/index.htm")!=-1){
				window.location=location.href;
			}else{
				JAlert(state);
			}
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function JFile(o,upload){
	var action=o.value;
	if(action){
		if(upload){
			action=location.href.indexOf("blog/article/image.htm")!=-1?cloud+"article/image/"+action+".htm":"data/"+action.substring(0,2)+"/"+action;
		}
		JTarget(action,[new Date().getTime()]);
	}
}
function JTarget(action,ids,method,name){
	if(!method){
		method="get";
	}
	name=name?name:"ids";
	var h="";
	for(var i=0;i<ids.length;i++){
		h+="<input type=\"hidden\" value=\""+ids[i]+"\" name=\""+name+"\">";
	}
	var o=$("#j_target");
	if(!o.length){
		o=$("<form style=\"display:none;\" target=\"_blank\" id=\"j_target\"><input type=\"submit\"></form>");
		$("body").append(o);
	}
	o.attr({action:action,method:method});
	o.find("input[type='hidden']").remove();
	o.prepend(h);
	o.find("input[type='submit']").click();
}
function JTrace(url){
	if(!window.KEEY_LOCAL_ADDRESS){
		return;
	}
	if(url){
		window.history.pushState({},document.title,url);
	}else{
		url=location.href;
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"share/track.htm",
		data:{url:url},
		dataType:"json",
		async:false,
		success:function(res){},
		error:function(){}
	});
}
function JUpload(o,accect,id){
	var target="j_upload_frame_"+id;
	var form="j_upload_form_"+id;
	var file="j_upload_file_"+id;
	var text=$("#"+id);
	var input=$("#"+file);
	if(!$("#"+target).length){
		$(document.body).append("<iframe style=\"display:none;\" name=\""+target+"\" id=\""+target+"\"></iframe><form style=\"display:none;\" action=\""+window.WEB_CONFIG_ROOT+"share/upload.htm\" method=\"post\" enctype=\"multipart/form-data\" encoding=\"multipart/form-data\" target=\""+target+"\" id=\""+form+"\"><input type=\"file\" name=\""+file+"\" id=\""+file+"\"></form>");
		input=$("#"+file);
		input.attr("accept",accect).change(function(){
			var v=$(this).val();
			if(!v){
				text.val("");
				o.innerHTML="选择文件";
				o.title="请先选择文件";
				return;
			}
			o.innerHTML="上传文件";
			o.title="点击上传文件["+v+"]";
		});
		$("#"+target).load(function(){
			try{
				if(!window.attachEvent){
					var frame=document.getElementById(target);
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
						if(data.datas[0].state=="OK"){
							text.val(data.datas[0].id);
						}else{
							text.val("");
							JAlert(data.datas[0].state);
						}
					}else{
						text.val("");
						JAlert(data.state);
					}
					o.innerHTML="选择文件";
					o.title="请先选择文件";
					input.val("");
				}
			}catch(ev){
				text.val("");
				o.innerHTML="选择文件";
				o.title="请先选择文件";
				input.val("");
				JAlert("上传文件失败");
			}
		});
	}
	if(!input.val()){
		o.innerHTML="选择文件";
		o.title="请先选择文件";
		input.click();
		return;
	}
	try{
		$("#"+form).submit();
	}catch(e){
		JAlert("上传文件失败！请使用非IE浏览器");
	}
}
$(document).ready(function(){
	var power=$("#j_power").val();
	if(power){
		power=$("#j_menu a[href='"+power+"']");
		power.css("color","#DD514C");
		power=power.parent("li").parent("ul");
		if(power.prev().length){
			power.addClass("am-in");
			power.prev().css("color","#DD514C");
		}
	}
	$("#j_deep").submit(function(e){
		if(!$(this).find("input").val()){
			return false;
		}
	});
	if($("#j_menu").length>0){
		$("#j_left").click(function(){
			$("#j_menu").toggle(400);
		});
	}else{
		$("#j_left").remove();
		$.each($(".j_left"),function(){
			var o=$(this);
			o.css("bottom",parseInt(o.css("bottom"))-32+"px");
		});
	}
	$("#j_top").click(function(){
		$(this).css("opacity",0);
		$("#j_right").animate({scrollTop:0},250);
	});
	$("#j_right").scroll(function(){
		$("#j_top").css("opacity",$(this).scrollTop()>20?0.5:0);
	});
	if($.AMUI.fullscreen.enabled){
		$("#j_screen").click(function(){
			$.AMUI.fullscreen.toggle();
		});
		$(document).on($.AMUI.fullscreen.raw.fullscreenchange,function(){
			$("#j_screen").attr("class",$.AMUI.fullscreen.isFullscreen?"am-icon-compress":"am-icon-arrows-alt");
		});
	}
	window.setTimeout(function(){
		if(location.href.indexOf("/list.htm")==-1){
			JTrace();
		}
	},1000);
});
window.onerror=function(msg,url,line){
	if(url.indexOf("amazeui.min-2.6.2.js")!=-1||url.indexOf("ueditor.all.min-1.4.3.3.js")!=-1){
		return true;
	}
	var r="页面报错！\n";
	r+="错误信息:"+msg+"\n";
	r+="出错url:"+url+"\n";
	r+="出错行数:"+line+"\n";
	r+="点击继续";
	window.alert(r);
	return true;
};
/*
j_alert：消息弹框
j_bar：分页导航
j_daily：操作日志
j_deep：全站搜索
j_donate：赞助支持
j_event：待办事项
j_excel：表格导出
j_form：提交表单
j_head：头部菜单
j_hold：全局容器
j_left：左侧现隐
j_line：行列信息
j_menu：左侧菜单
j_notify：收件箱数
j_popup：文本弹框
j_power：当前权限
j_right：左边区域
j_screen：开启全屏
j_search：搜索条件
j_table：列表对象
j_target：链接跳转
j_term：现隐条件
j_top：滚到顶部
j_upload：文件上传
j_user：选择用户
*/