package com.page.dao;

import java.sql.*;
import java.util.*;

import com.page.model.*;

public class ImageDao
{
	
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
	public ImageDao(Connection con) 
	{
		super();
		this.con = con;
	}

	
	
	public boolean insertImage(Image image)
	{
        boolean result = false;
        
        try
        {
            query = "insert into image (imageFileName, sid) values(?,?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, image.getName());
            pst.setInt(2, image.getSid());
            pst.executeUpdate();
            result = true;
        }
        
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
	

	
	public List<Image> getAllImages(int sid)
	{
        List<Image> images = new ArrayList<>();
        try
        {
            query = "select * from image where sid=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, sid);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Image row = new Image();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("imageFileName"));

                images.add(row);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return images;
    }
}