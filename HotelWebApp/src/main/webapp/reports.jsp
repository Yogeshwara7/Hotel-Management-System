<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Hotel Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="background-container"></div>
    <div class="content-wrapper">
        <header class="header">
            <h1>Hotel Management System</h1>
        </header>
        <div class="container">
            <h2>Reports</h2>

            <div class="report-section">
                <form action="ReportServlet" method="post">
                    <h2>Reservations by Date Range</h2>
                    <div class="form-group">
                        <label for="startDate1">Start Date:</label>
                        <input type="date" id="startDate1" name="startDate" required />
                    </div>
                    <div class="form-group">
                        <label for="endDate1">End Date:</label>
                        <input type="date" id="endDate1" name="endDate" required />
                    </div>
                    <input type="hidden" name="reportType" value="dateRange" />
                    <button type="submit">Generate Report</button>
                </form>
            </div>

            <div class="report-section">
                <form action="ReportServlet" method="post">
                    <h2>Most Booked Rooms</h2>
                    <input type="hidden" name="reportType" value="mostBookedRooms" />
                    <button type="submit">Generate Report</button>
                </form>
            </div>

            <div class="report-section">
                <form action="ReportServlet" method="post">
                    <h2>Total Revenue by Date Range</h2>
                    <div class="form-group">
                        <label for="startDate2">Start Date:</label>
                        <input type="date" id="startDate2" name="startDate" required />
                    </div>
                    <div class="form-group">
                        <label for="endDate2">End Date:</label>
                        <input type="date" id="endDate2" name="endDate" required />
                    </div>
                    <input type="hidden" name="reportType" value="revenue" />
                    <button type="submit">Generate Report</button>
                </form>
            </div>

            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>

            <nav>
                <a href="index.jsp">Back to Home</a>
            </nav>
        </div>
    </div>
</body>
</html>
