package ewkart2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/addcredit")
public class addcredit extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
    {
    	res.setContentType("text/html");
    	String uname=req.getParameter("cn");
    	int credits=Integer.parseInt(req.getParameter("cp"));
    	int wallet1 = 0;
    
    	
    	try {
    		Class.forName("org.postgresql.Driver");
    		Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2","postgres","amey050802");
    		Statement st1=con.createStatement();
    		ResultSet rs=st1.executeQuery("select wallet from user2 where uname='"+uname+"'");
    		if(rs.next())
    		{
    			wallet1=rs.getInt("wallet");
    			
    		}
    		wallet1=wallet1+credits;
    		
    		Statement st2=con.createStatement();
    		int rs2=st2.executeUpdate("update user2 set wallet=' "+wallet1+"' where uname='"+uname+"'");
    		if(rs2==1)
    		{
    			System.out.println("updated");
    			res.sendRedirect("vendorview.jsp");
    		}
    		else
    		{
    			System.out.println("Not Updated");
    		}
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }
}
