<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Comment|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="1"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_css.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#shi-yong-yan-shi">使用演示</a>
							<ul class="am-collapse">
								<li><a href="#dan-tiao-ping-lun">单条评论</a></li>
								<li><a href="#ping-lun-lie-biao">评论列表</a></li>
								<li><a href="#ping-lun-nei-rong-zuo-you-dui-qi">评论内容左右对齐</a></li>
								<li><a href="#ping-lun-zhuang-tai">评论状态</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="comment-ping-lun-zu-jian">Comment 评论组件 <a href="#comment-ping-lun-zu-jian" class="doc-anchor"></a></h1>
			<hr>
			<p>评论组件由用户头像、评论元信息、评论内容组成（有点似曾相识？没错，很像 Github 的评论列表）。</p>
			<p>基本结构如下：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--评论容器--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">article</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-comment"</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">img</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-comment-avatar"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span>
   <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-comment-main"</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">header</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-comment-hd"</span>&gt;</span>
         <span class="hljs-comment">&lt;!--&lt;h3 class="am-comment-title"&gt;评论标题&lt;/h3&gt;--&gt;</span>
         <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-comment-meta"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">href</span>=<span class="hljs-value">"#"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-comment-author"</span>&gt;</span>上而求索<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span> 评论于 <span class="hljs-tag">&lt;<span class="hljs-title">time</span> <span class="hljs-attribute">datetime</span>=<span class="hljs-value">"2015-04-14"</span>&gt;</span>2015-04-14<span class="hljs-tag">&lt;/<span class="hljs-title">time</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
      <span class="hljs-tag">&lt;/<span class="hljs-title">header</span>&gt;</span>
      <span class="hljs-tag">&lt;<span class="hljs-title">div</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-comment-bd"</span>&gt;</span>...<span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span> <span class="hljs-comment">&lt;!-- 评论内容 --&gt;</span>
   <span class="hljs-tag">&lt;/<span class="hljs-title">div</span>&gt;</span>
<span class="hljs-tag">&lt;/<span class="hljs-title">article</span>&gt;</span>
					</code>
				</pre>
			</div>
			<p>其中 <code>.am-comment-title</code> 在使用中并不常见。</p>
			<h2 id="shi-yong-yan-shi">使用演示 <a href="#shi-yong-yan-shi" class="doc-anchor"></a></h2>
			<h3 id="dan-tiao-ping-lun">单条评论 <a href="#dan-tiao-ping-lun" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<article class="am-comment">
					<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
					<div class="am-comment-main">
						<header class="am-comment-hd">
							<div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-12</time></div>
							<div class="am-comment-actions">
								<a href="#"><i class="am-icon-pencil"></i></a>
								<a href="#"><i class="am-icon-close"></i></a>
							</div>
						</header>
						<div class="am-comment-bd">
							<p>那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
							<blockquote>妈：我打算在下个月和樱子结婚。</blockquote>
						</div>
						<footer class="am-comment-footer">
							<div class="am-comment-actions">
								<a href="#"><i class="am-icon-thumbs-up"></i></a>
								<a href="#"><i class="am-icon-thumbs-down"></i></a>
								<a href="#"><i class="am-icon-reply"></i></a>
							</div>
						</footer>
					</div>
				</article>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ping-lun-lie-biao">评论列表 <a href="#ping-lun-lie-biao" class="doc-anchor"></a></h3>
			<p>使用 <code>.am-comments-list</code> 包裹多个 <code>.am-comment</code> 即成评论列表。</p>
			<p>给<code>&lt;ul&gt;</code>元素添加<code>.am-comment-list</code>类来创建一个评论列表。</p>
			<div class="doc-example">
				<ul class="am-comments-list am-comments-list-flip">
					<li class="am-comment">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于 <time>2013-07-27</time></div></header>
							<div class="am-comment-bd">
								<p>那，那是一封写给南部母亲的信。我茫然站在骑楼下，我又看到永远的樱子走到街心。其实雨下得并不大，却是一生一世中最大的一场雨。而那封信是这样写的，年轻的樱子知不知道呢？</p>
								<blockquote>妈：我打算在下个月和樱子结婚。</blockquote>
							</div>
						</div>
					</li>
					<li class="am-comment">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">路人甲</a> 评论于 <time>2014-7-13 0:03</time></div></header>
							<div class="am-comment-bd"><p>She's gone 我早知道<br>她将要 从我的生命中走掉<br>不再停留多一秒</p></div>
						</div>
					</li>
					<li class="am-comment am-comment-primary">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">路人乙</a> 评论于 <time>2014-7-14</time></div></header>
							<div class="am-comment-bd"><p><a href="#">@某人</a> 撸主保重！</p></div>
						</div>
					</li>
					<li class="am-comment am-comment-flip am-comment-secondary">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-14</time></div></header>
							<div class="am-comment-bd"><p><a href="#">@路人乙</a> 朕知道了！</p></div>
						</div>
					</li>
					<li class="am-comment am-comment-highlight">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">路人乙</a> 评论于 <time>2014-7-14</time></div></header>
							<div class="am-comment-bd"><p><a href="#">@某人</a> 艹民告退！</p></div>
						</div>
					</li>
					<li class="am-comment am-comment-flip am-comment-danger">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-14</time></div></header>
							<div class="am-comment-bd"><p><a href="#">@路人乙</a> 滚！</p></div>
						</div>
					</li>
					<li class="am-comment am-comment-warning">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">路人乙</a> 评论于 <time>2014-7-14</time></div></header>
							<div class="am-comment-bd"><p><a href="#">@某人</a> 你妹！</p></div>
						</div>
					</li>
					<li class="am-comment am-comment-flip am-comment-success">
						<a href="#"><img src="doc/image/bing-6.jpg" class="am-comment-avatar" width="48px" height="48px"></a>
						<div class="am-comment-main">
							<header class="am-comment-hd"><div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-14</time></div></header>
							<div class="am-comment-bd"><p><a href="#">@路人乙</a> 你妹你妹！</p></div>
						</div>
					</li>
				</ul>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ping-lun-nei-rong-zuo-you-dui-qi">评论内容左右对齐 <a href="#ping-lun-nei-rong-zuo-you-dui-qi" class="doc-anchor"></a></h3>
			<p>在评论列表 <code>.am-comments-list</code> 上增加 <code>.am-comments-list-flip</code> class，可以使左右交错的评论列表内容左右对齐（在 <code>medium-up</code> 区间有效）。</p>
			<p><strong>谢谢大家的建议</strong>。并非所有使用场景都使用左右交错的列表，所以加了单独的 class，供用户选择。</p>
			<h3 id="ping-lun-zhuang-tai">评论状态 <a href="#ping-lun-zhuang-tai" class="doc-anchor"></a></h3>
			<p>在容器上添加评论状态 class（演示见上面列表里的最后几条）。</p>
			<ul>
				<li><code>.am-comment-flip</code> 在右边显示头像</li>
				<li><code>.am-comment-primary</code> 高亮评论（边框为主色）</li>
				<li><code>.am-comment-highlight</code> / <code>.am-comment-highlight</code> 高亮评论（边框为次色）</li>
				<li><code>.am-comment-success</code> 高亮评论（边框为绿色）</li>
				<li><code>.am-comment-warning</code> 高亮评论（边框为橙色）</li>
				<li><code>.am-comment-danger</code> 高亮评论（边框为红色）</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="ds-thread" data-thread-key="6a639d57af51e17723560fdaf8d5f1dd" data-title="CSS - Comment|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>