<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>Student Forum</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" type="text/css" rel="stylesheet" />
<link rel="shortcut icon" href="img/favicon.ico">

</head>

<body background="c2.jpg">
    
    

<div id="page_wrapper">
  <div id="header_wrapper">
    <div id="header" style="" >
      <h1>Stu<font color="#FFDF8C">Connect</font></h1><br>
      <h2><div style="color:white">A complete web forum for <font color="#FFDF8C">students</font></h2>
    </div>
  </div>
  </div>
    <div>
        <h1 align="left"><font color="#00008B">Please Sign in to Continue</font></h1>
      <form method="post" action="loginupdate.jsp">
          <table border="0" width="20" cellspacing="20" cellpadding="20">
              <tbody>
                  <tr>
                      <td><font color="#00008B"><b>Username</b></font></td>
                      <td><input type="text" name="t1" value="" /></td>
                  </tr>
                  <tr>
                      <td><font color="#00008B"><b>Password</b></font></td>
                      <td><input type="password" name="t2" value="" /></td>
                  </tr>
                  <tr>
                      <td><input type="submit" value="Login" /></td>
                      <td><input type="Reset" value="Clear" /></td>
                  </tr>
              </tbody>
          </table>
     </form>
     <form method="GET" action="register.jsp">

         <h3 align="left"><a href="register.jsp"><font color="#00008B"><b>Not a Member Click Here</b></font></a></h3>
     </form>
     </div>
    
</body>
</html>