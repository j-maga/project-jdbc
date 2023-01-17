package com.page.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.page.model.*;

public class UserDao
{
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    private int alter;
    
	public UserDao(Connection con)
	{
		this.con = con;
	}
	
	public User userLogin(String email, String pass)
	{
		User user = null;
        try
        {
            query = "select * from user where email=? and pass=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            rs = pst.executeQuery();
            
            if(rs.next())
            {
            	user = new User();
            	user.setId(rs.getInt("id"));
            	user.setName(rs.getString("name"));
            	user.setEmail(rs.getString("email"));
            }
        }
        
        catch (SQLException e)
        {
            System.out.print(e.getMessage());
        }
        return user;
    }
	
	
	public boolean userDel(int id)
	{
		boolean flag = false;
		try
		{
			query = "delete from user where id=?";
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
	
	
	public List<User> getAllUsers()
	{
        List<User> userlist = new ArrayList<>();
        try
        {

            query = "select * from user";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	User row = new User();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setEmail(rs.getString("email"));
                row.setDate(rs.getString("date"));
                row.setPhone(rs.getString("phone"));
                row.setAddress(rs.getString("address"));

                userlist.add(row);
            }

        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return userlist;
    }
	
}