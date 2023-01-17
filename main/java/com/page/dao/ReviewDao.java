package com.page.dao;

import java.sql.*;
import java.util.*;

import com.page.model.*;

public class ReviewDao
{
	
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    private int alter;
    
	public ReviewDao(Connection con) 
	{
		super();
		this.con = con;
	}

	
	
	public boolean insertReview(Review review)
	{
        boolean result = false;
        
        try
        {
            query = "insert into feedback (username, review, sname) values(?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, review.getUserName());
            pst.setString(2, review.getReview());
            pst.setString(3, review.getStudioName());
            pst.executeUpdate();
            result = true;
        }
        
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
	
	
	
	public boolean reviewDel(int id)
	{
		boolean flag = false;
		try
		{
			query = "delete from feedback where id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			alter = pst.executeUpdate();
			
			if(alter==1)
			{
				flag = true;
			}
		}
		catch (SQLException e)
        {
            System.out.print(e.getMessage());
        }
		return flag;
	}
	

	
	public List<Review> getAllReviews(String sname)
	{

        List<Review> review = new ArrayList<>();
        try
        {
            query = "select * from feedback where sname=? order by rand() limit 4";
            pst = this.con.prepareStatement(query);
            pst.setString(1, sname);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Review row = new Review();
                row.setUserName(rs.getString("username"));
                row.setReview(rs.getString("review"));

                review.add(row);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return review;
    }
	
	
	public List<Review> getAllReviews()
	{

        List<Review> review = new ArrayList<>();
        try
        {
            query = "select * from feedback order by rand() limit 4";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Review row = new Review();
                row.setUserName(rs.getString("username"));
                row.setReview(rs.getString("review"));

                review.add(row);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return review;
    }
}