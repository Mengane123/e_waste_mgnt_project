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
@WebServlet("/vlogin")
public class vlogin extends HttpServlet {
	 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	   {
		   res.setContentType("text/html");
		   PrintWriter out=res.getWriter();
		   String str1=req.getParameter("vname");
		   String str2=req.getParameter("vpass");
		   Connection con;
		   Statement st;
		   ResultSet rs;
		   try {
			  Class.forName("org.postgresql.Driver");
			  con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2","postgres","amey050802");
			  st=con.createStatement();
			  rs=st.executeQuery("select * from vendor where vname='"+str1+"' and vpass='"+str2+"'");
			  if(rs.next())
			  {
				   
				 HttpSession session=req.getSession();
				  session.setAttribute("vname", str1);
				  //req.setAttribute("vname","Amey");
				 res.sendRedirect("vendorview.jsp");
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
