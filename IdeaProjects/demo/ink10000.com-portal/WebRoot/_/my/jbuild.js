function JBuildCode(ids){
	if(typeof ids=="number"){
		JTarget(window.WEB_CONFIG_ROOT+"auto/field/code.htm",[ids],"get","id");
	}else{
		if(!ids||!ids.length){
			ids=JPageCheck();
			if(!ids.length){
				return;
			}
		}
		JTarget(window.WEB_CONFIG_ROOT+"auto/field/code.htm",ids);
	}
}
function JBuildDown(ids){
	if(typeof ids=="number"){
		JTarget(window.WEB_CONFIG_ROOT+"auto/field/down.htm",[ids],"get","id");
	}else{
		if(!ids||!ids.length){
			ids=JPageCheck();
			if(!ids.length){
				return;
			}
		}
		JTarget(window.WEB_CONFIG_ROOT+"auto/field/down.htm",ids);
	}
}
function JBuildScript(ids,id){
	if(!ids&&!id){
		ids=JPageCheck();
		if(ids.length<1){
			return;
		}
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"auto/field/script.htm",
		data:{ids:ids,id:id},
		dataType:"html",
		async:false,
		success:function(res){
			$("#j_popup .am-popup-title").html("表结构脚本");
			$("#j_popup .am-popup-bd").html(res);
			$("#j_popup").modal();
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}
function JBuildTask(ids,id,o){
	if(!ids&&!id){
		ids=JPageCheck();
		if(ids.length<1){
			return;
		}
	}
	$.ajax({
		type:"post",
		url:window.WEB_CONFIG_ROOT+"auto/field/build.htm",
		data:{ids:ids,id:id},
		dataType:"json",
		async:false,
		success:function(res){
			var state=res.state;
			if(state=="OK"){
				state="重建代码成功";
				if(o){
					o.removeClass("am-text-danger").addClass("am-text-secondary");
				}
			}
			JAlert(state);
		},
		error:function(r,s,e){
			JAlert(r.status);
		}
	});
}