<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/static/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/static/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/static/popper.min.js"></script>
<script
	src="<%=request.getContextPath()%>/static/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/Reader/css/bootstrap-datetimepicker.min.css" rel="stylesheet"
	media="screen">
<script type="text/javascript" src="<%=request.getContextPath()%>/Reader/css/bootstrap-datetimepicker.js"></script>
<style>
.imgs {
	width: 900px;
	height: 400px;
	background-position: center;
	background-size: cover;
}
</style>
</head>
<body background="../img/background.jpg">
	<h2 align="center" style="margin-top: 20px;">添加图书</h2>
	<div class="container">
		<div class="row " style="margin-top: 50px;">
			<div align="center" class="col-md-3">
				<ul class="list-group">
				<c:if test="${sessionScope.usertype=='-1'}">
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_about.jsp"><span
							style="color: black">首页</span></a></li>
					<li class="list-group-item    "><a href="<%=request.getContextPath() %>/UserListServlet"><span
							style="color: black">用户信息</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath() %>/BookListServlet"><span
							style="color: black">图书信息</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp"><span
							style="color: black">添加用户</span></a></li>
					<li class="list-group-item active"><a href="<%=request.getContextPath() %>/SBook/AddBook.jsp"><span
							style="color: black">添加图书</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath() %>/Super/Super_exit.jsp"><span
							style="color: black">退出</span></a></li>
				</c:if>
				<c:if test="${sessionScope.usertype=='0'}">
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/bookManager/bookManager_about.jsp"><span
						style="color: black">首页</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/BookListServlet"><span
							style="color: black">图书信息</span></a></li>
					<li class="list-group-item  active"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp"><span
							style="color: black">添加图书</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/bookManager/BorrowBook.jsp"><span
							style="color: black">借书</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath()%>/bookManager/BorrowNoteServlet"><span
							style="color: black">借阅记录查询</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath()%>/Reader/exit.jsp"><span
							style="color: black">退出</span></a></li>
				</c:if>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="container" align="center">
					<form action="<%=request.getContextPath()%>/AddBookServlet" method="post">
						<table align="center">
							<tr>
								<td align="center"><b>图书名称:</b></td>
								<td><input type="text" name="bookname"
								style="margin-left: 50px; margin-top: 10px;"
									class="form-control inputclass" ></td>
							  </tr>
							<tr>
								<td align="center"><b>作者:</b></td>
								<td><input type="text" name="author"
								style="margin-left: 50px; margin-top: 10px;"
									class="form-control inputclass" ></td>
							  </tr>
							<tr>
								<td align="center"><b>出版社:</b></td>
								<td><input type="text" name="publish"
								style="margin-left: 50px; margin-top: 10px;"
									class="form-control inputclass" ></td>
							  </tr>
							<tr>
								<td align="center"><b>图书库存:</b></td>
								<td><input type="text" name="bookcount"
								style="margin-left: 50px; margin-top: 10px;"
									class="form-control inputclass" ></td>
							  </tr>
							<tr>
								<td align="center"><b>图书类型:</b></td>
								<td><input type="text" name="booktype"
								style="margin-left: 50px; margin-top: 10px;"
									class="form-control inputclass" ></td>
							  </tr>
							  

						</table>
						<button type="submit" style="margin-left: 20px; margin-top: 30px;"
							class="btn btn-info">确认信息</button>

						<a href="Super_about.jsp" class="btn btn-danger"
							style="margin-left: 80px; margin-top: 30px;"><span>取消</span></a>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>