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
import com.page.dao.UserDao;
import com.page.dao.OwnerDao;
import com.page.dao.AdminDao;

import com.page.model.User;
import com.page.model.Owner;
import com.page.model.Admin;

public class LogInServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			response.setContentType("text/html;charset=UTF-8");
			
			try (PrintWriter out = response.getWriter())
			{
				String email = request.getParameter("logmail");
				String pass = request.getParameter("logpass");

				UserDao udao = new UserDao(DbCon.getConnection());
				OwnerDao odao = new OwnerDao(DbCon.getConnection());
				AdminDao adao = new AdminDao(DbCon.getConnection());
				
				User user = udao.userLogin(email, pass);
				Owner owner = odao.ownerLogin(email, pass);
				Admin admin = adao.adminLogin(email, pass);
				
				if (user != null)
				{
					request.getSession().setAttribute("auth", user);
					System.out.println(user);
					response.sendRedirect("user-home2.jsp");
				}
				
				else if (owner != null)
				{
					request.getSession().setAttribute("auth", owner);
					Object own = request.getSession().getAttribute("auth");
					System.out.println(request.getSession().getAttribute("auth"));
					System.out.println(own.toString());
					response.sendRedirect("owner-dashboard.jsp");
				}
				
				else if (admin != null)
				{
					request.getSession().setAttribute("auth", admin);
					response.sendRedirect("admin-dashboard.jsp");
				}
				
				else
				{
					response.sendRedirect("invalid.jsp");
				}
			}
			
			catch (ClassNotFoundException|SQLException e)
			{
				e.printStackTrace();
			} 

		}
	}