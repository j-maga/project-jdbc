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


public class ownerServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String sname = request.getParameter("sname");
		String smail = request.getParameter("smail");

		String slocation = request.getParameter("slocation");
		String sphone = request.getParameter("sphone");

		String sstudio = request.getParameter("sstudio");
		String sseat = request.getParameter("sseats");
		
		String sdesc = request.getParameter("sdesc");
		String saddress = request.getParameter("saddress");
		
		String spass = request.getParameter("spass");
		String sconfirm = request.getParameter("sconfirm");
		
		System.out.println(sname+smail+slocation+sphone+sstudio+sseat+sdesc+saddress+spass+sconfirm);
				
		RequestDispatcher dispatcher = null;
		Connection con = null;
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yg", "root", "My$q!22sep@MJ");
			
			PreparedStatement pst = con.prepareStatement("insert into Owner(name, email, location, phone, studioname, seats, description, address, password, confirm) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			pst.setString(1, sname);
			pst.setString(2, smail);
			pst.setString(3, slocation);
			pst.setString(4, sphone);
			pst.setString(5, sstudio);
			pst.setString(6, sseat);
			pst.setString(7, sdesc);
			pst.setString(8, saddress);
			pst.setString(9, spass);
			pst.setString(10, sconfirm);
			
			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("signup-studio.jsp");
			
			
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