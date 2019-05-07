<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>出货表查询</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" /> 
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>  
</head>
<script type="text/javascript">
function chaxun(){   
    var shipTime = document.getElementById("shipTime").value;
    	window.location.href ="<%=request.getContextPath()%>/OutProduct/outProductList/?shipTime="+shipTime;
}

function dayin(){   
    var shipTime = document.getElementById("shipTime").value;
    	window.location.href ="<%=request.getContextPath()%>/OutProduct/outProductPrint/?shipTime="+shipTime;
}

function download(){   
    var shipTime = document.getElementById("shipTime").value;
    	window.location.href ="<%=request.getContextPath()%>/OutProduct/outProductPrintdownload/?shipTime="+shipTime;
}
</script>
</head>
<body>
<h4 align="center">选择船期</h4>
		<div class="col-sm-offset-2 col-sm-10">
      		<button type="submit" class="btn btn-default" onclick="chaxun()">预览</button>
      		<button type="submit" class="btn btn-default" onclick="dayin()">打印</button>
      		<button type="submit" class="btn btn-default" onclick="download()">下载</button>
      		<a href="<%=request.getContextPath()%>/index" class="btn btn-default">返回</a>
    	</div>
		<div class="form-group">
			<label for="inputPassword3" class="col-sm-2 control-label">船期</label>
			<div class="input-group date" id='date3'>  
                <input id="shipTime" type="text" class="form-control" name="shipTime" />  
                <span class="input-group-addon">  
                    <i class="glyphicon glyphicon-calendar"></i>  
                </span>  
            </div>  
		</div> 
</body>
<script>
	$('#date3').datetimepicker({  
   		format: 'YYYY-MM',  
    	locale: moment.locale('zh-cn')  
	});
</script>
</html>