<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <h1>Add Reservation</h1>
    <form action="AddReservationServlet" method="post">
        <div>
            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" required />
        </div>
        <div>
            <label for="roomNumber">Room Number:</label>
            <input type="text" id="roomNumber" name="roomNumber" required />
        </div>
        <div>
            <label for="checkIn">Check-In Date:</label>
            <input type="date" id="checkIn" name="checkIn" required />
        </div>
        <div>
            <label for="checkOut">Check-Out Date:</label>
            <input type="date" id="checkOut" name="checkOut" required />
        </div>
        <div>
            <label for="totalAmount">Total Amount:</label>
            <input type="number" id="totalAmount" step="0.01" name="totalAmount" required />
        </div>
        <button type="submit">Add Reservation</button>
    </form>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <c:if test="${not empty message}">
        <p style="color:green">${message}</p>
    </c:if>

    <nav>
        <a href="index.jsp">Back to Home</a>
    </nav>
</body>
</html>
