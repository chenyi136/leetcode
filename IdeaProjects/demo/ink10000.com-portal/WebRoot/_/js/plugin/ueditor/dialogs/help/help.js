function clickHandler(tabHeads,tabBodys,obj){
	for(var k=0;k<tabHeads.length;k++){
		tabHeads[k].className="";
	}
	obj.className="focus";
	var tabSrc=obj.getAttribute("tabSrc");
	for(var j=0;j<tabBodys.length;j++){
		var body=tabBodys[j];
		body.onclick=function(){
			this.style.zoom=1;
		};
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
switchTab("helptab");
document.getElementById("version").innerHTML=parent.UE.version;