<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>On Security of an Identity-Based Dynamic Data Auditing Protocol for Big Data Storage</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>-->
<script>
	function validate() {

	}
</script>
<style>
td {
	align: center;
	text-align: center;
}

table {
	position: absolute;
	left: 100px;
	top: 150px;
}

table, td, tr {
	border-color: burlywood;
	border-style: solid;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div class="main">
		<div class="header">
			<div class="header_resize">
				<div class="logo">
					<h1>
						<a href="index.html">On Security of an Identity-Based Dynamic Data Auditing Protocol for Big Data Storage</a>
					</h1>
				</div>
				<div class="menu_nav">
					<ul>
						<li><a href="users.jsp">Users</a></li>
						<li><a href="#">AA</a></li>
						<li><a href="index.html">Logout</a></li>
					</ul>
				</div>
				<div class="clr"></div>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/identitybasedremotedata", "root",
							"root");

					Statement st = con.createStatement();
					ResultSet rt = st.executeQuery("select * from aa ");
				%>

				<div class="htext">
					<H2>ATTRIBUTE AUTHORITIES</H2>
					<table style="border-style: solid; border-collapse: collapse;">
						<tr style="background-color: burlywood">
							<td align="center">USERID</td>
							<td>PASSWORD</td>
							<td>MAILID</td>
							<td>PHONENO</td>
							<td>STATUS</td>
							<td>ACTIVATE</td>
						</tr>
						<%
							while (rt.next()) {
								String uname = rt.getString("username");
								String mail = rt.getString("mailid");
								String phoneno = rt.getString("phoneno");
								String status = rt.getString("status");
								String id = rt.getString("idaa");
						%>
						<tr>
							<td><%=uname%></td>
							<td align="center">****</td>
							<td><%=mail%></td>
							<td><%=phoneno%></td>
							<td><%=status%></td>
							<td><a href="activate_aa.jsp?<%=id%>">Activate</a></td>
						</tr>
						<%
							}
							con.close();
						%>
					</table>

				</div>
				<div class="clr"></div>
			</div>
		</div>
		<div class="content">
			<div class="content_resize">
					<div class="sidebar">
					<div class="gadget">

						<div class="clr"></div>

					</div>

				</div>
				<div class="clr"></div>
			</div>
		</div>
		<div class="fbg">
			<div class="fbg_resize">
				<div class="clr"></div>
			</div>
		</div>
		<div class="footer"></div>
	</div>
</body>
</html>
