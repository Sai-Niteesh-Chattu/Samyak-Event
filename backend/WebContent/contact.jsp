<%@ page import = "java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String first = request.getParameter("fname");
String lastname = request.getParameter("lname");
String email = request.getParameter("mail");
String mobile = request.getParameter("mobile");
String msg = request.getParameter("message");

try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
    PreparedStatement ps=con.prepareStatement("insert into smscontactus values(?,?,?,?,?)");
    ps.setString(1,first);
    ps.setString(2,lastname);
    ps.setString(3,email);
    ps.setString(4,mobile);
    ps.setString(5,msg);
    int x = ps.executeUpdate();
    if(x > 0){
          System.out.println("succesfully Stored");
  %>
     <i>Your query was sent successfully!!!!</i>
      <a href="Home.html" style="margin-right:0px; font-size:13px;font-family:Tahoma,Geneva,sans-serif;">Click here to go to Home page</a> 
          <%
      
    }else{
         System.out.println("failed");
}
}catch(Exception e){
     out.print(e);


}
%>

</body>
</html>