package com.page.model;

public class Review
{
	private int id;
	private String username;
	private String review;
	private String sname;
	
	public Review()
	{
		
	}
	
	public Review(String username, String review, String sname)
	{
		this.username = username;
		this.review = review;
		this.sname = sname;		
	}
	
	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}
	
	public String getStudioName()
	{
		return sname;
	}

	public void setStudioName(String sname)
	{
		this.sname = sname;
	}
	
	public String getUserName()
	{
		return username;
	}

	public void setUserName(String username)
	{
		this.username = username;
	}
	
	public String getReview()
	{
		return review;
	}

	public void setReview(String review)
	{
		this.review = review;
	}

}
