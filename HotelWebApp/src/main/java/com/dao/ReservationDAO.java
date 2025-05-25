package com.dao;

import com.model.Reservation;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class ReservationDAO {

    // Add reservation
    public boolean addReservation(Reservation r) throws SQLException {
        String sql = "INSERT INTO Reservations (CustomerName, RoomNumber, CheckIn, CheckOut, TotalAmount) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getCustomerName());
            ps.setString(2, r.getRoomNumber());
            ps.setDate(3, new java.sql.Date(r.getCheckIn().getTime()));
            ps.setDate(4, new java.sql.Date(r.getCheckOut().getTime()));
            ps.setDouble(5, r.getTotalAmount());
            return ps.executeUpdate() > 0;
        }
    }

    // Update reservation
    public boolean updateReservation(Reservation r) throws SQLException {
        String sql = "UPDATE Reservations SET CustomerName=?, RoomNumber=?, CheckIn=?, CheckOut=?, TotalAmount=? WHERE ReservationID=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, r.getCustomerName());
            ps.setString(2, r.getRoomNumber());
            ps.setDate(3, new java.sql.Date(r.getCheckIn().getTime()));
            ps.setDate(4, new java.sql.Date(r.getCheckOut().getTime()));
            ps.setDouble(5, r.getTotalAmount());
            ps.setInt(6, r.getReservationId());
            return ps.executeUpdate() > 0;
        }
    }

    // Delete reservation
    public boolean deleteReservation(int id) throws SQLException {
        String sql = "DELETE FROM Reservations WHERE ReservationID=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    // Get all reservations
    public List<Reservation> getAllReservations() throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations";
        try (Connection con = DBUtil.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("ReservationID"));
                r.setCustomerName(rs.getString("CustomerName"));
                r.setRoomNumber(rs.getString("RoomNumber"));
                r.setCheckIn(rs.getDate("CheckIn"));
                r.setCheckOut(rs.getDate("CheckOut"));
                r.setTotalAmount(rs.getDouble("TotalAmount"));
                list.add(r);
            }
        }
        return list;
    }

    // Reports - Reservations by date range
    public List<Reservation> getReservationsByDateRange(java.util.Date startDate, java.util.Date endDate) throws SQLException {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(startDate.getTime()));
            ps.setDate(2, new java.sql.Date(endDate.getTime()));
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Reservation r = new Reservation();
                    r.setReservationId(rs.getInt("ReservationID"));
                    r.setCustomerName(rs.getString("CustomerName"));
                    r.setRoomNumber(rs.getString("RoomNumber"));
                    r.setCheckIn(rs.getDate("CheckIn"));
                    r.setCheckOut(rs.getDate("CheckOut"));
                    r.setTotalAmount(rs.getDouble("TotalAmount"));
                    list.add(r);
                }
            }
        }
        return list;
    }

    // Reports - Most booked rooms
    public Map<String, Integer> getMostBookedRooms() throws SQLException {
        Map<String, Integer> map = new LinkedHashMap<>();
        String sql = "SELECT RoomNumber, COUNT(*) as count FROM Reservations GROUP BY RoomNumber ORDER BY count DESC";
        try (Connection con = DBUtil.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                map.put(rs.getString("RoomNumber"), rs.getInt("count"));
            }
        }
        return map;
    }

    // Reports - Total revenue over period
    public double getTotalRevenue(java.util.Date startDate, java.util.Date endDate) throws SQLException {
        double revenue = 0.0;
        String sql = "SELECT SUM(TotalAmount) as revenue FROM Reservations WHERE CheckIn >= ? AND CheckOut <= ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setDate(1, new java.sql.Date(startDate.getTime()));
            ps.setDate(2, new java.sql.Date(endDate.getTime()));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    revenue = rs.getDouble("revenue");
                }
            }
        }
        return revenue;
    }

    // Check room availability
    public boolean isRoomAvailable(String roomNumber, java.util.Date checkInDate, java.util.Date checkOutDate) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Reservations WHERE RoomNumber = ? AND ((CheckIn <= ? AND CheckOut >= ?) OR (CheckIn <= ? AND CheckOut >= ?))";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, roomNumber);
            ps.setDate(2, new java.sql.Date(checkOutDate.getTime()));
            ps.setDate(3, new java.sql.Date(checkInDate.getTime()));
            ps.setDate(4, new java.sql.Date(checkOutDate.getTime())); // Added to cover the second overlap condition
            ps.setDate(5, new java.sql.Date(checkInDate.getTime())); // Added to cover the second overlap condition
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0; // If count is 0, room is available
                }
            }
        }
        return false; // Assume not available on error or no result
    }
}
