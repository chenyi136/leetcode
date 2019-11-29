var JPage={size:window.LEAF_DEF_SIZE,tabs:0,now:1,show:0,order:null,queue:false,cell:0};
var JPageOrder=["am-icon-arrows-v","am-icon-long-arrow-up","am-icon-long-arrow-down"];
var JPageLink=[null,null,null];
var JPageCell=null;
var JPageList=new function(datas){};
function JPageCheck(){
	var res=[];
	$.each($("#j_table [name='ids']:checked"),function(){
		res[res.length]=$(this).val();
	});
	return res;
}
function JPageDrop(ids){
	if(!ids){
		ids=JPageCheck();
	}
	if(ids.length<1||!JPageLink[1]||!window.confirm("确认删除吗？")){
		return;
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+JPageLink[1],
		data:{ids:ids},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state!="OK"){
				JAlert(state);
				return;
			}
			JAlert("删除了 "+res.count+" 条数据");
			JPageSend(JPage.now);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function JPageEffect(){
	//提示文字
	$("#j_table td[data-am-popover]").popover();
	//全选监听
	$("#j_table input[lang='ids']").uCheck("uncheck").unbind("click").click(function(){
		var vs=this.checked?"check":"uncheck";
		var os=$("#j_table [name='ids']");
		$("#j_table input[lang='ids']").uCheck(vs);
		$("#j_table input[lang='check']").val(this.checked?os.length:0);
		os.uCheck(vs);
	});
	//行选监听
	$("#j_table [name='ids']").uCheck().click(function(){
		var vs=JPageCheck().length;
		$("#j_table input[lang='ids']").uCheck($("#j_table [name='ids']").length==vs?"check":"uncheck");
		$("#j_table input[lang='check']").val(vs);
	});
}
function JPageExcel(){
	var open=$("#j_excel input[lang='open']");
	if(open.val()=="0"){
		open.remove();
		$("#j_excel input[type='checkbox']").click(function(){
			var o=$(this);
			var v=eval(o.val());
			var p=o.parent("td");
			if(o.is(":checked")){
				p.find("[name='width']").val(v[1]);
				p.find("[name='clazz']").val(v[2]);
				p.find("[name='frame']").val(v[3]);
				p.find("[name='title']").val(v[4]);
				p.find("[name='custom']").val(v[5]);
			}else{
				p.find("[name='width']").val("");
				p.find("[name='clazz']").val("");
				p.find("[name='frame']").val("");
				p.find("[name='title']").val("");
				p.find("[name='custom']").val("");
			}
		});
	}
	$("#j_excel").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var tmp=$("#j_excel [name='query']:checked").val();
			if(tmp!="2"){
				var rows=JPageCheck();
				if(tmp=="0"&&rows.length<1){
					return;
				}
				$("#j_excel [name='rows']").val(rows.join(","));
			}
			$("#j_excel [name='href']").val(location.href);
			$("#j_excel form").submit();
		},
		onCancel:function(n){}
	});
}
function JPageInit(param,callback){
	$("#j_search").attr("title","清空[Delete]，搜索[Enter]，首页[Home]，上页[←]，下页[→]，尾页[End]，条数[↑/↓]");
	if(param.size>0){
		JPage.size=param.size;
	}
	JPage.now=param.now;
	JPage.order=param.order;
	JPage.queue=param.queue;
	JPage.cell=$("#j_table thead th").length;
	JPageLink=param.link;
	JPageList=callback;
	//参数设值
	JPageValue(param.equal);
	JPageValue(param.like);
	JPageValue(param.custom);
	JPageSend(param.now);
	//拖拽监听
	var table=document.getElementsByTagName("table");
	for(var k=0;k<table.length;k++){
		if(table[k].className.indexOf("am-table")==-1){
			continue;
		}
		var th=table[k].getElementsByTagName("th");
		for(var i=0;i<th.length;i++){
			th[i].onmousedown=function(){
				JPageCell=this;
				if(event.offsetX>JPageCell.offsetWidth-20){
					JPageCell.press=true;
					JPageCell.ow=JPageCell.offsetWidth;
					JPageCell.ox=event.x;
				}
			};
			th[i].onmousemove=function(event){
				this.style.cursor=event.offsetX>this.offsetWidth-20?"col-resize":"default";
				if(!JPageCell){
					JPageCell=this;
				}
				if(JPageCell.press){
					var w=event.x+JPageCell.ow-JPageCell.ox;
					if(w>0){
						JPageCell.style.width=w+"px";
						JPageCell.style.cursor="col-resize";
					}
					var tmp=JPageCell;
					while(tmp.tagName.toLowerCase()!="table"){
						tmp=tmp.parentElement;
					}
					var n=JPageCell.cellIndex;
					for(var j=0;j<tmp.length;j++){
						tmp[j].cells[n].width=JPageCell.width+"px";
					}
				}
			};
			th[i].onmouseup=function(){
				if(!JPageCell){
					JPageCell=this;
				}
				JPageCell.press=false;
				JPageCell.style.cursor="default";
			};
			//双击求和
			th[i].ondblclick=function(){
				var tmp=this;
				while(tmp.tagName.toLowerCase()!="table"){
					tmp=tmp.parentElement;
				}
				var n=this.cellIndex;
				var t=0;
				for(var j=0;j<tmp.rows.length;j++){
					if(n<tmp.rows[j].cells.length){
						var v=tmp.rows[j].cells[n].innerHTML;
						if(!isNaN(v)){
							t+=parseFloat(v);
						}
					}
				}
				JAlert("【"+(this.innerHTML.indexOf("<")!=-1?this.innerHTML.substring(0,this.innerHTML.indexOf("<")):this.innerHTML)+"】求和为 "+t,5000);
			};
		}
	}
	//现隐条件
	$("#j_search").prepend("<div id=\"j_term\"></div>");
	$("#j_term").click(function(){
		var o0=$(this);
		var o1=$("#j_search>div[class]");
		if(o1.css("display")=="none"){
			o0.css("transform","rotate(45deg)");
			o1.show(400);
		}else{
			o0.css("transform","rotate(225deg)");
			o1.hide(400);
		}
	});
	//清空监听
	$("#j_search a[type='reset']").click(function(){
		$.each($("#j_search input[name]"),function(){
			var o=$(this);
			if(o.attr("disabled")){
				return;
			}
			if(o.attr("data-am-datepicker")){
				o.datepicker("setValue",new Date());
			}else{
				o.val("");
			}
		});
		var os=$("#j_search select[name]");
		if(os.length){
			$.each(os,function(){
				var o=$(this);
				if(o.find("option:selected").index()!=0){
					o.find("option:not(:eq(0))").attr("selected",false);
					o.find("option").eq(0).attr("selected",true);
				}
			});
		}else{
			JPageSend(JPage.now);
		}
	});
	//提交监听
	$("#j_search a[type='submit']").click(function(){
		JPageSend(1);
	});
	//快捷监听
	$("#j_search select[name]").change(function(){
		JPageSend(1);
	});
	document.onkeydown=function(e){
		if($(e.target).closest("#j_deep").length){
			return;
		}
		var c=e.keyCode;
		if(c==46){
			$("#j_search a[type='reset']").click();
		}else if(c==13){
			JPageSend(1);
		}else if(c==37){
			if(!$(".am-pureview.am-pureview-bar-active.am-active").length&&JPage.now>1){
				JPageSend(JPage.now-1);
			}
		}else if(c==39){
			if(!$(".am-pureview.am-pureview-bar-active.am-active").length&&JPage.now<JPage.tabs){
				JPageSend(JPage.now+1);
			}
		}else if(c==35){
			if(JPage.now<JPage.tabs){
				JPageSend(JPage.tabs);
			}
		}else if(c==36){
			if(JPage.now>1){
				JPageSend(1);
			}
		}else if(c==38){
			c=Math.min(JPage.size,JPage.show);
			if(c-window.LEAF_MOVE_SIZE>0){
				JPage.size=c-window.LEAF_MOVE_SIZE;
				$("#j_table input[lang='size']").val(JPage.size);
				JPageSend(JPage.now);
			}
		}else if(c==40){
			if(JPage.size+window.LEAF_MOVE_SIZE<=window.LEAF_MAX_SIZE){
				JPage.size+=window.LEAF_MOVE_SIZE;
				$("#j_table input[lang='size']").val(JPage.size);
				JPageSend(JPage.now);
			}
		}
	};
	//排序监听
	$("#j_table th:not(:first-child) i[tabindex]").click(function(){
		var o=$(this);
		var v=false;
		if(o.is("."+JPageOrder[0])){
			$.each(o.parent("th").siblings(),function(){
				if($(this).is(":has(i[tabindex])")){
					$(this).find("i").removeClass(JPageOrder[1]).removeClass(JPageOrder[2]).addClass(JPageOrder[0]);
				}
			});
			o.removeClass(JPageOrder[0]).addClass(JPageOrder[2]);
		}else if(o.is("."+JPageOrder[1])){
			o.removeClass(JPageOrder[1]).addClass(JPageOrder[2]);
		}else if(o.is("."+JPageOrder[2])){
			o.removeClass(JPageOrder[2]).addClass(JPageOrder[1]);
			v=true;
		}
		JPage.order=o.attr("tabindex");
		JPage.queue=v;
		JPageSend(JPage.now);
	});
	//每页监听
	$("#j_table input[lang='size']").blur(function(){
		var vs=parseInt($(this).val(),10);
		if(!vs){
			vs=JPage.size;
		}
		if(vs>window.LEAF_MAX_SIZE){
			vs=window.LEAF_MAX_SIZE;
		}
		$("#j_table input[lang='size']").val(vs);
		if(vs!=JPage.size){
			JPage.size=vs;
			JPageSend(JPage.now);
		}
	});
	//跳页监听
	$("#j_table input[lang='now']").blur(function(){
		var vs=parseInt($(this).val(),10);
		if(!vs){
			vs=JPage.now;
		}
		if(vs>JPage.tabs){
			vs=JPage.tabs;
		}
		$("#j_table input[lang='now']").val(vs);
		if(vs!=JPage.now){
			JPageSend(vs);
		}
	});
}
function JPageLoad(id){
	if(JPageLink[2]){
		location.href=window.WEB_CONFIG_ROOT+JPageLink[2]+"?"+window.KEY_JUMP_PAGING+"="+JBase64(JPageParam(JPage.now))+(id?"&"+window.JDBC_PRIMARY_FIELD+"="+id:"");
	}
}
function JPageParam(now){
	var en=new Object();
	en.size=JPage.size;
	en.now=now;
	en.order=JPage.order;
	en.queue=JPage.queue;
	//查询参数
	en.equal=[];
	en.like=[];
	en.custom=[];
	$.each($("#j_search [name]"),function(){
		var o=$(this);
		var v=o.val();
		var tag=this.tagName.toLowerCase();
		if(!v||v=="-1"&&tag=="select"){
			return;
		}
		switch(parseInt(o.attr("lang"))){
			case 0:en.equal[en.equal.length]={tag:tag,value:v,name:o.attr("name")};break;
			case 1:en.like[en.like.length]={tag:tag,value:v,name:o.attr("name")};break;
			case 2:en.custom[en.custom.length]={tag:tag,value:v,name:o.attr("name")};break;
			default:window.alert("查询条件设置错误");break;
		}
	});
	return en;
}
function JPageSend(now,en){
	if(!en){
		en=JPageParam(now);
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+JPageLink[0],
		data:JSON.stringify(en),
		dataType:"json",
		contentType:"application/json;charset=UTF-8",
		async:false,
		beforeSend:function(){
			$("#j_table tbody").html("<tr><td colspan=\""+JPage.cell+"\">加载数据中...</td></tr>");
		},
		success:function(res){
			if(JPageLink[0]!="auto/work/list.htm"){
				JTrace(window.SHOW_JUMP_PAGING?window.WEB_CONFIG_ROOT+JPageLink[0]+"?"+window.KEY_JUMP_PAGING+"="+JBase64(en):null);
			}
			var state=res.state;
			if(state=="NO"){
				$("#j_table thead tr:last-child").hide();
				JPageTacit("暂无数据");
				return;
			}
			if(state!="OK"){
				JPageTacit(state);
				return;
			}
			//写入数据
			JPageList(res.datas);
			JPageEffect();
			//分页参数
			var pages=res.pages;
			var show=pages.show;
			var tabs=pages.tabs;
			var now=pages.now;
			JPage.tabs=tabs;
			JPage.now=now;
			JPage.show=show;
			$("#j_table input[lang='check']").val(0);
			$("#j_table input[lang='show']").val(show);
			$("#j_table input[lang='total']").val(pages.total);
			$("#j_table input[lang='size']").val(pages.size);
			$("#j_table input[lang='tabs']").val(tabs);
			$("#j_table input[lang='now']").val(now);
			if(show>10){
				$("#j_table thead tr:last-child").show();
			}else{
				$("#j_table thead tr:last-child").hide();
			}
			//分页导航
			var h="";
			if(tabs>=2){
				if(tabs<8){
					for(var i=1;i<=tabs;i++){
						h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JPageSend("+i+")\"")+">"+i+"</a></li>";
					}
				}else{
					if(now>1){
						h+="<li><a onclick=\"JPageSend(1)\" class=\"am-icon-fast-backward\"></a></li>";
						h+="<li><a onclick=\"JPageSend("+(now-1)+")\" class=\"am-icon-backward\"></a></li>";
					}
					if(now<=3){
						for(var i=1;i<=5;i++){
							h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JPageSend("+i+")\"")+">"+i+"</a></li>";
						}
						h+="<li class=\"am-disabled\"><a>...</a></li>";
					}else if(now>=tabs-2){
						h+="<li class=\"am-disabled\"><a>...</a></li>";
						for(var i=tabs-4;i<=tabs;i++){
							h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JPageSend("+i+")\"")+">"+i+"</a></li>";
						}
					}else{
						h+="<li class=\"am-disabled\"><a>...</a></li>";
						for(var i=now-2;i<=now+2;i++){
							h+="<li"+(i==now?" class=\"am-active\"":"")+"><a"+(i==now?"":" onclick=\"JPageSend("+i+")\"")+">"+i+"</a></li>";
						}
						h+="<li class=\"am-disabled\"><a>...</a></li>";
					}
					if(now<tabs){
						h+="<li><a onclick=\"JPageSend("+(now+1)+")\" class=\"am-icon-forward\"></a></li>";
						h+="<li><a onclick=\"JPageSend("+tabs+")\" class=\"am-icon-fast-forward\"></a></li>";
					}
				}
			}
			$("#j_bar").html(h);
		},
		error:function(r,s,e){
			JPageTacit("请求失败！错误码：<a href=\"https://baike.baidu.com/item/HTTP%E7%8A%B6%E6%80%81%E7%A0%81/5053660\" target=\"_blank\">"+r.status+"</a>");
		}
	});
}
function JPageTacit(state){
	$("#j_table tbody").html("<tr><td colspan=\""+JPage.cell+"\">"+state+"</td></tr>");
	$("#j_table input[lang='ids']").uCheck("uncheck");
	$("#j_table input[lang='check']").val(0);
	$("#j_table input[lang='show']").val(0);
	$("#j_table input[lang='total']").val(0);
	$("#j_table input[lang='tabs']").val(0);
	$("#j_table input[lang='now']").val(1);
	$("#j_bar").html("");
}
function JPageValue(ds){
	if(!ds||ds.length<1){
		return;
	}
	for(var i=0;i<ds.length;i++){
		var o=$("#j_search [name='"+ds[i].name+"']");
		switch(ds[i].tag){
			case "input":
				if(o.attr("data-am-datepicker")){
					o.datepicker("setValue",ds[i].value);
				}else{
					o.val(ds[i].value);
				}
				break;
			case "select":o.find("option[value='"+ds[i].value+"']").attr("selected",true);break;
		}
	}
}
function JPageUser(type,callback){
	var open=$("#j_user input[lang='open']");
	if(!open.val()){
		open.val(type);
		$("#j_user .am-btn").click(function(){
			var body=$("#j_user tbody");
			$.ajax({
				type:"post",
				url:window.WEB_CONFIG_ROOT+"share/user.htm",
				data:{name:$("#j_user input[type='text']").val()},
				dataType:"json",
				async:false,
				beforeSend:function(){
					body.html("<tr><td colspan=\"3\">加载数据中...</td></tr>");
				},
				success:function(res){
					var state=res.state;
					if(state!="OK"){
						body.html("<tr><td colspan=\"3\">"+state+"</td></tr>");
						return;
					}
					var type=$("#j_user input[lang='open']").val();
					var h="";
					for(var i=0;i<res.datas.length;i++){
						var data=res.datas[i];
						h+="<tr>";
						h+="<td><input type=\""+type+"\" value=\""+data.id+"\" name=\"ids\"></td>";
						h+="<td>"+data.username+"</td>";
						h+="<td>"+data.name+"</td>";
						h+="</tr>";
					}
					body.html(h);
				},
				error:function(r,s,e){
					body.html("<tr><td colspan=\"3\">请求失败！错误码："+r.status+"</td></tr>");
				}
			});
		});
		$("#j_user .am-btn").click();
	}
	$("#j_user").modal({
		relatedTarget:this,
		onConfirm:function(n){
			var res=[];
			$.each($("#j_user [name='ids']:checked"),function(){
				res[res.length]=$(this).val();
			});
			callback(res);
		},
		onCancel:function(n){
			callback([]);
		}
	});
}