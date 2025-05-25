<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, java.text.SimpleDateFormat, com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
</head>
<body>
    <h2>Report: ${reportName}</h2>

    <c:if test="${not empty error}">
        <p style="color:red">${error}</p>
    </c:if>

    <%
        Object result = request.getAttribute("reportResult");
        Object revenue = request.getAttribute("revenue");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (result instanceof List) {
            List<?> list = (List<?>) result;
            if (!list.isEmpty() && list.get(0) instanceof Reservation) {
    %>
                <!-- Date Range report -->
                <table border="1" cellpadding="5" cellspacing="0">
                  <tr>
                    <th>ID</th><th>Customer Name</th><th>Room Number</th>
                    <th>Check-In</th><th>Check-Out</th><th>Total Amount</th>
                  </tr>
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
                </table>
    <%
            } else if (!list.isEmpty() && list.get(0) instanceof Map.Entry) {
    %>
                <!-- Most booked rooms report -->
                <table border="1" cellpadding="5" cellspacing="0">
                  <tr><th>Room Number</th><th>Booking Count</th></tr>
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
                </table>
    <%
            }
        } else if (revenue != null) {
    %>
            <p>Total Revenue: $<%= revenue %></p>
    <%
        } else {
    %>
            <p>No data found for the selected report.</p>
    <%
        }
    %>

    <br/>
    <a href="reports.jsp">Back to Reports</a> |
    <a href="index.jsp">Home</a>
</body>
</html>
