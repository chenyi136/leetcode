<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String[] data = new String[] { " minlength=\"3\"", " minchecked=\"2\" maxchecked=\"4\"", " minlength=\"10\"", " required" };%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Validator|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
<style type="text/css">
#vld-tooltip{
	position:absolute;
	padding:5px 10px;
	min-width:150px;
	background:#F37B1D;
	transition:all .15s;
	box-shadow:0 0 5px rgba(0,0,0,.15);
	color:#FFF;
	z-index:1000;
	display:none;
}
#vld-tooltip:before{
	position:absolute;
	top:-8px;
	left:50%;
	margin-left:-8px;
	width:0;
	height:0;
	border-width:0 8px 8px;
	border-color:transparent transparent #F37B1D;
	border-style:none inset solid;
	content:"";
}
</style>
</head>
<body data-amui="2.x">
<jsp:include page="/doc/header.jsp"><jsp:param name="type" value="2"/></jsp:include>
<section id="amz-main">
	<div class="am-g am-g-fixed">
		<jsp:include page="/doc/menu_plugin.jsp"/>
		<div class="am-u-md-9 col-md-9 doc-content">
			<div class="doc-toc">
				<h2><span>目录</span></h2>
				<div class="doc-toc-bd">
					<ul class="md-toc">
						<li>
							<a href="#shi-yong-shi-li">使用示例</a>
							<ul class="am-collapse">
								<li><a href="#html5-yuan-sheng-biao-dan-yan-zheng">HTML5 原生表单验证</a></li>
								<li><a href="#js-biao-dan-yan-zheng">JS 表单验证</a></li>
								<li><a href="#xian-shi-ti-shi-xin-xi">显示提示信息</a></li>
								<li><a href="#deng-zhi-yan-zheng">等值验证</a></li>
								<li><a href="#zi-ding-yi-yan-zheng">自定义验证</a></li>
							</ul>
						</li>
						<li>
							<a href="#shi-yong-fang-shi">使用方式</a>
							<ul class="am-collapse">
								<li><a href="#tong-guo-data-api">通过 Data API</a></li>
								<li><a href="#tong-guo-js">通过 JS</a></li>
								<li><a href="#fang-fa">方法</a></li>
							</ul>
						</li>
						<li>
							<a href="#issue-ce-shi">Issue 测试</a>
							<ul class="am-collapse"><li><a href="#a-hrefhttpsgithub-comallmobilizeamazeuiissues528528a">#528</a></li></ul>
						</li>
						<li>
							<a href="#can-kao-zi-yuan">参考资源</a>
							<ul class="am-collapse">
								<li><a href="#chang-yong-zheng-ze-biao-da-shi">常用正则表达式</a></li>
								<li><a href="#zhu-yi-shi-xiang">注意事项</a></li>
								<li><a href="#can-kao-lian-jie">参考链接</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<h1 id="form-validator">Form Validator <a href="#form-validator" class="doc-anchor"></a></h1>
			<hr>
			<p>基于 HTML5 的表单验证，使用 H5 <code>type</code>、<code>required</code>、<code>pattern</code>、<code>min</code>、<code>max</code>、<code>minlength</code>、<code>maxlength</code> 等属性进行验证，在不支持 JS 的环境中可以平稳退化到 H5 原生验证。</p>
			<h2 id="shi-yong-shi-li">使用示例 <a href="#shi-yong-shi-li" class="doc-anchor"></a></h2>
			<h3 id="html5-yuan-sheng-biao-dan-yan-zheng">HTML5 原生表单验证 <a href="#html5-yuan-sheng-biao-dan-yan-zheng" class="doc-anchor"></a></h3>
			<p>如果表单只面向 H5 浏览器，而且不需要过多的控制，那原生的表单验证无疑是省时省力的选择，通过 <code>:valid</code>、<code>:invalid</code> 伪类可以控制不同验证状态的样式。</p>
			<div class="doc-example">
				<form class="am-form">
					<fieldset>
						<legend>H5 原生表单验证</legend>
						<div class="am-form-group">
							<label>用户名：</label>
							<input type="text" class="am-form-field" required="required" pattern="^\d+$" maxlength="3" placeholder="输入用户名">
						</div>
						<div class="am-form-group">
							<label>邮箱：</label>
							<input type="email" required="required" placeholder="输入邮箱">
						</div>
						<div class="am-form-group">
							<label>网址：</label>
							<input type="url" required="required" placeholder="输入网址">
						</div>
						<div class="am-form-group">
							<label>年龄：</label>
							<input type="number" required="required" max="100" placeholder="输入年龄">
						</div>
						<div class="am-form-group">
							<label>评论：</label>
							<textarea maxlength="100"></textarea>
						</div>
						<button type="submit" class="am-btn am-btn-secondary">提交</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<p><strong>参考链接：</strong></p>
			<ul>
				<li><a href="#">Forms in HTML</a></li>
				<li><a href="#">:invalid 伪类</a></li>
				<li><a href="#">HTML5 Form Validation</a></li>
				<li><a href="#">HTML5 Form Validation Examples</a></li>
			</ul>
			<h3 id="js-biao-dan-yan-zheng">JS 表单验证 <a href="#js-biao-dan-yan-zheng" class="doc-anchor"></a></h3>
			<p>JS 表单验证基于 HTML5 的各项验证属性进行：</p>
			<ul>
				<li><code>required</code>:必填；</li>
				<li><code>pattern</code>:验证正则表达式，插件内置了 <code>email</code>、<code>url</code>、<code>number</code> 三种类型的正则表达式；</li>
				<li><code>minlength</code>/<code>maxlength</code>:字符限制；</li>
				<li><code>min</code>/<code>max</code>:最小、最大值限制，仅适用于数值类型的域；</li>
				<li><code>minchecked</code>/<code>maxchecked</code>:至少、至多选择数，适用于 <code>checkbox</code>、下拉多选框，<code>checkbox</code> 时将相关属性的设置在同组的第一个元素上；</li>
				<li><code>.js-pattern-xx</code>:验证规则 class，正则库中存在的规则可以通过添加相应 class 实现规则添加。</li>
			</ul>
			<p><strong>注意：</strong></p>
			<p>HTML5 原生表单验证中 <code>pattern</code> 只验证值的合法性，也就是<strong>可以不填，如果填写则必须符合规则</strong>。如果是必填项，仍要添加 <code>required</code> 属性。该插件与 HTML5 的规则保持一致。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="xml">
<span class="hljs-comment">&lt;!--下面三种写法等效--&gt;</span>
<span class="hljs-comment">&lt;!--只内置了email url number三种类型的正则，可自行扩展--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"email"</span>&gt;</span>
<span class="hljs-comment">&lt;!--js-pattern-xx其中xx为pattern库中的key--&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text"</span> <span class="hljs-attribute">class</span>=<span class="hljs-value">"js-pattern-email"</span>&gt;</span>
<span class="hljs-tag">&lt;<span class="hljs-title">input</span> <span class="hljs-attribute">type</span>=<span class="hljs-value">"text"</span> <span class="hljs-attribute">pattern</span>=<span class="hljs-value">"^(...email regex...)$"</span>&gt;</span>
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<form class="am-form" data-am-validator>
					<fieldset>
						<legend>JS 表单验证</legend>
						<div class="am-form-group">
							<label>用户名：</label>
							<input type="text" required="required"<%=data[0]%> placeholder="输入用户名（至少 3 个字符）">
						</div>
						<div class="am-form-group">
							<label>邮箱：</label>
							<input type="email" required="required" placeholder="输入邮箱">
						</div>
						<div class="am-form-group">
							<label>网址：</label>
							<input type="url" required="required" placeholder="输入网址">
						</div>
						<div class="am-form-group">
							<label>年龄：</label>
							<input type="number" required="required" min="18" max="120" placeholder="输入年龄 18-120">
						</div>
						<div class="am-form-group">
							<label class="am-form-label">爱好：</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="橘子" required="required"<%=data[1]%> name="docVlCb"> 橘子</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="苹果" name="docVlCb"> 苹果</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="菠萝" name="docVlCb"> 菠萝</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="芒果" name="docVlCb"> 芒果</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="香蕉" name="docVlCb"> 香蕉</label>
						</div>
						<div class="am-form-group">
							<label>性别：</label>
							<label class="am-radio-inline"><input type="radio" required="required" name="docVlGender"> 男</label>
							<label class="am-radio-inline"><input type="radio" name="docVlGender"> 女</label>
							<label class="am-radio-inline"><input type="radio" name="docVlGender"> 其他</label>
						</div>
						<div class="am-form-group">
							<label>下拉单选框</label>
							<select<%=data[3]%>>
								<option value="">-=请选择一项=-</option>
								<option value="option1">选项一...</option>
								<option value="option2">选项二.....</option>
								<option value="option3">选项三........</option>
							</select>
							<span class="am-form-caret"></span>
						</div>
						<div class="am-form-group">
							<label>多选框</label>
							<select multiple="multiple"<%=data[1]%>>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="am-form-group">
							<label>评论：</label>
							<textarea<%=data[2]%> maxlength="100"></textarea>
						</div>
						<button type="submit" class="am-btn am-btn-secondary">提交</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="xian-shi-ti-shi-xin-xi">显示提示信息 <a href="#xian-shi-ti-shi-xin-xi" class="doc-anchor"></a></h3>
			<p>通过插件的 <code>.onValid</code> 和 <code>onInValid</code> 回调接口，可以根据需要定提示信息显示。</p>
			<p>使用时可以自行定义提示信息，也可以使用插件的内置的提示信息，详见后面的示例代码。</p>
			<p><strong>注意：</strong> <code>.getValidationMessage(validity)</code> 是 <code>v2.3</code> 中新增的方法，以前的版本只能使用自定义信息。</p>
			<h4 id="di-bu-xian-shi-ti-shi-xin-xi">底部显示提示信息 <a href="#di-bu-xian-shi-ti-shi-xin-xi" class="doc-anchor"></a></h4>
			<div class="doc-example">
				<form class="am-form" id="doc-vld-msg">
					<fieldset>
						<legend>JS 表单验证</legend>
						<div class="am-form-group">
							<label>用户名：</label>
							<input type="text" required="required"<%=data[0]%> placeholder="输入用户名（至少 3 个字符）">
						</div>
						<div class="am-form-group">
							<label>邮箱：</label>
							<input type="email" required="required" placeholder="输入邮箱" data-validation-message="自定义提示信息：输入地球上的电子邮箱撒">
						</div>
						<div class="am-form-group">
							<label>网址：</label>
							<input type="url" required="required" placeholder="输入网址">
						</div>
						<div class="am-form-group">
							<label>年龄：</label>
							<input type="number" required="required" min="18" max="120" placeholder="输入年龄 18-120">
						</div>
						<div class="am-form-group">
							<label class="am-form-label">爱好：</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="橘子" required="required"<%=data[1]%> name="docVlCb"> 橘子</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="苹果" name="docVlCb"> 苹果</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="菠萝" name="docVlCb"> 菠萝</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="芒果" name="docVlCb"> 芒果</label>
							<label class="am-checkbox-inline"><input type="checkbox" value="香蕉" name="docVlCb"> 香蕉</label>
						</div>
						<div class="am-form-group">
							<label>性别：</label>
							<label class="am-radio-inline"><input type="radio" required="required" name="docVlGender"> 男</label>
							<label class="am-radio-inline"><input type="radio" name="docVlGender"> 女</label>
							<label class="am-radio-inline"><input type="radio" name="docVlGender"> 其他</label>
						</div>
						<div class="am-form-group">
							<label>下拉单选框</label>
							<select<%=data[3]%>>
								<option value="">-=请选择一项=-</option>
								<option value="option1">选项一...</option>
								<option value="option2">选项二.....</option>
								<option value="option3">选项三........</option>
							</select>
							<span class="am-form-caret"></span>
						</div>
						<div class="am-form-group">
							<label>多选框</label>
							<select multiple="multiple"<%=data[1]%>>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
							</select>
						</div>
						<div class="am-form-group">
							<label>评论：</label>
							<textarea<%=data[2]%> maxlength="100"></textarea>
						</div>
						<button type="submit" class="am-btn am-btn-secondary">提交</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h4 id="tooltip">Tooltip <a href="#tooltip" class="doc-anchor"></a></h4>
			<div class="doc-example">
				<form class="am-form" id="form-with-tooltip">
					<fieldset>
						<legend>定义 Tooltip</legend>
						<div class="am-form-group">
							<label>用户名：</label>
							<input type="text" required="required"<%=data[0]%> placeholder="输入用户名（至少 3 个字符）">
						</div>
						<div class="am-form-group">
							<label>密码：</label>
							<input type="password" required="required" pattern="^\d{6}$" placeholder="6 位数字的银行卡密码" data-foolish-msg="把 IQ 卡密码交出来！">
						</div>
						<button type="submit" class="am-btn am-btn-secondary">提交</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h3 id="deng-zhi-yan-zheng">等值验证 <a href="#deng-zhi-yan-zheng" class="doc-anchor"></a></h3>
			<p>通过 <code>data-equal-to</code> 指定要比较的域。</p>
			<div class="doc-example">
				<form class="am-form" data-am-validator>
					<fieldset>
						<legend>密码验证</legend>
						<div class="am-form-group">
							<label>用户名：</label>
							<input type="text" required="required"<%=data[0]%> placeholder="输入用户名（至少 3 个字符）">
						</div>
						<div class="am-form-group">
							<label>密码：</label>
							<input type="password" required="required" pattern="^\d{6}$" placeholder="6 位数字的银行卡密码" id="doc-vld-pwd-1">
						</div>
						<div class="am-form-group">
							<label>确认密码：</label>
							<input type="password" required="required" placeholder="请与上面输入的值一致" data-equal-to="#doc-vld-pwd-1">
						</div>
						<button type="submit" class="am-btn am-btn-secondary">提交</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="zi-ding-yi-yan-zheng">自定义验证 <a href="#zi-ding-yi-yan-zheng" class="doc-anchor"></a></h3>
			<p>插件预置的功能不可能满足各异的需求，通过 <code>validate</code> 选项，可以自定义验证规则，如远程验证等。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-string">'#your-form'</span>).validator({
   validate:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">validity</span>)</span>{
       <span class="hljs-comment">//在这里编写你的验证逻辑</span>
   }
});
					</code>
				</pre>
			</div>
			<p>参数 <code>validity</code> 是一个类似 <a href="#">H5 ValidityState</a> 属性的对象。只要中主要用到的包括：</p>
			<ul>
				<li><code>validity.field</code> - DOM 对象，当前验证的域，通过 <code>$(validity.field)</code> 可转换为 jQuery 对象，一般用于获取值和判断是否为特定域，以编写验证逻辑；</li>
				<li><code>validity.valid</code> - 布尔值，验证是否通过，通过赋值 <code>true</code>，否则赋值 <code>false</code>。</li>
			</ul>
			<p>其它属性用来描述验证出错的细节，包括：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
{
   customError:<span class="hljs-literal">false</span>,
   patternMismatch:<span class="hljs-literal">false</span>,
   rangeOverflow:<span class="hljs-literal">false</span>,<span class="hljs-comment">//higher than maximum</span>
   rangeUnderflow:<span class="hljs-literal">false</span>,<span class="hljs-comment">//lower than minimum</span>
   stepMismatch:<span class="hljs-literal">false</span>,
   tooLong:<span class="hljs-literal">false</span>,
   <span class="hljs-comment">//value is not in the correct syntax</span>
   typeMismatch:<span class="hljs-literal">false</span>,
   <span class="hljs-comment">//Returns true if the element has no value but is a required field</span>
   valueMissing:<span class="hljs-literal">false</span>
}
					</code>
				</pre>
			</div>
			<p>插件扩展的三种验证属性，对应的自定义错误名称为：</p>
			<ul>
				<li><code>minlength</code> -&gt; <code>tooShort</code></li>
				<li><code>minchecked</code> -&gt; <code>checkedUnderflow</code></li>
				<li><code>maxchecked</code> -&gt; <code>checkedOverflow</code></li>
			</ul>
			<p>H5 浏览器原生验证通过错误细节来显示提示信息，<del>插件中暂未使用到这些属性，如果实在不想写，可以略过，</del> <code>v2.3</code> 开始这些信息用于生成错误提示信息。</p>
			<p><strong>需要注意的注意细节：</strong></p>
			<ul>
				<li>通过 <code>validity.valid</code> 标记验证是否通过；</li>
				<li>如果是远程异步验证，<strong>必须</strong>返回 <a href="#">Deferred 对象</a>，且回调函数中要返回 <code>validity</code>。</li>
			</ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">return</span> $.ajax({
   url:<span class="hljs-string">'...'</span>,
   <span class="hljs-comment">//cache:false,实际使用中请禁用缓存</span>
   dataType:<span class="hljs-string">'json'</span>
}).then(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">data</span>) </span>{
   <span class="hljs-comment">//Ajax请求成功，根据服务器返回的信息，设置validity.valid=true or flase</span>
   <span class="hljs-comment">//返回 validity</span>
   <span class="hljs-keyword">return</span> validity;
},<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-comment">//Ajax请求失败，根据需要决定验证是否通过，然后返回validity</span>
   <span class="hljs-keyword">return</span> validity;
});
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<form class="am-form" id="doc-vld-ajax">
					<fieldset>
						<legend>自定义验证</legend>
						<div class="am-form-group">
							<label>Ajax 服务器端验证：</label>
							<input type="text" class="js-ajax-validate" placeholder="只能填写数字 10" data-validate-async>
						</div>
						<div class="am-form-group">
							<label>客户端验证：</label>
							<input type="text" class="js-sync-validate" placeholder="只能填写数字 10">
						</div>
						<button type="submit" class="am-btn am-btn-secondary">提交</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<div class="doc-code demo-highlight"><pre><code class="javascript">CODE</code></pre></div>
			<h2 id="shi-yong-fang-shi">使用方式 <a href="#shi-yong-fang-shi" class="doc-anchor"></a></h2>
			<h3 id="tong-guo-data-api">通过 Data API <a href="#tong-guo-data-api" class="doc-anchor"></a></h3>
			<p>在 <code>form</code> 上添加 <code>data-am-validator</code> 属性（同时可以设置相关选项）。</p>
			<h3 id="tong-guo-js">通过 JS <a href="#tong-guo-js" class="doc-anchor"></a></h3>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   $(<span class="hljs-string">'#your-form'</span>).validator(options);
});
					</code>
				</pre>
			</div>
			<h4 id="can-shu-shuo-ming">参数说明 <a href="#can-shu-shuo-ming" class="doc-anchor"></a></h4>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
{
   <span class="hljs-comment">//是否使用H5原生表单验证，不支持浏览器会自动退化到JS验证</span>
   H5validation:<span class="hljs-literal">false</span>,
   <span class="hljs-comment">//内置规则的H5 input type，这些type无需添加pattern</span>
   H5inputType:[<span class="hljs-string">'email'</span>,<span class="hljs-string">'url'</span>,<span class="hljs-string">'number'</span>],
   <span class="hljs-comment">//验证正则</span>
   <span class="hljs-comment">//key1:/^...$/，包含`js-pattern-key1`的域会自动应用改正则</span>
   patterns:{},
   <span class="hljs-comment">//规则class钩子前缀</span>
   patternClassPrefix:<span class="hljs-string">'js-pattern-'</span>,
   activeClass:<span class="hljs-string">'am-active'</span>,
   <span class="hljs-comment">//验证不通过时添加到域上的class</span>
   inValidClass:<span class="hljs-string">'am-field-error'</span>,
   <span class="hljs-comment">//验证通过时添加到域上的class</span>
   validClass:<span class="hljs-string">'am-field-valid'</span>,
   <span class="hljs-comment">//表单提交的时候验证</span>
   validateOnSubmit:<span class="hljs-literal">true</span>,
   <span class="hljs-comment">//表单提交时验证的域</span>
   <span class="hljs-comment">//Elements to validate with allValid (only validating visible elements)</span>
   <span class="hljs-comment">//:input:selects all input,textarea,select and button elements.</span>
   <span class="hljs-comment">//@since 2.5:move `:visible` to `ignore` option,became to `:hidden`</span>
   allFields:<span class="hljs-string">':input:not(:button,:disabled,.am-novalidate)'</span>,
   <span class="hljs-comment">//表单提交时验证的忽略的域</span>
   <span class="hljs-comment">//ignored elements</span>
   <span class="hljs-comment">//@since 2.5</span>
   ignore:<span class="hljs-string">':hidden:not([data-am-selected],.am-validate)'</span>,
   <span class="hljs-comment">//调用validate()方法的自定义事件</span>
   customEvents:<span class="hljs-string">'validate'</span>,
   <span class="hljs-comment">//下列元素触发以下事件时会调用验证程序</span>
   keyboardFields:<span class="hljs-string">':input:not(:button,:disabled,.am-novalidate)'</span>,
   keyboardEvents:<span class="hljs-string">'focusout,change'</span>,<span class="hljs-comment">//keyup,focusin</span>
   <span class="hljs-comment">//标记为`.am-active`(发生错误以后添加此class)的元素keyup时验证</span>
   activeKeyup:<span class="hljs-literal">false</span>,
   <span class="hljs-comment">//textarea[maxlength]的元素keyup时验证</span>
   textareaMaxlenthKeyup:<span class="hljs-literal">true</span>,
   <span class="hljs-comment">//鼠标点击下列元素时会调用验证程序</span>
   pointerFields:<span class="hljs-string">'input[type="range"]:not(:disabled,.am-novalidate),'</span>+
      <span class="hljs-string">'input[type="radio"]:not(:disabled,.am-novalidate),'</span>+
      <span class="hljs-string">'input[type="checkbox"]:not(:disabled,.am-novalidate),'</span>+
      <span class="hljs-string">'select:not(:disabled,.am-novalidate),'</span>+
      <span class="hljs-string">'option:not(:disabled,.am-novalidate)'</span>,
   pointerEvents:<span class="hljs-string">'click'</span>,
   <span class="hljs-comment">//域验证通过时添加的操作，通过该接口可定义各种验证提示</span>
   markValid:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">validity</span>)</span>{
      <span class="hljs-comment">//this is Validator instance</span>
      <span class="hljs-keyword">var</span> options=<span class="hljs-keyword">this</span>.options;
      <span class="hljs-keyword">var</span> $field=$(validity.field);
      <span class="hljs-keyword">var</span> $parent=$field.closest(<span class="hljs-string">'.am-form-group'</span>);
      $field.addClass(options.validClass).
      removeClass(options.inValidClass);
      $parent.addClass(<span class="hljs-string">'am-form-success'</span>).removeClass(<span class="hljs-string">'am-form-error'</span>);
      options.onValid.call(<span class="hljs-keyword">this</span>,validity);
   },
   <span class="hljs-comment">//域验证失败时添加的操作，通过该接口可定义各种验证提示</span>
   markInValid:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">validity</span>)</span>{
      <span class="hljs-keyword">var</span> options=<span class="hljs-keyword">this</span>.options;
      <span class="hljs-keyword">var</span> $field=$(validity.field);
      <span class="hljs-keyword">var</span> $parent=$field.closest(<span class="hljs-string">'.am-form-group'</span>);
      $field.addClass(options.inValidClass+<span class="hljs-string">' '</span>+options.activeClass).
      removeClass(options.validClass);
      $parent.addClass(<span class="hljs-string">'am-form-error'</span>).removeClass(<span class="hljs-string">'am-form-success'</span>);
      options.onInValid.call(<span class="hljs-keyword">this</span>,validity);
   },
   <span class="hljs-comment">//域通过验证时回调</span>
   onValid:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">validity</span>)</span>{},
   <span class="hljs-comment">//验证出错时的回调，validity对象包含相关信息，格式通 H5表单元素的validity属性</span>
   onInValid:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">validity</span>)</span>{},
   <span class="hljs-comment">//自定义验证程序接口，详见示例</span>
   validate:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">validity</span>)</span>{
      <span class="hljs-comment">//return validity;</span>
   },
   <span class="hljs-comment">//定义表单提交处理程序</span>
   <span class="hljs-comment">//如果没有定义且`validateOnSubmit`为`true`时，提交时会验证整个表单</span>
   <span class="hljs-comment">//如果定义了表单提交处理程序，`validateOnSubmit`将会失效</span>
   <span class="hljs-comment">/function(e){</span>
   <span class="hljs-comment">//通过 this.isFormValid()获取表单验证状态</span>
   <span class="hljs-comment">//注意：如果自定义验证程序而且自定义验证程序中包含异步验证的话 this.isFormValid()返回的是 Promise，不是布尔值</span>
   <span class="hljs-comment">//Do something...</span>
   <span class="hljs-comment">//}</span>
   submit:<span class="hljs-literal">null</span>
}
					</code>
				</pre>
			</div>
			<p><strong>包含异步验证的表单提交处理</strong></p>
			<p>包含异步验证时，<code>isFormValid()</code> 返回 Promise，可以使用 <a href="#"><code>jQuery.when()</code></a> 来处理结果。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
$(<span class="hljs-string">'#xx'</span>).validator({
   submit:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
      <span class="hljs-keyword">var</span> formValidity=<span class="hljs-keyword">this</span>.isFormValid();
      $.when(formValidity).then(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
         <span class="hljs-comment">//验证成功的逻辑</span>
      },<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
         <span class="hljs-comment">//验证失败的逻辑</span>
      });
   }
});
					</code>
				</pre>
			</div>
			<h4 id="kuo-zhan-zheng-ze-ku">扩展正则库 <a href="#kuo-zhan-zheng-ze-ku" class="doc-anchor"></a></h4>
			<p>在 DOM Ready 之前执行以下操作：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">$</span>)</span>{
   <span class="hljs-keyword">if</span>($.AMUI&amp;&amp;$.AMUI.validator){
      <span class="hljs-comment">//增加多个正则</span>
      $.AMUI.validator.patterns=$.extend($.AMUI.validator.patterns,{
         colorHex:<span class="hljs-regexp">/^(#([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))?$/</span>
      });
      <span class="hljs-comment">//增加单个正则</span>
      $.AMUI.validator.patterns.yourpattern=<span class="hljs-regexp">/^your$/</span>;
   }
})(<span class="hljs-built_in">window</span>.jQuery);
					</code>
				</pre>
			</div>
			<div class="doc-example">
				<form class="am-form" data-am-validator>
					<div class="am-form-group">
						<label>输入一个颜色值</label>
						<input type="text" class="js-pattern-colorHex" placeholder="如果填写，必须是 #xxx 或 #xxxxxx">
					</div>
					<div class="am-form-group">
						<label>your pattern</label>
						<input type="text" class="js-pattern-yourpattern" required="required" placeholder="必填，且只能填 your">
					</div>
					<div><button class="am-btn am-btn-secondary">提交</button></div>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="fang-fa">方法 <a href="#fang-fa" class="doc-anchor"></a></h3>
			<ul>
				<li><code>.validator(options)</code> - 初始化表单验证</li>
				<li>
					<p><code>.validator(&#39;isFormValid&#39;)</code> - 返回表单验证状态，如果包含异步验证则返回 Promise（使用 <code>jQuery.when</code> 处理），否则返回布尔值</p>
					<div class="doc-code demo-highlight">
						<pre>
							<code class="javascript">
<span class="hljs-comment">//处理异步验证结果</span>
$.when($(<span class="hljs-string">'myForm'</span>).validator(<span class="hljs-string">'isFormValid'</span>)).then(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-comment">//验证成功的逻辑</span>
},<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-comment">//验证失败的逻辑</span>
});
							</code>
						</pre>
					</div>
				</li>
				<li><code>.validator(&#39;destroy&#39;)</code> - 销毁表单验证</li>
			</ul>
			<h2 id="issue-ce-shi">Issue 测试 <a href="#issue-ce-shi" class="doc-anchor"></a></h2>
			<h3 id="a-hrefhttpsgithub-comallmobilizeamazeuiissues528528a"><a href="#">#528</a> <a href="#a-hrefhttpsgithub-comallmobilizeamazeuiissues528528a" class="doc-anchor"></a></h3>
			<div class="doc-example">
				<form class="am-form" data-am-validator>
					<fieldset>
						<legend>Issue 528</legend>
						<div class="am-form-group">
							<label>手机号：</label>
							<input type="text" class="js-pattern-mobile" required="required" placeholder="输入手机号">
						</div>
						<button type="submit" class="am-btn am-btn-secondary">提交</button>
					</fieldset>
				</form>
			</div>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h2 id="can-kao-zi-yuan">参考资源 <a href="#can-kao-zi-yuan" class="doc-anchor"></a></h2>
			<h3 id="chang-yong-zheng-ze-biao-da-shi">常用正则表达式 <a href="#chang-yong-zheng-ze-biao-da-shi" class="doc-anchor"></a></h3>
			<ul>
				<li>带区号的电话号码：<code>/^(\d{3}-|\d{4}-)(\d{8}|\d{7})$/</code></li>
				<li>匹配中文字符： <code>/[\u4e00-\u9fa5]/</code></li>
				<li>国内邮政编码： <code>/^\d{6}$/</code></li>
				<li>国内手机号码： <code>/^1((3|5|8){1}\d{1}|70)\d{8}$/</code> （匹配 13x/15x/18x/170 号段，如有遗漏请自行添加）</li>
			</ul>
			<h3 id="zhu-yi-shi-xiang">注意事项 <a href="#zhu-yi-shi-xiang" class="doc-anchor"></a></h3>
			<ul>
				<li><code>checkbox</code>/<code>radio</code> <strong>务必添加 <code>name</code> 属性，否则无法正常工作</strong>；</li>
				<li><code>&lt;input type='number'&gt;</code> 输入非数字字符时返回值为空字符串 <code>''</code>；</li>
				<li>浏览器默认选中下拉单选框的第一项，使用时需将第一项的值设置为空 <code>value=''</code>。</li>
			</ul>
			<div class="doc-code demo-highlight"><pre><code class="xml">CODE</code></pre></div>
			<h3 id="can-kao-lian-jie">参考链接 <a href="#can-kao-lian-jie" class="doc-anchor"></a></h3>
			<ul>
				<li><a href="#">Validity State</a></li>
				<li><a href="#">HTML5 Constraint Validation API</a></li>
				<li><a href="#">Constraint Validation:Native Client Side Validation for Web Forms</a></li>
				<li><a href="#">https://github.com/wenzhixin/multiple-select/</a></li>
				<li><a href="#">HTML5 Placeholder jQuery Plugin</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="44c119b3ec6b6d0762ee08c26ce31fba" data-title="JS 插件 - Validator|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
$(function(){
	$("#doc-vld-msg").validator({
		onValid:function(a){
			$(a.field).closest(".am-form-group").find(".am-alert").hide();
		},
		onInValid:function(a){
			var i=$(a.field),d=i.closest(".am-form-group"),e=d.find(".am-alert"),l=i.data("validationMessage")||this.getValidationMessage(a);
			e.length||(e=$('<div class="am-alert am-alert-danger"></div>').hide().appendTo(d)),e.html(l).show();
		}
	});
	var t=$("#form-with-tooltip"),o=$("<div id=\"vld-tooltip\">提示信息！</div>");
	o.appendTo(document.body);
	t.validator({
		onValid:function(){
			o.hide();
		}
	});
	t.on("focusin focusout",".am-form-error input",function(i){
		if("focusin"===i.type){
			var a=$(this),e=a.offset(),d=a.data("foolishMsg")||t.validator("getValidationMessage",a.data("validity"));
			o.text(d).show().css({left:e.left+10,top:e.top+$(this).outerHeight()+10});
		}else{
			o.hide();
		}
	});
	$("#doc-vld-ajax").validator({
		validate:function(a){
			var n=$(a.field).val();
			var i=function(n,i){
				n!=i&&(a.valid=!1),10>i?a.rangeUnderflow=!0:i>10&&(a.rangeOverflow=!0);
			};
			return $(a.field).is(".js-ajax-validate")?$.ajax({
				url:"http://s.amazeui.org/media/i/demos/validate.json",
				dataType:"json"
			}).then(function(e){
				return i(e.count,n),a;
			},function(){
				return a;
			}):void($(a.field).is(".js-sync-validate")&&i(10,n));
		}
	});
});
!function(a){
	a.AMUI&&a.AMUI.validator&&(a.AMUI.validator.patterns=a.extend(a.AMUI.validator.patterns,{colorHex:/^(#([a-fA-F0-9]{6}|[a-fA-F0-9]{3}))?$/}),a.AMUI.validator.patterns.yourpattern=/^your$/);
}(window.jQuery);
$.AMUI&&$.AMUI.validator&&($.AMUI.validator.patterns.mobile=/^\s*1\d{10}\s*$/);
</script>
</body>
</html>