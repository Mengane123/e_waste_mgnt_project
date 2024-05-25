<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>E-Waste Facility Locator Login</title>
    
   <style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
}

.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.login-form {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h2 {
    color: #333;
}

label {
    display: block;
    margin: 10px 0 5px;
    color: #555;
}

input {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    box-sizing: border-box;
}

button {
    background-color: #4caf50;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #45a049;
}

</style>
</head>
<body>
    <div class="login-container">
        <form class="login-form" action="itew" method="post">
            <h2> Waste Details</h2>
        
            <label for="username">Number of products:</label>
            <input type="text" id="username" name="snop" required>

            <label for="password">Approx. weight:</label>
            <input type="text" id="password" name="iw" required>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>