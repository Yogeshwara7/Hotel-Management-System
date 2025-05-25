<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Update Reservation</title></head>
<body>
<h2>Update Reservation</h2>
<form action="UpdateReservationServlet" method="post">
    Reservation ID: <input type="number" name="reservationId" required /><br/><br/>
    Customer Name: <input type="text" name="customerName" required /><br/><br/>
    Room Number: <input type="text" name="roomNumber" required /><br/><br/>
    Check-In Date: <input type="date" name="checkIn" required /><br/><br/>
    Check-Out Date: <input type="date" name="checkOut" required /><br/><br/>
    Total Amount: <input type="number" step="0.01" name="totalAmount" required /><br/><br/>
    <input type="submit" value="Update Reservation" />
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
