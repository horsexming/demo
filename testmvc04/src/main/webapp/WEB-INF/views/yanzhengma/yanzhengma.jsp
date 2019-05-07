<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验证码</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/static/css/lanren.css">
</head>
<body>
<!--代码部分begin-->
<div class="form">
	<div class="div-name">
		<label for="name">用户名</label><input type="text" id="name" class="infos" placeholder="请输入用户名" />
	</div>
	<div class="div-phone">
		<label for="phone">手机</label><input type="text" id="phone" class="infos" placeholder="请输入手机" />
		<a href="javascript:;" class="send1" onclick="sends.send();">发送验证码</a>
	</div>
	<div class="div-ranks">
		<label for="ranks">验证码</label><input type="text" id="ranks" class="infos" placeholder="请输入验证码"  />
	</div>
	<div class="div-conform">
		<a href="javascript:;" class="conform" onclick="sends.conform();">提交</a>
	</div>
</div>
<script>
var sends = {
	checked:1,
	send:function(){
			var numbers = /^1\d{10}$/;
			var val = $('#phone').val().replace(/\s+/g,""); //获取输入手机号码
			if($('.div-phone').find('span').length == 0 && $('.div-phone a').attr('class') == 'send1'){
				if(!numbers.test(val) || val.length ==0){
					$('.div-phone').append('<span class="error">手机格式错误</span>');
					return false;
				}
			}
			if(numbers.test(val)){
				var time = 60;
				$('.div-phone span').remove();
				function timeCountDown(){
					if(time==0){
						clearInterval(timer);
						$('.div-phone a').addClass('send1').removeClass('send0').html("发送验证码");
						sends.checked = 1;
						return true;
					}
					$('.div-phone a').html(time+"S后重发");
					time--;
					return false;
					sends.checked = 0;
				}
				$('.div-phone a').addClass('send0').removeClass('send1');
				timeCountDown();
				var timer = setInterval(timeCountDown,1000);
			}
	}
}
</script>
<!--代码部分end-->
</body>
</html>