package com.nathan.footballsquadmanagerbp2.model;

import com.nathan.footballsquadmanagerbp2.service.AlertService;
import com.nathan.footballsquadmanagerbp2.service.DBConnector;

import java.sql.*;

public class PlayerDAO {
    private final Connection conn;
    private final AlertService alertService = new AlertService();

    // Getting the Instance of the connection variable, this avoids spamming connecting to the database.
    public PlayerDAO() {
        try {
            conn = DBConnector.getInstance().getConnection();
        } catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    // Inserting a new player.
    public int insertPlayer(Player player) {
        // SQL query, values have '?' to prevent SQL injection.
        String query = "INSERT INTO player VALUES (?,?,?,?,?,?,?)";
        // PreparedStatements are safer and more readable than Statements. Also returns the auto generated key for id.
        try (PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
            // This is always 0. So it gets autogenerated in the database.
            pstmt.setInt(1, player.getPlayerId());
            // If this was a normal statement and the user would put in "DROP TABLE player",
            // as their input for the first name, it could cause problems.
            pstmt.setString(2, player.getPlayerFirstName());
            pstmt.setString(3, player.getPlayerLastName());
            pstmt.setInt(4, player.getPlayerAge());
            pstmt.setString(5, player.getPlayerPrefFoot());
            pstmt.setInt(6, player.getPlayerShirtNumber());
            pstmt.setString(7, player.getPlayerStatus());
            pstmt.executeUpdate();

            // Get the generated id in player table.
            try (ResultSet rs = pstmt.getGeneratedKeys()) {
                if(rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLIntegrityConstraintViolationException e) {
            alertService.getAlert("This player has already been inserted!");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        // if no ID was generated, return -1.
        return -1;
    }

    // Editing an existing player from the database.
    public void editPlayer(int id, Player player) {
        String query = "UPDATE player SET first_name = ?, last_name = ?, age = ?, "
                + "pref_foot = ?, playing_number = ?, status = ? WHERE id = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, player.getPlayerFirstName());
            pstmt.setString(2, player.getPlayerLastName());
            pstmt.setInt(3, player.getPlayerAge());
            pstmt.setString(4, player.getPlayerPrefFoot());
            pstmt.setInt(5, player.getPlayerShirtNumber());
            pstmt.setString(6, player.getPlayerStatus());

            // id to specify which player to update
            pstmt.setInt(7, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Delete a player from the database.
    public void deletePlayer(int playerId) {
        // But first delete the foreign key link in player_position and selection_details.
        String deletePlayerPositionLink = "DELETE FROM player_position WHERE player_id = ?";
        String deleteSelectionDetailsLink = "DELETE FROM selection_details WHERE player_id = ?";
        String query = "DELETE FROM player WHERE id = ?";
        try (PreparedStatement pstmt1 = conn.prepareStatement(deletePlayerPositionLink);
             PreparedStatement pstmt2 = conn.prepareStatement(deleteSelectionDetailsLink);
             PreparedStatement pstmt3 = conn.prepareStatement(query)) {
            pstmt1.setInt(1, playerId);
            pstmt1.executeUpdate();
            pstmt2.setInt(1, playerId);
            pstmt2.executeUpdate();
            pstmt3.setInt(1, playerId);
            pstmt3.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Getting all the players.
    public ResultSet getAllPlayers() {
        ResultSet players;
        String query = "SELECT * FROM player";
        try {
            Statement stmt = conn.createStatement();
            players = stmt.executeQuery(query);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return players;
    }
}
