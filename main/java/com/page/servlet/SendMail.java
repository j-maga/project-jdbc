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
import com.page.dao.PaymentDao;

public class SendMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String email = request.getParameter("mail");
		String otp = request.getParameter("amount");

		String appointmentFees = request.getParameter("appointmentFees");
		
		PaymentDao paymentDao;
		try
		{
			paymentDao = new PaymentDao(DbCon.getConnection());
			if (paymentDao.SendEmailtoUser(email, otp)) {
				
				request.getSession().setAttribute("generatedOtp", otp);
				request.getRequestDispatcher("user-orders.jsp").forward(request, response);
				
				System.out.println("Otp send to useremail successfully");
				
				
				otp=paymentDao.generateOTP();
				HttpSession session = request.getSession();
			}
			else
			{
				//session.setAttribute("errorMsg", "something wrong on server otp is not send");
				response.sendRedirect("index.jsp");
				System.out.println("something wrong !..Appointment not Booked");

			}
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}	

		
	}

}
