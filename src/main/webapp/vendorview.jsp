<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
    .nav h2{
                color: green;
                font-size: 40px;
            }
            .head1{
                color:blue;
            }
            .nav-list{
                
                display:flex;
                
                margin-top: -81px;
                margin-left:550px;
                font-size: 20px;

            }
            .nav-list ul{
                margin-left:400px;
                
            }
            .nav-list li{
                display:inline-block;
                margin-left:80px;
                margin-top:20px;
            }
            .nav-list li:hover{
                color:green;
            }
            .marquee1{
                font-size:18px;
                display:flex;
                justify-content: flex-start;
                color:green;
            }
            
             table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        form {
            width: 50%;
            margin: 20px auto;
        }

        input {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
 </style>    
</head>
<body>
   <div class="nav">
        <h2><span class="head1">EW</span>Kart</h2>
        <ul class="nav-list">
            
            <li>Home</li>
            <li>Updates</li>
            <li>Rewards</li>
            <li>About Us</li>
        </ul>
      </div>
      <marquee  >
        <div class="marquee1">
        <p >25  people  earns credit points in your area&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;20 people reedemed their credit points&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;25  people  earns credit points in your area&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;20 people reedemed their credit points</p>
        <p ></p>
        </div>
      </marquee>
      <%//String str1=(String)request.getAttribute("vname");
      HttpSession session1=request.getSession();
      String str1=(String)session1.getAttribute("vname");
      %>
      <h1>Hello <%=str1 %></h1>
<table border="1">
<tr>

<th>username</th>
<th>phone No.</th>
<th>city</th>
<th>state</th>
 <th>Waste Category</th>
<th>Waste weight(approx.)</th>
<th>Credits</th>
</tr>
<% 
//out.println("hello");
   Connection con;
   Statement st;
   ResultSet rs;
   //out.println("kas kay");
   try{
	  // out.println("brr aahe ky");
   Class.forName("org.postgresql.Driver");
   //out.println("Jevla ky");
   con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2","postgres","amey050802");
   st=con.createStatement();
   rs=st.executeQuery("SELECT user2.uname, user2.uphone, user2.ucity, user2.ustate, user2.wallet, ewaste2.ewc, ewaste2.eww FROM user2 INNER JOIN ewaste2 ON user2.uname = ewaste2.uname1;");
  // out.println("hello");
   while(rs.next())
   {
  // out.println("kiti divas rahnar");%>
	   
	<tr>
	
	<td><%=rs.getString("uname")%></td>
	<td><%=rs.getString("uphone") %></td>
	  <td><%out.println(rs.getString("ucity")); %></td> 
	<td><%out.println(rs.getString("ustate")); %> </td>
	 <td><%=rs.getString("ewc") %></td>
	<td><%=rs.getInt("eww") %></td>
	<td><%=rs.getInt("wallet") %>
	
	<%
	
	%>
	
	</tr> 
	<%}
   }catch(Exception e){
   e.printStackTrace();
   }
   
   %>   

   
   
 </table>  
 
 <form action="addcredit" method="post">
 Username:<input type="text" name="cn"><br>
 Add Credit Points:<input type="number" name="cp"><br>
 <input type="submit" value="Add Credits">
 </form>
   

</body>
</html>