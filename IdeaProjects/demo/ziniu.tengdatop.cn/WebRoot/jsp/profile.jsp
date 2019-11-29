<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>个人资料 - ${SITE}</title>
	<%@ include file="/jsp/_/meta.jsp"%>
	<link rel="stylesheet" type="text/css" href="_/css/ui-dialog.css">
<style type="text/css">
#dialog-a{padding:20px;width:460px;height:306px;box-sizing:border-box;}
#dialog-a .upload-btn{position:relative;overflow:hidden;display:inline-block;}
#dialog-a .upload-btn input{position:absolute;top:0;right:0;font-size:100px;opacity:0;filter:alpha(opacity=0);}
</style>
</head>
<body>
<jsp:include page="/jsp/_/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/menu.htm"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="row">
					<div class="col-md-12">
						<div class="information_wrap">
							<div class="handle_box">欢迎您使用紫牛舆情监控系统免费版</div>
							<div class="blog_info_box">
								<div class="row" style="min-height: 350px;">
									<div class="col-md-4">
										<div class="datum_box">
											<div class="photo">
												<a href="javascript:App.dialogById('上传头像','dialog-a');"><img src="_/images/photo2.png"></a>
												<div class="name">王麻子</div>
											</div>
											<div style="padding-top:10px;" class="pb10"><span class="btn btn-warning">普通用户</span></div>
											<div style="padding-bottom:5px;">
												<label>
													<span class="c666">ID：</span>
													<span class="c333">Z01534</span>
												</label>|
												<label>
													<span class="c666">账号：</span>
													<span class="c333">admin</span>
												</label>
											</div>
											<div class="fz12 c999">注册时间：2017-12-02</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="condition_box">
											<div class="fz16 c666">账号使用情况</div>
											<div style="width:100%;height:230px;" id="bar_3"></div>
											<div class="ta-c pb10 fz16">关键词总数：10</div>
											<div class="ta-c pb10 fz16">已用数量：5</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="versions_box">
											<div class="fz16 c666">当前版本</div>
											<div style="margin-right:30px;" class="member">
												<img src="_/images/versions_box_icon1.png" class="vm">
												<span class="ml5 vm">普通会员</span>
											</div>
											<div style="padding-top:30px;" class="fz16 c999">高级会员</div>
											<div style="padding-top:30px;" class="fz16 c999">VIP会员</div>
											<div style="padding-top:40px;"><span style="padding:8px 30px;" class="btn btn-danger">立即升级</span></div>
										</div>
									</div>
								</div>
							</div>
							<div class="link_box">
								<img src="_/images/distinction_box_icon1.png" class="vm">
								<span class="fz16 c333 ml5 vm">生成邀请链接</span>
								<input type="text" style="width:300px;" class="public_input ml10 vm">
								<a href="#" class="vm btn btn-warning ml5">生成链接</a>
							</div>
							<div class="account_setting_box">
								<table style="margin:0;padding:0;width:100%;border:0;">
									<tr>
										<td style="width:100px;text-align:left;vertical-align:top;">*会员身份：</td>
										<td>
											<div>企业/政府（含企业、政府、事业单位、团体、组织）</div>
											<div style="display:none;" class="ensconce_box mt10">
												<form>
													<p class="pb10">
														<select style="width:300px;" class="public_select">
															<option>单位1</option>
															<option>单位2</option>
															<option>单位3</option>
														</select>
													</p>
													<p class="pb10"><input type="submit" class="btn btn-info" value="保存"></p>
												</form>
											</div>
										</td>
										<td style="width:200px;text-align:left;vertical-align:top;"><a class="revamp">修改</a></td>
									</tr>
									<tr>
										<td style="width:100px;text-align:left;vertical-align:top;">*单位名称：</td>
										<td>
											<div>深圳市紫牛网络</div>
											<div style="display:none;" class="ensconce_box mt10">
												<form>
													<p class="pb10"><input type="text" style="width:300px;" class="public_input" placeholder="请输入单位名称"></p>
													<p class="pb10"><input type="submit" class="btn btn-info" value="保存"></p>
												</form>
											</div>
										</td>
										<td style="width:200px;text-align:left;vertical-align:top;"><a class="revamp">修改</a></td>
									</tr>
									<tr>
										<td style="width:100px;text-align:left;vertical-align:top;">*修改密码：</td>
										<td>
											<p>修改密码时需要输入当前密码，如果你忘记了当前密码，可以点击这里通过邮件重置你的密码。</p>
											<div style="display:none;" class="ensconce_box">
												<form>
													<p class="pb10"><input type="password" style="width:300px;" class="public_input" placeholder="旧密码"></p>
													<p class="pb10"><input type="password" style="width:300px;" class="public_input" placeholder="新密码"></p>
													<p class="pb10"><input type="submit" class="btn btn-info" value="保存"></p>
												</form>
											</div>
										</td>
										<td style="width:200px;text-align:left;vertical-align:top;"><a class="revamp">修改</a></td>
									</tr>
									<tr>
										<td style="width:100px;text-align:left;vertical-align:top;">*联系电话：</td>
										<td>
											<p>你当前的手机号码是186****9969，修改手机时系统会发送验证码到新的手机号码上，然后输入验证码后完成修改。</p>
											<div style="display:none;" class="ensconce_box">
												<form>
													<p class="pb10">
														<select class="public_select vm">
															<option>中国+86</option>
														</select>
														<input type="text" style="width:300px;" class="public_input ml10 vm" placeholder="输入手机号码">
													</p>
													<p class="pb10">
														<input type="text" style="width:300px;" class="public_input vm" placeholder="输入手机号码">
														<img src="_/images/code.png" style="width:100px;height:40px" class="ml10 vm">
														<a href="#" class="fz12 c999 ml10">看不清？点击图片刷新</a>
													</p>
													<p class="pb10">
														<input type="text" style="width:300px;" class="public_input vm" placeholder="输入手机号码">
														<button class="btn btn-warning ml10 vm">获取验证码</button>
													</p>
													<p class="pb10"><input type="submit" class="btn btn-info" value="绑定"></p>
												</form>
											</div>
										</td>
										<td style="width:200px;text-align:left;vertical-align:top;"><a class="revamp">修改</a></td>
									</tr>
									<tr>
										<td style="width:100px;text-align:left;vertical-align:top;">*绑定邮箱：</td>
										<td>
											<p>你当前还没有绑定邮箱，绑定邮箱时系统会发送一封邮件到你的邮箱地址，请按照邮箱中的链接重置你的邮箱</p>
											<div style="display:none;" class="ensconce_box">
												<form>
													<p class="pb10">
														<input type="text" style="width:300px;" class="public_input vm" placeholder="输入你的邮箱">
														<img src="_/images/code.png" style="width:100px;height:40px" class="ml10 vm">
														<a href="#" class="fz12 c999 ml10">看不清？点击图片刷新</a>
													</p>
													<p class="pb10">
														<input type="text" style="width:300px;" class="public_input vm" placeholder="输入验证码">
														<button class="btn btn-warning ml10 vm">获取验证码</button>
													</p>
													<p class="pb10"><input type="submit" class="btn btn-info" value="保存"></p>
												</form>
											</div>
										</td>
										<td style="width:200px;text-align:left;vertical-align:top;"><a class="revamp">修改</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/jsp/_/copy.jsp"/>
		</div>
	</div>
</section>
<div style="display:none;" id="dialog-a">
	<p class="ta-c pb10"><img src="_/images/photo2.png" style="width:150px;height:150px;border-radius:50%;"></p>
	<p class="ta-c pb10"><a class="upload-btn btn btn-warning"><input type="file" value="浏览">请选择一张照片</a></p>
	<p><a href="#" class="btn btn-danger btn-block">确定</a></p>
</div>
<script type="text/javascript" src="_/js/dialog.js"></script>
<script type="text/javascript" src="_/js/dialog-min.js"></script>
<script type="text/javascript" src="_/js/function.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
	jQuery(".datepicker").datepicker();
});
$(".revamp").bind("click", function () {
	$(this).parent().prev().find(".ensconce_box").toggle(200);
});
var option = {
	tooltip: {
		trigger: "item",
		formatter: "{a} <br/>{b}: {c} ({d}%)"
	},
	legend: {
		orient: "vertical",
		x: "left"
	},
	series: [
		{
			name:"访问来源",
			type:"pie",
			radius: ["50%", "65%"],
			avoidLabelOverlap: false,
			label: {
				normal: {
					show: false,
					position: "center"
				},
				emphasis: {
					show: true,
					textStyle: {
						fontSize: "20",
						fontWeight: "bold"
					}
				}
			},
			labelLine: {
				normal: {
					show: false
				}
			},
			data:[
				{value:335, name:"剩余数量"},
				{value:335, name:"已用数量"},
			]
		}
	]
};
echarts.init(document.getElementById("bar_3")).setOption(option);
</script>
</body>
</html>