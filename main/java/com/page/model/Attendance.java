package com.page.model;

public class Attendance
{
	private String stname;
	private int total;
	private int attended;
	private int id;
	private int sid;
	
	public Attendance()
	{
		
	}
	
	public Attendance(String stname, int total, int attended, int sid)
	{
		this.stname = stname;
		this.total = total;
		this.attended = attended;
		this.sid = sid;		
	}
	
	
	public Attendance(String stname, int total, int attended, int sid, int id)
	{
		this.id = id;
		this.stname = stname;
		this.total = total;
		this.attended = attended;
		this.sid = sid;		
	}
	
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}
	
	public int getSid()
	{
		return sid;
	}

	public void setSid(int sid)
	{
		this.sid = sid;
	}
	
	public String getName()
	{
		return stname;
	}

	public void setName(String stname)
	{
		this.stname = stname;
	}
	
	public int getTotal()
	{
		return total;
	}

	public void setTotal(int total)
	{
		this.total = total;
	}
	
	public int getAttend()
	{
		return attended;
	}

	public void setAttend(int attended)
	{
		this.attended = attended;
	}

}
