package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DisplayReservationsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ReservationDAO dao = new ReservationDAO();
            List<Reservation> list = dao.getAllReservations();
            request.setAttribute("reservationsList", list);
            request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("reservationdisplay.jsp").forward(request, response);
        }
    }
}
