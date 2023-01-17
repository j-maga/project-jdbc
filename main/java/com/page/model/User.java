package com.page.model;

public class User
{
	private int id;
	private String name;
	private String email;
	private String date;
	private String phone;
	private String address;
	private String pass;

	public User()
	{
	
	}

	public User(String name, String email, String date, String phone, String address, String pass)
	{
		this.name = name;
		this.email = email;
		this.date = date;
		this.phone = phone;
		this.address = address;
		this.pass = pass;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getDate()
	{
		return date;
	}

	public void setDate(String date)
	{
		this.date = date;
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
	
	public String getPassword()
	{
		return pass;
	}

	public void setPassword(String pass)
	{
		this.pass = pass;
	}

	@Override
	public String toString()
	{
		return "User [" +name+email+date+phone+address+pass+ "]";
	}

}
