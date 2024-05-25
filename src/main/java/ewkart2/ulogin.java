package ewkart2;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
@WebServlet("/ulogin")
public class ulogin extends HttpServlet{
	 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	   {
		   res.setContentType("text/html");
		   PrintWriter out=res.getWriter();
		   String str1=req.getParameter("uname");
		   String str2=req.getParameter("upass");
		   Connection con;
		   Statement st;
		   ResultSet rs;
		   try {
			  Class.forName("org.postgresql.Driver");
			  con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2","postgres","amey050802");
			  st=con.createStatement();
			  rs=st.executeQuery("select * from user2 where uname='"+str1+"' and upass='"+str2+"'");
			  if(rs.next())
			  {
				 // out.println("welcome");
				HttpSession session=req.getSession();
				session.setAttribute("uname", str1);
				  res.sendRedirect("ewhome/index.html");
			  }
			  else
			  {
				  out.println("Wrong Info");
			  }
			   
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   
	   }
}
