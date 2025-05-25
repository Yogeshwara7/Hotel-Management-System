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

                List<Reservation> list = dao.getReservationsByDateRange(startDate, endDate);
                request.setAttribute("reportResult", list);
                request.setAttribute("reportName", "Reservations from " + startDateStr + " to " + endDateStr);

            } else if ("mostBookedRooms".equals(reportType)) {
                Map<String, Integer> data = dao.getMostBookedRooms();
                request.setAttribute("reportResult", data);
                request.setAttribute("reportName", "Most Booked Rooms");

            } else if ("revenue".equals(reportType)) {
                String startDateStr = request.getParameter("startDate");
                String endDateStr = request.getParameter("endDate");

                java.util.Date startDate = sdf.parse(startDateStr);
                java.util.Date endDate = sdf.parse(endDateStr);

                double revenue = dao.getTotalRevenue(startDate, endDate);
                request.setAttribute("revenue", revenue);
                request.setAttribute("reportName", "Total Revenue from " + startDateStr + " to " + endDateStr);
            }

            request.getRequestDispatcher("report_result.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error generating report: " + e.getMessage());
            request.getRequestDispatcher("reports.jsp").forward(request, response);
        }
    }
}
