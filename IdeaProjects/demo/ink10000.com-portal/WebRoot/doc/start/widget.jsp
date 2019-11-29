<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 getting-started"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 getting-started"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js getting-started"><!--<![endif]-->
<head>
	<title>开始使用 - Widget|Amaze UI</title>
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
						<li><a href="#web-zu-jian-yang-shi-zu-zhi">Web 组件样式组织</a></li>
						<li>
							<a href="#mu-lu-jie-gou-ji-shuo-ming">目录结构及说明</a>
							<ul class="am-collapse">
								<li><a href="#codepackage-jsoncode">package.json</a></li>
								<li><a href="#codereadme-mdcode">README.md</a></li>
								<li><a href="#codehistory-mdcode">HISTORY.md</a></li>
								<li><a href="#codesrccode-mu-lu">src 目录</a></li>
							</ul>
						</li>
						<li><a href="#kai-fa-jiao-shou-jia">开发脚手架</a></li>
						<li><a href="#diao-shi-yu-lan">调试预览</a></li>
					</ul>
				</div>
			</div>
			<h1 id="amaze-ui-web-zu-jian-kai-fa-gui-fan">Amaze UI Web 组件开发规范 <a href="#amaze-ui-web-zu-jian-kai-fa-gui-fan" class="doc-anchor"></a></h1>
			<hr>
			<p>Web 组件基于 Amaze UI 基础库（<a href="doc/css/index.jsp">CSS</a> / <a href="doc/plugin/index.jsp">JS</a>）开发，在基础库已有样式、功能的基础上做更多扩展。</p>
			<h2 id="web-zu-jian-yang-shi-zu-zhi">Web 组件样式组织 <a href="#web-zu-jian-yang-shi-zu-zhi" class="doc-anchor"></a></h2>
			<p>Web 组件的样式有三个层级：</p>
			<ol>
				<li>
					<p>Amaze UI 基础样式:每个网站项目中都会默认引入以下基础样式，组件开发时应在以下样式的基础上进行。</p>
					<ul>
						<li><code>variables.less</code></li>
						<li><code>mixins.less</code></li>
						<li><code>base.less</code></li>
						<li><code>grid.less</code></li>
						<li><code>block-grid.less</code></li>
						<li><code>utility.less</code></li>
					</ul>
				</li>
				<li><p>Amaze UI 其他样式组件：Web 组件编写过程中使用到类似的样式时应当引入相关 <a href="doc/css/index.jsp">CSS 组件</a>，在此上进行微调，比如 <code>button.less</code>、<code>close.less</code>。</p></li>
				<li>
					<p>Web 组件自身样式：Web 组件自身样式拆分出骨干样式和主题样式；每个 Web 组件可以有多个不同主题，主题基于骨干样式编写，每个主题相互独立。</p>
					<ul>
						<li>骨干样式以 <code>{widget}.less</code> 命名；</li>
						<li>默认主题以 <code>{widget}.default.less</code> 命名；</li>
						<li>其他主题以 <code>{widget}.{theme-name}.less</code> 命名。</li>
					</ul>
				</li>
			</ol>
			<h2 id="mu-lu-jie-gou-ji-shuo-ming">目录结构及说明 <a href="#mu-lu-jie-gou-ji-shuo-ming" class="doc-anchor"></a></h2>
			<p>一个组件的目录结构如下：</p>
			<pre>
{widget}
|-- package.json
|-- README.md
|-- HISTORY.md
|-- resources
|   `-- screenshots
|       |-- 0.jpg
|       |-- 1.jpg
|       `-- 2.jpg
`-- src
    |-- {widget}.hbs
    |-- {widget}.js
    |-- {widget}.less
    |-- {widget}.default.less
    |-- {widget}.[theme1].less
    |-- {widget}.[themen].less
    `-- {widget}.png
			</pre>
			<h3 id="codepackage-jsoncode"><code>package.json</code> <a href="#codepackage-jsoncode" class="doc-anchor"></a></h3>
			<p>Web 组件核心描述文件，<code>json</code> 格式，下面的注释仅为方便解释各项含义添加。</p>
			<h3 id="codereadme-mdcode"><code>README.md</code> <a href="#codereadme-mdcode" class="doc-anchor"></a></h3>
			<p>Web 组件使用说明，包括 Web 组件 API 介绍、使用技巧、注意事项等。</p>
			<h3 id="codehistory-mdcode"><code>HISTORY.md</code> <a href="#codehistory-mdcode" class="doc-anchor"></a></h3>
			<p>Web 组件更新历史记录。</p>
			<h3 id="codesrccode-mu-lu"><code>src</code> 目录 <a href="#codesrccode-mu-lu" class="doc-anchor"></a></h3>
			<p><code>src</code> 目录包含 Web 组件的模板（hbs）、核心样式（less）、交互（js）、图标（png）、主题文件。</p>
			<p><code>src</code> 目录里的文件使用 Web 组件名称作为文件名，主题使用 <code>{Web 组件名}.{主题名}.less</code> 形式命名。</p>
			<ul>
				<li><code>{widget}.hbs</code>:模板，使用 handlebars</li>
				<li><code>{widget}.less</code>:主题核心样式，使用 less 编写</li>
				<li><code>{widget}.js</code>:组件交互</li>
				<li><code>{widget}.png</code>:组件图标，50px * 50px</li>
				<li><code>{widget}.default.less</code>:默认主题</li>
				<li><code>{widget}.xxx.less</code>:其他主题，可以任意多</li>
			</ul>
			<h4 id="mo-ban-code{widget}-hbscode">模板 <code>{widget}.hbs</code> <a href="#mo-ban-code{widget}-hbscode" class="doc-anchor"></a></h4>
			<ul>
				<li><code>data-am-widget='figure'</code> 为统一标识符；</li>
				<li><code>.am-{Web 组件名}</code> 为 Web 组件基础标识符，Web 组件的所有子元素、主题、状态基于此命名； Web 组件基础标识符采用 <code>am-{widget}</code> 方式命名，子元素、主题、状态采用 <code>am-{widget}-{子元素|主题|状态}</code>，如 <code>am-figure-hover</code> 、 <code>am-figure-bd</code> 、 <code>am-figure-active</code> 、 <code>am-figure-ios7</code>。</li>
				<li>模板使用 <code>{{#this}}..{{this}}</code> 包裹（Web 组件使用时注册为 Handlebars <code>partial</code>，通过 <code>{{&gt; widget data}}</code> 的形式调用。</li>
			</ul>
			<p><strong>注意</strong>：</p>
			<ul>
				<li>Handlebars 模板中不支持 <code>&lt;script&gt;</code> 标签，如需加载外部脚本需在 <code>{widget}.js</code> 中进行。</li>
				<li>如果需要保存用户设置的选项，使用 <code>data-am-{widget}-{option}</code> 保存在模板中，然后在 <code>{widget}.js</code> 中通过 <code>attr(&#39;data-am-{widget}-{option}&#39;)</code> 读取。</li>
			</ul>
			<h4 id="he-xin-yang-shi-code{widget}-lesscode">核心样式 <code>{widget}.less</code> <a href="#he-xin-yang-shi-code{widget}-lesscode" class="doc-anchor"></a></h4>
			<p>Web 组件样式使用 less 编写。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.am-{widget}{
   .hook-am-{widget};
}
.hook-am-{widget}(){}
					</code>
				</pre>
			</div>
			<p>样式添加必要的 <code>hook</code>，方便用户修改。</p>
			<h4 id="mo-ren-zhu-ti-code{widget}-defalt-lesscode">默认主题 <code>{widget}.defalt.less</code> <a href="#mo-ren-zhu-ti-code{widget}-defalt-lesscode" class="doc-anchor"></a></h4>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.am-{widget}-default{
   .hook-am-{widget}-default;
}
.hook-am-{widget}-default(){}
					</code>
				</pre>
			</div>
			<h4 id="qi-ta-zhu-ti-code{widget}-xxx-lesscode">其他主题 <code>{widget}.xxx.less</code> <a href="#qi-ta-zhu-ti-code{widget}-xxx-lesscode" class="doc-anchor"></a></h4>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="css">
.am-{widget}-xxx{
   .hook-am-{widget}-xxx;
}
.hook-am-{widget}-xxx(){}
					</code>
				</pre>
			</div>
			<h4 id="web-zu-jian-jiao-hu-code{widget}-jscode">Web 组件交互 <code>{widget}.js</code> <a href="#web-zu-jian-jiao-hu-code{widget}-jscode" class="doc-anchor"></a></h4>
			<p>Amaze UI 使用 Seajs 、Zepto，Widget 的脚本需按照 Seajs 规范编写。</p>
			<p><strong>如果要在 JS 中动态插入外部样式、脚本，必须在 <code>load</code> 事件触发以后再执行相关操作，以免影响网页基本内容载入。</strong></p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
define(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">require,exports,module</span>)</span>{
   <span class="hljs-comment">//按此方式使用 Zepto</span>
   <span class="hljs-keyword">var</span> $=<span class="hljs-built_in">window</span>.Zepto;
});
					</code>
				</pre>
			</div>
			<h2 id="kai-fa-jiao-shou-jia">开发脚手架 <a href="#kai-fa-jiao-shou-jia" class="doc-anchor"></a></h2>
			<p>我们提供一个基于 <a href="#">Slush.js</a> 的<a href="#">开发脚手架</a>，可以快速生成 Web 组件目录及相关文件。</p>
			<p>全局安装 Slush:</p>
			<div class="doc-code demo-highlight"><pre><code class="bash">npm install -g slush</code></pre></div>
			<p>全局安装 <code>slush-amuiwidget</code>:</p>
			<div class="doc-code demo-highlight"><pre><code class="bash">npm install -g slush-amuiwidget</code></pre></div>
			<p>在 Amaze UI 项目根目录下面执行:</p>
			<div class="doc-code demo-highlight"><pre><code class="bash">slush amuiwidget</code></pre></div>
			<h2 id="diao-shi-yu-lan">调试预览 <a href="#diao-shi-yu-lan" class="doc-anchor"></a></h2>
			<p>按照规范开发完 Web 组件以后，可以在本地调试预览组件。</p>
			<p>在 Amaze UI 项目根目录下执行以下命令，安装依赖：</p>
			<pre>npm install</pre>
			<p>全局安装 <code>nodemon</code>：</p>
			<pre>npm install nodemon -g</pre>
			<p>安装完成以后执行：</p>
			<pre>gulp preview</pre>
			<p>然后在浏览器里打开 <code>http://localhost:3008/{component}</code> 查看组件的效果，<code>{component}</code> 替换为组件名称。</p>
			<p>有样式、脚本、配置文件修改时，修改完成以后刷新浏览器即可，<code>nodemon</code> 会自动重启 Node 服务。</p>
			<div class="ds-thread" data-thread-key="3805b1a59d4e6b6d51daad2b152c302f" data-title="开始使用 - Widget|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
</body>
</html>