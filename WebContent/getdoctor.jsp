<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*"%>
<%!int i;%>
<%@ page import="dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	Doctor Name:-
	<select>
		<%
			String dep = request.getParameter("dep");
			String txtdate = request.getParameter("txtdate");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = format.parse(txtdate);
			Calendar c = Calendar.getInstance();
			c.setTime(parsed);
			int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
			String dayname=new DateFormatSymbols().getWeekdays()[dayOfWeek];
			System.out.println("Day name is "+dayname);
			System.out.println("Dpartment is "+dep);
			MyConnection con = new MyConnection();
			Statement statement = con.OpenConnection();
			ResultSet resultSet = statement
					.executeQuery("select DoctorID,DName from doctor where Department='"+dep+"' and AvailableDays like '%"+dayname+"%'");
			
			while (resultSet.next()) {
		%>
		<option value="<%=resultSet.getString(1)%>"><%=resultSet.getString(2)%></option>
		<%
			System.out.println(resultSet.getString(1));
			}
		%>
	</select>
</body>
</html>