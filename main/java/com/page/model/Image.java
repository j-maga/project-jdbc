package com.page.model;

public class Image extends Owner
{
	private int imageId;
	private String imageFileName;
	private int sid;
	
	public Image()
	{
	
	}
	
	public Image(int imageId, String imageFileName, int sid)
	{
		this.imageId = imageId;
		this.imageFileName = imageFileName;
		this.sid = sid;
	}

	public int getId()
	{
		return imageId;
	}

	public void setId(int imageId)
	{
		this.imageId = imageId;
	}
	
	public String getName()
	{
		return imageFileName;
	}

	public void setName(String imageFileName)
	{
		this.imageFileName = imageFileName;
	}
	
	public int getSid()
	{
		return sid;
	}

	public void setSid(int sid)
	{
		this.sid = sid;
	}
}