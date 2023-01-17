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
import com.page.model.Attendance;


public class DeleteAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		
		try
		{
			AttendanceDao attendDao = new AttendanceDao(DbCon.getConnection());
			HttpSession session = request.getSession();
			
				if (attendDao.attendDel(id))
				{
					response.sendRedirect("owner-attendance.jsp");
					session.setAttribute("succMsg", "Review Added Sucessfully..");
				}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
