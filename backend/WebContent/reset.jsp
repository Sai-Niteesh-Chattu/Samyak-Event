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
String oldpassword = request.getParameter("opwd");
String newpassword = request.getParameter("npwd");
String confirmpassword = request.getParameter("cnpwd");


try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
    PreparedStatement ps=con.prepareStatement("insert into smsreset values(?,?,?)");
    ps.setString(1,oldpassword);
    ps.setString(2,newpassword);
    ps.setString(3,confirmpassword);
    int x = ps.executeUpdate();
    if(x > 0){
          System.out.println("succesfully Stored");
  %>
     <i>Your query was sent successfully!!!!</i>
      <a href="login.html" style="margin-right:0px; font-size:13px;font-family:Tahoma,Geneva,sans-serif;">Password changed successfully click here to login now!!!</a> 
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