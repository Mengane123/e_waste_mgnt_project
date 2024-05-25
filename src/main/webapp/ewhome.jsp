<html>
    <head>
        <title>EWKart</title>
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
            .hero-btn1{
            margin-top:130px;
            margin-left:200px;
            margin-bottom:-107px;
            
            
            }
            .inforow{
                margin-top: 5px;
                display:flex;
                justify-content: space-between;
            }
            .info1{
                width:80%;
                margin:auto;
                padding-top:80px;
                padding-bottom:50px;
            }
            .infocol{
                flex-basis:48%;
                padding:30px 2px;
            }
            .infocol img{
              padding-left:100px;
            }
            .infocol h2{
                padding-top:35px;
                color:green;
                font-size:30px;
            }
            
              .info2{
                width:80%;
                margin:auto;
                padding-top:80px;
                padding-bottom:50px;
            }
            .infocol2{
                flex-basis:48%;
                padding:30px 2px;
            }
            .infocol2 img{
              padding-left:100px;
            }
            .infocol2 h2{
                padding-top:35px;
                color:green;
                font-size:30px;
            }
            .hero-btn1{
            width:320px;
            height:60px;
            background-color: white;
            border:2px solid green;
            border-radius:25px;


            }
            .hero-btn1:hover{
              background-color: green;
              color:black;
              transition: 1s;
            }
          
        </style>
    </head>
    <body>
    <script type="javascript">

</script>
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
      <% HttpSession session2=request.getSession();
      String str1=(String)session2.getAttribute("uname");
      %>
      <h1> Hello<%=str1 %></h1>
      <form action="ewcategory.jsp">
      <button type="submit" class="hero-btn1"  >Click Here To Donate Your E-Waste</button>
      </form>
      <section class="info1">
       <div class="inforow">
        <div class="infocol">
          <h2>Lorem</h2>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi quam perspiciatis architecto delectus beatae, nihil dicta placeat eos, aspernatur totam explicabo quas! Labore blanditiis facere quas possimus accusamus eligendi praesentium!</p>
        </div>
        <div class="infocol">
          <img src="ewaste2.jfif">
        </div>
       </div>
      </section>

   
       
       
         <section class="info2">
        <div class="inforow">
         
         <div class="infocol2">
           <img src="ewrecycle1.jfif">
         </div>
         <div class="infocol2">
           <h2>Benefits of Recycling</h2>
           <ul>
           <li>Reduces the amount of waste sent to landfills and incinerators</li><br>
           <li>Reduces air and water pollution which is caused by hazardous waste disposal</li><br>
           <li>Conserves resources by recovering metals and other useful materials</li><br>
           <li>Reduces the volume of greenhouse gas emissions</li><br>
           <li>Creates new jobs opportunities both for skilled and semi-skilled individuals</li><br>
           
           </ul>
           <!--  <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi quam perspiciatis architecto delectus beatae, nihil dicta placeat eos, aspernatur totam explicabo quas! Labore blanditiis facere quas possimus accusamus eligendi praesentium!</p>-->
         </div>
        </div>
       </section>
       
          <section class="info1">
        <div class="inforow">
         <div class="infocol">
           <h2>Lorem</h2>
           <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi quam perspiciatis architecto delectus beatae, nihil dicta placeat eos, aspernatur totam explicabo quas! Labore blanditiis facere quas possimus accusamus eligendi praesentium!</p>
         </div>
         <div class="infocol">
           <img src="growth.jfif">
         </div>
        </div>
       </section>
    </body>
</html>