package com.page.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.*;
import java.sql.*;

import com.page.connection.DbCon;
import com.page.dao.OrderDao;

public class CancelOrderServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try(PrintWriter out = response.getWriter())
		{
			String id = request.getParameter("id");
			if(id != null)
			{
				OrderDao orderDao = new OrderDao(DbCon.getConnection());
				orderDao.cancelOrder(Integer.parseInt(id));
			}
			response.sendRedirect("user-orders.jsp");
		}
		
		catch (ClassNotFoundException|SQLException e) 
		{
			e.printStackTrace();
		} 
	}

}
