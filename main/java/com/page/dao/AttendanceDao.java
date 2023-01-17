package com.page.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.page.model.Attendance;
import com.page.model.Product;

public class AttendanceDao
{
	private Connection con;
	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    private int alter;
    
    public AttendanceDao(Connection con)
    {
    	super();
		this.con = con;    	
    }
    
    
    
    public boolean insertAttend(Attendance attend)
	{
        boolean result = false;
        
        try
        {
            query = "insert into attendance (stname, total, attended, sid) values(?, ?, ?, ?)";
            pst = this.con.prepareStatement(query);
            pst.setString(1, attend.getName());
            pst.setInt(2, attend.getTotal());
            pst.setInt(3, attend.getAttend());
            pst.setInt(4, attend.getSid());
            pst.executeUpdate();
            result = true;
        }
        
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
    
    
    
    public boolean attendDel(int id)
	{
		boolean flag = false;
		try
		{
			query = "delete from attendance where id=?";
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
    
    
    
    public List<Attendance> getAttend(int sid)
	{
        List<Attendance> attend = new ArrayList<>();
        try
        {
            query = "select * from attendance where sid=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, sid);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Attendance row = new Attendance();
                row.setId(rs.getInt("id"));
                row.setName(rs.getString("stname"));
                row.setTotal(rs.getInt("total"));
                row.setAttend(rs.getInt("attended"));

                attend.add(row);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return attend;
    }
    
    
    
    public Attendance getSingleAttend(int id)
	 {
    	Attendance attend = null;
	        
		 try
		 {
	            query = "select * from attendance where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next())
	            {
	            	attend = new Attendance();
	            	attend.setName(rs.getString(1));
	            	attend.setTotal(rs.getInt(2));
	            	attend.setAttend(rs.getInt(3));
	            }
	     }
	     
		 catch (Exception e)
		 {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	     }
		 
	     return attend;
	 }
    
    
    
    public boolean updateAttend(Attendance attend)
	{
        boolean result = false;
        
        try
        {
            query = "update attendance set stname=?, total=?, attended=?, sid=? where id=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, attend.getName());
            pst.setInt(2, attend.getTotal());
            pst.setInt(3, attend.getAttend());
            pst.setInt(4, attend.getSid());
            pst.setInt(5, attend.getId());
            pst.executeUpdate();
            result = true;
            System.out.println(result);
            System.out.println(attend.getName()+attend.getId()+attend.getTotal()+attend.getAttend());
        }
        
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }

}
