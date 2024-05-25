<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EWKart</title>
    <style>
        .nav {
            background-color: #4CAF50;
            padding: 15px;
            text-align: center;
            color: white;
        }

        .nav h2 {
            margin: 0;
            font-size: 36px;
        }

        .nav-list {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .nav-list li {
            list-style: none;
            margin: 0 20px;
            font-size: 18px;
            color: white;
        }

        .marquee1 {
            font-size: 18px;
            color: green;
            margin: 20px 0;
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
        <h2>EWKart</h2>
        <ul class="nav-list">
            <li>Home</li>
            <li>Updates</li>
            <li>Rewards</li>
            <li>About Us</li>
        </ul>
    </div>

    <marquee class="marquee1">
        <p>25 people earned credit points in your area. 20 people redeemed their credit points.</p>
    </marquee>

    <table border="1">
        <tr>
            <th>Username</th>
            <th>Phone No.</th>
            <th>City</th>
            <th>State</th>
            <th>Credits</th>
        </tr>
        <% 
        Connection con;
        Statement st;
        ResultSet rs;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/ewkart2", "postgres", "amey050802");
            st = con.createStatement();
            rs = st.executeQuery("SELECT uname, uphone, ucity, ustate, wallet FROM user1;");
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("uname")%></td>
            <td><%=rs.getString("uphone") %></td>
            <td><%=rs.getString("ucity") %></td>
            <td><%=rs.getString("ustate") %></td>
            <td><%=rs.getInt("wallet") %></td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>   
    </table>

    <form action="addcredit" method="post">
        <label for="cn">Username:</label>
        <input type="text" name="cn" required>
        <br>
        <label for="cp">Add Credit Points:</label>
        <input type="number" name="cp" required>
        <br>
        <input type="submit" value="Add Credits">
    </form>
</body>
</html>
