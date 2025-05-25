<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Reservation - Hotel Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="background-container"></div>
    <div class="content-wrapper">
        <header class="header">
            <h1>Hotel Management System</h1>
        </header>
        <div class="container">
            <h2>Delete Reservation</h2>
            <form action="DeleteReservationServlet" method="post">
                <div class="form-group">
                    <label for="reservationId">Reservation ID:</label>
                    <input type="number" id="reservationId" name="reservationId" required />
                </div>
                <button type="submit" class="delete-button">Delete Reservation</button>
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
