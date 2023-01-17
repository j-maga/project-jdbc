package com.page;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig

public class AddImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		System.out.println("In do post method of Add Image servlet.");
		Part file=request.getPart("image");
		
		int sid = Integer.parseInt(request.getParameter("sid"));
		String imageFileName=file.getSubmittedFileName(); 
		System.out.println("Selected Image File Name : "+imageFileName);
		
		String uploadPath="E:/Workspace/StudOwnModule/src/main/webapp/images/"+imageFileName;
		System.out.println("Upload Path : "+uploadPath);
		
		
		try
		{		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		Connection connection=null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/yg","root","My$q!22sep@MJ");
			PreparedStatement stmt;
			String query="insert into image(imageFileName, sid) values(?, ?)";
			stmt=connection.prepareStatement(query);
			stmt.setString(1,imageFileName);
			stmt.setInt(2,sid);
			int row=stmt.executeUpdate();
			
			if(row>0)
			{
				System.out.println("Image added into database successfully.");
			}
			
			else
			{
				System.out.println("Failed to upload image.");
			}
				
		}
		
		catch (Exception e)
		{
			System.out.println(e);
		}
	
	}

}