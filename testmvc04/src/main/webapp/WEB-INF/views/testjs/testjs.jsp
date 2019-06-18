<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>测试js</title>
</head>
<script type="text/javascript">
	
	//var then = new Date(2011,0,1);
	//var jian = now - then;
	//alert(now.getFullYear());
	//alert(now.getDay());
	//alert(now.getDate());
	function displayTime() {
		var elt = document.getElementById("clock");
		var now = new Date();
		elt.innerHTML = now.toLocaleTimeString();
		setTimeout(displayTime,1000);
	}
	window.onload = displayTime;
</script>
<style>
	#clock{
		font: bold; 24pt sans;
		background: #ddf;
		padding: 10px;
		border: solid black 2px;
		border-radius: 10px;
	}
</style>
<body>
<h1>显示时钟</h1>
<span id="clock"></span>
</body>
</html>