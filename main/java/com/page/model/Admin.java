package com.page.model;

public class Admin
{	
	private int id;
	private String name;
	private String email;
	private String pass;

	public Admin()
	{
	
	}

	public Admin(int id, String name, String email, String pass) {
		this.id = id;
		this.name = name;
		this.email = email;
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
		return "Admin [id=" + id + ", name=" + name + ", email=" + email + ", password=" + pass + "]";
	}

}
