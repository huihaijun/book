package com.mage.servlet;

import com.mage.bean.User;
import com.mage.dao.UserDao;
import com.mage.dao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/ShowUserServlet")
public class ShowUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShowUserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

//			String username = (String)getServletContext().getAttribute("username");
			//1.获取共享数据
			String username = request.getParameter("username");
			System.out.println("开始接受共享："+username);
//			User name = (User)request.getSession().getAttribute("username");
			System.out.println("接受到共享："+username);
			//2. 执行显示
			UserDao service = new UserDaoImpl();
			User u = service.findUserByName(username);
			request.setAttribute("u",u);
			System.out.println(u.getUsername());
			//3. 跳转到列表页。
			System.out.println("开始跳转……");
			request.getRequestDispatcher("/Reader/ReaderImation.jsp").forward(request, response);
			System.out.println("跳转成功！");
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
