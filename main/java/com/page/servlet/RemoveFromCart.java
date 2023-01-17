package com.page.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.page.model.Cart;

public class RemoveFromCart extends HttpServlet
{
	private static final long serialVersionUID = 1L;    

    public RemoveFromCart()
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter())
		{
			String bookId = request.getParameter("id");
			
			if (bookId != null)
			{
				ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
				
				if (cart_list != null)
				{
					for (Cart c : cart_list)
					{
						if (c.getId() == Integer.parseInt(bookId))
						{
							cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
				
				response.sendRedirect("user-cart.jsp");

			}
			
			else
			{
				response.sendRedirect("user-cart.jsp");
			}

		}
	}

}
