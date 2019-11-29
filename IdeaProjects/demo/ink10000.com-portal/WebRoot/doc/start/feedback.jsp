<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Feedback|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="0"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_start.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li><a href="#bug-fan-kui-yao-qiu">Bug 反馈要求</a></li>
						<li><a href="#zhu-yi-shi-xiang">注意事项</a></li>
						<li>
							<a href="#chang-jian-wen-ti">常见问题</a>
							<ul class="am-collapse">
								<li><a href="#zhi-chi-tie-tu-ma-">支持贴图吗？</a></li>
								<li><a href="#ru-he-zai-duo-shuo-ping-lun-kuang-li-mian-tie-tu-">如何在多说评论框里面贴图？</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="bug-fan-kui">Bug 反馈 <a href="#bug-fan-kui" class="doc-anchor"></a></h1>
			<hr>
			<p>感谢对 Amaze UI 的关注和支持，如遇到 Bug 或者使用问题，可以通过以下途径反馈给我们：</p>
			<ul>
				<li>在组件文档底部<a href="#ds-thread">评论中留言</a>；</li>
				<li>在 GitHub 项目主页<a href="#" class="new-issue">提交 Issue</a>。</li>
			</ul>
			<div class="am-alert am-alert-danger">我们感谢提交的 Bug 的同学，但也请提交的时候换位思考一下：如果别人给你提交一个这样的 Issue，你能快速准确的理解吗？如果不能，烦请重新整理你的语言，按照要求的格式填写。专业一点，减少不必要的口舌浪费。</div>
			<h2 id="bug-fan-kui-yao-qiu">Bug 反馈要求 <a href="#bug-fan-kui-yao-qiu" class="doc-anchor"></a></h2>
			<ul>
				<li>标题：简要描述 Bug；</li>
				<li>
					内容：
					<ul>
						<li>描述一下 Bug，以及 Bug 产生的环境（操作系统及版本，浏览器以及版本）；</li>
						<li>如有可能，描述 Bug 复现的流程；</li>
						<li>如有可能，添加产生 Bug 时的截图；</li>
						<li>尽量添加 Bug 测试的 URL，推荐使用 <a href="#">JSBin</a>。</li>
					</ul>
				</li>
			</ul>
			<pre>
**问题描述**
（描述一下问题）
**产生环境**
- 设备：（手机、平板等移动设备时填写此项）
- 操作系统及版本：
- 浏览器及版本：
- 演示地址：
**复现步奏**
1.
2.
...
			</pre>
			<h2 id="zhu-yi-shi-xiang">注意事项 <a href="#zhu-yi-shi-xiang" class="doc-anchor"></a></h2>
			<p><strong>提交反馈</strong>：</p>
			<p>为了能最准确的传达所描述的问题，<strong>建议你在反馈时附上演示</strong>，方便我们理解及更快速的定位、解决问题。</p>
			<p>我们很不喜欢重复下面的对话：</p>
			<pre>
用户甲：xxx 有问题！
Amaze UI：什么问题？操作系统及版本、浏览器及版本？
用户甲：巴拉巴拉
			</pre>
			<p>下面的几个链接是我们在几个在线调试工具上建的页面，<strong>已经引入了 Amaze UI 样式和脚本</strong>，你可以<span class="am-text-danger">【Fork】</span>一份，把要有问题的场景粘在里面，反馈给我们。</p>
			<ul>
				<li><a href="#">Debug Amaze UI 2.x in JSBin</a></li>
				<li><a href="#">Debug Amaze UI 1.x in JSBin</a></li>
			</ul>
			<p><strong>反馈处理</strong>:</p>
			<p>提交到 GitHub 的 Issue 一般会通过两种方式关闭：</p>
			<ul>
				<li><strong>涉及代码修改的问题</strong>：一般会通过 Commit 关闭 Issue，在收到关闭通知以后你可以更新代码确认问题是否已经被修复。如果问题依然存在，劳烦 Reopen Issue 并把问题细节提交给我们；</li>
				<li><strong>使用问题</strong>：在我们给出答案后，希望你能反馈一下是否解决了你的问题。如果解决了，请关闭 Issue；如果未解决，请描述具体细节。如给出答案一周后仍无任何回复的，Issue 将被关闭。</li>
			</ul>
			<h2 id="chang-jian-wen-ti">常见问题 <a href="#chang-jian-wen-ti" class="doc-anchor"></a></h2>
			<h3 id="zhi-chi-tie-tu-ma-">支持贴图吗？ <a href="#zhi-chi-tie-tu-ma-" class="doc-anchor"></a></h3>
			<p>GitHub Issue 系统支持贴图：</p>
			<ul>
				<li>把<strong>图片拖到输入框</strong>里图片会自动上传并插入到内容中；</li>
				<li>也可以<strong>直接复制粘贴图片</strong>。</li>
			</ul>
			<p>多说评论系统见下面。</p>
			<h3 id="ru-he-zai-duo-shuo-ping-lun-kuang-li-mian-tie-tu-">如何在多说评论框里面贴图？ <a href="#ru-he-zai-duo-shuo-ping-lun-kuang-li-mian-tie-tu-" class="doc-anchor"></a></h3>
			<p><del>多说评论系统的贴图功能已经开启，但是多说没有提供图片服务器，仍然需要通过第三方图床来完成。</del></p>
			<p><del>点击<strong>插入图片</strong>图标以后，把 <code>请输入图片地址</code> 替换成图床里的图片地址。</del></p>
			<p>鉴于开启 HTML 解析以后，用户粘贴的代码被解析了。现在禁用了，无法直接插入图片了，不过仍然可以使用下面的图床上传以后给出图片地址。</p>
			<ul>
				<li><a href="#">Gimhoy图床</a></li>
				<li><a href="#">围脖图床修复计划（浏览器插件）</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="763386d93456712162dfa558d9965a2d" data-title="开始使用 - Feedback|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>