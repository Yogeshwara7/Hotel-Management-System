package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("reportType");

        try {
            ReservationDAO dao = new ReservationDAO();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            if ("dateRange".equals(reportType)) {
                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");

                java.util.Date startDate = sdf.parse(startDateStr);
                java.util.Date endDate = sdf.parse(endDateStr);

                List<Reservation> reservations = dao.getReservationsByDateRange(startDate, endDate);
                request.setAttribute("reservations", reservations);
                request.setAttribute("startDate", startDateStr);
                request.setAttribute("endDate", endDateStr);

            } else if ("mostBookedRooms".equals(reportType)) {
                Map<String, Integer> roomBookings = dao.getMostBookedRooms();
                List<Map<String, Object>> roomData = new ArrayList<>();
                
                for (Map.Entry<String, Integer> entry : roomBookings.entrySet()) {
                    Map<String, Object> room = new HashMap<>();
                    room.put("roomNumber", entry.getKey());
                    room.put("bookingCount", entry.getValue());
                    room.put("totalRevenue", entry.getValue() * 1000.0); // Assuming ₹1000 per booking
                    roomData.add(room);
                }
                
                request.setAttribute("roomBookings", roomData);

            } else if ("revenue".equals(reportType)) {
                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");

                java.util.Date startDate = sdf.parse(startDateStr);
                java.util.Date endDate = sdf.parse(endDateStr);

                double revenue = dao.getTotalRevenue(startDate, endDate);
                List<Map<String, Object>> revenueData = new ArrayList<>();
                Map<String, Object> dailyRevenue = new HashMap<>();
                dailyRevenue.put("date", startDateStr);
                int bookingCount = dao.getTotalBookings(startDate, endDate);
                dailyRevenue.put("bookingCount", bookingCount);
                dailyRevenue.put("totalRevenue", revenue);
                revenueData.add(dailyRevenue);
                
                request.setAttribute("revenueData", revenueData);
                request.setAttribute("startDate", startDateStr);
                request.setAttribute("endDate", endDateStr);
            }

            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error generating report: " + e.getMessage());
            request.getRequestDispatcher("report_form.jsp").forward(request, response);
        }
    }
}
