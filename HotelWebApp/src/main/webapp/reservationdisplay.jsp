<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat, com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Display Reservations - Hotel Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="background-container"></div>
    <div class="content-wrapper">
        <header class="header">
            <h1>Hotel Management System</h1>
        </header>
        <div class="container">
            <h2>All Reservations</h2>

            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Room Number</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Total Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservationsList");
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                        if (reservations != null && !reservations.isEmpty()) {
                            for (Reservation r : reservations) {
                    %>
                    <tr>
                        <td><%= r.getReservationId() %></td>
                        <td><%= r.getCustomerName() %></td>
                        <td><%= r.getRoomNumber() %></td>
                        <td><%= sdf.format(r.getCheckIn()) %></td>
                        <td><%= sdf.format(r.getCheckOut()) %></td>
                        <td><%= r.getTotalAmount() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6">No reservations found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>

            <nav>
                <a href="index.jsp">Back to Home</a>
            </nav>
        </div>
    </div>
</body>
</html>
