<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="Super/Super_head.jsp"></jsp:include>
<style type="text/css">
	html,body{
		background:url("img/background.jpg");
		width:100%;
		height: 100%;
		overflow: hidden;
	}
	.btn{
		width:280px;
	}
	.btn:hover{
		background-color:#4492E0;
	}
</style>
</head>
<body >
	<div align="center" style="margin-top: 20px"><img alt="图书管理系统" src="img/logo1_index.png"></div>
	<!-- 文字滚动 -->
	<MARQUEE scrollAmount=10 direction=left>欢迎访问某某图书管理系统</MARQUEE>
	<!-- 使用百分比设置表单位置始终居中 -->
	<div class="form_wrapper">
		<form style="margin-left:40%;margin-top:5%;" action="LoginCheck" method="post">
	         <div class="form-group">
	             <label  stype="display:inline;">账户：</label>
	            <input type="text" class="form-control" name="username" style="display:inline;width:200px;"autocomplete="off" placeholder="用户名" />
	         </div>
	         <div class="form-group">
	             <label  style="display:inline;">密码：</label>
	             <input type="password" class="form-control" name="password" style="display:inline;width:200px;"autocomplete="off" placeholder="密码"/>
	         </div>
	         <div class="form-group">
	             <label  style="display:inline;">类型：</label>
	         <select class="dropdown" name="usertype" style="display:inline;">
					<option value = "-1">系统管理员</option>
					<option value = "0">图书管理员</option>
					<option value = "1">读者</option>
			</select>
	         </div>
		         <button type="submit" class="btn"  >登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
	     </form>
	</div>

     <!-- 若登陆失败，弹窗提醒 -->
     		<%
		   String mess = (String)session.getAttribute("message");
		   if(mess==null){

		   }
			else{%>
				<script type="text/javascript">
					alert("<%=mess%>");
				</script>
			<%
			session.setAttribute("message",null);
			%>
			<% }%>
			
</body>
<jsp:include page="Super/Super_footer.jsp"></jsp:include>
</html>