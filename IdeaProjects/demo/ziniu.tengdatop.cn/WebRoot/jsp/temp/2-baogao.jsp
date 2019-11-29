<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>报告</title>
	<%@ include file="/jsp/meta.jsp"%>
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/jsp/menu.jsp"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="row">
					<div class="col-md-2">
						<div class="report_menu_box">
							<a href="#" class="hover">日报</a>
							<a href="#">周报</a>
							<a href="#">月报</a>
						</div>
					</div>
					<div class="col-md-10">
						<div class="panel panel-default report_search_box">
							<div class="panel-body">
								<span>发送状态：</span>
								<select class="public_select">
									<option>全部</option>
									<option value="111">111</option>
									<option value="222">222</option>
								</select>
								<input type="text" class="datepicker public_input" placeholder="mm/dd/yyyy">
								<span>至</span>
								<input type="text" class="datepicker public_input" placeholder="mm/dd/yyyy">
								<span style="margin-left:20px;">每页显示</span>
								<select class="public_select">
									<option value="10">10条</option>
									<option value="20">20条</option>
								</select>
								<span style="margin-left:10px;">1/50页|共15条</span>
								<span class="sort_box">
									<input type="text" class="public_input" placeholder="22">
									<button>go</button>
								</span>
							</div>
							<div class="report_paging_box">
								<a href="#" style="border-radius:3px 0 0 3px;"><img src="comm/images/left.png" style="width:10px;"></a>
								<a href="#" style="border-radius:0 3px 3px 0;" class="hover"><img src="comm/images/right.png" style="width:10px;"></a>
							</div>
						</div>
						<div class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>搜索分类：</span>
								<label class="vm">
									<input type="checkbox" class="vm" checked="checked">
									<span class="vm">搜索引擎</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">新闻</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">微博</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">论坛</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">微信</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">问答</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">视频</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">博客</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">APP</span>
								</label>
								<label class="vm">
									<input type="checkbox" class="vm">
									<span class="vm">报刊</span>
								</label>
							</div>
						</div>
						<div class="table-responsive">
							<table class="table report_table">
								<thead>
									<tr>
										<th>报告名称</th>
										<th>时间</th>
										<th>文件类别</th>
										<th>发送状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-warning btn-xs">再次发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
									<tr>
										<td>时时舆情报告</td>
										<td>2017-12-02</td>
										<td>
											<select class="public_select">
												<option>doc</option>
												<option>pdf</option>
											</select>
										</td>
										<td>已发送</td>
										<td><a href="#" class="btn btn-primary btn-xs">已发送</a></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/copy.jsp"/>
		</div>
	</div>
</section>
<jsp:include page="/jsp/footer.jsp"/>
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery(".datepicker").datepicker();
});
</script>
</body>
</html>