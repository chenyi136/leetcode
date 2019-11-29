<%@ page language="java" import="
java.util.Map,com.ziniu.pojo.ProgramInfo" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
@SuppressWarnings("unchecked")
Map<Integer, ProgramInfo> datas = (Map<Integer, ProgramInfo>) request.getAttribute("datas");
%>
<div class="col-md-3" id="j_program">
	<div class="grabble_wrap">
		<div class="matter_box">
			<div class="handle clear">
				<a href="#"><span>充值中心</span></a>
				<a href="program/load.htm"><span>添加方案</span></a>
			</div>
			<!-- <div style="margin-top:20px;" class="input-group">
				<input type="search" class="form-control" placeholder="请输入关键字来筛选词语">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
			</div> -->
			<div class="info_box">
			<%
				for (ProgramInfo data : datas.values()) {
					out.print("");
					for(Map.Entry<Integer, String> en : data.keywords.entrySet()) {
						
					}
				}
			%>
				<div class="panel panel-default" lang="">
					<div class="panel-heading">
						<div style="display:block;" class="panel-btns">
							<img src="_/images/wrench.png" style="width:16px;" class="cp">
							<div style="display:none;" class="operate_box">
								<p><a onclick="JProgramKeyword(1)">添加词语</a></p>
								<p><a href="program/load.htm?id=1">修改方案</a></p>
								<p><a onclick="JProgramQueue(this,true)">向上移动</a></p>
								<p><a onclick="JProgramQueue(false,true)">向下移动</a></p>
							</div>
						</div>
						<h5 class="panel-title">
							<span class="vm panel-minimize tooltips maximize cp"></span>
							<span class="vm ml5">深圳怡康妇科</span>
						</h5>
					</div>
					<div style="display:none;" class="panel-body">
						<div class="popover-example">
							<div class="info-box clear">
								<div class="info-left"><div class="info-left-child">关键词文案关键词文案12314321frwer14</div></div>
								<div class="info-right"><input type="radio" class="vm" value="1" name="keyword"></div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<div style="display:block;" class="panel-btns">
							<img src="_/images/wrench.png" style="width:16px;" class="cp">
							<div style="display:none;" class="operate_box">
								<p><a href="#">添加词语</a></p>
								<p><a href="#">修改方案</a></p>
								<p><a href="#">向上移动</a></p>
								<p><a href="#">向下移动</a></p>
							</div>
						</div>
						<h5 class="panel-title">
							<span class="vm panel-minimize tooltips maximize cp"></span>
							<span class="vm ml5">深圳怡康妇科</span>
						</h5>
					</div>
					<div style="display:none;" class="panel-body">
						<div class="popover-example">
							<div class="info-box clear">
								<div class="info-left"><div class="info-left-child">关键词文案关键词文案12314321frwer14</div></div>
								<div class="info-right"><input type="radio" class="vm" value="2" name="keyword"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<div style="display:block;" class="panel-btns">
							<img src="_/images/wrench.png" style="width:16px;" class="cp">
							<div style="display:none;" class="operate_box">
								<p><a href="#">添加词语</a></p>
								<p><a href="#">修改方案</a></p>
								<p><a href="#">向上移动</a></p>
								<p><a href="#">向下移动</a></p>
							</div>
						</div>
						<h5 class="panel-title">
							<span class="vm panel-minimize tooltips maximize cp"></span>
							<span class="vm ml5">深圳怡康妇科</span>
						</h5>
					</div>
					<div style="display:none;" class="panel-body">
						<div class="popover-example">
							<div class="info-box clear">
								<div class="info-left"><div class="info-left-child">关键词文案关键词文案12314321frwer14</div></div>
								<div class="info-right"><input type="radio" class="vm" value="3" name="keyword"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
