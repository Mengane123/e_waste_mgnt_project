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
@WebServlet("/shew")
public class shew extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
		String str1="Small HouseHold";
		int str2=Integer.parseInt(req.getParameter("sw"));
		HttpSession session1=req.getSession();
	String str3=(String)session1.getAttribute("uname");
		//String str3=req.getParameter("uname");
		//PrintWriter out=res.getWriter();
		try
		{
			Class.forName("org.postgresql.Driver");
			Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2","postgres","amey050802");
			PreparedStatement ps=con.prepareStatement("insert into ewaste2(ewc,eww,uname1) values(?,?,?)");
			ps.setString(1, str1);
			ps.setInt(2, str2);
			ps.setString(3, str3);
			int rs1=ps.executeUpdate();
			if(rs1==1)
			{
				//out.println("Updated");
				res.sendRedirect("maps.html");
			}
			else
			{
				//out.println("Not Updated");
				res.sendRedirect("shew.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
