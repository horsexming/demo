<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>购销合同</title> 
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<table class="table table-striped">
	<tr>
		<td colspan="10" align="right"><a href="<%=request.getContextPath()%>/OutProduct/ToOutProductDATE" class="btn btn-default">返回</a></td>
	</tr>
	<tr>
		<td colspan="10" align="center">出货表记录</td>
	</tr>
	<tr>
		<td></td>
		<td>序号</td>
		<td>客户</td>
		<td>订单号</td>
		<td>货号</td>
		<td>数量</td>
		<td>工厂</td>
		<td>工厂交期</td>
		<td>船期</td>
		<td>贸易条款</td>
	</tr>
	<c:forEach items="${outProductList}" var="outProduct">
		<tr>
			<td><input type="checkbox" id="subcheck" name="subcheck" value="${contract.id}"></td>
			<td>${outProduct.id}</td>
			<td>${outProduct.customName}</td>
			<td>${outProduct.contractNo}</td>
			<td>${outProduct.productNo}</td>
			<td>${outProduct.cnumber}</td>
			<td>${outProduct.factoryName}</td>
			<td><fmt:formatDate value="${outProduct.deliveryPeriod}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${outProduct.shipTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${outProduct.tradeTerms}</td>
		</tr>
	</c:forEach>
</table>
</body>		
</html>