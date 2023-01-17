package com.page.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.page.connection.DbCon;
import com.page.dao.UserDao;
import com.page.model.User;

public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		
		try
		{
			User user = new User();
			UserDao userDao = new UserDao(DbCon.getConnection());
			HttpSession session = request.getSession();
			
				if (userDao.userDel(id))
				{
					response.sendRedirect("admin-usermanage.jsp");
					session.setAttribute("succMsg", "Review Added Sucessfully..");
				}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
