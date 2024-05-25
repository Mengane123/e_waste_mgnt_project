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
@WebServlet("/ewinfo")
public class ewinfo extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	   {
		   res.setContentType("text/html");
		   PrintWriter out=res.getWriter();
		   String str1=req.getParameter("category");
		   int str2=Integer.parseInt(req.getParameter("weight"));
		   Connection con;
		   PreparedStatement ps;
		   
		   try {
			  Class.forName("org.postgresql.Driver");
			  con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2","postgres","amey050802");
			 ps=con.prepareStatement("insert into ewaste1(ewc,eww) values(?,?)");
			 ps.setString(1, str1);
			 ps.setInt(2, str2);
			 int rs=ps.executeUpdate();
			 if(rs==1)
			 {
				 out.println("updated");
			 }
			 else {
				 out.println("not update");
			 }
			 
			   
		   }
		   catch(Exception e)
		   {
			   e.printStackTrace();
		   }
		   
	   }

}
