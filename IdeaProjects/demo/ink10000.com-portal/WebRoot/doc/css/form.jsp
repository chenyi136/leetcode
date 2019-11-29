<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 css"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 css"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 css"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js css"><!--<![endif]-->
<head>
	<title>CSS - Form|Amaze UI</title>
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
							<a href="#ji-ben-shi-yong">基本使用</a>
							<ul class="am-collapse">
								<li><a href="#dan-xuan-fu-xuan-kuang">单选、复选框</a></li>
								<li><a href="#xia-la-xuan-kuang">下拉选框</a></li>
								<li><a href="#wen-jian-xuan-ze-yu">文件选择域</a></li>
								<li><a href="#ji-ben-yan-shi">基本演示</a></li>
								<li><a href="#biao-dan-xing-zhuang">表单形状</a></li>
							</ul>
						</li>
						<li>
							<a href="#biao-dan-yu-zhuang-tai">表单域状态</a>
							<ul class="am-collapse">
								<li><a href="#jin-yong-dan-ge-yuan-su">禁用单个元素</a></li>
								<li><a href="#jin-yong-yu-nei-de-yuan-su">禁用域内的元素</a></li>
								<li><a href="#jin-yong-lian-jie">禁用链接</a></li>
							</ul>
						</li>
						<li>
							<a href="#biao-dan-pai-lie">表单排列</a>
							<ul class="am-collapse">
								<li><a href="#shui-ping-pai-lie">水平排列</a></li>
								<li><a href="#xing-nei-pai-lie">行内排列</a></li>
							</ul>
						</li>
						<li><a href="#biao-dan-yu-icon">表单域 Icon</a></li>
						<li>
							<a href="#yan-zheng-zhuang-tai">验证状态</a>
							<ul class="am-collapse">
								<li><a href="#yan-shi">演示</a></li>
								<li><a href="#dai-tu-biao-de-yan-zheng">带图标的验证</a></li>
							</ul>
						</li>
						<li>
							<a href="#biao-dan-yu-da-xiao">表单域大小</a>
							<ul class="am-collapse">
								<li><a href="#dan-ge-yu-de-da-xiao">单个域的大小</a></li>
								<li><a href="#zu-da-xiao">组大小</a></li>
							</ul>
						</li>
						<li><a href="#shu-ru-kuang-zu">输入框组</a></li>
						<li><a href="#can-kao-lian-jie">参考链接</a></li>
					</ul>
				</div>
			</div>
			<h1 id="form-biao-dan-yuan-su">Form 表单元素 <a href="#form-biao-dan-yuan-su" class="doc-anchor"></a></h1>
			<hr>
			<p><code>&lt;form&gt;</code> 元素样式。</p>
			<h2 id="ji-ben-shi-yong">基本使用 <a href="#ji-ben-shi-yong" class="doc-anchor"></a></h2>
			<h3 id="dan-xuan-fu-xuan-kuang">单选、复选框 <a href="#dan-xuan-fu-xuan-kuang" class="doc-anchor"></a></h3>
			<p><code>checkbox</code>、<code>radio</code> 类型的 <code>&lt;input&gt;</code> 与其他元素稍有区别：</p>
			<ul>
				<li>块级显示时在容器上添加 <code>.am-checkbox</code>、<code>.am-radio</code> class；</li>
				<li>行内显示时在容器上添加 <code>.am-checkbox-inline</code>、<code>.am-radio-inline</code> class。</li>
			</ul>
			<h3 id="xia-la-xuan-kuang">下拉选框 <a href="#xia-la-xuan-kuang" class="doc-anchor"></a></h3>
			<p><strong><code>&lt;select&gt;</code> 是一个比较奇葩的元素，长得丑还不让人给它打扮</strong>。</p>
			<p>单使用 CSS， 很难给 <code>select</code> 定义跨浏览器兼容的样式，保留浏览器默认样式可能是它最好的归宿（<a href="#">Pure CSS 就是这么干的</a>)。Amaze UI 中针对 Webkit 浏览器写了一点样式替换了默认的下上三角形。</p>
			<h3 id="wen-jian-xuan-ze-yu">文件选择域 <a href="#wen-jian-xuan-ze-yu" class="doc-anchor"></a></h3>
			<p><code>&lt;input type='file'&gt;</code> 也是 CSS 啃不动的一块骨头，如果实在看不惯原生的样式，一般的做法是把文件选择域设为透明那个，覆盖在其他元素。</p>
			<div class="doc-example">
				<div class="am-form-group am-form-file">
					<button type="button" class="am-btn am-btn-sm am-btn-default"><i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
					<input type="file" multiple="multiple">
				</div>
				<hr>
				<div class="am-form-group am-form-file"><i class="am-icon-cloud-upload"></i> 选择要上传的文件 <input type="file" multiple="multiple"></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p>存在的问题是不会显示已经选择的文件，对用户不够友好，需要<a href="#">配合 JS</a> 使用：</p>
			<div class="doc-example">
				<div class="am-form-group am-form-file">
					<button type="button" class="am-btn am-btn-sm am-btn-danger"><i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
					<input type="file" multiple="multiple" id="doc-form-file">
				</div>
				<div id="file-list"></div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="ji-ben-yan-shi">基本演示 <a href="#ji-ben-yan-shi" class="doc-anchor"></a></h3>
			<p>在容器上添加 <code>.am-form</code> class，容器里的子元素才会应用 Amaze UI 定义的样式。</p>
			<div class="doc-example">
				<form class="am-form">
					<fieldset>
						<legend>表单标题</legend>
						<div class="am-form-group">
							<label>邮件</label>
							<input type="email" placeholder="输入电子邮件">
						</div>
						<div class="am-form-group">
							<label>密码</label>
							<input type="password" placeholder="设置个密码吧">
						</div>
						<div class="am-form-group">
							<label>原生文件上传域</label>
							<input type="file">
							<p class="am-form-help">请选择要上传的文件...</p>
						</div>
						<div class="am-form-group am-form-file">
							<label>Amaze UI 文件上传域</label>
							<div><button type="button" class="am-btn am-btn-sm am-btn-default"><i class="am-icon-cloud-upload"></i> 选择要上传的文件</button></div>
							<input type="file">
						</div>
						<hr>
						<div class="am-checkbox"><label><input type="checkbox"> 复选框，选我选我选我</label></div>
						<div class="am-radio"><label><input type="radio" value="option1" checked="checked" name="doc-radio-1"> 单选框 - 选项1</label></div>
						<div class="am-radio"><label><input type="radio" value="option2" name="doc-radio-1"> 单选框 - 选项2</label></div>
						<div class="am-form-group">
							<label class="am-checkbox-inline"><input type="checkbox" value="option1"> 选我</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="option2"> 同时可以选我</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="option3"> 还可以选我</label>
						</div>
						<div class="am-form-group">
							<label class="am-radio-inline"><input type="radio" name="docInlineRadio"> 每一分</label>
							<label class="am-radio-inline"><input type="radio" name="docInlineRadio"> 每一秒</label>
							<label class="am-radio-inline"><input type="radio" name="docInlineRadio"> 多好</label>
						</div>
						<div class="am-form-group am-form-select">
							<label>下拉多选框</label>
							<select>
								<option value="option1">选项一...</option>
								<option value="option2">选项二.....</option>
								<option value="option3">选项三........</option>
							</select>
							<span class="am-form-caret"></span>
						</div>
						<div class="am-form-group">
							<label>多选框</label>
							<select multiple="multiple">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="am-form-group">
							<label>文本域</label>
							<textarea rows="5"></textarea>
						</div>
						<p><button type="submit" class="am-btn am-btn-default">提交</button></p>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="biao-dan-xing-zhuang">表单形状 <a href="#biao-dan-xing-zhuang" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<p><input type="text" class="am-form-field am-radius" placeholder="圆角表单域"></p>
				<p><input type="text" class="am-form-field am-round" placeholder="椭圆表单域"></p>
			</div>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-form-field am-radius"</span> <span class="hljs-attribute">placeholder</span>=<span class="hljs-value">"圆角表单域"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">p</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-form-field am-round"</span> <span class="hljs-attribute">placeholder</span>=<span class="hljs-value">"椭圆表单域"</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">p</span>&gt;</span>
					</code>
				</pre>
			</div>
			<h2 id="biao-dan-yu-zhuang-tai">表单域状态 <a href="#biao-dan-yu-zhuang-tai" class="doc-anchor"></a></h2>
			<p>设置表单元素的不同状态。</p>
			<h3 id="jin-yong-dan-ge-yuan-su">禁用单个元素 <a href="#jin-yong-dan-ge-yuan-su" class="doc-anchor"></a></h3>
			<p>给 <code>&lt;input&gt;</code> 添加 <code>disabled</code> 属性以禁用表单元素。</p>
			<div class="doc-example"><form class="am-form"><input type="text" class="am-form-field" disabled="disabled" placeholder="禁止输入的表单..."></form></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">form</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-form"</span>&gt;</span><span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-form-field"</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text"</span> <span class="hljs-attribute">placeholder</span>=<span class="hljs-value">"禁止输入的表单..."</span> <span class="hljs-attribute">disabled</span>&gt;</span><span class="hljs-tag">&lt;/<span class="hljs-title">form</span>&gt;</span></code></pre></div>
			<p>给 <code>&lt;fieldset&gt;</code> 元素增加 <code>disabled</code> 属性，禁用所有的子元素。</p>
			<h3 id="jin-yong-yu-nei-de-yuan-su">禁用域内的元素 <a href="#jin-yong-yu-nei-de-yuan-su" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<form class="am-form">
					<fieldset disabled="disabled">
						<div class="am-form-group">
							<label>禁用的文本框</label>
							<input type="text" class="am-form-field" placeholder="禁止输入">
						</div>
						<div class="am-form-group">
							<label>禁用的下拉选框</label>
							<select class="am-form-field">
								<option>禁止选择我-0</option>
								<option>禁止选择我-1</option>
							</select>
						</div>
						<div class="am-checkbox"><label><input type="checkbox"> 无法选中的复选框</label></div>
						<button type="submit" class="am-btn am-btn-primary">Submit</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="jin-yong-lian-jie">禁用链接 <a href="#jin-yong-lian-jie" class="doc-anchor"></a></h3>
			<p><code>&lt;a&gt;</code> 元素设置禁用状态需要加上 <code>.am-disabled</code> class。</p>
			<div class="doc-example"><a class="am-btn am-btn-primary am-disabled">禁止提交</a></div>
			<div class="doc-code demo-highlight"><pre><code class="xml"><span class="hljs-tag">&lt;<span class="hljs-title">a</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"am-btn am-btn-primary am-disabled"</span>&gt;</span>禁止提交<span class="hljs-tag">&lt;/<span class="hljs-title">a</span>&gt;</span></code></pre></div>
			<h2 id="biao-dan-pai-lie">表单排列 <a href="#biao-dan-pai-lie" class="doc-anchor"></a></h2>
			<h3 id="shui-ping-pai-lie">水平排列 <a href="#shui-ping-pai-lie" class="doc-anchor"></a></h3>
			<p>在 <code>&lt;form&gt;</code> 添加 <code>.am-form-horizontal</code> class 并结合网格系统使用。</p>
			<div class="doc-example">
				<form class="am-form am-form-horizontal">
					<div class="am-form-group">
						<label class="am-u-sm-2 am-form-label">电子邮件</label>
						<div class="am-u-sm-10"><input type="email" placeholder="输入你的电子邮件"></div>
					</div>
					<div class="am-form-group">
						<label class="am-u-sm-2 am-form-label" >密码</label>
						<div class="am-u-sm-10"><input type="password" placeholder="设置一个密码吧"></div>
					</div>
					<div class="am-form-group"><div class="am-u-sm-10 am-u-sm-offset-2"><div class="checkbox"><label><input type="checkbox"> 记住十万年</label></div></div></div>
					<div class="am-form-group"><div class="am-u-sm-10 am-u-sm-offset-2"><button type="submit" class="am-btn am-btn-default">提交登入</button></div></div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xing-nei-pai-lie">行内排列 <a href="#xing-nei-pai-lie" class="doc-anchor"></a></h3>
			<p>在外围容器上添加 <code>.am-form-inline</code>。 <strong>注意</strong>： 行内排列的元素并没有设置右边距，默认使用 <code>inline-block</code> 元素的间距，压缩 HTML 后行内表单元素的右边距会消失，需要自行处理。</p>
			<div class="doc-example">
				<form class="am-form-inline">
					<div class="am-form-group"><input type="email" class="am-form-field" placeholder="电子邮件"></div>
					<div class="am-form-group"><input type="password" class="am-form-field" placeholder="密码"></div>
					<div class="am-checkbox"><label><input type="checkbox"> 记住我</label></div>
					<button type="submit" class="am-btn am-btn-default">登录</button>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="biao-dan-yu-icon">表单域 Icon <a href="#biao-dan-yu-icon" class="doc-anchor"></a></h2>
			<p>表单 group 元素上添加 <code>.am-form-icon</code>，依赖 <code>icon</code> 组件。</p>
			<div class="doc-example">
				<form class="am-form am-form-inline">
					<div class="am-form-group am-form-icon">
						<i class="am-icon-calendar"></i>
						<input type="text" class="am-form-field" placeholder="日期">
					</div>
					<div class="am-form-group am-form-icon">
						<i class="am-icon-clock-o"></i>
						<input type="text" class="am-form-field" placeholder="时间">
					</div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="yan-zheng-zhuang-tai">验证状态 <a href="#yan-zheng-zhuang-tai" class="doc-anchor"></a></h2>
			<h3 id="yan-shi">演示 <a href="#yan-shi" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<form class="am-form">
					<div class="am-form-group am-form-icon am-form-success am-form-feedback">
						<label class="am-form-label">验证成功</label>
						<input type="text" class="am-form-field">
						<span class="am-icon-check"></span>
					</div>
					<div class="am-form-group am-form-warning">
						<label class="am-form-label">验证警告</label>
						<input type="text" class="am-form-field">
					</div>
					<div class="am-form-group am-form-error">
						<label class="am-form-label">验证失败</label>
						<input type="text" class="am-form-field">
					</div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="dai-tu-biao-de-yan-zheng">带图标的验证 <a href="#dai-tu-biao-de-yan-zheng" class="doc-anchor"></a></h3>
			<p>添加 <code>.am-form-icon</code> 和 <code>.am-form-feedback</code>。</p>
			<p><del>注意：Icon 的样式针对 <code>.am-form-group</code> 单行排列编写，多行的时候会出现位置不对的情况。</del></p>
			<p><code>v2.3.1</code> 中调整样式，支持带有 <code>label</code> 的情形。</p>
			<div class="doc-example">
				<form class="am-form">
					<div class="am-form-group am-form-icon am-form-success am-form-feedback">
						<input type="text" class="am-form-field" placeholder="验证成功">
						<span class="am-icon-check"></span>
					</div>
					<div class="am-form-group am-form-icon am-form-warning am-form-feedback">
						<input type="text" class="am-form-field" placeholder="验证警告">
						<span class="am-icon-warning"></span>
					</div>
					<div class="am-form-group am-form-icon am-form-error am-form-feedback">
						<input type="text" class="am-form-field" placeholder="验证失败">
						<span class="am-icon-times"></span>
					</div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>水平排列：</strong></p>
			<div class="doc-example">
				<form class="am-form am-form-horizontal">
					<div class="am-form-group am-form-icon am-form-success am-form-feedback">
						<label class="am-u-sm-2 am-form-label">电子邮件</label>
						<div class="am-u-sm-10">
							<input type="email" class="am-form-field" placeholder="输入你的电子邮件">
							<span class="am-icon-warning"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="biao-dan-yu-da-xiao">表单域大小 <a href="#biao-dan-yu-da-xiao" class="doc-anchor"></a></h2>
			<h3 id="dan-ge-yu-de-da-xiao">单个域的大小 <a href="#dan-ge-yu-de-da-xiao" class="doc-anchor"></a></h3>
			<p>在表单元素上添加以下类名：</p>
			<ul>
				<li><code>am-input-lg</code></li>
				<li><code>am-input-sm</code></li>
			</ul>
			<p>适用于没有 <code>&lt;label&gt;</code> 的表单，如果表单包含 <code>&lt;label&gt;</code> 且需要调整大小的，请往后看。</p>
			<div class="doc-example">
				<form class="am-form">
					<input type="text" class="am-form-field am-input-lg" placeholder="添加了 .am-input-lg">
					<br>
					<input type="text" class="am-form-field" placeholder="默认的 input">
					<br>
					<input type="text" class="am-form-field am-input-sm" placeholder="添加了 .am-input-sm">
					<br>
					<div class="am-form-group am-form-select">
						<select class="am-input-lg">
							<option>添加了 .am-input-lg</option>
							<option>添加了 .am-input-lg</option>
						</select>
					</div>
					<div class="am-form-group am-form-select">
						<select>
							<option>select 默认大小</option>
							<option>select 默认大小</option>
						</select>
					</div>
					<div class="am-form-group am-form-select">
						<select class="am-input-sm">
							<option>添加了 .am-input-sm</option>
							<option>添加了 .am-input-sm</option>
						</select>
					</div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="zu-da-xiao">组大小 <a href="#zu-da-xiao" class="doc-anchor"></a></h3>
			<p>在 <code>.am-form-group</code> 的基础上添加以下 class，也可以实现对表单大小的设置：</p>
			<ul>
				<li><code>.am-form-group-sm</code></li>
				<li><code>.am-form-group-lg</code></li>
			</ul>
			<p>注意<strong>可输入类型的 <code>input</code> 元素上需要添加 <code>.am-form-field</code></strong>，不需要再添加 <code>.am-input-sm</code> 此类的 class。</p>
			<div class="doc-example">
				<form class="am-form am-form-horizontal">
					<div class="am-form-group am-form-group-sm">
						<label class="am-u-sm-2 am-form-label">电邮</label>
						<div class="am-u-sm-10"><input type="email" class="am-form-field" placeholder="输入你的电子邮件"></div>
					</div>
					<div class="am-form-group am-form-group-lg">
						<label class="am-u-sm-2 am-form-label">密码</label>
						<div class="am-u-sm-10"><input type="password" class="am-form-field" placeholder="设置一个密码吧"></div>
					</div>
					<div class="am-form-group am-form-group-sm"><div class="am-u-sm-10 am-u-sm-offset-2"><div class="am-checkbox"><label><input type="checkbox"> 记住十万年</label></div></div></div>
					<div class="am-form-group"><div class="am-u-sm-10 am-u-sm-offset-2"><button type="submit" class="am-btn am-btn-default">提交登入</button></div></div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="shu-ru-kuang-zu">输入框组 <a href="#shu-ru-kuang-zu" class="doc-anchor"></a></h2>
			<p>使用 <code>.am-form-set</code> 嵌套一系列 <code>&lt;input&gt;</code> 元素。</p>
			<div class="doc-example">
				<div class="am-g">
					<div class="am-u-sm-centered am-u-md-8">
						<form class="am-form">
							<fieldset class="am-form-set">
								<input type="text" placeholder="取个名字">
								<input type="text" placeholder="设个密码">
								<input type="email" placeholder="填下邮箱">
							</fieldset>
							<button type="submit" class="am-btn am-btn-block am-btn-primary">注册个账号</button>
						</form>
					</div>
				</div>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h2>
			<ul><li><a href="#">Webkit 浏览器 Radio/Checkbox 纯 CSS 样式</a></li></ul>
			<div class="ds-thread" data-thread-key="c187de7a59c6ba33d22785baaeb3eba4" data-title="CSS - Form|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("#doc-form-file").on("change",function(){
		var n="";
		$.each(this.files,function(){
			n+="<span class=\"am-badge\">"+this.name+"</span>";
		});
		$("#file-list").html(n);
	});
});
</script>
</body>
</html>