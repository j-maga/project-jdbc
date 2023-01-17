package com.page.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.page.connection.DbCon;
import com.page.dao.ReviewDao;
import com.page.model.Review;

public class AddReview extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       

    public AddReview()
    {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String user = request.getParameter("uid");
		String feedback = request.getParameter("review");
		String studio = request.getParameter("studio");
		
		try
		{
			Review review = new Review(user, feedback, studio);
			ReviewDao reviewDao = new ReviewDao(DbCon.getConnection());
			HttpSession session = request.getSession();
			
			if (reviewDao.insertReview(review))
			{
				response.sendRedirect("user-review.jsp");
				session.setAttribute("succMsg", "Review Added Sucessfully..");
			}
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}