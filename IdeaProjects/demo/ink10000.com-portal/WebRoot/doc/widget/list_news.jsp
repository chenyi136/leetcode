<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 widgets"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 widgets"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 widgets"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js widgets"><!--<![endif]-->
<head>
	<title>List 使用说明及演示|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="3"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_widget.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<h1 id="list-nei-rong-lie-biao">List 内容列表 <a href="#list-nei-rong-lie-biao" class="doc-anchor"></a></h1>
			<hr>
			<p>内容列表组件。</p>
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#list_news-demo">组件演示</a>
							<ul class="am-collapse">
								<li><a href="#list_news-demo-default-0">default（更多在上）</a></li>
								<li><a href="#list_news-demo-default-1">default（更多在下）</a></li>
								<li><a href="#list_news-demo-default-2">default（带摘要）</a></li>
								<li><a href="#list_news-demo-default-3">default（上图+摘要）</a></li>
								<li><a href="#list_news-demo-default-4">default（左图+摘要）</a></li>
								<li><a href="#list_news-demo-default-5">default（右图+摘要）</a></li>
								<li><a href="#list_news-demo-default-6">default（下图+摘要）</a></li>
								<li><a href="#list_news-demo-default-7">default（下右图+摘要）</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-fa">使用方法</a>
							<ul class="am-collapse">
								<li><a href="#zhi-jie-shi-yong">直接使用</a></li>
								<li><a href="#shi-yong-handlebars">使用 Handlebars</a></li>
								<li><a href="#yun-gua-pei-webide">云适配 WebIDE</a></li>
							</ul>
						</li>
						<li><a href="#shu-ju-jie-kou">数据接口</a></li>
					</ul>
				</div>
			</div>
			<h2 id="list_news-demo">组件演示</h2>
			<h3 id="list_news-demo-default-0">default（更多在上）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_0.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf">
						<a href="#">
							<ins>
								<h2>栏目标题</h2>
								<span class="am-list-news-more am-fr">更多 »</span>
							</ins>
						</a>
					</div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g am-list-item-dated">
								<a href="#" class="am-list-item-hd">我很囧，你保重....晒晒旅行中的那些囧！</a>
								<span class="am-list-date">2013-09-18</span>
							</li>
							<li class="am-g am-list-item-dated">
								<a href="#" class="am-list-item-hd">我最喜欢的一张画</a>
								<span class="am-list-date">2013-10-14</span>
							</li>
							<li class="am-g am-list-item-dated">
								<a href="#" class="am-list-item-hd">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a>
								<span class="am-list-date">2013-11-18</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="list_news-demo-default-1">default（更多在下）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_1.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf"><a href="#"><ins><h2>栏目标题</h2></ins></a></div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g"><a href="#" class="am-list-item-hd">我很囧，你保重....晒晒旅行中的那些囧！</a></li>
							<li class="am-g"><a href="#" class="am-list-item-hd">我最喜欢的一张画</a></li>
							<li class="am-g"><a href="#" class="am-list-item-hd">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></li>
						</ul>
					</div>
					<div class="am-list-news-ft"><a href="#" class="am-list-news-more am-btn am-btn-default">查看更多 »</a></div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="list_news-demo-default-2">default（带摘要）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_2.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf">
						<a href="#">
							<ins>
								<h2>栏目标题</h2>
								<span class="am-list-news-more am-fr">更多 »</span>
							</ins>
						</a>
					</div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g am-list-item-desced">
								<a href="#" class="am-list-item-hd">我很囧，你保重....晒晒旅行中的那些囧！</a>
								<div class="am-list-item-text">囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！</div>
							</li>
							<li class="am-g am-list-item-desced">
								<a href="#" class="am-list-item-hd">我最喜欢的一张画</a>
								<div class="am-list-item-text">你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，</div>
							</li>
							<li class="am-g"><a href="#" class="am-list-item-hd">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="list_news-demo-default-3">default（上图+摘要）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_3.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf">
						<a href="#">
							<ins>
								<h2>缩略图在上方 + 摘要</h2>
								<span class="am-list-news-more am-fr">更多 »</span>
							</ins>
						</a>
					</div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-top">
								<div class="am-u-sm-12 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
								<div class="am-list-main">
									<h3 class="am-list-item-hd"><a href="#">我很囧，你保重....晒晒旅行中的那些囧！</a></h3>
									<div class="am-list-item-text">囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！</div>
								</div>
							</li>
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-top">
								<div class="am-u-sm-12 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
								<div class="am-list-main">
									<h3 class="am-list-item-hd"><a href="#">我最喜欢的一张画</a></h3>
									<div class="am-list-item-text">你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，</div>
								</div>
							</li>
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-top">
								<div class="am-u-sm-12 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
								<div class="am-list-main">
									<h3 class="am-list-item-hd"><a href="#">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></h3>
									<div class="am-list-item-text">还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="list_news-demo-default-4">default（左图+摘要）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_4.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf">
						<a href="#">
							<ins>
								<h2>左图 + 摘要</h2>
								<span class="am-list-news-more am-fr">更多 »</span>
							</ins>
						</a>
					</div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
								<div class="am-u-sm-8 am-list-main">
									<h3 class="am-list-item-hd"><a href="#">我很囧，你保重....晒晒旅行中的那些囧！</a></h3>
									<div class="am-list-item-text">囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！</div>
								</div>
							</li>
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
								<div class="am-u-sm-8 am-list-main">
									<h3 class="am-list-item-hd"><a href="#">我最喜欢的一张画</a></h3>
									<div class="am-list-item-text">你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，</div>
								</div>
							</li>
							<li class="am-g am-list-item-desced">
								<div class="am-list-main">
									<h3 class="am-list-item-hd"><a href="#">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></h3>
									<div class="am-list-item-text">还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="list_news-demo-default-5">default（右图+摘要）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_5.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf">
						<a href="#">
							<ins>
								<h2>缩略图在标题右边 + 摘要</h2>
								<span class="am-list-news-more am-fr">更多 »</span>
							</ins>
						</a>
					</div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-right">
								<div class="am-u-sm-8 am-list-main">
									<h3 class="am-list-item-hd"><a href="#">我很囧，你保重....晒晒旅行中的那些囧！</a></h3>
									<div class="am-list-item-text">囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！</div>
								</div>
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
							</li>
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-right">
								<div class="am-u-sm-8 am-list-main">
									<h3 class="am-list-item-hd"><a href="#">我最喜欢的一张画</a></h3>
									<div class="am-list-item-text">你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，</div>
								</div>
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
							</li>
							<li class="am-g am-list-item-desced">
								<div class="am-list-main">
									<h3 class="am-list-item-hd"><a href="#">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></h3>
									<div class="am-list-item-text">还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="list_news-demo-default-6">default（下图+摘要）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_6.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf">
						<a href="#">
							<ins>
								<h2>缩略图在标题下左 + 摘要</h2>
								<span class="am-list-news-more am-fr">更多 »</span>
							</ins>
						</a>
					</div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-bottom-left">
								<h3 class="am-list-item-hd"><a href="#">我很囧，你保重....晒晒旅行中的那些囧！</a></h3>
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
								<div class="am-u-sm-8 am-list-main"><div class="am-list-item-text">囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！</div></div>
							</li>
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-bottom-left">
								<h3 class="am-list-item-hd"><a href="#">我最喜欢的一张画</a></h3>
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
								<div class="am-u-sm-8 am-list-main"><div class="am-list-item-text">你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，</div></div>
							</li>
							<li class="am-g am-list-item-desced">
								<h3 class="am-list-item-hd"><a href="#">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></h3>
								<div class="am-list-main"><div class="am-list-item-text">还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次</div></div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h3 id="list_news-demo-default-7">default（下右图+摘要）</h3>
			<div class="doc-example" data-url="doc/widget/list_news_default_7.jsp">
				<div class="am-list-news am-list-news-default" data-am-widget="list_news">
					<div class="am-list-news-hd am-cf">
						<a href="#">
							<ins>
								<h2>缩略图在标题下右 + 摘要</h2>
								<span class="am-list-news-more am-fr">更多 »</span>
							</ins>
						</a>
					</div>
					<div class="am-list-news-bd">
						<ul class="am-list">
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-bottom-right">
								<h3 class="am-list-item-hd"><a href="#">我很囧，你保重....晒晒旅行中的那些囧！</a></h3>
								<div class="am-u-sm-8 am-list-main"><div class="am-list-item-text">囧人囧事囧照，人在囧途，越囧越萌。标记《带你出发，陪我回家》http://book.douban.com/subject/25711202/为“想读”“在读”或“读过”，有机会获得此书本活动进行3个月，每月送出三本书。会有不定期bonus！</div></div>
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
							</li>
							<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-bottom-right">
								<h3 class="am-list-item-hd"><a href="#">我最喜欢的一张画</a></h3>
								<div class="am-u-sm-8 am-list-main"><div class="am-list-item-text">你最喜欢的艺术作品，告诉大家它们的------名图画，色彩，交织，撞色，线条雕塑装置当代古代现代作品的照片美我最喜欢的画群296795413进群发画，少说多发图，</div></div>
								<div class="am-u-sm-4 am-list-thumb"><a href="#"><img src="doc/image/bing-5.jpg"></a></div>
							</li>
							<li class="am-g am-list-item-desced">
								<h3 class="am-list-item-hd"><a href="#">“你的旅行，是什么颜色？” 晒照片，换北欧梦幻极光之旅！</a></h3>
								<div class="am-list-main"><div class="am-list-item-text">还在苦恼圣诞礼物再也玩儿不出新意？快来抢2013最炫彩的跨国圣诞礼物！【参与方式】1.关注“UniqueWay无二之旅”豆瓣品牌小站http://brand.douban.com/uniqueway/2.上传一张**本人**在旅行中色彩最浓郁、最丰富的照片（色彩包含取景地、周边事物、服装饰品、女生彩妆等等，发挥你们无穷的创意想象力哦！^^）一定要有本人出现喔！3. 在照片下方，附上一句旅行宣言作为照片说明。 成功参与活动！* 听他们刚才说，上传照片的次</div></div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre class="am-pre-scrollable"><code class="xml">CODE</code></pre></div>
			<h2 id="shi-yong-fang-fa">使用方法 <a href="#shi-yong-fang-fa" class="doc-anchor"></a></h2>
			<h3 id="zhi-jie-shi-yong">直接使用 <a href="#zhi-jie-shi-yong" class="doc-anchor"></a></h3>
			<ul>
				<li>拷贝演示中的代码，粘贴到 Amaze UI HTML 模板（<a href="#">点此下载</a>） <code>&lt;body&gt;</code> 区域；</li>
				<li>将示例代码中的内容替换为自己的内容。</li>
			</ul>
			<h3 id="shi-yong-handlebars">使用 Handlebars <a href="#shi-yong-handlebars" class="doc-anchor"></a></h3>
			<p>本组件 Handlebars partial 名称为 <code>list_news</code>，使用细节参照<a href="doc/widget/accordion.jsp">折叠面板组件</a>。</p>
			<h3 id="yun-gua-pei-webide">云适配 WebIDE <a href="#yun-gua-pei-webide" class="doc-anchor"></a></h3>
			<ul>
				<li>将组件拖入编辑界面；</li>
				<li>点击右侧面板里的【数据采集】按钮，按以下格式采集数据。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shu-ju-jie-kou">数据接口 <a href="#shu-ju-jie-kou" class="doc-anchor"></a></h2>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="b0ce9d966e42c53a044d391406bbce0c" data-title="List 使用说明及演示|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>