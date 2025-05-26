<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results - Luxury Hotel</title>
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
        <h2 class="text-center mb-4">Report Results</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
        </c:if>

        <!-- Date Range Reservations Report -->
        <c:if test="${not empty reservations}">
            <div class="card mb-4">
                <h3 class="card-title">
                    <i class="fas fa-calendar-check"></i> Reservations Report
                    <c:if test="${not empty startDate}">
                        <small class="text-muted">(${startDate} to ${endDate})</small>
                    </c:if>
                </h3>
                <div class="table-responsive">
                    <table class="modern-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Guest Name</th>
                                <th>Room Number</th>
                                <th>Check-in</th>
                                <th>Check-out</th>
                                <th>Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${reservations}" var="reservation">
                                <tr>
                                    <td>${reservation.reservationId}</td>
                                    <td>${reservation.customerName}</td>
                                    <td>${reservation.roomNumber}</td>
                                    <td><fmt:formatDate value="${reservation.checkIn}" pattern="yyyy-MM-dd"/></td>
                                    <td><fmt:formatDate value="${reservation.checkOut}" pattern="yyyy-MM-dd"/></td>
                                    <td>₹${reservation.totalAmount}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>

        <!-- Most Booked Rooms Report -->
        <c:if test="${not empty roomBookings}">
            <div class="card mb-4">
                <h3 class="card-title"><i class="fas fa-bed"></i> Most Booked Rooms</h3>
                <div class="table-responsive">
                    <table class="modern-table">
                        <thead>
                            <tr>
                                <th>Room Number</th>
                                <th>Number of Bookings</th>
                                <th>Total Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${roomBookings}" var="booking">
                                <tr>
                                    <td>${booking.roomNumber}</td>
                                    <td>${booking.bookingCount}</td>
                                    <td>₹${booking.totalRevenue}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>

        <!-- Revenue Report -->
        <c:if test="${not empty revenueData}">
            <div class="card mb-4">
                <h3 class="card-title">
                    <i class="fas fa-money-bill-wave"></i> Revenue Analysis
                    <c:if test="${not empty startDate}">
                        <small class="text-muted">(${startDate} to ${endDate})</small>
                    </c:if>
                </h3>
                <div class="table-responsive">
                    <table class="modern-table">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Number of Bookings</th>
                                <th>Total Revenue</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${revenueData}" var="revenue">
                                <tr>
                                    <td>${revenue.date}</td>
                                    <td>${revenue.bookingCount}</td>
                                    <td>₹${revenue.totalRevenue}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:if>

        <div class="text-center mt-4">
            <a href="report_form.jsp" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i> Back to Reports
            </a>
            <a href="index.jsp" class="btn btn-primary">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>
