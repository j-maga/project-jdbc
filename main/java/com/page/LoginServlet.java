package com.page;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String logmail = request.getParameter("logmail");
		String logpass = request.getParameter("logpass");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yg", "root", "My$q!22sep@MJ");
			PreparedStatement pst = con.prepareStatement("select * from user where email = ? and pass = ?");
			PreparedStatement pst1 = con.prepareStatement("select * from owner where email = ? and password = ?");
			pst.setString(1, logmail);
			pst.setString(2, logpass);
			pst1.setString(1, logmail);
			pst1.setString(2, logpass);
			
			ResultSet rs = pst.executeQuery();
			ResultSet rs1 = pst1.executeQuery();
			
			if(rs.next())
			{
				System.out.println("User if ");
				session.setAttribute("name", logmail);
				System.out.print("Welcome "+logmail);
				dispatcher = request.getRequestDispatcher("user.jsp");			
			}
			
			else if(rs1.next())
			{
				System.out.println("Owner if ");
				
				dispatcher = request.getRequestDispatcher("owner.jsp");				
			}
			
			else
			{
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
			}
			
			dispatcher.forward(request, response);
		}
		
		catch(Exception e)
		{
			e.printStackTrace(); 
		}
	}
	
}