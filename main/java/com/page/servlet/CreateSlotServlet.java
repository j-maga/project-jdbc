package com.page.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.page.connection.DbCon;
import com.page.dao.SlotDao;
import com.page.model.Slot;

public class CreateSlotServlet extends HttpServlet
{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String date = request.getParameter("date");
		int fees = Integer.parseInt(request.getParameter("fee"));
		String time = request.getParameter("time");
		String slot = request.getParameter("slot");
		int sid = Integer.parseInt(request.getParameter("sid"));
		
		try
		{
			Slot slots = new Slot(slot, time, date, fees, sid);
			SlotDao slotDao = new SlotDao(DbCon.getConnection());
			HttpSession session = request.getSession();
			
			if (slotDao.insertSlot(slots))
			{
				response.sendRedirect("owner-slotmanage.jsp");
				session.setAttribute("succMsg", "Slot Added Sucessfully..");
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}