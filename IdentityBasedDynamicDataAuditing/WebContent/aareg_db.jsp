<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>

<%
	String uname = request.getParameter("uname");
	String mailid = request.getParameter("mail");
	String pass = request.getParameter("password");
	String ph = request.getParameter("phoneno");

	try {

		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
				"root");

		Statement st = con.createStatement();
		
		int i = st
				.executeUpdate("INSERT INTO aa (username,password,mailid,phoneno,status) VALUES('"
						+ uname
						+ "','"
						+ pass
						+ "','"
						+ mailid
						+ "','"
						+ ph + "','yes')");
		con.close();
		
		if (i != 0) {
			response.sendRedirect("aa.jsp?msg=registered sucess..!");
		}

	} catch (Exception e) {
		out.println(e.getMessage());
	}
%>