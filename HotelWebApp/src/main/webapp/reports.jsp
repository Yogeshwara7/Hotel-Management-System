<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Reports</title></head>
<body>
<h2>Reports</h2>

<form action="ReportServlet" method="post">
    <h3>Reservations by Date Range</h3>
    Start Date: <input type="date" name="startDate" required />
    End Date: <input type="date" name="endDate" required />
    <input type="hidden" name="reportType" value="dateRange" />
    <input type="submit" value="Generate" />
</form>

<hr/>

<form action="ReportServlet" method="post">
    <h3>Most Booked Rooms</h3>
    <input type="hidden" name="reportType" value="mostBookedRooms" />
    <input type="submit" value="Generate" />
</form>

<hr/>

<form action="ReportServlet" method="post">
    <h3>Total Revenue by Date Range</h3>
    Start Date: <input type="date" name="startDate" required />
    End Date: <input type="date" name="endDate" required />
    <input type="hidden" name="reportType" value="revenue" />
    <input type="submit" value="Generate" />
</form>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<br/><a href="index.jsp">Back to Home</a>
</body>
</html>
