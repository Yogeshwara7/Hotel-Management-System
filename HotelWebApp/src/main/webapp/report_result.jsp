<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat, com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results - Hotel Management System</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="background-container"></div>
    <div class="content-wrapper">
        <header class="header">
            <h1>Hotel Management System</h1>
        </header>
        <div class="container">
            <h2>Report: ${reportName}</h2>

            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>

            <%
                Object result = request.getAttribute("reportResult");
                Object revenue = request.getAttribute("revenue");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

                if (result instanceof List) {
                    List<?> list = (List<?>) result;
                    if (!list.isEmpty() && list.get(0) instanceof Reservation) {
            %>
                        <%-- Date Range report --%>
                        <table>
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Customer Name</th>
                                    <th>Room Number</th>
                                    <th>Check-In</th>
                                    <th>Check-Out</th>
                                    <th>Total Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Reservation r : (List<Reservation>) list) {
                                %>
                                <tr>
                                    <td><%= r.getReservationId() %></td>
                                    <td><%= r.getCustomerName() %></td>
                                    <td><%= r.getRoomNumber() %></td>
                                    <td><%= sdf.format(r.getCheckIn()) %></td>
                                    <td><%= sdf.format(r.getCheckOut()) %></td>
                                    <td><%= r.getTotalAmount() %></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
            <%
                    } else if (!list.isEmpty() && list.get(0) instanceof Map.Entry) {
            %>
                        <%-- Most booked rooms report --%>
                        <table>
                            <thead>
                                <tr>
                                    <th>Room Number</th>
                                    <th>Booking Count</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Map.Entry<String, Integer> entry : ((Map<String,Integer>)result).entrySet()) {
                                %>
                                <tr>
                                    <td><%= entry.getKey() %></td>
                                    <td><%= entry.getValue() %></td>
                                </tr>
                                <%
                                    }
                                %>
                            </tbody>
                        </table>
            <%
                    }
                } else if (revenue != null) {
            %>
                    <%-- Total Revenue report --%>
                    <div class="total-revenue-display">
                        <p>Total Revenue: $<%= revenue %></p>
                    </div>
            <%
                } else {
            %>
                    <p>No data found for the selected report.</p>
            <%
                }
            %>

            <nav>
                <a href="reports.jsp">Back to Reports</a>
                <a href="index.jsp">Home</a>
            </nav>
        </div>
    </div>
</body>
</html>
