<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Delete Reservation</title></head>
<body>
<h2>Delete Reservation</h2>
<form action="DeleteReservationServlet" method="post">
    Reservation ID: <input type="number" name="reservationId" required /><br/><br/>
    <input type="submit" value="Delete Reservation" />
</form>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>
<c:if test="${not empty message}">
    <p style="color:green">${message}</p>
</c:if>

<a href="index.jsp">Back to Home</a>
</body>
</html>
