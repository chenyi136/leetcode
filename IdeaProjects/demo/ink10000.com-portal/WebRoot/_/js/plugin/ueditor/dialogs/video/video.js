(function(){
	var uploadVideoList=[],isModifyUploadVideo=false,uploadFile=null;
	window.onload=function(){
		$focus($G("videoUrl"));
		initTabs();
		initVideo();
		initUpload();
	};
	function initTabs(){
		var tabs=$G("tabHeads").children;
		for(var i=0;i<tabs.length;i++){
			domUtils.on(tabs[i],"click",function(e){
				var target=e.target||e.srcElement;
				for(var j=0;j<tabs.length;j++){
					var bodyId=tabs[j].getAttribute("data-content-id");
					if(tabs[j]==target){
						domUtils.addClass(tabs[j],"focus");
						domUtils.addClass($G(bodyId),"focus");
					}else{
						domUtils.removeClasses(tabs[j],"focus");
						domUtils.removeClasses($G(bodyId),"focus");
					}
				}
			});
		}
	}
	function initVideo(){
		createAlignButton(["videoFloat","upload_alignment"]);
		addUrlChangeListener($G("videoUrl"));
		addOkListener();
		(function(){
			var img=editor.selection.getRange().getClosedNode(),url=null;
			if(img&&img.className){
				var hasUploadClass=img.className.indexOf("edui-upload-video")!=-1;
				if(img.className=="edui-faked-video"||hasUploadClass){
					$G("videoUrl").value=url=img.getAttribute("_url");
					$G("videoWidth").value=img.width;
					$G("videoHeight").value=img.height;
					updateAlignButton(domUtils.getComputedStyle(img.parentNode,"text-align")==="center"?"center":domUtils.getComputedStyle(img,"float"));
				}
				if(hasUploadClass){
					isModifyUploadVideo=true;
				}
			}
			createPreviewVideo(url);
		})();
	}
	function addOkListener(){
		dialog.onok=function(){
			$G("preview").innerHTML="";
			var currentTab=findFocus("tabHeads","tabSrc");
			switch(currentTab){
				case "video":return insertSingle();break;
				case "videoSearch":return insertSearch("searchList");break;
				case "upload":return insertUpload();break;
			}
		};
		dialog.oncancel=function(){
			$G("preview").innerHTML="";
		};
	}
	function updateAlignButton(align){
		var aligns=$G("videoFloat").children;
		for(var i=0,ci;ci=aligns[i++];){
			if(ci.getAttribute("name")==align){
				if(ci.className!="focus"){
					ci.className="focus";
				}
			}else{
				if(ci.className=="focus"){
					ci.className="";
				}
			}
		}
	}
	function insertSingle(){
		var width=$G("videoWidth"),height=$G("videoHeight"),url=$G("videoUrl").value;
		if(!url||!checkNum([width,height])){
			return false;
		}
		var align=findFocus("videoFloat","name");
		editor.execCommand("insertvideo",{url:convert_url(url),width:width.value,height:height.value,align:align},isModifyUploadVideo?"upload":null);
	}
	function insertSearch(id){
		var imgs=domUtils.getElementsByTagName($G(id),"img"),videoObjs=[];
		for(var i=0,img;img=imgs[i++];){
			if(img.getAttribute("selected")){
				videoObjs.push({url:img.getAttribute("ue_video_url"),width:420,height:280,align:"none"});
			}
		}
		editor.execCommand("insertvideo",videoObjs);
	}
	function findFocus(id,returnProperty){
		var tabs=$G(id).children,property=null;
		for(var i=0,ci;ci=tabs[i++];){
			if(ci.className=="focus"){
				property=ci.getAttribute(returnProperty);
				break;
			}
		}
		return property;
	}
	function convert_url(url){
		if(!url){
			return "";
		}
		return utils.trim(url).replace(/v\.youku\.com\/v_show\/id_([\w\-=]+)\.html/i,"player.youku.com/player.php/sid/$1/v.swf").replace(/(www\.)?youtube\.com\/watch\?v=([\w\-]+)/i,"www.youtube.com/v/$2").replace(/youtu.be\/(\w+)$/i,"www.youtube.com/v/$1").replace(/v\.ku6\.com\/.+\/([\w\.]+)\.html.*$/i,"player.ku6.com/refer/$1/v.swf").replace(/www\.56\.com\/u\d+\/v_([\w\-]+)\.html/i,"player.56.com/v_$1.swf").replace(/www.56.com\/w\d+\/play_album\-aid\-\d+_vid\-([^.]+)\.html/i,"player.56.com/v_$1.swf").replace(/v\.pps\.tv\/play_([\w]+)\.html.*$/i,"player.pps.tv/player/sid/$1/v.swf").replace(/www\.letv\.com\/ptv\/vplay\/([\d]+)\.html.*$/i,"i7.imgs.letv.com/player/swfPlayer.swf?id=$1&autoplay=0").replace(/www\.tudou\.com\/programs\/view\/([\w\-]+)\/?/i,"www.tudou.com/v/$1").replace(/v\.qq\.com\/cover\/[\w]+\/[\w]+\/([\w]+)\.html/i,"static.video.qq.com/TPout.swf?vid=$1").replace(/v\.qq\.com\/.+[\?\&]vid=([^&]+).*$/i,"static.video.qq.com/TPout.swf?vid=$1").replace(/my\.tv\.sohu\.com\/[\w]+\/[\d]+\/([\d]+)\.shtml.*$/i,"share.vrs.sohu.com/my/v.swf&id=$1");
	}
	function checkNum(nodes){
		for(var i=0,ci;ci=nodes[i++];){
			var value=ci.value;
			if(!isNumber(value)&&value){
				window.alert(lang.numError);
				ci.value="";
				ci.focus();
				return false;
			}
		}
		return true;
	}
	function isNumber(value){
		return /(0|^[1-9]\d*$)/.test(value);
	}
	function createAlignButton(ids){
		for(var i=0,ci;ci=ids[i++];){
			var floatContainer=$G(ci),nameMaps={"none":lang["default"],"left":lang.floatLeft,"right":lang.floatRight,"center":lang.block};
			for(var j in nameMaps){
				var div=document.createElement("div");
				div.setAttribute("name",j);
				if(j=="none"){
					div.className="focus";
				}
				div.style.cssText="background:url(images/"+j+"_focus.jpg);";
				div.setAttribute("title",nameMaps[j]);
				floatContainer.appendChild(div);
			}
			switchSelect(ci);
		}
	}
	function switchSelect(selectParentId){
		var selects=$G(selectParentId).children;
		for(var i=0,ci;ci=selects[i++];){
			domUtils.on(ci,"click",function(){
				for(var j=0,cj;cj=selects[j++];){
					cj.className="";
					cj.removeAttribute&&cj.removeAttribute("class");
				}
				this.className="focus";
			});
		}
	}
	function addUrlChangeListener(url){
		if(browser.ie){
			url.onpropertychange=function(){
				createPreviewVideo(this.value);
			};
		}else{
			url.addEventListener("input",function(){
				createPreviewVideo(this.value);
			},false);
		}
	}
	function createPreviewVideo(url){
		if(!url){
			return;
		}
		$G("preview").innerHTML="<div class=\"previewMsg\"><span>"+lang.urlError+"</span></div><embed src=\""+utils.unhtmlForUrl(convert_url(url))+"\" class=\"previewVideo\" width=\""+420+"\" height=\""+280+"\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"></embed>";
	}
	function insertUpload(){
		var videoObjs=[],uploadDir=editor.getOpt("videoUrlPrefix"),width=parseInt($G("upload_width").value,10)||420,height=parseInt($G("upload_height").value,10)||280,align=findFocus("upload_alignment","name")||"none";
		for(var key in uploadVideoList){
			videoObjs.push({url:uploadDir+uploadVideoList[key].url,width:width,height:height,align:align});
		}
		var count=uploadFile.getQueueCount();
		if(count){
			$(".info","#queueList").html("<span style=\"color:red;\">还有"+count+"个未上传文件</span>");
			return false;
		}else{
			editor.execCommand("insertvideo",videoObjs,"upload");
		}
	}
	function initUpload(){
		uploadFile=new UploadFile("queueList");
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
			var _this=this,$=jQuery,$wrap=_this.$wrap,$queue=$wrap.find(".filelist"),$statusBar=$wrap.find(".statusBar"),$info=$statusBar.find(".info"),$upload=$wrap.find(".uploadBtn"),$filePickerBlock=$wrap.find(".filePickerBlock"),$placeHolder=$wrap.find(".placeholder"),$progress=$statusBar.find(".progress").hide(),fileCount=0,fileSize=0,ratio=window.devicePixelRatio||1,thumbnailWidth=113*ratio,thumbnailHeight=113*ratio,state="",percentages={},uploader,actionUrl=editor.getActionUrl(editor.getOpt("videoActionName")),fileMaxSize=editor.getOpt("videoMaxSize"),acceptExtensions=(editor.getOpt("videoAllowFiles")||[]).join("").replace(/\./g,",").replace(/^[,]/,"");
			var supportTransition=(function(){
				var s=document.createElement("p").style;
				return "transition" in s||"WebkitTransition" in s||"MozTransition" in s||"msTransition" in s||"OTransition" in s;
			})();
			if(!WebUploader.Uploader.support()){
				$("#filePickerReady").after($("<div>").html(lang.errorNotSupport)).hide();
				return;
			}else if(!editor.getOpt("videoActionName")){
				$("#filePickerReady").after($("<div>").html(lang.errorLoadConfig)).hide();
				return;
			}
			uploader=_this.uploader=WebUploader.create({
				pick:{id:"#filePickerReady",label:lang.uploadSelectFile},
				swf:"../../third-party/webuploader/Uploader.swf",
				server:actionUrl,
				fileVal:editor.getOpt("videoFieldName"),
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
						$wrap.empty().addClass("notimage").append("<i class=\"file-preview file-type-"+file.ext.toLowerCase()+"\"></i><span class=\"file-title\">"+file.name+"</span>");
					}else{
						if(browser.ie&&browser.version<=7){
							$wrap.text(lang.uploadNoPreview);
						}else{
							uploader.makeThumb(file,function(error,src){
								if(error||!src||(/^data:/.test(src)&&browser.ie&&browser.version<=7)){
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
						uploadVideoList.push({"url":json.url,"type":json.type,"original":json.original});
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
		refresh:function(){
			this.uploader.refresh();
		}
	};
})();