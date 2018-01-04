package app.model;

import app.util.DBUtils;

import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {

    /**
     * Method checks if user with given login and password exist in DB and return their perm_level
     * @param
     *  username - username
     *  password - password
     *
     * @return perm_level   -1 - wrong password
     *                       0 - user
     *                       1 - admin
     */
    public static int login(String username, String password) throws SQLException {
        String selectstmt = String.format( "SELECT uprawnienia_admin as \"perm\" FROM " +
                "serwis.pracownicy WHERE LOGIN = '%s' AND HASLO = '%s'",username, password);

        ResultSet rs = null;
        int perm = -1;

        try {
            rs = DBUtils.dbExecuteQuery(selectstmt);
        } catch (SQLException e) {
            System.err.println("Error while executing login query");
            System.err.println(selectstmt);
            e.printStackTrace();
        }

        if (rs.next()) {
            perm = rs.getInt("perm");
        }
        return perm;
    }
}