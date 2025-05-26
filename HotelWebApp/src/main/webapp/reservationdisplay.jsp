<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat, com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Reservations - Luxury Hotel</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <!-- Modern Navigation -->
    <nav class="navbar">
        <div class="nav-container">
            <a href="index.jsp" class="nav-brand">Luxury Hotel</a>
            <ul class="nav-menu">
                <li><a href="reservationadd.jsp" class="nav-link"><i class="fas fa-plus"></i> Add Reservation</a></li>
                <li><a href="DisplayReservationsServlet" class="nav-link"><i class="fas fa-list"></i> View Reservations</a></li>
                <li><a href="report_form.jsp" class="nav-link"><i class="fas fa-chart-bar"></i> Reports</a></li>
            </ul>
        </div>
    </nav>

    <div class="container" style="margin-top: 6rem;">
        <h2 class="text-center mb-4">All Reservations</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
        </c:if>

        <div class="table-container">
            <table class="modern-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Customer Name</th>
                        <th>Room Number</th>
                        <th>Check-In</th>
                        <th>Check-Out</th>
                        <th>Total Amount</th>
                        <th>Actions</th>
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
                        <td>₹<%= r.getTotalAmount() %></td>
                        <td>
                            <a href="reservationupdate.jsp?id=<%= r.getReservationId() %>" class="action-btn edit-btn">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="reservationdelete.jsp?id=<%= r.getReservationId() %>" class="action-btn delete-btn">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-center">No reservations found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>
