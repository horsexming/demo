<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>搜索用户</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/static/js/jquery-3.3.1.min.js"></script>
<link
	href="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
	function finduser(){
		var usernames = document.getElementById('usernames').value;
		$.ajax(
			{			
				type : "POST",
				url : "finUserByname",
				data : {username:usernames},
				dataType:"json",
				success : function(data) {				
					var html = '<tr><td>用户名</td><td>年龄</td><td>性别</td><td align="center">手机</td><td colspan="3" align="center">编辑</td></tr>';
						 for(var i = 0;i< data.length;i++){
							 html +="<tr>"+
							 '<td>'+data[i].username+'</td>'+'<td>'+data[i].age+'</td>'+'<td>'+ data[i].sex +
							 '</td>'+'<td>'+data[i].phone+'</td>'+
							 '<td>'+'<a href="#" id="dels" onclick="deletes(this,'+data[i].id+') ">删除</a>'+'</td>'
							+'<td>'+'<a href="#"id="dels" onclick="update(this,'+data[i].id+') ">修改</a>'+'</td>'
							+'<td>'
							 +"</tr>"	 
						 }										
					  $('#datatable').html(html);
				}
			}	
		);
		
	}
	
	//删除用户
	function deletes(node,id){
		var flag = confirm("确定删除吗？");
		if(flag){
			$.ajax({
				type : "POST",
				url : "delete",
				data : {id:id},
				dataType:"json",
				success : function(data) {
					if(data==1){
						alert("删除成功");
						var tr=node.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
					}else{
						alert("删除失败");
					}
				}
			});	
		}		
	}
	
	//更新用户
	function update(node,id){
		findUserByID(id)
		$("#empUpdateModal").modal({
			backdrop:"static"
		});
	}
	
	//更新回显
	function findUserByID(id){
		$.ajax({
			type : "POST",
			url : "GetUserById",
			data : {id:id},
			dataType:"json",
			success : function(data) {
				//console.log(data);
				$("#username").text(data.username);
				$("#password").val(data.password);
				$("#age").val(data.age);
				$("#phone").val(data.phone);
				$("#id").val(data.id);
			}
		});	
		
	}
	
	function updateUser(){
		var id = document.getElementById('id').value;
		$.ajax({
			type : "post",		
			url : "updateUserById/"+id,
			data:$("#empUpdateModal form").serialize()+"&_method=PUT",
			success : function(data) {
					
					$("#empUpdateModal").modal('hide');
					finduser();
				
			}
		});	
		//alert(id);
	}
	function savemodel(){
		$("#empAddModal").modal({
			backdrop:"static"
		});
	}
	function saveUser(){
		$.ajax({
			url:"save",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(result){
					SetNull();
					$("#empAddModal").modal('hide');
					
			}
				
		});
	}
	



</script>
<body>
				<input type="text" name="username" id="usernames">
				<input type="submit" value="搜索" onclick="finduser()">
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_modal_btn" onclick="savemodel()">新增</button>
			</div>		
		</div>
				<table border="1" id="datatable">				
				</table>
				
				
				
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      	<p class="form-control-static" id="username"></p>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-10">
		      <input type="text" name="password" class="form-control" id="password" placeholder="******">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="sex" id="sex1" value="m" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="sex" id="sex2" value="n"> 女
				</label>
		    </div>
		  </div>
		 <div class="form-group">
		    <label class="col-sm-2 control-label">年龄</label>
		    <div class="col-sm-10">
		      <input type="text" name="age" class="form-control" id="age">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">电话</label>
		    <div class="col-sm-10">
		      <input type="text" name="phone" class="form-control" id="phone">
		      <span class="help-block"></span>
		    </div>
		  </div>
		 
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <input type="hidden" id="id">
        <button type="button" class="btn btn-primary" id="emp_update_btn" onclick="updateUser()">更新</button>
      </div>
    </div>
  </div>
</div>

<!-- //修改用户身份 -->

<div class="modal fade" id="updateUserid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">身份修改</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">身份</label>
		    <div class="col-sm-10">
		     	<select name="roleid">
				  <option>--请选择--</option>
				  <option value="3">游客</option>
				  <option value="2">用户</option>
				  <option value="1">管理员</option>
				</select>
		      <span class="help-block"></span>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <input type="hidden" id="id">
        <button type="button" class="btn btn-primary" id="emp_update_btn" onclick="updateUserid()">更新</button>
      </div>
    </div>
  </div>
</div>
<!-- //员工添加模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
        <div class="form-group">
		    <label class="col-sm-2 control-label">用户名</label>
		    <div class="col-sm-10">
		      <input type="text" name="username" class="form-control" id="username2" >
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-10">
		      <input type="text" name="password" class="form-control" id="password2" placeholder="******">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">性别</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="sex" id="sex1" value="m" checked="checked"> 男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="sex" id="sex2" value="n"> 女
				</label>
		    </div>
		  </div>
		 <div class="form-group">
		    <label class="col-sm-2 control-label">年龄</label>
		    <div class="col-sm-10">
		      <input type="text" name="age" class="form-control" id="age2">
		      <span class="help-block"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">电话</label>
		    <div class="col-sm-10">
		      <input type="text" name="phone" class="form-control" id="phone2">
		      <span class="help-block"></span>
		    </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn" onclick="saveUser()">保存</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>

 <!--  -->