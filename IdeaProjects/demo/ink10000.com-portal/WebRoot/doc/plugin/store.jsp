<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte IE 7]><html class="no-js ie lte7 lte8 lte9 javascript"><![endif]-->
<!--[if IE 8]><html class="no-js ie ie8 lte8 lte9 javascript"><![endif]-->
<!--[if IE 9]><html class="no-js ie ie9 lte9 javascript"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html class="no-js javascript"><!--<![endif]-->
<head>
	<title>JS 插件 - Store|Amaze UI</title>
	<%@ include file="/doc/meta.jsp"%>
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
							<a href="#cun-chu-jie-kou">存储接口</a>
							<ul class="am-collapse">
								<li><a href="#jian-ce-shi-fou-zhi-chi-kai-qi-localstorage">检测是否支持（开启） LocalStorage</a></li>
								<li><a href="#jie-kou-lie-biao">接口列表</a></li>
							</ul>
						</li>
						<li><a href="#liu-lan-qi-zhi-chi">浏览器支持</a></li>
						<li>
							<a href="#zhu-yi-shi-xiang">注意事项</a>
							<ul class="am-collapse">
								<li><a href="#yuan-sheng-fang-fa-yu-store-js-de-chai-yi">原生方法与 store.js 的差异</a></li>
								<li><a href="#zi-dong-guo-qi-shi-xian">自动过期实现</a></li>
							</ul>
						</li>
						<li><a href="#can-kao-zi-yuan">参考资源</a></li>
					</ul>
				</div>
			</div>
			<h1 id="store">Store <a href="#store" class="doc-anchor"></a></h1>
			<hr>
			<p>跨浏览器本地存储接口封装，源自 <a href="#">store.js</a>，精简了针对 IE 6/7 的代码。</p>
			<p>LocalStorage 只能存储字符串，store.js 在存取的时候会自动 <code>stringify</code>、<code>parse</code>。</p>
			<h2 id="cun-chu-jie-kou">存储接口 <a href="#cun-chu-jie-kou" class="doc-anchor"></a></h2>
			<p>通过 <code>$.AMUI.store</code> 调用。</p>
			<h3 id="jian-ce-shi-fou-zhi-chi-kai-qi-localstorage">检测是否支持（开启） LocalStorage <a href="#jian-ce-shi-fou-zhi-chi-kai-qi-localstorage" class="doc-anchor"></a></h3>
			<p>爱上一匹野马之前，先想想你家有没有草原；使用之前，当然要先检测一下。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> store=$.AMUI.store;
<span class="hljs-keyword">if</span>(!store.enabled){
   alert(<span class="hljs-string">'Local storage is not supported by your browser. Please disable "Private Mode", or upgrade to a modern browser.'</span>);
   <span class="hljs-keyword">return</span>;
}
<span class="hljs-keyword">var</span> user=store.get(<span class="hljs-string">'user'</span>);
<span class="hljs-comment">//...and so on...</span>
					</code>
				</pre>
			</div>
			<p>Safari 的<code>无痕浏览</code>模式或者用户禁用了本地存储时，<code>store.enabled</code> 将返回 <code>false</code>。</p>
			<p><strong>浏览器如何禁用 LocalStorage</strong>：</p>
			<ul>
				<li>Firefox： 地址栏输入 <code>about:config</code>, 将 <code>dom.storage.enabled</code> 的值设置为 <code>false</code>；</li>
				<li>Chrome:<code>设置</code> → <code>隐私设置</code> → <code>内容设置</code> → <code>阻止网站设置任何数据</code>。</li>
			</ul>
			<h3 id="jie-kou-lie-biao">接口列表 <a href="#jie-kou-lie-biao" class="doc-anchor"></a></h3>
			<p><a href="#">LocalStorage</a> 受<a href="#">同源策略</a>限制，以下操作仅限于同源下的数据。</p>
			<ul>
				<li><code>store.set(key, val)</code>:存储 <code>key</code> 的值为 <code>val</code>；</li>
				<li><code>store.get(key)</code>:获取 <code>key</code> 的值；</li>
				<li><code>store.remove(key)</code>:移除 <code>key</code> 的记录；</li>
				<li><code>store.clear()</code>:清空存储；</li>
				<li><code>store.getAll()</code>:返回所有存储；</li>
				<li><code>store.forEach()</code>:遍历所有存储。</li>
			</ul>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> store=$.AMUI.store;
<span class="hljs-comment">//存储'username'的值为'marcus'</span>
store.set(<span class="hljs-string">'username'</span>,<span class="hljs-string">'marcus'</span>)
<span class="hljs-comment">//获取'username'</span>
store.get(<span class="hljs-string">'username'</span>);
<span class="hljs-comment">//移除'username'字段</span>
store.remove(<span class="hljs-string">'username'</span>);
<span class="hljs-comment">//清除所有本地存储</span>
store.clear();
<span class="hljs-comment">//存储对象-自动调用JSON.stringify</span>
store.set(<span class="hljs-string">'user'</span>,{name:<span class="hljs-string">'marcus'</span>,likes:<span class="hljs-string">'javascript'</span>});
<span class="hljs-comment">//获取存储的对象-自动执行 JSON.parse</span>
<span class="hljs-keyword">var</span> user=store.get(<span class="hljs-string">'user'</span>);
alert(user.name+<span class="hljs-string">' likes '</span>+user.likes);
<span class="hljs-comment">//从所有存储中获取值</span>
store.getAll().user.name==<span class="hljs-string">'marcus'</span>;
<span class="hljs-comment">//遍历所有存储</span>
store.forEach(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">key,val</span>)</span>{
   <span class="hljs-built_in">console</span>.log(key,<span class="hljs-string">'=='</span>,val);
});
					</code>
				</pre>
			</div>
			<h2 id="liu-lan-qi-zhi-chi">浏览器支持 <a href="#liu-lan-qi-zhi-chi" class="doc-anchor"></a></h2>
			<p>绝大多数浏览器（包括 IE 8）都<a href="#">原生支持 LocalStorage</a>。</p>
			<p>
				你的浏览器测试结果为：
				<strong class="am-text-danger" id="errorOutput"></strong>
				<strong class="am-text-success" id="store-test-success"></strong>
			</p>
			<p>不同浏览器对本地存储单条记录的长度限定不同，具体可以通过以下链接测试：</p>
			<ul>
				<li><a href="#">Web Storage Support Test</a></li>
				<li><a href="#">Test of localStorage limits/quota</a></li>
			</ul>
			<h2 id="zhu-yi-shi-xiang">注意事项 <a href="#zhu-yi-shi-xiang" class="doc-anchor"></a></h2>
			<h3 id="yuan-sheng-fang-fa-yu-store-js-de-chai-yi">原生方法与 store.js 的差异 <a href="#yuan-sheng-fang-fa-yu-store-js-de-chai-yi" class="doc-anchor"></a></h3>
			<p>使用原生方法操作：</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
localStorage.myage=<span class="hljs-number">24</span>;
localStorage.myage!==<span class="hljs-number">24</span>;<span class="hljs-comment">//true</span>
localStorage.myage===<span class="hljs-string">'24'</span>;<span class="hljs-comment">//true</span>
localStorage.user={name:<span class="hljs-string">'marcus'</span>,likes:<span class="hljs-string">'javascript'</span>};
localStorage.user===<span class="hljs-string">"[object Object]"</span>;<span class="hljs-comment">//true</span>
localStorage.tags=[<span class="hljs-string">'javascript'</span>,<span class="hljs-string">'localStorage'</span>, <span class="hljs-string">'store.js'</span>]
localStorage.tags.length===<span class="hljs-number">32</span>;<span class="hljs-comment">//true</span>
localStorage.tags===<span class="hljs-string">"javascript,localStorage,store.js"</span>;<span class="hljs-comment">//true</span>
					</code>
				</pre>
			</div>
			<p>使用 store.js 序列化后的结果:</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
store.set(<span class="hljs-string">'myage'</span>,<span class="hljs-number">24</span>);
store.get(<span class="hljs-string">'myage'</span>)===<span class="hljs-number">24</span>;<span class="hljs-comment">//true</span>
store.set(<span class="hljs-string">'user'</span>,{name:<span class="hljs-string">'marcus'</span>,likes:<span class="hljs-string">'javascript'</span>});
alert(<span class="hljs-string">"Hi my name is "</span>+store.get(<span class="hljs-string">'user'</span>).name+<span class="hljs-string">"!"</span>);<span class="hljs-comment">// 仍然返回对象</span>
store.set(<span class="hljs-string">'tags'</span>,[<span class="hljs-string">'javascript'</span>,<span class="hljs-string">'localStorage'</span>,<span class="hljs-string">'store.js'</span>]);
alert(<span class="hljs-string">"We've got "</span>+store.get(<span class="hljs-string">'tags'</span>).length+<span class="hljs-string">" tags here"</span>);<span class="hljs-comment">//仍然返回数组</span>
					</code>
				</pre>
			</div>
			<h3 id="zi-dong-guo-qi-shi-xian">自动过期实现 <a href="#zi-dong-guo-qi-shi-xian" class="doc-anchor"></a></h3>
			<p>LocalStorage 并没有提供过期时间接口，只能通过存储时间做比对实现。</p>
			<div class="doc-code demo-highlight">
				<pre>
					<code class="javascript">
<span class="hljs-keyword">var</span> store=$.AMUI.store;
<span class="hljs-keyword">var</span> storeWithExpiration={
   set:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">key,val,exp</span>)</span>{
      store.set(key,{val:val,exp:exp,time:<span class="hljs-keyword">new</span> <span class="hljs-built_in">Date</span>().getTime()});
   },
   get:<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params">key</span>)</span>{
      <span class="hljs-keyword">var</span> info=store.get(key)
      <span class="hljs-keyword">if</span>(!info){
         <span class="hljs-keyword">return</span> <span class="hljs-literal">null</span>;
      }
      <span class="hljs-keyword">if</span>(<span class="hljs-keyword">new</span> <span class="hljs-built_in">Date</span>().getTime()-info.time&gt;info.exp){
         <span class="hljs-keyword">return</span> <span class="hljs-literal">null</span>;
      }
      <span class="hljs-keyword">return</span> info.val
   }
};
storeWithExpiration.set(<span class="hljs-string">'foo'</span>,<span class="hljs-string">'bar'</span>,<span class="hljs-number">1000</span>);
setTimeout(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-built_in">console</span>.log(storeWithExpiration.get(<span class="hljs-string">'foo'</span>));
},<span class="hljs-number">500</span>);<span class="hljs-comment">//-&gt;"bar"</span>
setTimeout(<span class="hljs-function"><span class="hljs-keyword">function</span>(<span class="hljs-params"></span>)</span>{
   <span class="hljs-built_in">console</span>.log(storeWithExpiration.get(<span class="hljs-string">'foo'</span>));
},<span class="hljs-number">1500</span>);<span class="hljs-comment">//-&gt;null</span>
					</code>
				</pre>
			</div>
			<h2 id="can-kao-zi-yuan">参考资源 <a href="#can-kao-zi-yuan" class="doc-anchor"></a></h2>
			<ul>
				<li><a href="#">Cross domain local storage</a></li>
				<li><a href="#">使用 cookie 实现 LocalStorage</a></li>
				<li><a href="#">localForage</a></li>
				<li><a href="#">PouchDB</a></li>
				<li><a href="#">Basil.js</a></li>
			</ul>
			<div class="ds-thread" data-thread-key="eeeeb0287a379a484079b4b9ce59975d" data-title="JS 插件 - Store|Amaze UI" id="ds-thread"></div>
		</div>
	</div>
</section>
<%@ include file="/doc/footer.jsp"%>
<script type="text/javascript">
var a=$.AMUI.store;
$(function(){
	var s={outputError:null,assert:e,runFirstPass:o,runSecondPass:t,failed:!1},n=document,l=n.getElementById("errorOutput"),f="#secondPass"==n.location.hash;
	function e(e,o){
		e||(s.outputError("bad assert:"+o),a.disabled&&s.outputError("<br>Note that store.disabled == true"),s.failed=!0);
	}
	function o(){
		a.clear(),a.get("unsetValue"),a.set("foo","bar"),e("bar"==a.get("foo"),"stored key 'foo' not equal to stored value 'bar'"),a.remove("foo"),e(null==a.get("foo"),"removed key 'foo' not null"),e("value"==a.set("foo","value"),"store#set returns the stored value"),a.set("foo","bar1"),a.set("foo","bar2"),e("bar2"==a.get("foo"),"key 'foo' is not equal to second value set 'bar2'"),a.set("foo","bar"),a.set("bar","foo"),a.remove("foo"),e("foo"==a.get("bar"),"removing key 'foo' also removed key 'bar'"),a.set("foo","bar"),a.set("bar","foo"),a.clear(),e(null==a.get("foo")&&null==a.get("bar"),"keys foo and bar not cleared after store cleared");
		a.transact("foosact",function(o){
			e("object"==typeof o,"new key is not an object at beginning of transaction"),o.foo="foo";
		});
		a.transact("foosact",function(o){
			e("foo"==o.foo,"first transaction did not register"),o.bar="bar";
		});
		e("bar"==a.get("foosact").bar,"second transaction did not register"),a.set("foo",{name:"marcus",arr:[1,2,3]}),e("object"==typeof a.get("foo"),"type of stored object 'foo' is not 'object'"),e(a.get("foo")instanceof Object,"stored object 'foo' is not an instance of Object"),e("marcus"==a.get("foo").name,"property 'name' of stored object 'foo' is not 'marcus'"),e(a.get("foo").arr instanceof Array,"Array property 'arr' of stored object 'foo' is not an instance of Array"),e(3==a.get("foo").arr.length,"The length of Array property 'arr' stored on object 'foo' is not 3"),e(a.enabled=!a.disabled,"Store.enabled is not the reverse of .disabled"),a.remove("circularReference");
		var o={},t={one:o};
		o.two=t;
		var s=!1;
		try{
			a.set("circularReference",o);
		}catch(n){
			s=!0;
		}
		if(e(s,"storing object with circular reference did not throw"),e(!a.get("circularReference"),"attempting to store object with circular reference which should have faile affected store state"),"undefined"!=typeof localStorage){
			var l={"int":42,bool:!0,"float":3.141592653,string:"Don't Panic",odd_string:"{ZYX'} abc:;::)))"};
			for(key in l){
				localStorage[key]=l[key];
			}
			for(key in l){
				e(a.get(key)==l[key],key+" was not correctly promoted to valid JSON"),a.remove(key);
			}
		}
		a.set("firstPassFoo","bar"),a.set("firstPassObj",{woot:!0});
		var f=a.getAll();
		e("bar"==f.firstPassFoo,"getAll gets firstPassFoo"),e(4==r(f),"getAll gets all 4 values");
	}
	function t(){
		e("bar"==a.get("firstPassFoo"),"first pass key 'firstPassFoo' not equal to stored value 'bar'");
		var o=a.getAll();
		e("bar"==o.firstPassFoo,"getAll still gets firstPassFoo on second pass"),e(4==r(o),"getAll gets all 4 values"),a.clear(),e(null==a.get("firstPassFoo"),"first pass key 'firstPassFoo' not null after store cleared");
		var o=a.getAll();e(0==r(o),"getAll returns 0 properties after store.clear() has been called");
	}
	function r(e){
		var o=0;
		for(var t in e){
			e.hasOwnProperty(t)&&o++;
		}
		return o;
	}
	s.outputError=function(e){
		var o=(f?"second":"first")+" pass ";l.appendChild(n.createElement("div")).innerHTML=o+e;
	};
	try{
		f?s.runSecondPass():s.runFirstPass();
	}catch(c){
		console.log(c),s.assert(!1,'Tests should not throw:"'+JSON.stringify(c)+'"');
	}
	s.failed||(f?(n.location.hash="#",$("#store-test-success").html("测试通过！")):(n.location.hash="#secondPass",n.location.reload()));
});
</script>
</body>
</html>