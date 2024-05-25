<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Categories</title>
        <style>
               .nav h2{
                color: greenyellow;
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
                color:blue;
            }
            .row{
    margin-top: 5%;
    display: flex;
    justify-content: space-between;

    
}
.row p{
    color:#777;
    font-size: 18px;
    font-weight: 300;
    line-height: 22px;
    padding: 10px;
}
            .treatment{
    width:80%;
    margin:auto;
    text-align: center;
    padding-top:100px;
}
.treatment-col{
    flex-basis:31%;
    border-radius: 10px;
    margin-bottom: 5%;
    text-align: center;
    border:2px solid green;

}
.treatment-col img{
    width:75%;
    border-radius:10px;
}
.treatment-col p{
    padding:0;
}
.treatment-col h3{
    margin-top:16px;
    margin-bottom:15px;
    text-align:center;
}
.category-btn{
    width:80px;
                height:30px;
                border-radius:25px;
                border:2px solid green;
                color:green;
                background-color: white;
                margin-top:10px;
}
.category-btn:hover{
                color:black;
                background-color: green;
            }
        </style>
    </head>
    <body>
        <div class="nav">
            <h2><span class="head1">EW</span>Kart</h2>
            <ul class="nav-list">
                
                <li>Home</li>
                <li>Redeem</li>
                <li>About Us</li>
                <li>Contact Us</li>
            </ul>
          </div>
        <h1>Categories</h1>
        <section class="treatment">
            <h1>Select Your Category</h1>
            <div class="row">
           
                <div class="treatment-col">
                 <form action="shew.jsp">
                    <img src="shew.jfif">
                    <h3>Small Household</h3>
                    <p>Appliaences like toasters, coffee makers, irons, hairdryers etc.</p>
                    <input type="submit" class="category-btn" value="Donate">
                    </form>
                   
                </div>
                <div class="treatment-col">
                <form action="lhew.jsp">
                    <img src="lhew.jfif">
                    <h3>Large Household</h3>
                    <p>Appliaences like refrigerators/freezers, washing machines, dishwashers etc.</p>
                    <button name="blh" type="submit" class="category-btn">Donate</button> 
                    </form>
                   
                </div>
                <div class="treatment-col">
                 <form action="itew.jsp">
                    <img src="itew.jfif">
                    <h3>IT</h3>
                    <p>Appliaences like personal computers, telephones, mobile phones, laptops, printers, scanners, photocopiers etc.</p>
                    <button name="bict" type="submit" class="category-btn">Donate</button> 
                    </form>
                   
                </div>
            </div>
        </section>
    </body>
</html>