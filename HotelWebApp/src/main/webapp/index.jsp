<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="background-container"></div>
    <div class="content-wrapper">
        <header class="header">
            <h1>Hotel Management System</h1>
        </header>
        <div class="container">
            <nav>
                <a href="reservationadd.jsp">Add Reservation</a>
                <a href="reservationupdate.jsp">Update Reservation</a>
                <a href="reservationdelete.jsp">Delete Reservation</a>
                <a href="DisplayReservationsServlet">View All Reservations</a>
                <a href="reports.jsp">Reports</a>
            </nav>
        </div>
    </div>
</body>
</html>