package com.mage.Operaservlet;

import com.mage.bean.User;
import com.mage.dao.UserDao;
import com.mage.dao.impl.UserDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/RenewUserServlet")
public class RenewUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RenewUserServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			//1. 获取客户端提交上来的数据
			int userid = Integer.parseInt(request.getParameter("userid"));
			System.out.println("正在封杀 ....."+userid);

			UserDao service = new UserDaoImpl();
			service.renewkill(userid);
			System.out.println("已经封杀完毕 .....");

			request.getRequestDispatcher("/BorrowNoteServlet").forward(request, response);
			
		} catch (Exception e) {
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
