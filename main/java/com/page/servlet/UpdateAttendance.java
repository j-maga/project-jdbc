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

public class UpdateAttendance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String name = request.getParameter("name");
		int total = Integer.parseInt(request.getParameter("total"));
		int attend = Integer.parseInt(request.getParameter("attend"));
		int sid = Integer.parseInt(request.getParameter("sid"));
		
		int id = Integer.parseInt(request.getParameter("uid"));
		
		System.out.println("servlet"+id+name+total+attend+sid);
		
		
		try
		{
			Attendance attendance = new Attendance(name, total, attend, sid, id);
			AttendanceDao attendDao = new AttendanceDao(DbCon.getConnection());
			HttpSession session = request.getSession();
			
			if (attendDao.updateAttend(attendance))
			{
				response.sendRedirect("owner-attendance.jsp");
				session.setAttribute("succMsg", "Attendance Updated Sucessfully..");
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
