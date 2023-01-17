package com.page.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.page.model.*;

public class OwnerDao
{
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    private int alter;

	public OwnerDao(Connection con)
	{
		this.con = con;
	}
	
	public Owner ownerLogin(String email, String pass)
	{
		Owner owner = null;
        try
        {
            query = "select * from owner where email=? and password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, pass);
            rs = pst.executeQuery();
            
            if(rs.next())
            {
            	owner = new Owner();
            	owner.setId(rs.getInt("id"));
            	owner.setName(rs.getString("name"));
            	owner.setEmail(rs.getString("email"));
            	owner.setStudioName(rs.getString("studioname"));
            }
        }
        
        catch (SQLException e)
        {
            System.out.print(e.getMessage());
        }
        return owner;
    }
	
	
	
	public boolean ownerDel(int id)
	{
		boolean flag = false;
		try
		{
			query = "delete from owner where id=?";
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
		System.out.println(flag);
		return flag;
	}
	
	
	
	public List<Owner> getAllStudios()
	{
        List<Owner> ownerlist = new ArrayList<>();
        try
        {

            query = "select * from owner";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Owner row = new Owner();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("name"));
                row.setEmail(rs.getString("email"));
                row.setLocation(rs.getString("location"));
                row.setPhone(rs.getString("phone"));
                row.setAddress(rs.getString("address"));
                row.setStudioName(rs.getString("studioname"));
                row.setSeats(rs.getInt("seats"));

                ownerlist.add(row);
            }

        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return ownerlist;
    }
	
	
	public List<Owner> getDistinctStudioNames()
	{
        List<Owner> studioname = new ArrayList<>();
        try
        {
            query = "select distinct studioname from owner";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Owner studios = new Owner();
                studios.setStudioName(rs.getString(1));

                studioname.add(studios);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return studioname;
    }
	
}