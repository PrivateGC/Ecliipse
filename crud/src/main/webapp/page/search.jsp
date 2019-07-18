<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
.error{
	color:red;
}
.success{
	color:green;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台中间1</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
	
%>
<script type="text/javascript" src="${APP_PATH }/page/Assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH }/page/Assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>

<script type="text/javascript" src="${APP_PATH }/page/Assets/bootstrap-3.3.7-dist/js/npm.js"></script>
<link rel="stylesheet" type="text/css" href="${APP_PATH }/page/Assets/bootstrap-3.3.7-dist/css/bootstrap-theme.css"/>
<link rel="stylesheet" type="text/css" href="${APP_PATH }/page/Assets/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" type="text/css" href="${APP_PATH }/page/Assets/bootstrap-3.3.7-dist/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="${APP_PATH }/page/Assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript">
	$(function() {
		//点击事件
		$("#addtea").click(function() {
			$("#myModal form")[0].reset();
			$("#teaNumMsg").text("").removeClass("error").removeClass("success");
			$("#myModal").model({
				backdrop:"static"
			})		
		})
		$("#addTeaNum").change(function() {
			//alert($(this).val())
			var teaNum = $(this).val();
			$.ajax({
				url:"${APP_PATH}/checkStuInfo",
				type:"POST",
				data:"teaNum="+teaNum,
				success:function(result){
					if(result){
						
						$("#teaNumMsg").text("该工号可用").removeClass("error").addClass("success");
						$("#tea_add_btn").attr("ajax-va","success");
					} else {
						$("#teaNumMsg").text("该工号已存在！").removeClass("success").addClass("error");
						$("#tea_add_btn").attr("ajax-va","error");
					}
				}
			})
			
		})
		//保存按钮事件
		$("#tea_add_btn").click(function(){
			
			alert($("#myModal form").serialize())
			
			if($(this).attr("ajax-va")=="error"){
				return false;
			} else {
				
				$.ajax({
					url:"${APP_PATH}/teaInfo",
					type:"POST",
					data:$("#myModal form").serialize(),
					//发送成功处理事件
					success:function(result){
						if (result) {
							alert("添加成功。");
						} else {
							alert("添加失敗");
						}
						
						$("#addStuModel").modal("hide");
						window.location.reload();
					}
				})
			}
		})
	})
	
	//修改。。。。。。。。。。。。
	$(document).on("click",".edit_btn",function(){
		$("#edit form").css("color","gray");
		$("#edtTeaNum").val(
			$(this).parents("tr").find("td:eq(0)")
					.text()).attr("readonly",
					"readonly").css("color","red");
		$("#edtTName").val(
			$(this).parents("tr").find("td:eq(1)")
					.text());
		$("#edtTsex").val(
				$(this).parents("tr").find("td:eq(2)")
						.text());
		$("#edtTmajo").val(
				$(this).parents("tr").find("td:eq(3)")
						.text());
		$("#edtProfessional").val(
				$(this).parents("tr").find("td:eq(4)")
						.text());
		$("#edtEducation").val(
				$(this).parents("tr").find("td:eq(5)")
						.text());
		$("#edtphone").val(
				$(this).parents("tr").find("td:eq(6)")
						.text());
		$("#edtidcard").val(
				$(this).parents("tr").find("td:eq(7)")
						.text());
		$("#edtaddress").val(
				$(this).parents("tr").find("td:eq(8)")
						.text());
		$("#edtmailbox").val(
				$(this).parents("tr").find("td:eq(9)")
						.text());
		$("#departmentalid").val(
				$(this).parents("tr").find("td:eq(10)")
						.text());
		
		$("#edit").modal({
			backdrop:"static"
		})
		
		//保存事件
		$("#tea_edit_btn").click(function(){
			$.ajax({
				url:"${APP_PATH}/editTeaInfo",
				type:"PUT",
				data:$("#edit form").serialize(),
				
				success : function(result) {
					alert("修改成功！")
				$("#edit").modal('hide');
				window.location.reload();
				}
			})
		})
	})
	//删除------------------------------------------------
	$(document).on("click",".delete_btn",function(){
		//弹出确认删除信息对话框
		//获取
		var teaName = $(this).parents("tr").find("td:eq(1)").text();
		var teaNum =  $(this).parents("tr").find("td:eq(0)").text();
		
		if(confirm("是否删除【"+teaName+"】？")){
			$.ajax({
				url:"${APP_PATH}/teacherInfo/" +teaNum,
				type:"DELETE",
				success:function(result){
					alert("删除成功！");
					//刷新页面
					window.location.reload();
				}
			})
			
		}
	})
	//搜索------------------------------------------------
	$("#seach_tea").click(
			function(){
				var input_info = $("#input_info").val();
				window.location.href="${APP_PATH}/teachers?input_info"+input_info+"&teaDorm"+sea_teaDorm;
				
			})
	
</script>

</head>

<body>
			<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
	增加
</button>
<form id = "search_form">
	<div class="input-group line left">
		<span class="input-group-addon" id="basic-addon2">
		<span class="glyphicon glyphicon-search"></span>
		</span><input type="text" class = "form-control" placeholder="请输入姓名"
		 name="input_info" id="input_info" aria-describedby="basic-addon2" style="width:400px;">
		      <button class="btn btn-primary btn-sm" id="serch_tea">
	搜索
</button>
		 </div>
</form>	
	
	
<!-- 模态框（Modal） 增加-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加
				</h4>
			</div>
			<div class="modal-body">
				 <form>
       
        <ul>
				<li><label><span >	Tid: </span></label><input type="text" name="tid" id="addTeaNum"/><label id="teaNumMsg"></label></li>
				<li><label><span >	TName: </span></label><input type="text" name="tname" id="addTName" /></li>
				<li><label><span >	sex: </span></label><input type="text" name="sex" id="addTsex" /></li>
				<li><label><span >	majo: </span></label><input type="text" name="majo" id="addTmajo" /></li>
				<li><label><span >	Professional: </span></label><input type="text" name="professional" id="addProfessional" /></li>
				<li><label><span >	Education: </span></label><input type="text" name="education" id="addEducation" /></li>
				<li><label><span >	phone: </span></label><input type="text" name="phone" id="addphone" /></li>
				<li><label><span >	idcard: </span></label><input type="text" name="idcard" id="addidcard" /></li>
				<li><label><span >	address: </span></label><input type="text" name="address" id="addaddress" /></li>
				<li><label><span >	mailbox: </span></label><input type="text" name="mailbox" id="addmailbox" /></li>
				<li><label><span >	DepartmentalId: </span></label><input type="text" name="departmentalid" id="addDepartmentalId" /></li>
			</ul>			
    </form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary btn-sm" id = "tea_add_btn">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
				
				<!-- 模态框（Modal） 修改-->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改
				</h4>
			</div>
			<div class="modal-body">
				 <form>
       
        <ul>
				<li><label><span >	Tid: </span></label><input type="text" name="tid" id="edtTeaNum"/><label id="teaNumMsg"></label></li>
				<li><label><span >	TName: </span></label><input type="text" name="tname" id="edtTName" /></li>
				
				<li><label><span >	sex: </span></label><label 
				class="radio-inline"><input type = "radio" value = "man" checked="checked"
				name = "teaSex"/>man</label>
				<label 
				class="radio-inline"><input type = "radio" value = "woman" checked="checked"
				name = "teaSex"/>woman</label>
				</li>
				<li><label><span >	majo: </span></label><input type="text" name="majo" id="edtTmajo" /></li>
				<li><label><span >	Professional: </span></label><input type="text" name="professional" id="edtProfessional" /></li>
				<li><label><span >	Education: </span></label><input type="text" name="education" id="edtEducation" /></li>
				<li><label><span >	phone: </span></label><input type="text" name="phone" id="edtphone" /></li>
				<li><label><span >	idcard: </span></label><input type="text" name="idcard" id="edtidcard" /></li>
				<li><label><span >	address: </span></label><input type="text" name="address" id="edtaddress" /></li>
				<li><label><span >	mailbox: </span></label><input type="text" name="mailbox" id="edtmailbox" /></li>
				<li><label><span >	DepartmentalId: </span></label><input type="text" name="departmentalid" id="edtDepartmentalId" /></li>
			</ul>			
    </form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary btn-sm" id = "tea_edit_btn">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>				
		<table class="table table-striped">
 
    <tr>
     			<th>Tid</th>
				<th>TName</th>
				<th>sex</th>
				<th>majo</th>
				<th>Professional</th>
				<th>Education</th>
				<th>phone</th>
				<th>Idcard</th>		
				<th>address</th>
				<th>mailbox</th>
				<th>部门名称</th>
    </tr>
  </thead>
  <tbody>
    
			<tr>
			<td>${tea.tid }</td>
			<td>${tea.tname }</td>
			<td>${tea.sex }</td>
			<td>${tea.majo }</td>
			<td>${tea.professional }</td>
			<td>${tea.education }</td>
			<td>${tea.phone }</td>
			<td>${tea.idcard }</td>
			<td>${tea.address }</td>
			<td>${tea.mailbox }</td>
			<td>${tea.dept.bname }</td>
      		<td><button class="btn btn-primary btn-lg edit_btn" data-toggle="modal" data-target="#edit">修改</button></td>
      		<td><button class="btn btn-primary btn-lg delete_btn" data-toggle="modal" data-target="#delete">删除</button></td>
 
           
      
    </table>
	
</div>

  </tbody>
</table>


</body>
</html>