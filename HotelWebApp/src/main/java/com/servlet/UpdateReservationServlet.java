package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class UpdateReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("reservationId");
            String customerName = request.getParameter("customerName");
            String roomNumber = request.getParameter("roomNumber");
            String checkInStr = request.getParameter("checkIn");
            String checkOutStr = request.getParameter("checkOut");
            String totalAmountStr = request.getParameter("totalAmount");

            if (idStr == null || idStr.isEmpty() ||
                customerName == null || customerName.isEmpty() ||
                roomNumber == null || roomNumber.isEmpty() ||
                checkInStr == null || checkOutStr == null ||
                totalAmountStr == null || totalAmountStr.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
                return;
            }

            int reservationId = Integer.parseInt(idStr);
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date checkIn = sdf.parse(checkInStr);
            java.util.Date checkOut = sdf.parse(checkOutStr);
            double totalAmount = Double.parseDouble(totalAmountStr);

            if (checkIn.after(checkOut)) {
                request.setAttribute("error", "Check-out date must be after check-in.");
                request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
                return;
            }

            Reservation r = new Reservation();
            r.setReservationId(reservationId);
            r.setCustomerName(customerName);
            r.setRoomNumber(roomNumber);
            r.setCheckIn(checkIn);
            r.setCheckOut(checkOut);
            r.setTotalAmount(totalAmount);

            ReservationDAO dao = new ReservationDAO();
            if (dao.updateReservation(r)) {
                request.setAttribute("message", "Reservation updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update reservation.");
            }
            request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("reservationupdate.jsp").forward(request, response);
        }
    }
}
