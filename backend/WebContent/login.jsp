<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%@ page import = "javax.servlet.*"%>
<%@ page import = "javax.servlet.http.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body text="green" bgcolor="orange">
<%
String username = request.getParameter("username");
String passwor = request.getParameter("pass");
String query= "select * from smssignup";
int x=0;
int f=0;
int v=0;
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
    Statement st=con.createStatement();
  ResultSet rs=st.executeQuery(query);
  while(rs.next()){
       if(username.equals(rs.getString(5)) && passwor.equals(rs.getString(3)))
       {
        f=1;
        break;
       }
       else if(username.equals(rs.getString(5)) && !passwor.equals(rs.getString(3)))
       {
          v=1;
          break;
     }
  }
  if(f==1)
  { 
    PreparedStatement ps=con.prepareStatement("insert into smslogin values(?,?)");
      ps.setString(1,username);
      ps.setString(2,passwor);
      x = ps.executeUpdate();
      if(x > 0){
            System.out.println("succesfully");
            session.setAttribute("username",username);  
            response.sendRedirect("logoutHome.html");
      }
    }
  
  else if(v==1)
  { %>
   <i>Invalid Password!!!!</i><br>
     <a href="login.html" style="margin-right:0px; font-size:13px;font-family:Tahoma,Geneva,sans-serif;">click here to login again</a><br> 
     <a href="reset.html" style="margin-right:0px; font-size:13px;font-family:Tahoma,Geneva,sans-serif;">click here to reset password</a> 
  <% 
  }else
  {%>
    <i>Not a valid user!!!!</i><br>
      <a href="signup.html" style="margin-right:0px; font-size:13px;font-family:Tahoma,Geneva,sans-serif;">click here to signup</a> 
  <%}
  

}catch(Exception e){
  System.out.println("error");
     out.print(e);


}
%>



</body>
</html>