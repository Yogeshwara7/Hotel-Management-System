package com.servlet;

import com.dao.ReservationDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("reservationId");

            if (idStr == null || idStr.isEmpty()) {
                request.setAttribute("error", "Reservation ID is required.");
                request.getRequestDispatcher("reservationdelete.jsp").forward(request, response);
                return;
            }

            int reservationId = Integer.parseInt(idStr);

            ReservationDAO dao = new ReservationDAO();
            if (dao.deleteReservation(reservationId)) {
                request.setAttribute("message", "Reservation deleted successfully.");
            } else {
                request.setAttribute("error", "Failed to delete reservation.");
            }
            request.getRequestDispatcher("reservationdelete.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("reservationdelete.jsp").forward(request, response);
        }
    }
}
