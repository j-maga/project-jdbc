package com.page;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{		
		String uname = request.getParameter("uname");
		String umail = request.getParameter("umail");
		String udob = request.getParameter("udob");
		String uphone = request.getParameter("uphone");
		String uaddress = request.getParameter("uaddress");
		String upass = request.getParameter("upass");
		String uconfirm = request.getParameter("uconfirm");
		RequestDispatcher dispatcher =null;
		
		System.out.println(uname+umail+udob+uphone+uaddress+upass+uconfirm);
		
		Connection con = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yg", "root", "My$q!22sep@MJ");
			PreparedStatement pst = con.prepareStatement("insert into user(name, email, date, phone, address, pass, confirm) values(?, ?, ?, ?, ?, ?, ?)");
			pst.setString(1, uname);
			pst.setString(2, umail);
			pst.setString(3, udob);
			pst.setString(4, uphone);
			pst.setString(5, uaddress);
			pst.setString(6, upass);
			pst.setString(7, uconfirm);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("pagesignuser.jsp");
			
			if(rowCount > 0)
			{
				request.setAttribute("status", "success");
			}
			
			else
			{
				request.setAttribute("status", "failed");
			}
			dispatcher.forward(request, response);
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		finally
		{
			try
			{
				con.close();
			}
			
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
	}
}