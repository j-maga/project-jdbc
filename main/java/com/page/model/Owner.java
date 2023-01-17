package com.page.model;

public class Owner
{	
	private int id;
	private String name;
	private String email;
	private String location;
	private String studioname;
	private String description;
	private int seats;
	private String phone;
	private String address;
	private String password;

	public Owner()
	{
	
	}

	public Owner(String name, String email, String location, String phone, String studioname, String description, int seats, String address, String password)
	{
		this.name = name;
		this.email = email;
		this.location = location;
		this.studioname = studioname;
		this.description = description;
		this.seats = seats;
		this.phone = phone;
		this.address = address;
		this.password = password;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}
	
	public int getSeats()
	{
		return seats;
	}

	public void setSeats(int seats)
	{
		this.seats = seats;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}
	
	public String getStudioName()
	{
		return studioname;
	}

	public void setStudioName(String studioname)
	{
		this.studioname = studioname;
	}

	public String getEmail()
	{
		return email;
	}
	
	public void setEmail(String email)
	{
		this.email = email;
	}
	
	public String getLocation()
	{
		return location;
	}

	public void setLocation(String location)
	{
		this.location = location;
	}
	
	public String getPhone()
	{
		return phone;
	}

	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	
	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}
	
	public String getDescription()
	{
		return description;
	}

	public void setDescription(String description)
	{
		this.description = description;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	@Override
	public String toString()
	{
		return "Owner [" + name+email+location+studioname+seats+phone+address+password+ "]";
	}

}
