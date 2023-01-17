package com.page.model;

public class Slot extends Owner
{
	private int id;
	private String yogatype;
	private String slottime;
	private String slotdate;
	private int fees;
	private int sid;

	public Slot()
	{
	
	}

	public Slot(String yogatype, String slottime, String slotdate, int fees, int sid)
	{
		this.yogatype = yogatype;
		this.slottime = slottime;
		this.slotdate = slotdate;
		this.fees = fees;
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
	
	public int getPrice()
	{
		return fees;
	}

	public void setPrice(int fees)
	{
		this.fees = fees;
	}

	public String getYogatype()
	{
		return yogatype;
	}

	public void setYogatype(String yogatype)
	{
		this.yogatype = yogatype;
	}

	public String getTiming()
	{
		return slottime;
	}

	public void setTiming(String slottime)
	{
		this.slottime = slottime;
	}

	public String getDate()
	{
		return slotdate;
	}

	public void setDate(String slotdate)
	{
		this.slotdate = slotdate;
	}

	@Override
	public String toString()
	{
		return "Slot [id=" + id + ", yogatype=" + yogatype + ", timing=" + slottime + ", date=" + slotdate + "]";
	}

}