<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ZNNHS Online Voting</title>
<link rel="shortcut icon" type="image/png" href="images/logo.png"/>
<style>
body {font-family: Arial, Helvetica, sans-serif;}


/* Add padding to containers */
.container {
  padding: 40px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 85%;
  padding: 12px;
  margin: 4px 0 20px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 3px solid #f1f1f1;
  margin-bottom: 20px;
}


.login100-more {
  width: calc(95% - 560px);
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
  position: relative;
  z-index: 1;
}

.container-login100 {
  width: 100%;  
  min-height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  background: #ffffff;
}


.limiter {
  width: 100%;
  margin: 0 auto;
}

/* Set a style for the submit button */
.btn {
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 20px;
  width: 85%;
  height: 40px;
  border-radius: 10px;
  background: #339966;

  font-family: Montserrat-Bold;
  font-size: 12px;
  color: #fff;
  line-height: 1.2;
  text-transform: uppercase;
  letter-spacing: 1px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}


.wrap-login100 {
  width: 100%;
  background: #fff;
  overflow: hidden;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  align-items: stretch;
  flex-direction: row-reverse;

}

.btn:hover {
  background: #26734d;
}

/* Add a blue text color to links */
a {
  color: #339966;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  text-align: center;
}


ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  border-radius: 20px;
  background-color: #ddd;
  margin-left: 20px;
  margin-right: 20px;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: #26734d;
}

.active {
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 30px;
  width: 60%;
  height: 60px;
  
  background: #339966;

  font-family: Montserrat-Bold;
  font-size: 12px;
  color: #fff;
  line-height: 1.2;
  text-transform: uppercase;
  letter-spacing: 1px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.active:hover {
  background: #267734d;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}


.containerr {
  position: relative;
  width: 100%;
  height: auto;
}
.header{
      padding: 30px;
  	  text-align: center;
  	  background: #1abc9c;
}
.reslts{
	font-size: 20px;
}
.logo{
height: 60px;
width: 100px;
margin-left: 50px;
}
.school{
height: 60px; 
width: 60px;
margin-left: 30px;
}



</style>
</head>
<body >
    
    <%
        String s1 = (String) session.getAttribute("adminname");
        

String a[] = new String[100];
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/evoting", "root", "kitchennightmares");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery("select vote from voter");


int candidate1 = 0;
int candidate2 = 0;
int candidate3 = 0;
int candidate4 = 0;
int candidate5 = 0;

while(rs.next()){
    if(rs.getString("vote").equals("Candidate 1")){
    	candidate1++;
    }else if(rs.getString("vote").equals("Candidate 2")){
    	candidate2++;
    }else if(rs.getString("vote").equals("Candidate 3")){
    	candidate3++;
    }else if(rs.getString("vote").equals("Candidate 4")){
    	candidate4++;
    }else if(rs.getString("vote").equals("Candidate 5")){
    	candidate5++;
    }

}

%>    
    
<div class="header"> 
<ul>
  <li><a class="active" href="index.html">Home</a></li>
  <li><img class="logo" src="images/logo.png"></li>
  <li><img class="school" src="images/schooled.png"></li>
  <li style="float:right"><a href="admin.html">Admin</a></li>
  <li style="float:right"><a href="about.html">About</a></li>
  <li style="float:right"><a href="contact.html">Contact us</a></li>
</ul>
</div>
<div class="limiter">
<div class="container-login100">
  <div class="wrap-login100">
    <form action="" method="post" style="max-width:1000px;margin:auto">
      <center>
        <div class="container">
          <h1>Result</h1>
          <hr>
          <div>
            <div class="reg" style="padding-top: 35px;">
              <pre> 
               <center>  <p class="reslts"> <strong >Candidate 1:</strong> <%=candidate1%> | <strong>Candidate 2:</strong> <%=candidate2%> |<strong> Candidate 3:</strong> <%=candidate3%> | <strong>Candidate 4: </strong> <%=candidate4%> | <strong>Candidate 5:</strong> <%=candidate5%> |</p> </center>                                                                                        
              </pre>
            </div>
            <hr>
          </div>
          <div class="container signin">
          </div>
      </center>
    </form>
    </div>
    <div class="containerr">
      <img src="images/phil.png"  width="1320" height="170" >
    </div>
  </div>
</div>
</body>
</html>
