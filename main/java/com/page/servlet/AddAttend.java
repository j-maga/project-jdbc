package com.page.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.page.connection.DbCon;
import com.page.dao.AttendanceDao;
import com.page.dao.ReviewDao;
import com.page.model.Attendance;
import com.page.model.Review;

public class AddAttend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String name = request.getParameter("name");
		int total = Integer.parseInt(request.getParameter("total"));
		int attend = Integer.parseInt(request.getParameter("attend"));
		int sid = Integer.parseInt(request.getParameter("sid"));
		
		try
		{
			Attendance attendance = new Attendance(name, total, attend, sid);
			AttendanceDao attendDao = new AttendanceDao(DbCon.getConnection());
			HttpSession session = request.getSession();
			
			if (attendDao.insertAttend(attendance))
			{
				response.sendRedirect("owner-attendance.jsp");
				session.setAttribute("succMsg", "Attendance Added Sucessfully..");
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
