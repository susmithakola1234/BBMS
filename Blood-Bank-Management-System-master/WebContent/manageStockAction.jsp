<%@include file="header.html"%>
<%@page import="com.java.Project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String bloodgroup=request.getParameter("bloodgroup");
String incdec=request.getParameter("incdec");
String units=request.getParameter("units");
int units1=Integer.parseInt(units);
try{
	Connection con=ConnectionProvider.getConnection();
	Statement st=con.createStatement();
	if(incdec.equals("inc"))
		st.executeUpdate("update stock set units=units +'"+units1+"' where bloodgroup='"+bloodgroup+"'");
	else
		st.executeUpdate("update stock set units=units -'"+units1+"' where bloodgroup='"+bloodgroup+"'");
	response.sendRedirect("manageStock.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("manageStock.jsp?msg=invalid");
}
%>