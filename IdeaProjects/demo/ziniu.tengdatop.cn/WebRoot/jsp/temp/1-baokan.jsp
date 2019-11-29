<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>报刊</title>
	<%@ include file="/jsp/meta.jsp"%>
</head>
<body>
<!--
【来源网页】从【搜索引擎结果页】转换成【网站直接结果页】时则需对【网页分析】进行重新判断情感
【网页分析】确认了就不能重新判断情感，但可以设置失效
【来源网页】无效了则就让对应的【网页分析】确认了并设置无效
【网页分析】无效了则不再进行【网页追踪】
【网页分析】中点击了情感判断下拉框就算确认了
-->
<jsp:include page="/jsp/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/jsp/menu.jsp"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="row">
					<jsp:include page="/jsp/program.jsp"/>
					<div class="col-md-9" id="j_search">
						<div style="margin:0;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>时间范围：</span>
								<label class="vm">
									<input type="radio" class="vm" value="24" name="scope">
									<span class="vm">24小时</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="48" name="scope">
									<span class="vm">48小时</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="168" name="scope">
									<span class="vm">7天</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="360" name="scope">
									<span class="vm">15天</span>
								</label>
								<label class="vm">
									<input type="radio" class="vm" value="720" name="scope">
									<span class="vm">30天</span>
								</label>
								<span style="margin-left:40px;">最近</span>
								<input type="number" style="width:80px;" class="public_input" name="scope">
								<span>小时</span>
							</div>
						</div>
						<div style="margin:0;border-top:none;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>排列方式：</span>
								<label>
									<input type="radio" class="vm" value="CREATED_ASC" name="order">
									<span class="vm">按抓取时间升序</span>
								</label>
								<label>
									<input type="radio" class="vm" value="CREATED_DESC" name="order">
									<span class="vm">按抓取时间降序</span>
								</label>
								<label>
									<input type="radio" class="vm" value="SCREEN_ASC" name="order">
									<span class="vm">按发布时间升序</span>
								</label>
								<label>
									<input type="radio" class="vm" value="SCREEN_DESC" name="order">
									<span class="vm">按发布时间降序</span>
								</label>
							</div>
						</div>
						<div style="margin:0;border-top:none;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>来源媒体：</span>
								<label>
									<input type="checkbox" class="vm" value="1" name="media">
									<span class="vm">百度PC</span>
								</label>
								<label>
									<input type="checkbox" class="vm" value="2" name="media">
									<span class="vm">百度新闻</span>
								</label>
							</div>
						</div>
						<div style="margin:0;border-top:none;" class="panel panel-default report_classify_box">
							<div class="panel-body">
								<span>情感判断：</span>
								<label>
									<input type="checkbox" class="vm" value="ZHENGMIAN" name="trend">
									<span class="vm">正面</span>
								</label>
								<label>
									<input type="checkbox" class="vm" value="ZHONGLI" name="trend">
									<span class="vm">中立</span>
								</label>
								<label>
									<input type="checkbox" class="vm" value="FUMIAN" name="trend">
									<span class="vm">负面</span>
								</label>
								<label>
									<input type="checkbox" class="vm" value="WUXIAO" name="trend">
									<span class="vm">无效</span>
								</label>
							</div>
						</div>
						<div style="border:none;" class="panel panel-default report_classify_box"><div class="panel-body"><div class="hunt_box"><a style="padding:8px 40px;" class="btn btn-warning">搜索</a></div></div></div>
						<div class="microblog_wrap">
							<div class="lists_box">
								<div class="handle">搜索结果（共30条）</div>
								<div class="message_box">
									<div class="clear">
										<div class="title left">【曝光】长沙长江医院怎么样?员工揭内幕骗子企业,黑心企业(转载),...</div>
										<div class="right">
											<span class="btn btn-info btn-bordered mr5">媒体名称</span>
											<span class="btn btn-info btn-bordered">抓取时间：2017/12/27</span>
										</div>
									</div>
									<div class="content">2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企业我要揭开这家医院的骗人黑幕赵元（化名）曾是长沙长江医院的一名员工，因不能忍受长江医院黑暗的环境，自愿离开。但对它的种种行为必须予以揭露，以保护百姓的权益...</div>
									<div class="clear operation">
										<div class="left"><span class="btn btn-danger mr5">负面</span></div>
										<div class="left link ml5">
											<p class="clear">
												<a href="#" style="border-radius:3px 0 0 3px;" class="btn btn-info left">查看全文</a>
												<span class="left">http://www.adminexe.com/p/detailed_11704.html</span>
											</p>
										</div>
										<div class="left"><span class="btn btn-info btn-bordered mr5">发布时间：2017/12/27</span></div>
										<div class="right">
											<span class="vm">搜索关键词：</span>
											<span class="vm mr30">长沙医院</span>
											<span class="vm">信息判定：</span>
											<select class="public_select vm">
												<option>正面</option>
												<option>负面</option>
												<option>中立</option>
											</select>
											<a href="#" class="btn btn-default ml5">设置无效</a>
											<a class="btn btn-default ml5">已无效了</a>
											<a href="#" class="btn btn-info ml5">舆情追踪</a>
										</div>
									</div>
								</div>
								
								
								
								<div class="message_box">
									<div class="clear">
										<div class="title left">【曝光】长沙长江医院怎么样?员工揭内幕骗子企业,黑心企业(转载),...</div>
										<div class="right">
											<span class="btn btn-info btn-bordered mr5">媒体名称</span>
											<span class="btn btn-info btn-bordered">抓取时间：2017/12/27</span>
										</div>
									</div>
									<div class="content">2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企业我要揭开这家医院的骗人黑幕赵元（化名）曾是长沙长江医院的一名员工，因不能忍受长江医院黑暗的环境，自愿离开。但对它的种种行为必须予以揭露，以保护百姓的权益...</div>
									<div class="clear operation">
										<div class="left"><span class="btn btn-warning mr5">正面</span></div>
										<div class="left link ml5">
											<p class="clear">
												<a href="#" style="border-radius:3px 0 0 3px;" class="btn btn-info left">查看全文</a>
												<span class="left">http://www.adminexe.com/p/detailed_11704.html</span>
											</p>
										</div>
										<div class="left"><span class="btn btn-info btn-bordered mr5">发布时间：2017/12/27</span></div>
										<div class="right">
											<span class="vm">搜索关键词：</span>
											<span class="vm mr30">长沙医院</span>
											<span class="vm">信息判定：</span>
											<select class="public_select vm">
												<option>正面</option>
												<option>负面</option>
												<option>中立</option>
												<option>无效</option>
											</select>
											<a href="#" class="btn btn-danger vm ml5">舆情追踪</a>
										</div>
									</div>
								</div>
								<div class="message_box">
									<div class="clear">
										<div class="title left">【曝光】长沙长江医院怎么样?员工揭内幕骗子企业,黑心企业(转载),...</div>
										<div class="right">
											<span class="btn btn-info btn-bordered mr5">媒体名称</span>
											<span class="btn btn-info btn-bordered">抓取时间：2017/12/27</span>
										</div>
									</div>
									<div class="content">2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企业我要揭开这家医院的骗人黑幕赵元（化名）曾是长沙长江医院的一名员工，因不能忍受长江医院黑暗的环境，自愿离开。但对它的种种行为必须予以揭露，以保护百姓的权益...</div>
									<div class="clear operation">
										<div class="left"><span class="btn btn-success mr5">正常</span></div>
										<div class="left link ml5">
											<p class="clear">
												<a href="#" style="border-radius:3px 0 0 3px;" class="btn btn-info left">查看全文</a>
												<span class="left">http://www.adminexe.com/p/detailed_11704.html</span>
											</p>
										</div>
										<div class="left"><span class="btn btn-info btn-bordered mr5">发布时间：2017/12/27</span></div>
										<div class="right">
											<span class="vm">搜索关键词：</span>
											<span class="vm mr30">长沙医院</span>
											<span class="vm">信息判定：</span>
											<select class="public_select vm">
												<option>正面</option>
												<option>负面</option>
												<option>中立</option>
												<option>无效</option>
											</select>
											<a href="#" class="btn btn-danger vm ml5">舆情追踪</a>
										</div>
									</div>
								</div>
								<div class="message_box">
									<div class="clear">
										<div class="title left">【曝光】长沙长江医院怎么样?员工揭内幕骗子企业,黑心企业(转载),...</div>
										<div class="right">
											<span class="btn btn-info btn-bordered mr5">媒体名称</span>
											<span class="btn btn-info btn-bordered">抓取时间：2017/12/27</span>
										</div>
									</div>
									<div class="content">2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企2天前-曝光长沙长江医院怎么样员工揭内幕骗子企业，黑心企业我要揭开这家医院的骗人黑幕赵元（化名）曾是长沙长江医院的一名员工，因不能忍受长江医院黑暗的环境，自愿离开。但对它的种种行为必须予以揭露，以保护百姓的权益...</div>
									<div class="clear operation">
										<div class="left"><span class="btn btn-default mr5">无效</span></div>
										<div class="left link ml5">
											<p class="clear">
												<a href="#" style="border-radius:3px 0 0 3px;" class="btn btn-info left">查看全文</a>
												<span class="left">http://www.adminexe.com/p/detailed_11704.html</span>
											</p>
										</div>
										<div class="left"><span class="btn btn-info btn-bordered mr5">发布时间：2017/12/27</span></div>
										<div class="right">
											<span class="vm">搜索关键词：</span>
											<span class="vm mr30">长沙医院</span>
											<span class="vm">信息判定：</span>
											<select class="public_select vm">
												<option>正面</option>
												<option>负面</option>
												<option>中立</option>
												<option>无效</option>
											</select>
											<a href="#" class="btn btn-danger vm ml5">舆情追踪</a>
										</div>
									</div>
								</div>
								<div id="pagelink">
									<ul>
										<li>首页</li>
										<li class="thisclass">1</li>
										<li><a href="#">2</a></li>
										<li><a href="#">下一页</a></li>
										<li><a href="#">末页</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/copy.jsp"/>
		</div>
	</div>
</section>
<jsp:include page="/jsp/footer.jsp"/>
</body>
</html>