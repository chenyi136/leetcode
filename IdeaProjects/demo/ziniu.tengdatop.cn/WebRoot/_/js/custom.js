function JProgramDrop(id){
	if(!window.confirm("你确认要删除该方案及其下的抓取词语、舆情分析、舆情追踪等数据吗")){
		return;
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"program/drop.htm",
		data:{id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(id);
				return;
			}
			location.href=window.WEB_CONFIG_ROOT+"program/load.htm";
		},
		error:function(){
			window.alert("请求失败！请稍后重试");
		}
	});
}
function JProgramEvent(){
	$("#j_program .panel .panel-minimize").unbind("click").click(function(){
		var o=$(this);
		var p=o.closest(".panel");
		if(o.hasClass("maximize")){
			p.find(".panel-body").slideDown(200);
			o.removeClass("maximize");
		}else{
			p.find(".panel-body").slideUp(200);
			o.addClass("maximize");
		}
		return false;
	});
	$("#j_program .panel .panel-btns").unbind("click").click(function(){
		$(this).find(".operate_box").show();
	});
	$("#j_program .panel").unbind("mouseleave").mouseleave(function(){
		$(this).find(".operate_box").hide(200);
	});
}
function JProgramKeyword(id){
	var name=window.prompt("请输入用于抓取网页的关键字\n不能超过10个字符","");
	if(!name||name.length>10){
		return;
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"keyword/save.htm",
		data:{id:id,name:name},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(state);
				return;
			}
			var html="<div class=\"info-box clear\">";
			html+="<div class=\"info-left\"><div class=\"info-left-child\">"+name+"</div></div>";
			html+="<div class=\"info-right\"><input type=\"radio\" class=\"vm\" value=\""+res.id+"\" name=\"keyword\" onclick=\"search()\"></div>";
			html+="</div>";
			$("#j_program div[lang='"+id+"'] .popover-example").prepend(html);
			var o=$("#j_program div[lang='"+id+"'] .panel-minimize");
			if(o.hasClass("maximize")){
				$("#j_program div[lang='"+id+"'] .panel-body").slideDown(200);
				o.removeClass("maximize");
			}
		},
		error:function(){
			window.alert("请求失败！请稍后重试");
		}
	});
}
function JProgramQueue(id,order){
	var now=$("#j_program div[lang='"+id+"']");
	var him=order?now.prev():now.next();
	if(!him.is("div")){
		return;
	}
	var datas=[];
	datas[0]=[now.attr("lang"),him.find("input[type='hidden']").val()];
	datas[1]=[him.attr("lang"),now.find("input[type='hidden']").val()];
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"program/queue.htm",
		data:JSON.stringify(datas),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(state);
				return;
			}
			now.find("input[type='hidden']").val(datas[0][1]);
			him.find("input[type='hidden']").val(datas[1][1]);
			var tmp=now.clone();
			if(order){
				him.before(tmp);
			}else{
				him.after(tmp);
			}
			tmp.find(".operate_box").hide(200);
			now.remove();
			JProgramEvent();
		},
		error:function(){
			window.alert("请求失败！请稍后重试");
		}
	});
}
function JSummaryList(o,type,keyword,opt){
	o=$(o);
	var en=new Object();
	en.type=type;
	en[o.attr("name")]=o.val();
	if(keyword){
		en.keyword=keyword;
	}
	if (type=="index_table_media_time"||type=="index_pie_media_time"){
		if(en.hasOwnProperty("engine")){
			en.time=$("#index_pie_media_time_1").val();
		}else{
			en.engine=$("#index_table_media_time_1").val();
		}
	}else if(type=="pie_media_time"){
		if(en.hasOwnProperty("engine")){
			en.time=$("#pie_media_time_2").val();
		}else{
			en.engine=$("#pie_media_time_1").val();
		}
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"list.htm",
		data:en,
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(state);
				return;
			}
			var datas=res.datas;
			if(type=="index_pie_engine_time"){
				var keys=[];
				var vals=[];
				for(var key in datas){
					keys[keys.length]=key;
					vals[vals.length]=datas[key];
				}
				opt.legend.data=keys;
				opt.series[0].name="按来源类型占比图";
				opt.series[0].data=vals;
				echarts.init(document.getElementById(type)).setOption(opt);
			}else if(type=="index_table_media_time"){
				var h="";
				for(var i=0;i<datas.length;i++){
					var data=datas[i];
					h+="<tr>";
					for(var j=0;j<data.length;j++){
						h+="<td>"+(data[j]?data[j]:0)+"</td>";
					}
					h+="</tr>";
				}
				$("#"+type).html(h);
				var datas2=res.datas2;
				var keys=[];
				var vals=[];
				for(var key in datas2){
					keys[keys.length]=key;
					vals[vals.length]=datas2[key];
				}
				opt.legend.data=keys;
				opt.series[0].name="按来源媒体占比图";
				opt.series[0].data=vals;
				echarts.init(document.getElementById("index_pie_media_time")).setOption(opt);
			}else if(type=="index_pie_media_time"){
				var keys=[];
				var vals=[];
				for(var key in datas){
					keys[keys.length]=key;
					vals[vals.length]=datas[key];
				}
				opt.legend.data=keys;
				opt.series[0].name="按来源媒体占比图";
				opt.series[0].data=vals;
				echarts.init(document.getElementById(type)).setOption(opt);
			}else if(type=="index_table_media_total"){
				var color=["btn-warning","btn-success","btn-danger","btn-default"];
				var h="";
				for(var i=0;i<datas.length;i++){
					h+="<div class=\"lists clear\">";
					h+="<div class=\"left\">"+datas[i]+"</div>";
					h+="<div class=\"right\"><span class=\"btn "+(i<3?color[i]:color[3])+"\">No."+(i+1)+"</span></div>";
					h+="</div>";
				}
				$("#"+type).html(h);
			}else if(type=="index_line_media_day"){
				var keys=[];
				var vals=[];
				for(var key in datas.series){
					keys[keys.length]=key;
					vals[vals.length]=datas.series[key];
				}
				opt.legend.data=keys;
				opt.series=vals;
				echarts.init(document.getElementById(type)).setOption(opt);
			}else if(type=="pie_engine_time"){
				var keys=[];
				var vals=[];
				for(var key in datas){
					keys[keys.length]=key;
					vals[vals.length]=datas[key];
				}
				opt.legend.data=keys;
				opt.series[0].name="按来源类型占比图";
				opt.series[0].data=vals;
				echarts.init(document.getElementById(type)).setOption(opt);
			} else if(type=="table_media_time"){
				var h="";
				for(var i=0;i<datas.length;i++){
					var data=datas[i];
					h+="<tr>";
					for(var j=0;j<data.length;j++){
						h+="<td>"+(data[j]?data[j]:0)+"</td>";
					}
					h+="</tr>";
				}
				$("#"+type).html(h);
			} else if(type=="pie_media_time"){
				var keys=[];
				var vals=[];
				for(var key in datas){
					keys[keys.length]=key;
					vals[vals.length]=datas[key];
				}
				opt.legend.data=keys;
				opt.series[0].name="按来源媒体占比图";
				opt.series[0].data=vals;
				echarts.init(document.getElementById(type)).setOption(opt);
			}else if(type=="table_media_total"){
				var h="";
				for(var i=0;i<datas.length;i++){
					var data=datas[i];
					h+="<tr>";
					h+=i>0?"<td class=\"c333 ta-l\"><span class=\"c999\">Top "+i+"</span> "+data[0]+"</td>":"<td class=\"c333 ta-l\">"+data[0]+"</td>";
					for(var j=1;j<data.length;j++){
						h+="<td>"+(data[j]?data[j]:0)+"</td>";
					}
					h+="</tr>";
				}
				$("#"+type).html(h);
			}
		},
		error:function(){
			window.alert("请求失败！请稍后重试");
		}
	});
}
function JTraceStore(o,id){
	o=$(o);
	var store=o.attr("lang");
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"trace/store.htm",
		data:{id:id,store:store?store:0},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				window.alert(state);
				return;
			}
			if(store){
				if(store=="1"){
					o.attr("lang",0);
					o.text("移除收藏");
				}else{
					o.attr("lang",1);
					o.text("加入收藏");
				}
			}else{
				o.parent("td").parent("tr").remove();
			}
		},
		error:function(){
			window.alert("请求失败！请稍后重试");
		}
	});
}
jQuery(document).ready(function(){
	$(".leftpanel .nav .parent>a").click(function(){
		$(".leftpanel .nav .parent-focus").each(function(){
			var o=$(this);
			o.find(".children").slideUp("fast");
			o.removeClass("parent-focus");
		});
		var p=$(this).parent();
		var o=p.find(".children");
		if(o.is(":visible")){
			o.slideUp("fast");
			p.removeClass("parent-focus");
		}else{
			o.slideDown("fast");
			if(!p.hasClass("active")){
				p.addClass("parent-focus");
			}
		}
		return false;
	});
	JProgramEvent();
	$.datepicker.regional["zh-CN"]={
		clearText:"清除",
		clearStatus:"清除已选日期",
		closeText:"关闭",
		closeStatus:"不改变当前选择",
		prevText:"&lt; 上月",
		prevStatus:"显示上月",
		prevBigText:"&lt;&lt;",
		prevBigStatus:"显示上一年",
		nextText:"下月&gt;",
		nextStatus:"显示下月",
		nextBigText:"&gt;&gt;",
		nextBigStatus:"显示下一年",
		currentText:"今天",
		currentStatus:"显示本月",
		monthNames:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		monthNamesShort:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
		monthStatus:"选择月份",
		yearStatus:"选择年份",
		weekHeader:"周",
		weekStatus:"年内周次",
		dayNames:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
		dayNamesShort:["周日","周一","周二","周三","周四","周五","周六"],
		dayNamesMin:["日","一","二","三","四","五","六"],
		dayStatus:"设置 DD 为一周起始",
		dateStatus:"选择 m月 d日,DD",
		dateFormat:"yy-mm-dd",
		firstDay:1,
		initStatus:"请选择日期",
		isRTL:false
	}; 
	$.datepicker.setDefaults($.datepicker.regional["zh-CN"]);
	$(".datepicker").datepicker();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	jQuery(".tooltips").tooltip({container:"body"});
	jQuery(".popovers").popover();
	jQuery(".panel .panel-close").click(function(){
		jQuery(this).closest(".panel").fadeOut(200);
		return false;
	});
	jQuery(".menu-collapse").click(function(){
		if(!$("body").hasClass("hidden-left")){
			if($(".headerwrapper").hasClass("collapsed")){
				$(".headerwrapper,.mainwrapper").removeClass("collapsed");
			}else{
				$(".headerwrapper,.mainwrapper").addClass("collapsed");
				$(".children").hide(); // hide sub-menu if leave open
			}
		}else{
			if(!$("body").hasClass("show-left")){
				$("body").addClass("show-left");
			}else{
				$("body").removeClass("show-left");
			}
		}
		return false;
	});
	jQuery(".leftpanel .nav li").hover(function(){
		$(this).addClass("nav-hover");
	},function(){
		$(this).removeClass("nav-hover");
	});
	jQuery(window).resize(function(){
		hideMenu();
	});
	hideMenu();
	function hideMenu(){
		if($(".header-right").css("position")=="relative"){
			$("body").addClass("hidden-left");
			$(".headerwrapper,.mainwrapper").removeClass("collapsed");
		}else{
			$("body").removeClass("hidden-left");
		}
		if($(window).width()<=480){
			if($(".leftpanel .form-search").length==0){
				$(".form-search").insertAfter($(".profile-left"));
			}
		}else{
			if($(".header-right .form-search").length==0){
				$(".form-search").insertBefore($(".btn-group-notification"));
			}
		}
	}
	collapsedMenu();
	function collapsedMenu(){
		if($(".logo").css("position")=="relative"){
			$(".headerwrapper,.mainwrapper").addClass("collapsed");
		}else{
			$(".headerwrapper,.mainwrapper").removeClass("collapsed");
		}
	}
	if($.fn.slimScroll){
		$(".widget-todo ul").slimscroll({height:"300px",wheelStep:35});
	}
});
window.onerror=function(e,url,line){
	var r="页面报错！\n";
	r+="错误信息:"+e+"\n";
	r+="出错url:"+url+"\n";
	r+="出错行数:"+line+"\n";
	r+="点击继续";
	window.alert(r);
	return true;
};