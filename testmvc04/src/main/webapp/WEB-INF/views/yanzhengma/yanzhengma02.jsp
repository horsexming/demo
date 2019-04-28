<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证码</title>
</head>
<script type="text/javascript"> 
	var countdown=60; 
	function settime(obj) { 
	    if (countdown == 0) { 
	        obj.removeAttribute("disabled");    
	        obj.value="免费获取验证码"; 
	        countdown = 60; 
	        return;
	    } else { 
	        obj.setAttribute("disabled", true); 
	        obj.value="重新发送(" + countdown + ")"; 
	        countdown--; 
	    } 
		setTimeout(function() {settime(obj)},1000) 
	}
	
	
	function showTime() {
		var datetime = new Date();
		var h = datetime.getHours();
		var m = datetime.getMinutes();
		var s = datetime.getSeconds();
		if (h < 10) {
			h = "0" + h;
		}
		if (m < 10) {
			m = "0" + m;
		}
		if (s < 10) {
			s = "0" + s;
		}
		var hour = document.getElementById("hour");
		var minute = document.getElementById("minute");
		var seconds = document.getElementById("second");

		hour.innerHTML = h;
		minute.innerHTML = m;
		seconds.innerHTML = s;
		setTimeout(showTime, 1000);
	}
</script>
<body onload="showTime()">
<input type="button" id="btn" value="免费获取验证码" onclick="settime(this)" /> 
<div style="float: right; width: 37%;">
			北京时间：
			<span id="hour"></span>时
			<span id="minute"></span>分
			<span id="second"></span>秒						
</div>
</body>
</html>