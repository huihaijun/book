<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<style>
.imgs {
	width: 900px;
	height: 400px;
	background-position: center;
	background-size: cover;
}
</style>
</head>
<body background="<%=request.getContextPath()%>/img/background.jpg">
		<h2 align="center" style="margin-top:20px;">图书管理系统</h2>
		<div class="container">
		<div class="row " style="margin-top: 50px;">
			<div align="center" class="col-md-3" >
				<ul class="list-group" >
					<li class="list-group-item active"><a href="<%=request.getContextPath()%>/bookManager/bookManager_about.jsp"><span
							style="color: black">首页</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/BookListServlet"><span
							style="color: black">图书信息</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp"><span
							style="color: black">添加图书</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/bookManager/BorrowBook.jsp"><span
							style="color: black">借书</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath() %>/BorrowNoteServlet"><span
							style="color: black">借阅记录查询</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath()%>/Super/Super_exit.jsp"><span
							style="color: black">退出</span></a></li>
				</ul>
			</div>
			<!-- 这个div -->
			<!-- 和这个div横向排序 -->
			<div class=" col-md-9 carousel slide"  style="padding-left:10px; width:900px;height:450px" id="demo" data-ride="carousel">
				<!-- 指示符 -->
				<ul class="carousel-indicators">
					<li data-target="#demo" data-slide-to="0" class="active"></li>
					<li data-target="#demo" data-slide-to="1"></li>
					<li data-target="#demo" data-slide-to="2"></li>
				</ul>

				<!-- 轮播图片 -->
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="imgs" src="<%=request.getContextPath()%>/img/timg3.jpg">
					</div>
					<div class="carousel-item">
						<img class="imgs" src="<%=request.getContextPath()%>/img/timg1.jpg">
					</div>
					<div class="carousel-item">
						<img class="imgs" src="<%=request.getContextPath()%>/img/timg2.jpg">
					</div>
				</div>

				<!-- 左右切换按钮 -->
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon"></span>
				</a> <a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon"></span>
				</a>
			</div>
		</div>
		</div>
</body>
</html>