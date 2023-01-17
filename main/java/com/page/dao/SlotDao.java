package com.page.dao;

import java.sql.*;
import java.util.*;

import com.page.model.Cart;
import com.page.model.Slot;

public class SlotDao
{
	
	private Connection con;

	private String query;
    private PreparedStatement pst;
    private ResultSet rs;
    
    private int alter;
    

	public SlotDao(Connection con)
	{
		super();
		this.con = con;
	}
	
	
	public boolean insertSlot(Slot slot)
	{
        boolean result = false;
        
        try
        {
            query = "insert into slotsalloc (slotdate, slottime, yogatype, sid, fees) values(?, ?, ?, ?, ?)";
            pst = this.con.prepareStatement(query);

            pst.setString(1, slot.getDate());
            pst.setString(2, slot.getTiming());
            pst.setString(3, slot.getYogatype());
            pst.setInt(4, slot.getSid());
            pst.setInt(5, slot.getPrice());
            pst.executeUpdate();
            result = true;
        }
        
        catch (SQLException e)
        {
            System.out.println(e.getMessage());
        }
        return result;
    }
	
	
	
	public boolean slotDel(int id)
	{
		boolean flag = false;
		try
		{
			query = "delete from slotsalloc where id=?";
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
	
	
	
	public List<Slot> getAllSlots(int sid)
	{
        List<Slot> book = new ArrayList<>();
        try
        {
            query = "select * from slotsalloc where sid=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, sid);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Slot row = new Slot();
                row.setId(rs.getInt("id"));
                row.setYogatype(rs.getString("yogatype"));
                row.setTiming(rs.getString("slottime"));
                row.setDate(rs.getString("slotdate"));
                row.setPrice(rs.getInt("fees"));

                book.add(row);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	
	
	public List<Slot> getAllSlots()
	{
        List<Slot> book = new ArrayList<>();
        try
        {
            query = "select * from slotsalloc";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Slot row = new Slot();
                row.setId(rs.getInt("id"));
                row.setYogatype(rs.getString("yogatype"));
                row.setTiming(rs.getString("slottime"));
                row.setDate(rs.getString("slotdate"));
                row.setPrice(rs.getInt("fees"));

                book.add(row);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	
	
	public List<Slot> getAllSlots(String sname)
	{
        List<Slot> book = new ArrayList<>();
        try
        {
            query = "select * from slotsalloc where sname=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, sname);
            rs = pst.executeQuery();

            while (rs.next())
            {
            	Slot row = new Slot();
                row.setId(rs.getInt("id"));
                row.setYogatype(rs.getString("yogatype"));
                row.setTiming(rs.getString("slottime"));
                row.setDate(rs.getString("slotdate"));
                row.setPrice(rs.getInt("fees"));

                book.add(row);
            }
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return book;
    }
	
	
	
	
	 public Slot getSingleProduct(int id)
	 {
		 Slot row = null;
	        
		 try
		 {
	            query = "select * from slotsalloc where id=? ";

	            pst = this.con.prepareStatement(query);
	            pst.setInt(1, id);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next())
	            {
	            	row = new Slot();
	                row.setId(rs.getInt("id"));
	                row.setYogatype(rs.getString("yogatype"));
	                row.setTiming(rs.getString("timing"));
	                row.setDate(rs.getString("studioname"));
	            }
	     }
	     
		 catch (Exception e)
		 {
	            e.printStackTrace();
	            System.out.println(e.getMessage());
	     }

	     return row;
	 }
	
	public double getTotalCartPrice(ArrayList<Cart> cartList)
	{
        double sum = 0;
        
        try
        {
            if (cartList.size() > 0)
            {
                for (Cart item : cartList)
                {
                    query = "select fees from slotsalloc where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                    while (rs.next())
                    {
                        sum+=rs.getInt("fees")*item.getQuantity();
                    }

                }
            }

        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return sum;
    }

    
	public List<Cart> getCartSlots(ArrayList<Cart> cartList)
    {
        List<Cart> book = new ArrayList<>();
        
        try
        {
            if (cartList.size() > 0)
            {
                for (Cart item : cartList)
                {
                    query = "select * from slotsalloc where id=?";
                    pst = this.con.prepareStatement(query);
                    pst.setInt(1, item.getId());
                    rs = pst.executeQuery();
                    
                    while (rs.next())
                    {
                        Cart row = new Cart();
                        row.setId(rs.getInt("id"));
                        row.setYogatype(rs.getString("yogatype"));
                        row.setDate(rs.getString("slotdate"));
                        row.setPrice(rs.getInt("fees")*item.getQuantity());
                        row.setQuantity(item.getQuantity());
                        book.add(row);
                    }

                }
            }

        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        
        return book;
    }

}