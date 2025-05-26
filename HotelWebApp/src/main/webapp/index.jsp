<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Hotel Management</title>
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

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1 class="hero-title">Welcome to Luxury Hotel</h1>
            <p class="hero-subtitle">Experience unparalleled luxury in the heart of Mudbidre, Mangalore</p>
            <a href="reservationadd.jsp" class="btn btn-primary"><i class="fas fa-calendar-plus"></i> Book Now</a>
        </div>
    </section>

    <!-- Quick Actions Section -->
    <section class="container mt-4 mb-4">
        <div class="hotel-grid">
            <div class="card">
                <h3 class="card-title"><i class="fas fa-calendar-plus"></i> New Reservation</h3>
                <p>Book a new stay at our luxury hotel</p>
                <a href="reservationadd.jsp" class="btn btn-primary">Make Reservation</a>
            </div>
            <div class="card">
                <h3 class="card-title"><i class="fas fa-list"></i> View Bookings</h3>
                <p>Check your existing reservations</p>
                <a href="DisplayReservationsServlet" class="btn btn-primary">View Reservations</a>
            </div>
            <div class="card">
                <h3 class="card-title"><i class="fas fa-chart-bar"></i> Reports</h3>
                <p>Access detailed reports and analytics</p>
                <a href="report_form.jsp" class="btn btn-primary">View Reports</a>
            </div>
        </div>
    </section>

    <!-- Hotel Details Section -->
    <section class="hotel-details">
        <div class="container">
            <div class="hotel-grid">
                <div class="hotel-feature">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3>Location</h3>
                    <p>Mudbidre, Mangalore<br>Karnataka, India</p>
                </div>
                <div class="hotel-feature">
                    <i class="fas fa-concierge-bell"></i>
                    <h3>Luxury Amenities</h3>
                    <p>Premium rooms, Spa, Pool<br>Fine dining restaurants</p>
                </div>
                <div class="hotel-feature">
                    <i class="fas fa-star"></i>
                    <h3>5-Star Experience</h3>
                    <p>World-class service<br>Unmatched comfort</p>
                </div>
            </div>
        </div>
    </section>
</body>
</html>