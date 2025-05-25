<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation - Hotel Management System</title>
    <link rel="stylesheet" href="css/style.css">
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
                
                amountField.value = amount;
            }
        }
    </script>
</head>
<body>
    <div class="background-container"></div>
    <div class="content-wrapper">
        <header class="header">
            <h1>Hotel Management System</h1>
        </header>
        <div class="container">
            <h2>Add Reservation</h2>
            <form action="AddReservationServlet" method="post">
                <div class="form-group">
                    <label for="customerName">Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" required />
                </div>
                <div class="form-group">
                    <label for="roomNumber">Room Number:</label>
                    <input type="text" id="roomNumber" name="roomNumber" required onchange="calculateAmount()" />
                </div>
                <div class="form-group">
                    <label for="checkIn">Check-In Date:</label>
                    <input type="date" id="checkIn" name="checkIn" required />
                </div>
                <div class="form-group">
                    <label for="checkOut">Check-Out Date:</label>
                    <input type="date" id="checkOut" name="checkOut" required />
                </div>
                <div class="form-group">
                    <label for="totalAmount">Total Amount:</label>
                    <input type="number" id="totalAmount" step="0.01" name="totalAmount" required readonly />
                </div>
                <button type="submit">Add Reservation</button>
            </form>

            <c:if test="${not empty error and not empty fn:trim(error)}">
                <p class="action-message error">${error}</p>
            </c:if>
            <c:if test="${not empty message and not empty fn:trim(message)}">
                <p class="action-message success">${message}</p>
            </c:if>

            <nav>
                <a href="index.jsp">Back to Home</a>
            </nav>
        </div>
    </div>
</body>
</html>
