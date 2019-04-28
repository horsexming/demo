<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购销合同下的货物</title>
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
    	//设置冗余的生产厂家名称
    	function setFactoryName(val){
    		var ele = document.getElementById("factoryName");
    		ele.value = val;
    	}
    </script>
</head>
<body>
<h4 align="center">购销合同下的货物</h4>
<form class="form-horizontal" action="<%=request.getContextPath()%>/ContractProduct/insContractProduct" method="post">
	<div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">提交</button>
      <a href="<%=request.getContextPath()%>/contract/contractList" class="btn btn-default">返回</a>
    </div>
  </div>
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">厂家名称</label>
    <div class="col-sm-4">
    	<select name="factoryId" class="form-control" id="inputPassword3" onchange="setFactoryName(this.options[this.selectedIndex].text);">
    		<option value="">--请选择--</option>
    		<c:forEach items="${factorys}" var="f">
    			<option value="${f.id}">${f.factoryName}</option>
    		</c:forEach>   		
    	</select>
    </div>
    <label for="inputPassword3" class="col-sm-1 control-label">货号</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="productNo">
    </div>
  </div>
  <input type="hidden" name="factoryName" id="factoryName" value="">
  <input type="hidden" name="contractId" value="${contractId}">
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">货物图片</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="productImage">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">数量</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="cnumber">
    </div>
    <label for="inputPassword3" class="col-sm-1 control-label">包装单位</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="packingUnit">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">装率</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="loadingRate">
    </div>
    <label for="inputPassword3" class="col-sm-1 control-label">箱数</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="boxNum">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">单价</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="price">
    </div>
    <label for="inputPassword3" class="col-sm-1 control-label">排序号</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="orderNo">
    </div>
  </div>
  <div class="form-group">
	<label for="inputPassword3" class="col-sm-2 control-label">货物描述</label>
		<div class="col-sm-10">
			<textarea rows="5" cols="90" name="productDesc"></textarea>
		</div>
  </div>
</form>
<table class="table table-striped">
	<tr>
		<td>序号</td>
		<td>厂家名称</td>
		<td>货号</td>
		<td>数量</td>
		<td>包装单位</td>
		<td>箱数</td>
		<td>单价</td>
		<td>总金额</td>
		<td colspan="2" align="center">操作</td>
		<td>附件</td>
	</tr>
	<c:if test="${Productlist.size()!=0}">
		<c:forEach items="${Productlist}" var="Product" varStatus="status">
			<tr>
				<td>${status.index+1}</td>
				<td>${Product.factoryName}</td>
				<td>${Product.productNo}</td>
				<td>${Product.cnumber}</td>
				<td>${Product.packingUnit}</td>
				<td>${Product.boxNum}</td>
				<td>${Product.price}</td>
				<td>${Product.amount}</td>
				<td><a href="<%=request.getContextPath()%>/ContractProduct/updateProduct/?id=${Product.id}">[修改]</a></td>
				<td><a href="<%=request.getContextPath()%>/ContractProduct/deleteProduct/?id=${Product.id}&contractId=${Product.contractId}">[删除]</a></td>
				<td><a href="<%=request.getContextPath()%>/ExtCproduct/ToExtCproduct/?contractProductId=${Product.id}">[附件]</a></td>
			</tr>
		</c:forEach>
	</c:if>
	
</table>
</body>
</html>