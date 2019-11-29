<%@ page language="java" import="com.mc.portal.tool.html.First" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="am-modal am-modal-prompt j_block" id="j_user">
	<div class="am-modal-dialog">
		<div class="am-modal-hd">
			添加空间成员
			<div class="am-input-group am-input-group-sm">
				<input type="hidden" lang="open">
				<input type="text" class="am-form-field" placeholder="清输入关键字">
				<b class="am-input-group-btn"><a class="am-btn am-btn-secondary <%=First.icon("search")%>"> 搜索</a></b>
			</div>
			<i class="am-close am-close-spin" data-am-modal-close>&times;</i>
		</div>
		<div style="padding-bottom:5px;" class="am-modal-bd">
			<table class="am-table-striped am-table-hover">
				<thead>
					<tr class="am-primary">
						<th><input type="radio" disabled="disabled"></th>
						<th>登录账号</th>
						<th>真实姓名</th>
					</tr>
				</thead>
				<tbody></tbody>
			</table>
		</div>
		<div class="am-modal-footer">
			<a class="am-modal-btn" data-am-modal-cancel>取消</a>
			<a class="am-modal-btn" data-am-modal-confirm>提交</a>
		</div>
	</div>
</div>