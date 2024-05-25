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
 @WebServlet("/vregister")
public class vregister  extends HttpServlet{
	 public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
		{
			res.setContentType("text/html");
			PrintWriter out=res.getWriter();
			String str1=req.getParameter("vname");
			String str2=req.getParameter("vpass");
			String str3=req.getParameter("vphone");
			String str4=req.getParameter("vcity");
			String str5=req.getParameter("vstate");
			
			try {
				Class.forName("org.postgresql.Driver");
				Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2","postgres","amey050802");
				PreparedStatement ps=con.prepareStatement("insert into vendor(vname,vphone,vcity,vstate,vpass) values(?,?,?,?,?)");
			     ps.setString(1, str1);
			     ps.setString(2, str3);
			     ps.setString(3, str4);
			     ps.setString(4, str5);
			     ps.setString(5, str2);
			     
				int i=ps.executeUpdate();
				if(i>0)
				{
					out.println("updated");
					//res.sendRedirect("ewhome.html");
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		}
}
