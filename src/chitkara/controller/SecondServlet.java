package chitkara.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SecondServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		doPost(request,response);
	}
   protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
   {
	   try {
		   String name=request.getParameter("username");
		   PrintWriter out=response.getWriter();
		   out.println("this is second servlet "+name);
	   }
	   catch(Exception e)
	   {
		   e.printStackTrace();
	   }
   }
}