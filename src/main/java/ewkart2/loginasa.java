package ewkart2;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
@WebServlet("/loginasa")
public class loginasa extends HttpServlet {
	 public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	   {
		   res.setContentType("text/html");
		   PrintWriter out=res.getWriter();
		   String str1=req.getParameter("loginasabtn");
		    if(str1.equals("user"))
		    {
		    	res.sendRedirect("ulogin.html");
		    }
		    if(str1.equals("vendor"))
		    {
		    	res.sendRedirect("vlogin.html");
		    }
		
		   
	   }

}
