<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        <form class="login-form" action="ewinfo" method="post">
            <h2> E-Waste Information </h2>
            <label for="category">Category:</label>
            <input type="text" id="username" name="category" required>

            <label for="weight">Weight(approx.):</label>
            <input type="password" id="password" name="weight" required>

            <button type="submit">submit</button>
        </form>
    </div>
</body>
</html>