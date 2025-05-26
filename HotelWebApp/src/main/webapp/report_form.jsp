<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Luxury Hotel</title>
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
        <h2 class="text-center mb-4">Hotel Reports & Analytics</h2>

        <c:if test="${not empty error}">
            <div class="alert alert-error">
                <i class="fas fa-exclamation-circle"></i> ${error}
            </div>
        </c:if>

        <div class="hotel-grid">
            <!-- Date Range Report -->
            <div class="card">
                <h3 class="card-title"><i class="fas fa-calendar-alt"></i> Reservations by Date Range</h3>
                <form action="ReportServlet" method="post" class="form-container">
                    <div class="form-group">
                        <label for="startDate1" class="form-label">Start Date:</label>
                        <input type="date" id="startDate1" name="startDate" class="form-input" required />
                    </div>
                    <div class="form-group">
                        <label for="endDate1" class="form-label">End Date:</label>
                        <input type="date" id="endDate1" name="endDate" class="form-input" required />
                    </div>
                    <input type="hidden" name="reportType" value="dateRange" />
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i> Generate Report
                    </button>
                </form>
            </div>

            <!-- Most Booked Rooms Report -->
            <div class="card">
                <h3 class="card-title"><i class="fas fa-bed"></i> Most Booked Rooms</h3>
                <form action="ReportServlet" method="post" class="form-container">
                    <input type="hidden" name="reportType" value="mostBookedRooms" />
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-chart-pie"></i> View Popular Rooms
                    </button>
                </form>
            </div>

            <!-- Revenue Report -->
            <div class="card">
                <h3 class="card-title"><i class="fas fa-money-bill-wave"></i> Revenue Analysis</h3>
                <form action="ReportServlet" method="post" class="form-container">
                    <div class="form-group">
                        <label for="startDate2" class="form-label">Start Date:</label>
                        <input type="date" id="startDate2" name="startDate" class="form-input" required />
                    </div>
                    <div class="form-group">
                        <label for="endDate2" class="form-label">End Date:</label>
                        <input type="date" id="endDate2" name="endDate" class="form-input" required />
                    </div>
                    <input type="hidden" name="reportType" value="revenue" />
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-calculator"></i> Calculate Revenue
                    </button>
                </form>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>
</body>
</html>
