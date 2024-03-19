package com.mage.Operaservlet;

import com.mage.dao.UserDao;
import com.mage.dao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/RelifeUserServlet")
public class RelifeUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RelifeUserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			//1. 获取客户端提交上来的数据
			int userid = Integer.parseInt(request.getParameter("userid"));
			System.out.println("正在解封 ....."+userid);

			UserDao service = new UserDaoImpl();
			service.renewlife(userid);
			System.out.println("已经解封完毕 .....");

			request.getRequestDispatcher("/BorrowNoteServlet").forward(request, response);
			
		} catch (Exception e) {
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
