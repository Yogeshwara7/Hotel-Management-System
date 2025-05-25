package com.servlet;

import com.dao.ReservationDAO;
import com.model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class AddReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String customerName = request.getParameter("customerName");
            String roomNumber = request.getParameter("roomNumber");
            String checkInStr = request.getParameter("checkIn");
            String checkOutStr = request.getParameter("checkOut");
            String totalAmountStr = request.getParameter("totalAmount");

            if (customerName == null || customerName.isEmpty() ||
                roomNumber == null || roomNumber.isEmpty() ||
                checkInStr == null || checkOutStr == null ||
                totalAmountStr == null || totalAmountStr.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
                return;
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date checkIn = sdf.parse(checkInStr);
            java.util.Date checkOut = sdf.parse(checkOutStr);
            double totalAmount = Double.parseDouble(totalAmountStr);

            if (checkIn.after(checkOut)) {
                request.setAttribute("error", "Check-out date must be after check-in.");
                request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
                return;
            }

            ReservationDAO dao = new ReservationDAO();

            // Check for room availability
            if (!dao.isRoomAvailable(roomNumber, checkIn, checkOut)) {
                request.setAttribute("error", "Room " + roomNumber + " is already occupied for the selected dates.");
                request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
                return;
            }

            Reservation r = new Reservation();
            r.setCustomerName(customerName);
            r.setRoomNumber(roomNumber);
            r.setCheckIn(checkIn);
            r.setCheckOut(checkOut);
            r.setTotalAmount(totalAmount);

            if (dao.addReservation(r)) {
                request.setAttribute("message", "Reservation added successfully.");
            } else {
                request.setAttribute("error", "Failed to add reservation.");
            }
            request.getRequestDispatcher("reservationadd.jsp").forward(request, response);

        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
            request.getRequestDispatcher("reservationadd.jsp").forward(request, response);
        }
    }
}
