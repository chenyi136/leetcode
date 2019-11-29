(function(){
	var URL=window.UEDITOR_HOME_URL||getRootPath();
	window.UEDITOR_CONFIG={
		UEDITOR_HOME_URL:URL
		,autoHeightEnabled:false
		,inputXssFilter:true
		,maximumWords:40000
		,serverUrl:window.WEB_CONFIG_ROOT+"ueditor/config.htm"
		,toolbars:[[
			"fullscreen","source",
			"undo","redo","|",
			"bold","italic","underline","fontborder","strikethrough","superscript","subscript","removeformat","formatmatch","autotypeset","blockquote","pasteplain","|",
			"forecolor","backcolor","insertorderedlist","insertunorderedlist","selectall","cleardoc","|",
			"rowspacingtop","rowspacingbottom","lineheight","|",
			"customstyle","paragraph","fontfamily","fontsize","|",
			"directionalityltr","directionalityrtl","indent","|",
			"justifyleft","justifycenter","justifyright","justifyjustify","|",
			"touppercase","tolowercase","|",
			"link","unlink","anchor","|",
			"imagenone","imageleft","imageright","imagecenter","|",
			"simpleupload","insertimage","emotion","insertvideo","music","attachment","map","gmap","insertframe","insertcode","webapp","pagebreak","template","background","|",
			"horizontal","date","time","spechars","snapscreen","wordimage","|",
			"inserttable","deletetable","insertparagraphbeforetable","insertrow","deleterow","insertcol","deletecol","mergecells","mergeright","mergedown","splittocells","splittorows","splittocols","charts","|",
			"print","preview","searchreplace","drafts","help"
		]]
		,outputXssFilter:true
		,whitList:{//XSS过滤白名单名单https://raw.githubusercontent.com/leizongmin/js-xss/master/lib/default.js
			a:["target","href","title","class","style"],
			abbr:["title","class","style"],
			address:["class","style"],
			area:["shape","coords","href","alt"],
			article:[],
			aside:[],
			audio:["autoplay","controls","loop","preload","src","class","style"],
			b:["class","style"],
			bdi:["dir"],
			bdo:["dir"],
			big:[],
			blockquote:["cite","class","style"],
			br:[],
			caption:["class","style"],
			center:[],
			cite:[],
			code:["class","style"],
			col:["align","valign","span","width","class","style"],
			colgroup:["align","valign","span","width","class","style"],
			dd:["class","style"],
			del:["datetime"],
			details:["open"],
			div:["class","style"],
			dl:["class","style"],
			dt:["class","style"],
			em:["class","style"],
			font:["color","size","face"],
			footer:[],
			h1:["class","style"],
			h2:["class","style"],
			h3:["class","style"],
			h4:["class","style"],
			h5:["class","style"],
			h6:["class","style"],
			header:[],
			hr:[],
			i:["class","style"],
			img:["src","alt","title","width","height","id","_src","loadingclass","class","data-latex"],
			ins:["datetime"],
			li:["class","style"],
			mark:[],
			nav:[],
			ol:["class","style"],
			p:["class","style"],
			pre:["class","style"],
			s:[],
			section:[],
			small:[],
			span:["class","style"],
			sub:["class","style"],
			sup:["class","style"],
			strong:["class","style"],
			table:["width","border","align","valign","class","style"],
			tbody:["align","valign","class","style"],
			td:["width","rowspan","colspan","align","valign","class","style"],
			tfoot:["align","valign","class","style"],
			th:["width","rowspan","colspan","align","valign","class","style"],
			thead:["align","valign","class","style"],
			tr:["rowspan","align","valign","class","style"],
			tt:[],
			u:[],
			ul:["class","style"],
			video:["autoplay","controls","loop","preload","src","height","width","class","style"]
		}
		,xssFilterRules:true
		//,allHtmlEnabled:false//提交的数据是否包含整个html字符串
		//,allowDivTransToP:true//允许进入编辑器的div标签自动变成p标签
		//,allowLinkProtocols:["http:","https:","#","/","ftp:","mailto:","tel:","git:","svn:"]
		//,autoClearEmptyNode:true//当getContent()时是否删除空的内部节点，包括嵌套情况
		//,autoClearinitialContent:true
		//,autoFloatEnabled:true//是否保持toolbar的位置不动
		//,autoTransWordToList:false//从word中粘贴进来的列表是否自动变成列表
		//,autotypeset:{//自动排版参数
		//	bdc2sb:false,
		//	clearFontFamily:false,
		//	clearFontSize:false,
		//	imageBlockLine:"center",//图片的浮动方式，取值为center、left、right、none，去掉此属性则不执行排版
		//	indent:false,
		//	indentValue:"2em",
		//	mergeEmptyline:true,
		//	pasteFilter:false,//根据规则过滤每次粘贴进来的内容
		//	removeClass:true,
		//	removeEmptyline:false,
		//	removeEmptyNode:false,
		//	removeTagNames:{标签名字:1},//可去掉的标签
		//	textAlign:"left",//段落的排版方式，取值为left、right、center、justify，去掉此属性则不执行排版
		//	tobdc:false
		//}
		//,autoSyncData:true//自动同步编辑器要提交的数据
		//,catchRemoteImageEnable:true
		//,charset:"UTF-8"//当getAllHtml()时会在head中增加编码设置
		//,codeMirrorJsUrl:URL+"third-party/codemirror/codemirror.js"
		//,codeMirrorCssUrl:URL+"third-party/codemirror/codemirror.css"
		//,contextMenu:[{//右键菜单的内容，可参考plugins/contextmenu.js
		//		label:显示的名称,
		//		cmdName:selectall,
		//		exec:function(){//可选，优先级高于cmdName执行
		//			//this.ui._dialogs["inserttableDialog"].open();
		//		}
		//	}
		//]
		//,customDomain:false//若手动修改的domain则需设置为true
		//,customstyle:[//自定义样式，不支持国际化，block元素是依据段落的逻辑设置，inline元素依据BIU的逻辑设置，label是用来标识不同类型且每个要不同
		//	{tag:"h1",name:"tc",label:"",style:"margin:0 0 20px 0;padding:0 4px 0 0;border-bottom:#CCC 2px solid;text-align:center;"},
		//	{tag:"h1",name:"tl",label:"",style:"margin:0 0 10px 0;padding:0 4px 0 0;border-bottom:#CCC 2px solid;"},
		//	{tag:"span",name:"im",label:"",style:"font-style:italic;font-weight:bold"},
		//	{tag:"span",name:"hi",label:"",style:"font-style:italic;font-weight:bold;color:rgb(51,153,204)"}
		//]
		//,disabledTableInTable:true//禁止表格嵌套
		//,elementPathEnabled:true
		//,emotionLocalization:false//是否开启表情本地化，若开启请确保emotion文件夹下包含官网提供的images表情文件夹
		//,enableAutoSave:true
		//,enableContextMenu:true//打开右键菜单功能
		//filterTxtRules:function(){//纯文本粘贴模式下的过滤规则
		//	function transP(node){
		//		node.tagName="p";
		//		node.setStyle();
		//	}
		//	return {
		//		"-":"script style object iframe embed input select",
		//		"p":{$:{}},
		//		"br":{$:{}},
		//		"div":{"$":{}},
		//		"li":{"$":{}},
		//		"caption":transP,
		//		"th":transP,
		//		"tr":transP,
		//		"h1":transP,"h2":transP,"h3":transP,"h4":transP,"h5":transP,"h6":transP,
		//		"td":function(node){
		//			var txt=!!node.innerText();
		//			if(txt){
		//				node.parentNode.insertAfter(UE.uNode.createText("&nbsp;&nbsp;"),node);
		//			}
		//			node.parentNode.removeChild(node,node.innerText())
		//		}
		//	}
		//}()
		//,focus:false
		//,fontfamily:[{label:"",name:"songti",val:"宋体,SimSun"},{label:"",name:"kaiti",val:"楷体,楷体_GB2312,SimKai"},{label:"",name:"yahei",val:"微软雅黑,Microsoft YaHei"},{label:"",name:"heiti",val:"黑体,SimHei"},{label:"",name:"lishu",val:"隶书,SimLi"},{label:"",name:"andaleMono",val:"andale mono"},{label:"",name:"arial",val:"arial,helvetica,sans-serif"},{label:"",name:"arialBlack",val:"arial black,avant garde"},{label:"",name:"comicSansMs",val:"comic sans ms"},{label:"",name:"impact",val:"impact,chicago"},{label:"",name:"timesNewRoman",val:"times new roman"}]
		//,fontsize:[10,11,12,14,16,18,20,24,36]
		//,fullscreen:false//是否开启初始化时即全屏
		//,iframeCssUrl:URL+"/themes/iframe.css"//给编辑区域的iframe引入样式
		//,iframeUrlMap:{"anchor":"~/dialogs/anchor/anchor.html"}//～会被替换成URL，该属性一旦打开则将覆盖所有的dialog的默认路径
		//,imagePopup:true//图片操作的浮层开关
		//,indentValue:"2em"//首行缩进距离
		//,initialContent:"欢迎使用ueditor!"
		//,initialFrameHeight:320//默认为320
		//,initialFrameWidth:1000//默认为1000
		//,initialStyle:"p{line-height:1em}"
		//,insertorderedlist:{decimal:"",lower-alpha:"",lower-roman:"",upper-alpha:"",upper-roman:"",num:"1,2,3...",num1:"1),2),3)...",num2:"(1),(2),(3)...",cn:"一,二,三....",cn1:"一),二),三)....",cn2:"(一),(二),(三)...."}//有序列表的下拉配置
		//,insertunorderedlist:{dash:"—破折号",dot:"。小圆圈",circle:"",disc:"",square:""}//无序列表的下拉配置
		//,isShow:true//默认为显示编辑器
		//,labelMap:{anchor:"",undo:""}//工具栏中按钮的提示文字，留空支持自动多语言配置
		//,lang:"zh-cn"//语言配置项
		//,langPath:URL+"lang/"
		//,lineheight:["1","1.5","1.75","2","3","4","5"]//行内间距值
		//,listDefaultPaddingLeft:"30"//默认的左边缩进的基数倍
		//,listiconpath:"http://bs.baidu.com/listicon/"//自定义标号的路径
		//,maxInputCount:1//当输入的字符数超过该值时，保存一次现场
		//,maxListLevel:3//限制可以tab的级数，设置-1为不限制
		//,maxUndoCount:20//可最多回退的次数
		//,minFrameHeight:220//默认为220
		//,minFrameWidth:800//默认为800
		//,pageBreakTag:"_ueditor_page_break_tag_"//分页标识符
		//,paragraph:{"p":"","h1":"","h2":"","h3":"","h4":"","h5":"","h6":""}//段落格式值留空时支持多语言自动识别，若配置则以配置值为准
		//,pasteplain:false//粘贴时为纯文本吗
		//,readonly:false
		//,removeFormatAttributes:"class,style,lang,width,height,align,hspace,valign"//清除格式时可删除的属性
		//,removeFormatTags:"b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var"//清除格式时可删除的标签
		//,retainOnlyLabelPasted:false//粘贴只保留标签吗
		//,rgb2Hex:true//color自动从rgb格式变成16进制格式
		//,rowspacingbottom:["5","10","15","20","25"]
		//,rowspacingtop:["5","10","15","20","25"]//段间距值
		//,saveInterval:500//自动保存间隔时间，单位为ms
		//,scaleEnabled:false//是否可以拉伸长度，默认为true，当开启时，自动长高失效
		//,shortcutMenu:["fontfamily","fontsize","bold","italic","underline","forecolor","backcolor","insertorderedlist","insertunorderedlist"]//快捷菜单
		//,sourceEditor:"codemirror"//源码的查看方式，codemirror是代码高亮、textarea是文本框，codemirror只能在ie8+和非ie中使用
		//,sourceEditorFirst:false//编辑器初始化完成后是否进入源码模式
		//,tableDragable:true//表格是否可以拖拽
		//,tabNode:"&nbsp;"//点击tab键时移动距离倍数的单位
		//,tabSize:4//点击tab键时移动距离的倍数
		//,textarea:"editorValue"//默认提交表单时服务器获取编辑器提交内容的请求参数
		//,theme:"default"
		//,themePath:URL+"themes/"
		//,toolbarTopOffset:400//编辑器底部距离工具栏高度，若参数不小于编辑器高度则设置无效
		//,topOffset:30//浮动时工具栏距离浏览器顶部的高度，用于某些具有固定头部的页面
		//,webAppKey:""//http://app.baidu.com/static/cms/getapikey.html
		//,wordCount:true//是否开启字数统计
		//,wordCountMsg:""//当前已输入{#count}个字符，您还可以输入{#leave}个字符
		//,wordOverFlowMsg:""//<span style="color:red;">你输入的字符个数已经超出最大允许值，服务器可能会拒绝保存！</span>
		//,zIndex:900//编辑器层级
	};
	function getScriptPath() {
		var script=document.getElementsByTagName("script");
		return script[script.length-1].src;
	}
	function getRootPath(doc,path) {
		doc=doc||self.document.URL||self.location.href;
		path=path||getScriptPath();
		if(/^(\/|\\\\)/.test(path)){
			path=/^.+?\w(\/|\\\\)/.exec(doc)[0]+path.replace(/^(\/|\\\\)/,"");
		} else if (!/^[a-z]+:/i.test(path)) {
			doc=doc.split("#")[0].split("?")[0].replace(/[^\\\/]+$/,"");
			path=doc+""+path;
		}
		var protocol=/^[a-z]+:\/\//.exec(path)[0],res=[];
		path=path.replace(protocol,"").split("?")[0].split("#")[0];
		path=path.replace(/\\/g,"/").split(/\//);
		path[path.length-1]="";
		while(path.length){
			var tmp=path.shift();
			if(tmp===".."){
				res.pop();
			}else if(tmp !== "."){
				res.push(tmp);
			}
		}
		return protocol+res.join("/");
	}
	window.UE={getUEBasePath:getRootPath};
})();