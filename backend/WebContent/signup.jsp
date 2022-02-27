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
String firstname = request.getParameter("fname");
String lastname = request.getParameter("lname");
String password = request.getParameter("pass");
String confirmpass = request.getParameter("cpass");
String email = request.getParameter("mail");
String query= "select * from smssignup";
int x=0;
int f=0;
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","manager");
    Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(query);
	while(rs.next()){
	     if(email.equals(rs.getString(5)))
	     {
	    	f=1;
	    	break;
	     }
	}
	
	if(f==1)
	{
		System.out.println("not");
%>
<i>user exists with this email!!!!</i>
<a href="login.html" style="margin-right:0px; font-size:13px;font-family:Tahoma,Geneva,sans-serif;">Login</a> 
<% 
     }
	else{
		PreparedStatement ps=con.prepareStatement("insert into smssignup values(?,?,?,?,?)");
	    ps.setString(1,firstname);
	    ps.setString(2,lastname);
	    ps.setString(3,password);
	    ps.setString(4,confirmpass);
	    ps.setString(5,email);
	    x = ps.executeUpdate();
	}
	
    if(x > 0){
          System.out.println("succesfully");
      %>
 
     <i>signed up successfully!!!!</i>
     <a href="login.html" style="margin-right:0px; font-size:13px;font-family:Tahoma,Geneva,sans-serif;">Login to access services</a> 
  
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