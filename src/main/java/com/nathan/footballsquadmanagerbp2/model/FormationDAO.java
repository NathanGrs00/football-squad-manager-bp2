package com.nathan.footballsquadmanagerbp2.model;

import com.nathan.footballsquadmanagerbp2.service.DBConnector;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FormationDAO {
    private final Connection conn;

    public FormationDAO() {
        try {
            conn = DBConnector.getInstance().getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Get all formations query.
    public List<Formation> getAllFormations() {
        List<Formation> formations = new ArrayList<>();
        ResultSet resultSet;
        String query = "SELECT * FROM formation";
        try {
            Statement stmt = conn.createStatement();
            resultSet = stmt.executeQuery(query);
            while (resultSet.next()) {
                formations.add(new Formation(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return formations;
    }

    // Get specific formation query
    public Formation getFormationById(int id) {
        String query = "SELECT id, name FROM formation WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Formation(rs.getInt("id"), rs.getString("name"));
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
