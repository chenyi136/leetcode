(function(){
	var onlineImage=null,backupStyle=editor.queryCommandValue("background");
	window.onload=function(){
		initTabs();
		initColorSelector();
	};
	function initTabs(){
		var tabs=$G("tabHeads").children;
		for(var i=0;i<tabs.length;i++){
			domUtils.on(tabs[i],"click",function(e){
				var target=e.target||e.srcElement;
				for(var j=0;j<tabs.length;j++){
					if(tabs[j]==target){
						tabs[j].className="focus";
						var contentId=tabs[j].getAttribute("data-content-id");
						$G(contentId).style.display="block";
						if(contentId=="imgManager"){
							initImagePanel();
						}
					}else{
						tabs[j].className="";
						$G(tabs[j].getAttribute("data-content-id")).style.display="none";
					}
				}
			});
		}
	}
	function initColorSelector(){
		var obj=editor.queryCommandValue("background");
		if(obj){
			var color=obj["background-color"],repeat=obj["background-repeat"]||"repeat",image=obj["background-image"]||"",position=obj["background-position"]||"center center",pos=position.split(" "),x=parseInt(pos[0])||0,y=parseInt(pos[1])||0;
			if(repeat=="no-repeat"&&(x||y)){
				repeat="self";
			}
			image=image.match(/url[\s]*\(([^\)]*)\)/);
			updateFormState("colored",color,image?image[1]:"",repeat,x,y);
		}else{
			updateFormState();
		}
		var updateHandler=function(){
			updateFormState();
			updateBackground();
		};
		domUtils.on($G("nocolorRadio"),"click",updateBackground);
		domUtils.on($G("coloredRadio"),"click",updateHandler);
		domUtils.on($G("url"),"keyup",function(){
			if($G("url").value&&$G("alignment").style.display=="none"){
				utils.each($G("repeatType").children,function(item){
					item.selected="repeat"==item.getAttribute("value")?"selected":false;
				});
			}
			updateHandler();
		});
		domUtils.on($G("repeatType"),"change",updateHandler);
		domUtils.on($G("x"),"keyup",updateBackground);
		domUtils.on($G("y"),"keyup",updateBackground);
		initColorPicker();
	}
	function initColorPicker(){
		var me=editor,cp=$G("colorPicker");
		var popup=new UE.ui.Popup({
			content:new UE.ui.ColorPicker({
				noColorText:me.getLang("clearColor"),
				editor:me,
				onpickcolor:function(t,color){
					updateFormState("colored",color);
					updateBackground();
					UE.ui.Popup.postHide();
				},
				onpicknocolor:function(t,color){
					updateFormState("colored","transparent");
					updateBackground();
					UE.ui.Popup.postHide();
				}
			}),
			editor:me,
			onhide:function(){}
		});
		domUtils.on(cp,"click",function(){
			popup.showAnchor(this);
		});
		domUtils.on(document,"mousedown",function(e){
			UE.ui.Popup.postHide(e.target||e.srcElement);
		});
		domUtils.on(window,"scroll",function(){
			UE.ui.Popup.postHide();
		});
	}
	function initImagePanel(){
		onlineImage=onlineImage||new OnlineImage("imageList");
	}
	function updateFormState(radio,color,url,align,x,y){
		var nocolorRadio=$G("nocolorRadio"),coloredRadio=$G("coloredRadio");
		if(radio){
			nocolorRadio.checked=radio=="colored"?false:"checked";
			coloredRadio.checked=radio=="colored"?"checked":false;
		}
		if(color){
			domUtils.setStyle($G("colorPicker"),"background-color",color);
		}
		if(url&&/^\//.test(url)){
			var a=document.createElement("a");
			a.href=url;
			browser.ie&&(a.href=a.href);
			url=browser.ie?a.href:a.protocol+"//"+a.host+a.pathname+a.search+a.hash;
		}
		if(url||url===""){
			$G("url").value=url;
		}
		if(align){
			utils.each($G("repeatType").children,function(item){
				item.selected=align==item.getAttribute("value")?"selected":false;
			});
		}
		if(x||y){
			$G("x").value=parseInt(x)||0;
			$G("y").value=parseInt(y)||0;
		}
		$G("alignment").style.display=coloredRadio.checked&&$G("url").value?"":"none";
		$G("custom").style.display=coloredRadio.checked&&$G("url").value&&$G("repeatType").value=="self"?"":"none";
	}
	function updateBackground(){
		if($G("coloredRadio").checked){
			var color=domUtils.getStyle($G("colorPicker"),"background-color"),bgimg=$G("url").value,align=$G("repeatType").value,backgroundObj={"background-repeat":"no-repeat","background-position":"center center"};
			if(color){
				backgroundObj["background-color"]=color;
			}
			if(bgimg){
				backgroundObj["background-image"]="url("+bgimg+")";
			}
			if(align=="self"){
				backgroundObj["background-position"]=$G("x").value+"px "+$G("y").value+"px";
			}else if(align=="repeat-x"||align=="repeat-y"||align=="repeat"){
				backgroundObj["background-repeat"]=align;
			}
			editor.execCommand("background",backgroundObj);
		}else{
			editor.execCommand("background",null);
		}
	}
	function OnlineImage(target){
		this.container=utils.isString(target)?document.getElementById(target):target;
		this.init();
	}
	OnlineImage.prototype={
		init:function(){
			this.reset();
			this.initEvents();
		},
		initContainer:function(){
			this.container.innerHTML="";
			this.list=document.createElement("ul");
			this.clearFloat=document.createElement("li");
			domUtils.addClass(this.list,"list");
			domUtils.addClass(this.clearFloat,"clearFloat");
			this.list.id="imageListUl";
			this.list.appendChild(this.clearFloat);
			this.container.appendChild(this.list);
		},
		initEvents:function(){
			var _this=this;
			domUtils.on($G("imageList"),"scroll",function(e){
				var panel=this;
				if(panel.scrollHeight-panel.offsetHeight-panel.scrollTop<10){
					_this.getImageData();
				}
			});
			domUtils.on(this.container,"click",function(e){
				var li=(e.target||e.srcElement).parentNode,nodes=$G("imageListUl").childNodes;
				if(li.tagName.toLowerCase()=="li"){
					updateFormState("nocolor",null,"");
					for(var i=0,node;node=nodes[i++];){
						if(node==li&&!domUtils.hasClass(node,"selected")){
							domUtils.addClass(node,"selected");
							updateFormState("colored",null,li.firstChild.getAttribute("_src"),"repeat");
						}else{
							domUtils.removeClasses(node,"selected");
						}
					}
					updateBackground();
				}
			});
		},
		initData:function(){
			this.state=0;
			this.listSize=editor.getOpt("imageManagerListSize");
			this.listIndex=0;
			this.listEnd=false;
			this.getImageData();
		},
		reset:function(){
			this.initContainer();
			this.initData();
		},
		getImageData:function(){
			var _this=this;
			if(!_this.listEnd&&!this.isLoadingData){
				this.isLoadingData=true;
				var url=editor.getActionUrl(editor.getOpt("imageManagerActionName")),isJsonp=utils.isCrossDomainUrl(url);
				ajax.request(url,{
					"timeout":100000,
					"dataType":isJsonp?"jsonp":"",
					"data":utils.extend({start:this.listIndex,size:this.listSize},editor.queryCommandValue("serverparam")),
					"method":"get",
					"onsuccess":function(r){
						try{
							var json=isJsonp?r:eval("("+r.responseText+")");
							if(json.state=="SUCCESS"){
								_this.pushData(json.list);
								_this.listIndex=parseInt(json.start)+parseInt(json.list.length);
								if(_this.listIndex>=json.total){
									_this.listEnd=true;
								}
								_this.isLoadingData=false;
							}
						}catch(e){
							if(r.responseText.indexOf("ue_separate_ue")!=-1){
								var list=r.responseText.split(r.responseText);
								_this.pushData(list);
								_this.listIndex=parseInt(list.length);
								_this.listEnd=true;
								_this.isLoadingData=false;
							}
						}
					},
					"onerror":function(){
						_this.isLoadingData=false;
					}
				});
			}
		},
		pushData:function(list){
			var _this=this,urlPrefix=editor.getOpt("imageManagerUrlPrefix");
			for(var i=0;i<list.length;i++){
				if(list[i]&&list[i].url){
					var item=document.createElement("li");
					var img=document.createElement("img");
					var icon=document.createElement("span");
					domUtils.on(img,"load",(function(image){
						return function(){
							_this.scale(image,image.parentNode.offsetWidth,image.parentNode.offsetHeight);
						};
					})(img));
					img.width=113;
					img.setAttribute("src",urlPrefix+list[i].url+(list[i].url.indexOf("?")==-1?"?noCache=":"&noCache=")+(+new Date()).toString(36));
					img.setAttribute("_src",urlPrefix+list[i].url);
					domUtils.addClass(icon,"icon");
					item.appendChild(img);
					item.appendChild(icon);
					this.list.insertBefore(item,this.clearFloat);
				}
			}
		},
		scale:function(img,w,h,type){
			var ow=img.width,oh=img.height;
			if(type=="justify"){
				if(ow>=oh){
					img.width=w;
					img.height=h*oh/ow;
					img.style.marginLeft="-"+parseInt((img.width-w)/2)+"px";
				}else{
					img.width=w*ow/oh;
					img.height=h;
					img.style.marginTop="-"+parseInt((img.height-h)/2)+"px";
				}
			}else{
				if(ow>=oh){
					img.width=w*ow/oh;
					img.height=h;
					img.style.marginLeft="-"+parseInt((img.width-w)/2)+"px";
				}else{
					img.width=w;
					img.height=h*oh/ow;
					img.style.marginTop="-"+parseInt((img.height-h)/2)+"px";
				}
			}
		},
		getInsertList:function(){
			var lis=this.list.children,list=[],align=getAlign();
			for(var i=0;i<lis.length;i++){
				if(domUtils.hasClass(lis[i],"selected")){
					var src=lis[i].firstChild.getAttribute("_src");
					list.push({src:src,_src:src,floatStyle:align});
				}
			}
			return list;
		}
	};
	dialog.onok=function(){
		updateBackground();
		editor.fireEvent("saveScene");
	};
	dialog.oncancel=function(){
		editor.execCommand("background",backupStyle);
	};
})();