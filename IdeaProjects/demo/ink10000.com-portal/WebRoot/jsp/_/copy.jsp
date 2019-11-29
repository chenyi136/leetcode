<%@ page language="java" import="
com.mc.portal.crux.Global,
com.mc.portal.tool.html.First" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<footer>
	<hr class="am-margin-vertical-xs">
	<div class="am-input-group">
		<input type="text" class="am-form-field" maxlength="400" placeholder="请描述您遇到的问题或分享您的想法" onkeydown="javascript:if(event.keyCode==13){JFeed(this);}">
		<b class="am-input-group-btn"><a class="am-btn am-btn-default <%=First.icon("send-o")%>" onclick="JFeed($(this).closest('.am-input-group').find('input'));"></a></b>
	</div>
	<p class="am-margin-0 am-padding-left-xs">© 2018 <a href="<%=Global.CLOUD%>about.htm">${SITE}</a>, Co.ltd.</p>
</footer>
<div class="am-modal am-modal-alert" id="j_donate">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">谢谢你的赞助<i class="am-close am-close-spin" data-am-modal-close>&times;</i></div>
		<div style="border:0;" class="am-padding-0 am-modal-bd">
			<a href="#" target="_blank">
				<b class="am-padding-xs am-u-md-6"><img src="data/i/alipay.jpg" class="am-img-thumbnail"></b>
				<b class="am-padding-xs am-u-md-6"><img src="data/i/wxpay.jpg" class="am-img-thumbnail"></b>
			</a>
			<div class="am-margin-xs am-form-group"><input type="text" class="am-form-field" maxlength="80" placeholder="你的联系方式" name="contact"></div>
			<div class="am-margin-xs am-margin-bottom-0 am-form-group"><input type="text" class="am-form-field" maxlength="200" placeholder="写下你的留言" name="comment"></div>
		</div>
		<div class="am-modal-footer"><a class="am-modal-btn <%=First.icon("thumbs-up")%>" onclick="JDonate()"> 支付了告诉我</a></div>
	</div>
</div>
<div style="bottom:68px;" class="am-gotop am-gotop-fixed j_left" onclick="JEvent('save')"><i class="am-gotop-icon <%=First.icon("plus")%>"></i></div>
<div style="bottom:36px;" class="am-gotop am-gotop-fixed j_left" data-am-modal="{target:'#j_donate'}"><i class="am-gotop-icon <%=First.icon("dollar")%>"></i></div>
<div style="bottom:4px;" class="am-gotop am-gotop-fixed j_left" id="j_left"><i class="am-gotop-icon <%=First.icon("list")%>"></i></div>
<div class="am-gotop am-gotop-fixed" id="j_top"><i class="am-gotop-icon <%=First.icon("long-arrow-up")%>"></i></div>
<script type="text/javascript">
window.KEEY_LOCAL_ADDRESS=true;
window.KEY_JUMP_PAGING="<%=Global.KEY_JUMP_PAGING%>";
window.JDBC_PRIMARY_FIELD="<%=Global.JDBC_PRIMARY_FIELD%>";
window.LEAF_DEF_SIZE=<%=Global.LEAF_DEF_SIZE%>;
window.LEAF_MAX_SIZE=<%=Global.LEAF_MAX_SIZE%>;
window.LEAF_MOVE_SIZE=3;
window.SHOW_JUMP_PAGING=true;
window.WEB_CONFIG_CLOUD="<%=Global.CLOUD%>";
window.WEB_CONFIG_ROOT="<%=Global.ROOT%>";
</script>
<script type="text/javascript" src="_/js/jquery.min-2.2.3.js"></script>
<script type="text/javascript" src="_/js/amazeui.min-2.6.2.js"></script>
<script type="text/javascript" src="_/js/plugin/jedate/jedate.min-3.4.0.js"></script>
<script type="text/javascript" src="_/my/jshare.js"></script>