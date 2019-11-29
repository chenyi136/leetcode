editor.firstForSR=0;
editor.currentRangeForSR=null;
function clickHandler(tabHeads,tabBodys,obj){
	for(var k=0;k<tabHeads.length;k++){
		tabHeads[k].className="";
	}
	obj.className="focus";
	var tabSrc=obj.getAttribute("tabSrc");
	for(var j=0;j<tabBodys.length;j++){
		var body=tabBodys[j];
		body.style.zIndex=body.getAttribute("id")!=tabSrc?1:200;
	}
}
function switchTab(tabParentId){
	var tabElements=$G(tabParentId).children,tabHeads=tabElements[0].children,tabBodys=tabElements[1].children;
	for(var i=0;i<tabHeads.length;i++){
		var head=tabHeads[i];
		if(head.className==="focus"){
			clickHandler(tabHeads,tabBodys,head);
		}
		head.onclick=function(){
			clickHandler(tabHeads,tabBodys,this);
		};
	}
}
$G("searchtab").onmousedown=function(){
	$G("search-msg").innerHTML="";
	$G("replace-msg").innerHTML="";
};
function getMatchCase(id){
	return $G(id).checked?true:false;
}
$G("nextFindBtn").onclick=function(txt,dir,mcase){
	var findtxt=$G("findtxt").value;
	if(!findtxt){
		return false;
	}
	if(!frCommond({searchStr:findtxt,dir:1,casesensitive:getMatchCase("matchCase")})){
		$G("search-msg").innerHTML=lang.getEnd;
		editor.selection.getRange().moveToBookmark(editor.selection.getRange().createBookmark()).select();
	}
};
$G("nextReplaceBtn").onclick=function(txt,dir,mcase){
	var findtxt=$G("findtxt1").value;
	if(!findtxt){
		return false;
	}
	frCommond({searchStr:findtxt,dir:1,casesensitive:getMatchCase("matchCase1")});
};
$G("preFindBtn").onclick=function(txt,dir,mcase){
	var findtxt=$G("findtxt").value;
	if(!findtxt){
		return false;
	}
	if(!frCommond({searchStr:findtxt,dir:-1,casesensitive:getMatchCase("matchCase")})){
		$G("search-msg").innerHTML=lang.getStart;
	}
};
$G("preReplaceBtn").onclick=function(txt,dir,mcase){
	var findtxt=$G("findtxt1").value;
	if(!findtxt){
		return false;
	}
	frCommond({searchStr:findtxt,dir:-1,casesensitive:getMatchCase("matchCase1")});
};
$G("repalceBtn").onclick=function(){
	var findtxt=$G("findtxt1").value.replace(/^\s|\s$/g,"");
	if(!findtxt){
		return false;
	}
	var replacetxt=$G("replacetxt").value.replace(/^\s|\s$/g,"");
	if(findtxt==replacetxt||(!getMatchCase("matchCase1")&&findtxt.toLowerCase()==replacetxt.toLowerCase())){
		return false;
	}
	frCommond({searchStr:findtxt,dir:1,casesensitive:getMatchCase("matchCase1"),replaceStr:replacetxt});
};
$G("repalceAllBtn").onclick=function(){
	var findtxt=$G("findtxt1").value.replace(/^\s|\s$/g,"");
	if(!findtxt){
		return false;
	}
	var replacetxt=$G("replacetxt").value.replace(/^\s|\s$/g,"");
	if(findtxt==replacetxt||(!getMatchCase("matchCase1")&&findtxt.toLowerCase()==replacetxt.toLowerCase())){
		return false;
	}
	var num=frCommond({searchStr:findtxt,casesensitive:getMatchCase("matchCase1"),replaceStr:replacetxt,all:true});
	if(num){
		$G("replace-msg").innerHTML=lang.countMsg.replace("{#count}",num);
	}
};
var frCommond=function(obj){
	return editor.execCommand("searchreplace",obj);
};
switchTab("searchtab");