<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation - Luxury Hotel</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script>
        function calculateAmount() {
            const roomNumber = document.getElementById('roomNumber').value;
            const amountField = document.getElementById('totalAmount');
            
            if (roomNumber) {
                const roomNum = parseInt(roomNumber);
                let amount = 0;
                
                if (roomNum >= 100 && roomNum <= 199) {
                    amount = 1000;
                } else if (roomNum >= 200 && roomNum <= 299) {
                    amount = 1500;
                } else if (roomNum >= 300 && roomNum <= 399) {
                    amount = 2200;
                }
                
                amountField.value = amount.toFixed(2); // Format to 2 decimal places
            }
        }
    </script>
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
        <h2 class="text-center mb-4">Add New Reservation</h2>

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
            <form action="AddReservationServlet" method="post">
                <div class="form-group">
                    <label for="customerName" class="form-label">Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" class="form-input" required />
                </div>
                <div class="form-group">
                    <label for="roomNumber" class="form-label">Room Number:</label>
                    <input type="text" id="roomNumber" name="roomNumber" class="form-input" required onchange="calculateAmount()" />
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
                    <input type="number" id="totalAmount" step="0.01" name="totalAmount" class="form-input" required readonly />
                </div>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-calendar-plus"></i> Add Reservation
                </button>
            </form>
        </div>

        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>
