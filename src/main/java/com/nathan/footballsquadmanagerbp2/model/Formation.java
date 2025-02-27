package com.nathan.footballsquadmanagerbp2.model;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Formation {
    private final int formationId;
    private final String formationName;

    public Formation(ResultSet resultSet) throws SQLException {
        this.formationId = resultSet.getInt("id");
        this.formationName = resultSet.getString("name");
    }

    public Formation(int formationId, String formationName) {
        this.formationId = formationId;
        this.formationName = formationName;
    }

    public int getFormationId() {
        return formationId;
    }

    public String getFormationName() {
        return formationName;
    }

    // Ensures formationName can be used in a combobox, but still gains access to the .getFormationId() getter.
    @Override
    public String toString() {
        return formationName;
    }
}
