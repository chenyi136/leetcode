<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Integer code = (Integer) request.getAttribute("code");
String title = (String) request.getAttribute("title");
String state = (String) request.getAttribute("state");
%>
<!DOCTYPE html>
<html>
<head>
	<title><%=title(request, code.toString())%></title>
	<%@ include file="/jsp/_/meta.jsp"%>
</head>
<body>
<div class="am-g am-u-sm-12 am-padding-0">
	<h2 class="am-text-xxxl am-text-center"><%=title%></h2>
	<p class="am-text-center"><%=state%></p>
	<pre style="margin:0 auto;width:200px;border:none;">
          .----.
       _.'__    `.
   .--($)($$)---/#\
 .' @          /###\
 :         ,   #####
  `-..__.-' _.-###/
        `;_:    `"'
      .'"""""`.
     /,  ya ,\\
    //  <%=code%>  \\
    `-._______.-'
    ___`. | .'___
   (______|______)
	</pre>
	<p class="am-text-center">
		<a href="admin/index.htm" class="am-btn am-btn-secondary <%=icon("home")%>"> 返回首页</a>
		<a class="am-margin-left-xs am-btn am-btn-secondary <%=icon("trash-o")%>" onclick="trash()"> 清理痕迹</a>
		<a class="am-margin-left-xs am-btn am-btn-secondary <%=icon("reply")%>" onclick="javascript:history.back();"> 返回上页</a>
	</p>
</div>
<script type="text/javascript" src="_/js/jquery.min-2.2.3.js"></script>
<script type="text/javascript">
function trash(){
	$.ajax({
		type:"post",
		url:"${ROOT}share/track.htm",
		dataType:"json",
		async:false,
		success:function(res){},
		error:function(){}
	});
}
</script>
</body>
</html>