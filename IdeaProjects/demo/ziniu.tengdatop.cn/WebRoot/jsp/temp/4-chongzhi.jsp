<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>充值</title>
	<%@ include file="/jsp/meta.jsp"%>
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>
<section>
	<div class="mainwrapper">
		<jsp:include page="/jsp/menu.jsp"/>
		<div class="mainpanel">
			<div class="contentpanel">
				<div class="recharge_wrap">
					<div class="balance_box clear">
						<img src="comm/images/balance_box.png" style="width:60px;height:60px;" class="vm left">
						<label class="left">账户余额：<span>100.22</span> 元</label>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="recharge_wrap">
							<div class="manner_box">
								<form>
									<dl>
										<dt>
											<img src="comm/images/manner_box_icon1.png" class="vm">
											<span class="vm ml5">升级会员方式：</span>
										</dt>
										<dt>
											<ins>
												<div class="price_box clear">
													<label class="vm">
														<input type="radio" class="vm" name="111">
														<span class="vm ml5">1800元/月</span>
													</label>
													<label class="vm">
														<input type="radio" class="vm" name="111">
														<span class="vm ml5">9800元/月</span>
													</label>
													<label class="vm">
														<input type="radio" class="vm" name="111">
														<span class="vm ml5">15000元/年</span>
													</label>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div style="padding-top:30px;">
													<img src="comm/images/manner_box_icon1.png" class="vm">
													<span class="vm ml5">升级会员方式：</span>
												</div>
											</ins>
										</dt>
										<dt>
											<ins>
												<div class="way clear">
													<label><img src="comm/images/alipay.png" class="vm hover"></label>
													<label><img src="comm/images/wechat.png" class="vm"></label>
												</div>
											</ins>
										</dt>
									</dl>
									<div class="ta-c"><input type="submit" style="padding:10px 40px;" class="btn btn-danger" value="下一步"></div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-8">
						<div class="recharge_wrap">
							<div class="distinction_box">
								<div class="handle">
									<img src="comm/images/distinction_box_icon1.png" class="vm">
									<span class="ml5">VIP与普通用户的区别</span>
								</div>
								<div class="matter clear">
									<table style="margin:0;padding:0;width:100%;border:0;">
										<tr>
											<th style="background:#EEE;color:#333;">功能权限</th>
											<th style="background:#AAA;">普通用户</th>
											<th style="background:#E57B1D;">VIP用户</th>
										</tr>
										<tr>
											<td>关键字个数</td>
											<td>5个</td>
											<td>20个</td>
										</tr>
										<tr>
											<td>生成报表</td>
											<td>无</td>
											<td>日报、周报、月报</td>
										</tr>
										<tr>
											<td>舆情分析</td>
											<td>付费</td>
											<td>专业舆情分析与解决方案</td>
										</tr>
										<tr>
											<td>舆情预警</td>
											<td>有</td>
											<td>有</td>
										</tr>
									</table>
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
<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery(".datepicker").datepicker();
});
$(function(){
	$(".manner_box .way label img").bind("click",function(){
		$(".manner_box .way label img").removeClass("hover");
		$(this).addClass("hover");
	});
});
</script>
</body>
</html>