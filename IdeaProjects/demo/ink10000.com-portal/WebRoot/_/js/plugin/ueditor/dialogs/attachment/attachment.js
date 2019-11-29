(function(){
	var uploadFile=null,onlineFile=null;
	window.onload=function(){
		initTabs();
		initButtons();
	};
	function initTabs(){
		var tabs=$G("tabhead").children;
		for(var i=0;i<tabs.length;i++){
			domUtils.on(tabs[i],"click",function(e){
				setTabFocus((e.target||e.srcElement).getAttribute("data-content-id"));
			});
		}
		setTabFocus("upload");
	}
	function setTabFocus(id){
		if(!id){
			return;
		}
		var tabs=$G("tabhead").children;
		for(var i=0;i<tabs.length;i++){
			var bodyId=tabs[i].getAttribute("data-content-id");
			if(bodyId==id){
				domUtils.addClass(tabs[i],"focus");
				domUtils.addClass($G(bodyId),"focus");
			}else{
				domUtils.removeClasses(tabs[i],"focus");
				domUtils.removeClasses($G(bodyId),"focus");
			}
		}
		switch(id){
			case "upload":uploadFile=uploadFile||new UploadFile("queueList");break;
			case "online":onlineFile=onlineFile||new OnlineFile("fileList");break;
		}
	}
	function initButtons(){
		dialog.onok=function(){
			var list=[],id=null,tabs=$G("tabhead").children;
			for(var i=0;i<tabs.length;i++){
				if(domUtils.hasClass(tabs[i],"focus")){
					id=tabs[i].getAttribute("data-content-id");
					break;
				}
			}
			switch(id){
				case "upload":
					list=uploadFile.getInsertList();
					var count=uploadFile.getQueueCount();
					if(count){
						$(".info","#queueList").html("<span style=\"color:red;\">还有"+count+"个未上传文件</span>");
						return false;
					}
					break;
				case "online":list=onlineFile.getInsertList();break;
			}
			editor.execCommand("insertfile",list);
		};
	}
	function UploadFile(target){
		this.$wrap=target.constructor==String?$("#"+target):$(target);
		this.init();
	}
	UploadFile.prototype={
		init:function(){
			this.fileList=[];
			this.initContainer();
			this.initUploader();
		},
		initContainer:function(){
			this.$queue=this.$wrap.find(".filelist");
		},
		initUploader:function(){
			var _this=this,$=jQuery,$wrap=_this.$wrap,$queue=$wrap.find(".filelist"),$statusBar=$wrap.find(".statusBar"),$info=$statusBar.find(".info"),$upload=$wrap.find(".uploadBtn"),$filePickerBlock=$wrap.find(".filePickerBlock"),$placeHolder=$wrap.find(".placeholder"),$progress=$statusBar.find(".progress").hide(),fileCount=0,fileSize=0,ratio=window.devicePixelRatio||1,thumbnailWidth=113*ratio,thumbnailHeight=113*ratio,state="",percentages={},uploader,actionUrl=editor.getActionUrl(editor.getOpt("fileActionName")),fileMaxSize=editor.getOpt("fileMaxSize"),acceptExtensions=(editor.getOpt("fileAllowFiles")||[]).join("").replace(/\./g,",").replace(/^[,]/,"");
			var supportTransition=(function(){
				var s=document.createElement("p").style;
				return "transition" in s||"WebkitTransition" in s||"MozTransition" in s||"msTransition" in s||"OTransition" in s;
			})();
			if(!WebUploader.Uploader.support()){
				$("#filePickerReady").after($("<div>").html(lang.errorNotSupport)).hide();
				return;
			}else if(!editor.getOpt("fileActionName")){
				$("#filePickerReady").after($("<div>").html(lang.errorLoadConfig)).hide();
				return;
			}
			uploader=_this.uploader=WebUploader.create({
				pick:{id:"#filePickerReady",label:lang.uploadSelectFile},
				swf:"../../third-party/webuploader/Uploader.swf",
				server:actionUrl,
				fileVal:editor.getOpt("fileFieldName"),
				duplicate:true,
				fileSingleSizeLimit:fileMaxSize,
				compress:false
			});
			uploader.addButton({id:"#filePickerBlock"});
			uploader.addButton({id:"#filePickerBtn",label:lang.uploadAddFile});
			setState("pedding");
			function addFile(file){
				var $li=$("<li id=\""+file.id+"\"><p class=\"title\">"+file.name+"</p><p class=\"imgWrap\"></p><p class=\"progress\"><span></span></p></li>"),$btns=$("<div class=\"file-panel\"><span class=\"cancel\">"+lang.uploadDelete+"</span><span class=\"rotateRight\">"+lang.uploadTurnRight+"</span><span class=\"rotateLeft\">"+lang.uploadTurnLeft+"</span></div>").appendTo($li),$prgress=$li.find("p.progress span"),$wrap=$li.find("p.imgWrap"),$info=$("<p class=\"error\"></p>").hide().appendTo($li);
				var showError=function(code){
					switch(code){
						case "exceed_size":text=lang.errorExceedSize;break;
						case "interrupt":text=lang.errorInterrupt;break;
						case "http":text=lang.errorHttp;break;
						case "not_allow_type":text=lang.errorFileType;break;
						default:text=lang.errorUploadRetry;break;
					}
					$info.text(text).show();
				};
				if(file.getStatus()==="invalid"){
					showError(file.statusText);
				}else{
					$wrap.text(lang.uploadPreview);
					if("|png|jpg|jpeg|bmp|gif|".indexOf("|"+file.ext.toLowerCase()+"|")==-1){
						$wrap.empty().addClass("notimage").append("<i class=\"file-preview file-type-"+file.ext.toLowerCase()+"\"></i><span class=\"file-title\" title=\""+file.name+"\">"+file.name+"</span>");
					}else{
						if(browser.ie&&browser.version<=7){
							$wrap.text(lang.uploadNoPreview);
						}else{
							uploader.makeThumb(file,function(error,src){
								if(error||!src){
									$wrap.text(lang.uploadNoPreview);
								}else{
									var $img=$("<img src=\""+src+"\">");
									$wrap.empty().append($img);
									$img.on("error",function(){
										$wrap.text(lang.uploadNoPreview);
									});
								}
							},thumbnailWidth,thumbnailHeight);
						}
					}
					percentages[file.id]=[file.size,0];
					file.rotation=0;
					if(!file.ext||acceptExtensions.indexOf(file.ext.toLowerCase())==-1){
						showError("not_allow_type");
						uploader.removeFile(file);
					}
				}
				file.on("statuschange",function(cur,prev){
					if(prev==="progress"){
						$prgress.hide().width(0);
					}else if(prev==="queued"){
						$li.off("mouseenter mouseleave");
						$btns.remove();
					}
					if(cur==="error"||cur==="invalid"){
						showError(file.statusText);
						percentages[file.id][1]=1;
					}else if(cur==="interrupt"){
						showError("interrupt");
					}else if(cur==="queued"){
						percentages[file.id][1]=0;
					}else if(cur==="progress"){
						$info.hide();
						$prgress.css("display","block");
					}else if(cur==="complete"){}
					$li.removeClass("state-"+prev).addClass("state-"+cur);
				});
				$li.on("mouseenter",function(){
					$btns.stop().animate({height:30});
				});
				$li.on("mouseleave",function(){
					$btns.stop().animate({height:0});
				});
				$btns.on("click","span",function(){
					var index=$(this).index(),deg;
					switch(index){
						case 0:uploader.removeFile(file);return;
						case 1:file.rotation+=90;break;
						case 2:file.rotation-=90;break;
					}
					if(supportTransition){
						deg="rotate("+file.rotation+"deg)";
						$wrap.css({"-webkit-transform":deg,"-mos-transform":deg,"-o-transform":deg,"transform":deg});
					}else{
						$wrap.css("filter","progid:DXImageTransform.Microsoft.BasicImage(rotation="+(~~((file.rotation/90)%4+4)%4)+")");
					}
				});
				$li.insertBefore($filePickerBlock);
			}
			function removeFile(file){
				delete percentages[file.id];
				updateTotalProgress();
				$("#"+file.id).off().find(".file-panel").off().end().remove();
			}
			function updateTotalProgress(){
				var loaded=0,total=0,spans=$progress.children();
				$.each(percentages,function(k,v){
					total+=v[0];
					loaded+=v[0]*v[1];
				});
				var percent=total?loaded/total:0;
				spans.eq(0).text(Math.round(percent*100)+"%");
				spans.eq(1).css("width",Math.round(percent*100)+"%");
				updateStatus();
			}
			function setState(val,files){
				if(val!=state){
					var stats=uploader.getStats();
					$upload.removeClass("state-"+state);
					$upload.addClass("state-"+val);
					switch(val){
						case "pedding":
							$queue.addClass("element-invisible");
							$statusBar.addClass("element-invisible");
							$placeHolder.removeClass("element-invisible");
							$progress.hide();
							$info.hide();
							uploader.refresh();
							break;
						case "ready":
							$placeHolder.addClass("element-invisible");
							$queue.removeClass("element-invisible");
							$statusBar.removeClass("element-invisible");
							$progress.hide();
							$info.show();
							$upload.text(lang.uploadStart);
							uploader.refresh();
							break;
						case "uploading":
							$progress.show();
							$info.hide();
							$upload.text(lang.uploadPause);
							break;
						case "paused":
							$progress.show();
							$info.hide();
							$upload.text(lang.uploadContinue);
							break;
						case "confirm":
							$progress.show();
							$info.hide();
							$upload.text(lang.uploadStart);
							stats=uploader.getStats();
							if(stats.successNum&&!stats.uploadFailNum){
								setState("finish");
								return;
							}
							break;
						case "finish":
							$progress.hide();
							$info.show();
							$upload.text(stats.uploadFailNum?lang.uploadRetry:lang.uploadStart);
							break;
					}
					state=val;
					updateStatus();
				}
				if(!_this.getQueueCount()){
					$upload.addClass("disabled");
				}else{
					$upload.removeClass("disabled");
				}
			}
			function updateStatus(){
				var text="";
				if(state==="ready"){
					text=lang.updateStatusReady.replace("_",fileCount).replace("_KB",WebUploader.formatSize(fileSize));
				}else if(state==="confirm"){
					var stats=uploader.getStats();
					if(stats.uploadFailNum){
						text=lang.updateStatusConfirm.replace("_",stats.successNum).replace("_",stats.successNum);
					}
				}else{
					var stats=uploader.getStats();
					text=lang.updateStatusFinish.replace("_",fileCount).replace("_KB",WebUploader.formatSize(fileSize)).replace("_",stats.successNum);
					if(stats.uploadFailNum){
						text+=lang.updateStatusError.replace("_",stats.uploadFailNum);
					}
				}
				$info.html(text);
			}
			uploader.on("fileQueued",function(file){
				fileCount++;
				fileSize+=file.size;
				if(fileCount===1){
					$placeHolder.addClass("element-invisible");
					$statusBar.show();
				}
				addFile(file);
			});
			uploader.on("fileDequeued",function(file){
				fileCount--;
				fileSize-=file.size;
				removeFile(file);
				updateTotalProgress();
			});
			uploader.on("filesQueued",function(file){
				if(!uploader.isInProgress()&&(state=="pedding"||state=="finish"||state=="confirm"||state=="ready")){
					setState("ready");
				}
				updateTotalProgress();
			});
			uploader.on("all",function(type,files){
				switch(type){
					case "uploadFinished":setState("confirm",files);break;
					case "startUpload":
						var params=utils.serializeParam(editor.queryCommandValue("serverparam"))||"",url=utils.formatUrl(actionUrl+(actionUrl.indexOf("?")==-1?"?":"&")+"encode=UTF-8&"+params);
						uploader.option("server",url);
						setState("uploading",files);
						break;
					case "stopUpload":setState("paused",files);break;
				}
			});
			uploader.on("uploadBeforeSend",function(file,data,header){
				header["X_Requested_With"]="XMLHttpRequest";
			});
			uploader.on("uploadProgress",function(file,percentage){
				$("#"+file.id).find(".progress span").css("width",percentage*100+"%");
				percentages[file.id][1]=percentage;
				updateTotalProgress();
			});
			uploader.on("uploadSuccess",function(file,ret){
				var $file=$("#"+file.id);
				try{
					var json=utils.str2json(ret._raw||ret);
					if(json.state=="SUCCESS"){
						_this.fileList.push(json);
						$file.append("<span class=\"success\"></span>");
					}else{
						$file.find(".error").text(json.state).show();
					}
				}catch(e){
					$file.find(".error").text(lang.errorServerUpload).show();
				}
			});
			uploader.on("uploadError",function(file,code){});
			uploader.on("error",function(code,file){
				if(code=="Q_TYPE_DENIED"||code=="F_EXCEED_SIZE"){
					addFile(file);
				}
			});
			uploader.on("uploadComplete",function(file,ret){});
			$upload.on("click",function(){
				if($(this).hasClass("disabled")){
					return false;
				}
				if(state==="ready"||state==="paused"){
					uploader.upload();
				}else if(state==="uploading"){
					uploader.stop();
				}
			});
			$upload.addClass("state-"+state);
			updateTotalProgress();
		},
		getQueueCount:function(){
			var readyFile=0,files=this.uploader.getFiles();
			for(var i=0,file;file=files[i++];){
				var status=file.getStatus();
				if(status=="queued"||status=="uploading"||status=="progress"){
					readyFile++;
				}
			}
			return readyFile;
		},
		getInsertList:function(){
			var list=[],prefix=editor.getOpt("fileUrlPrefix");
			for(var i=0;i<this.fileList.length;i++){
				var data=this.fileList[i];
				var link=data.url;
				list.push({title:data.original||link.substr(link.lastIndexOf("/")+1),url:prefix+link});
			}
			return list;
		}
	};
	function OnlineFile(target){
		this.container=utils.isString(target)?document.getElementById(target):target;
		this.init();
	}
	OnlineFile.prototype={
		init:function(){
			this.initContainer();
			this.initEvents();
			this.initData();
		},
		initContainer:function(){
			this.container.innerHTML="";
			this.list=document.createElement("ul");
			this.clearFloat=document.createElement("li");
			domUtils.addClass(this.list,"list");
			domUtils.addClass(this.clearFloat,"clearFloat");
			this.list.appendChild(this.clearFloat);
			this.container.appendChild(this.list);
		},
		initEvents:function(){
			var _this=this;
			domUtils.on($G("fileList"),"scroll",function(e){
				var panel=this;
				if(panel.scrollHeight-panel.offsetHeight-panel.scrollTop<10){
					_this.getFileData();
				}
			});
			domUtils.on(this.list,"click",function(e){
				var li=(e.target||e.srcElement).parentNode;
				if(li.tagName.toLowerCase()=="li"){
					if(domUtils.hasClass(li,"selected")){
						domUtils.removeClasses(li,"selected");
					}else{
						domUtils.addClass(li,"selected");
					}
				}
			});
		},
		initData:function(){
			this.state=0;
			this.listSize=editor.getOpt("fileManagerListSize");
			this.listIndex=0;
			this.listEnd=false;
			this.getFileData();
		},
		getFileData:function(){
			var _this=this;
			if(!_this.listEnd&&!this.isLoadingData){
				this.isLoadingData=true;
				ajax.request(editor.getActionUrl(editor.getOpt("fileManagerActionName")),{
					timeout:100000,
					data:utils.extend({start:this.listIndex,size:this.listSize},editor.queryCommandValue("serverparam")),
					method:"get",
					onsuccess:function(r){
						try{
							var json=eval("("+r.responseText+")");
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
					onerror:function(){
						_this.isLoadingData=false;
					}
				});
			}
		},
		pushData:function(list){
			var _this=this,urlPrefix=editor.getOpt("fileManagerUrlPrefix");
			for(var i=0;i<list.length;i++){
				if(list[i]&&list[i].url){
					var item=document.createElement("li");
					var icon=document.createElement("span");
					var filetype=list[i].url.substr(list[i].url.lastIndexOf(".")+1);
					var preview=null;
					if("png|jpg|jpeg|gif|bmp".indexOf(filetype)!=-1){
						preview=document.createElement("img");
						domUtils.on(preview,"load",(function(image){
							return function(){
								_this.scale(image,image.parentNode.offsetWidth,image.parentNode.offsetHeight);
							};
						})(preview));
						preview.width=113;
						preview.setAttribute("src",urlPrefix+list[i].url+(list[i].url.indexOf("?")==-1?"?noCache=":"&noCache=")+(+new Date()).toString(36));
					}else{
						var ic=document.createElement("i"),textSpan=document.createElement("span");
						textSpan.innerHTML=list[i].url.substr(list[i].url.lastIndexOf("/")+1);
						preview=document.createElement("div");
						preview.appendChild(ic);
						preview.appendChild(textSpan);
						domUtils.addClass(preview,"file-wrapper");
						domUtils.addClass(textSpan,"file-title");
						domUtils.addClass(ic,"file-type-"+filetype);
						domUtils.addClass(ic,"file-preview");
					}
					domUtils.addClass(icon,"icon");
					item.setAttribute("data-url",urlPrefix+list[i].url);
					if(list[i].original){
						item.setAttribute("data-title",list[i].original);
					}
					item.appendChild(preview);
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
			var lis=this.list.children,list=[];
			for(var i=0;i<lis.length;i++){
				if(domUtils.hasClass(lis[i],"selected")){
					var url=lis[i].getAttribute("data-url");
					list.push({title:lis[i].getAttribute("data-title")||url.substr(url.lastIndexOf("/")+1),url:url});
				}
			}
			return list;
		}
	};
})();