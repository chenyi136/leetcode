function Music(){
	this.init();
}
(function(){
	var pages=[],panels=[],selectedItem=null;
	Music.prototype={
		total:70,
		pageSize:10,
		dataUrl:"http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.search.common",
		playerUrl:"http://box.baidu.com/widget/flash/bdspacesong.swf",
		init:function(){
			var me=this;
			domUtils.on($G("J_searchName"),"keyup",function(e){
				if((event||e).keyCode==13){
					me.dosearch();
				}
			});
			domUtils.on($G("J_searchBtn"),"click",function(){
				me.dosearch();
			});
		},
		callback:function(data){
			var me=this;
			me.data=data.song_list;
			window.setTimeout(function(){
				$G("J_resultBar").innerHTML=me._renderTemplate(data.song_list);
			},300);
		},
		dosearch:function(){
			selectedItem=null;
			var key=$G("J_searchName").value;
			if(utils.trim(key)==""){
				return false;
			}
			key=encodeURIComponent(key);
			this._sent(key);
		},
		doselect:function(i){
			if(typeof i=="object"){
				selectedItem=i;
			}else if(typeof i=="number"){
				selectedItem=this.data[i];
			}
		},
		onpageclick:function(id){
			for(var i=0;i<pages.length;i++){
				$G(pages[i]).className="pageoff";
				$G(panels[i]).className="paneloff";
			}
			$G("page"+id).className="pageon";
			$G("panel"+id).className="panelon";
		},
		listenTest:function(elem){
			var view=$G("J_preview"),old_trying=this._getTryingElem();
			if(old_trying){
				old_trying.className="m-try";
				view.innerHTML="";
			}
			if(elem.className=="m-try"){
				elem.className="m-trying";
				view.innerHTML=this._buildMusicHtml(this._getUrl(true));
			}
		},
		_sent:function(param){
			$G("J_resultBar").innerHTML="<div class=\"loading\"></div>";
			utils.loadFile(document,{src:this.dataUrl+"&query="+param+"&page_size="+this.total+"&callback=music.callback&.r="+Math.random(),tag:"script",type:"text/javascript",defer:"defer"});
		},
		_removeHtml:function(str){
			return str.replace(/<\s*\/?\s*[^>]*\s*>/gi,"");
		},
		_getUrl:function(isTryListen){
			return this.playerUrl+"?from=tiebasongwidget&url=&name="+encodeURIComponent(this._removeHtml(selectedItem.title))+"&artist="+encodeURIComponent(this._removeHtml(selectedItem.author))+"&extra="+encodeURIComponent(this._removeHtml(selectedItem.album_title))+"&autoPlay="+isTryListen+""+"&loop=true";
		},
		_getTryingElem:function(){
			var s=$G("J_listPanel").getElementsByTagName("span");
			for(var i=0;i<s.length;i++){
				if(s[i].className=="m-trying"){
					return s[i];
				}
			}
			return null;
		},
		_buildMusicHtml:function(playerUrl){
			return "<embed src=\""+playerUrl+"\" style=\"position:absolute;left:-2000px;\" class=\"BDE_try_Music\" width=\"1\" height=\"1\" type=\"application/x-shockwave-flash\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" scale=\"noborder\" allowscriptaccess=\"never\" allowfullscreen=\"false\">";
		},
		_byteLength:function(str){
			return str.replace(/[^\u0000-\u007f]/g,"\u0061\u0061").length;
		},
		_getMaxText:function(s){
			s=this._removeHtml(s);
			if(this._byteLength(s)>12){
				return s.substring(0,5)+"...";
			}
			if(!s){
				s="&nbsp;";
			}
			return s;
		},
		_rebuildData:function(data){
			var newData=[],d=this.pageSize,itembox=[];
			for(var i=0;i<data.length;i++){
				if((i+d)%d==0){
					itembox=[];
					newData.push(itembox);
				}
				itembox.push(data[i]);
			}
			return newData;
		},
		_renderTemplate:function(data){
			if(data.length==0){
				return "<div class=\"empty\">"+lang.emptyTxt+"</div>";
			}
			data=this._rebuildData(data);
			var s=[],p=[],t=[];
			s.push("<div class=\"listPanel\" id=\"J_listPanel\">");
			p.push("<div class=\"page\">");
			for(var i=0,tmpList;tmpList=data[i++];){
				panels.push("panel"+i);
				pages.push("page"+i);
				if(i==1){
					s.push("<div class=\"panelon\" id=\"panel"+i+"\">");
					if(data.length!=1){
						t.push("<div class=\"pageon\" id=\"page"+i+"\" onclick=\"music.onpageclick("+i+")\">"+i+"</div>");
					}
				}else{
					s.push("<div class=\"paneloff\" id=\"panel"+i+"\">");
					t.push("<div class=\"pageoff\" id=\"page"+i+"\" onclick=\"music.onpageclick("+i+")\">"+(i)+"</div>");
				}
				s.push("<div class=\"m-box\">");
				s.push("<div class=\"m-h\"><span class=\"m-t\">"+lang.chapter+"</span><span class=\"m-s\">"+lang.singer+"</span><span class=\"m-z\">"+lang.special+"</span><span class=\"m-try-t\">"+lang.listenTest+"</span></div>");
				for(var j=0,tmpObj;tmpObj=tmpList[j++];){
					s.push("<label class=\"m-m\" for=\"radio-"+i+"-"+j+"\">");
					s.push("<input type=\"radio\" class=\"m-l\" name=\"musicId\" id=\"radio-"+i+"-"+j+"\" onclick=\"music.doselect("+(this.pageSize*(i-1)+j-1)+")\">");
					s.push("<span class=\"m-t\">"+this._getMaxText(tmpObj.title)+"</span>");
					s.push("<span class=\"m-s\">"+this._getMaxText(tmpObj.author)+"</span>");
					s.push("<span class=\"m-z\">"+this._getMaxText(tmpObj.album_title)+"</span>");
					s.push("<span class=\"m-try\" onclick=\"music.doselect("+(this.pageSize*(i-1)+j-1)+");music.listenTest(this)\"></span>");
					s.push("</label>");
				}
				s.push("</div>");
				s.push("</div>");
			}
			t.reverse();
			p.push(t.join(""));
			s.push("</div>");
			p.push("</div>");
			return s.join("")+p.join("");
		},
		exec:function(){
			if(selectedItem==null){
				return;
			}
			$G("J_preview").innerHTML="";
			editor.execCommand("music",{url:this._getUrl(false),width:400,height:95});
		}
	};
})();