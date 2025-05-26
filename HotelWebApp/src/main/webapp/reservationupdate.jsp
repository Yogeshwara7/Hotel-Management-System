<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Reservation - Luxury Hotel</title>
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
        <h2 class="text-center mb-4">Update Reservation</h2>

        <c:if test="${not empty error and not empty fn:trim(error)}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
        </c:if>
        <c:if test="${not empty message and not empty fn:trim(message)}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i> ${message}
            </div>
        </c:if>

        <div class="form-container">
            <form action="UpdateReservationServlet" method="post">
                <div class="form-group">
                    <label for="reservationId" class="form-label">Reservation ID:</label>
                    <input type="number" id="reservationId" name="reservationId" class="form-input" value="${param.id}" required readonly />
                </div>
                <div class="form-group">
                    <label for="customerName" class="form-label">Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" class="form-input" required />
                </div>
                <div class="form-group">
                    <label for="roomNumber" class="form-label">Room Number:</label>
                    <input type="text" id="roomNumber" name="roomNumber" class="form-input" required />
                </div>
                <div class="form-group">
                    <label for="checkIn" class="form-label">Check-In Date:</label>
                    <input type="date" id="checkIn" name="checkIn" class="form-input" required />
                </div>
                <div class="form-group">
                    <label for="checkOut" class="form-label">Check-Out Date:</label>
                    <input type="date" id="checkOut" name="checkOut" class="form-input" required />
                </div>
                <div class="form-group">
                    <label for="totalAmount" class="form-label">Total Amount:</label>
                    <input type="number" id="totalAmount" step="0.01" name="totalAmount" class="form-input" required />
                </div>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Update Reservation
                </button>
            </form>
        </div>

        <div class="text-center mt-4">
            <a href="DisplayReservationsServlet" class="btn btn-secondary">
                 <i class="fas fa-arrow-left"></i> Back to Reservations
            </a>
            <a href="index.jsp" class="btn btn-secondary">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>
