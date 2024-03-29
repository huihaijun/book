<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
function doDelete(operatid) {
	var flag = confirm("是否确定删除改条记录?");
	if(flag){
		//表明点了确定。 访问servlet。 在当前标签页上打开 超链接
		location.href="<%=request.getContextPath()%>/DeleteOperaServlet?Operaid="+operatid;
	}
}
function doReturn(userid,bookid) {
	var flag = confirm("是否确定还书?");
	if(flag){
		location.href="<%=request.getContextPath()%>/ReturnBooksServlet?userid="+userid+"&bookid="+bookid;
        location.href = "<%=request.getContextPath()%>/RelifeUserServlet?userid="+userid;
	}
}
function doRenew(userid,bookid) {
	var flag = confirm("是否确定续借?");
	if(flag){
		location.href="<%=request.getContextPath()%>/RenewBooksServlet?userid="+userid+"&bookid="+bookid;
	} 
}

function kill(userid){
    var flag = confirm("是否将该用户标记为“未归还”");
    if (flag){
        location.href = "<%=request.getContextPath()%>/RenewUserServlet?userid="+userid;
    }
}

</script>
</head>
<body background="<%=request.getContextPath() %>/img/background.jpg">
	<h2 align="center" style="margin-top: 20px;">图书管理系统</h2>
	<div class="container">
		<div class="row " style="margin-top: 50px;">
			<div align="center" class="col-md-3">
				<ul class="list-group">
				<c:if test="${sessionScope.usertype=='-1'}">
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/Super/Super_about.jsp"><span
							style="color: black">首页</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/UserListServlet"><span
							style="color: black">用户信息</span></a></li>
					<li class="list-group-item  active"><a href="<%=request.getContextPath() %>/BorrowNoteServlet"><span
							style="color: black">图书信息</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath() %>/RoleServlet"><span
							style="color: black">角色管理</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath() %>/Super/Super_AddUser.jsp"><span
							style="color: black">添加用户</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath() %>/Book/AddBook.jsp"><span
							style="color: black">添加图书</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath() %>/Super/Super_exit.jsp"><span
							style="color: black">退出</span></a></li>
				</c:if>
				<c:if test="${sessionScope.usertype=='1'}">
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/Reader/Reader.jsp"><span
							style="color: black">首页</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/ShowUserServlet?username=${username}"><span
							style="color: black">我的信息</span></a></li>
					<li class="list-group-item "><a href="BookListServlet"><span
							style="color: black">图书信息查询</span></a></li>
					<li class="list-group-item active"><a href="<%=request.getContextPath() %>/SearchOperatServlet?username=${username}"><span
							style="color: black">我的借阅记录</span></a></li>
					<li class="list-group-item "><a href="Reader/exit.jsp"><span
							style="color: black">退出</span></a></li>
				</c:if>
				<c:if test="${sessionScope.usertype=='0'}">
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/bookManager/bookManager_about.jsp"><span
							style="color: black">首页</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath()%>/BookListServlet"><span
							style="color: black">图书信息</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/Book/AddBook.jsp"><span
							style="color: black">添加图书</span></a></li>
					<li class="list-group-item"><a href="<%=request.getContextPath() %>/bookManager/BorrowBook.jsp"><span
							style="color: black">借书</span></a></li>
					<li class="list-group-item  active"><a href="<%=request.getContextPath()%>/BorrowNoteServlet"><span
							style="color: black">借阅记录查询</span></a></li>
					<li class="list-group-item "><a href="<%=request.getContextPath()%>/Super/Super_exit.jsp"><span
							style="color: black">退出</span></a></li>
				</c:if>
				</ul>
			</div>
			<div class="col-md-9">
				<div class="search" style="float:right;margin:5px;">
					<form class="form-inline" action="BorrowSearchServlet">
					  <div class="form-group">
					    <input type="text" name="key" class="form-control"  placeholder="搜索">
					  </div>
					  <button type="submit" class="btn btn-default" >搜索</button>
					</form>
				</div>
			
			<table class="table table-bordered">
							  <tr align="center">
			<td>借阅记录id</td>
			<td>图书id</td>
			<td>图书名称</td>
			<td>借阅者id</td>
			<td>借阅人姓名</td>
			<td>借阅时间</td>
			<td>借阅期限</td>
			<td>是否归还</td>
			<c:if test="${sessionScope.usertype!='1'}"><td>操作</td></c:if>
		  </tr>
			  <c:forEach items="${pageBean.list}" var="book">
				  <tr align="center">
					<td>${book.operatid}</td>
					<td>${book.bookid}</td>
					<td>${book.bookname}</td>
					<td>${book.userid}</td>
					<td>${book.username}</td>
					<td>${book.borrowtime}</td>
					<td>${book.renttime}</td>
					<td>
						<c:if test="${book.isreturn!=true}">
							否
						</c:if>	
						<c:if test="${book.isreturn}">
							是
						</c:if>	
					</td>
					<td>
					<c:if test="${sessionScope.usertype==0}">
						<c:if test="${book.isreturn==false}">
							<a href="#" onclick="doReturn(${book.userid},${book.bookid})">还书</a>
							<a href="#" onclick="kill(${book.userid},${book.bookid})">未归还</a>
						</c:if>
							<a href="#" onclick="doDelete(${book.operatid})">删除</a>	
						<c:if test="${book.renttime<60}">
							<a href="#" onclick="doRenew(${book.userid},${book.bookid})">续借</a>
						</c:if>	
					</c:if>
					</td>
				  </tr>
			  </c:forEach>
			  		<tr>
			  	<td colspan="9">
			  		第 ${pageBean.currentPage } / ${pageBean.totalPage }
			  		&nbsp;&nbsp;
			  		每页显示${pageBean.pageSize }条  &nbsp;&nbsp;&nbsp;
			  		总的记录数${pageBean.totalSize } &nbsp;&nbsp;&nbsp;
			  		<c:if test="${pageBean.currentPage !=1 }">
			  			<a href="BorrowNoteServlet?currentPage=1">首页</a>
						| <a href="BorrowNoteServlet?currentPage=${pageBean.currentPage-1 }">上一页</a>
			  		</c:if>
			  		
			  		<c:forEach begin="1" end="${pageBean.totalPage }" var="i">
			  			<c:if test="${pageBean.currentPage == i }">
			  				${i }
			  			</c:if>
			  			<c:if test="${pageBean.currentPage != i }">
			  				<a href="BorrowNoteServlet?currentPage=${i }">${i }</a>
			  			</c:if>
			  		
			  		</c:forEach>
			  		
			  		
			  		<c:if test="${pageBean.currentPage !=pageBean.totalPage }">
			  			<a href="BorrowNoteServlet?currentPage=${pageBean.currentPage+1 }">下一页</a> | 
			  			<a href="BorrowNoteServlet?currentPage=${pageBean.totalPage }">尾页</a>
			  		</c:if>
			  	</td>
			  </tr>
				</table>
				
				<nav class="text-center">
				<ul class="pagination">
					<!-- 上一页 -->
					<li class="page-item"><a href="BorrowNoteServlet?currentPage=${pageBean.currentPage-1 }" class="page-link"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<!-- 页码 -->
					<!-- 下一页 -->
					<li class="page-item"><a href="BorrowNoteServlet?currentPage=${pageBean.currentPage+1 }" class="page-link"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>

</body>
</html>