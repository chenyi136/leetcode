(function(){
	var me=editor,preview=$G("preview"),preitem=$G("preitem"),tmps=templates,currentTmp=null;
	var initPre=function(){
		var str="";
		for(var i=0,tmp;tmp=tmps[i++];){
			str+="<div class=\"preitem\" onclick=\"pre("+i+")\"><img src=\"\images/"+tmp.pre+"\""+(tmp.title?" alt=\""+tmp.title+"\" title=\""+tmp.title:"\"")+"></div>";
		}
		preitem.innerHTML=str;
	};
	var pre=function(n){
		var tmp=tmps[n-1];
		currentTmp=tmp;
		clearItem();
		domUtils.setStyles(preitem.childNodes[n-1],{"background-color":"lemonChiffon","border":"1px solid #CCC"});
		preview.innerHTML=tmp.preHtml?tmp.preHtml:"";
	};
	var clearItem=function(){
		var items=preitem.children;
		for(var i=0,item;item=items[i++];){
			domUtils.setStyles(item,{"background-color":"","border":"1px solid #FFF"});
		}
	};
	dialog.onok=function(){
		if(!$G("issave").checked){
			me.execCommand("cleardoc");
		}
		me.execCommand("template",{html:currentTmp&&currentTmp.html});
	};
	initPre();
	window.pre=pre;
	pre(2);
})();