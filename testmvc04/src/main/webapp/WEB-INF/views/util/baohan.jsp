<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>

</head>
<script type="text/javascript">
	function aaa() {
		document.getElementById("workMainIframe").src="index.jsp";
		document.getElementById("workMainIframe1").src="index.jsp";
	}
</script>
<body onload="aaa()">
	
		<!--主体 iframe -->
		<iframe src="" id="workMainIframe1" frameborder="1" height="50px;" width="800px;"></iframe>
		<br>
		<marquee direction="left" scrollamount="5" onmouseout="this.start()"
			onmouseover="this.stop()" width="400px;">
			<font color="red" id="show">滚动</font>
		</marquee>
		<br>
		<iframe src="" id="workMainIframe" frameborder="1" height="50px;" width="800px;"></iframe>
	
</body>
</html>