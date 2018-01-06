package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ServicesDAO {

    public static ObservableList<Services> getAvalibleServices() throws SQLException, ClassNotFoundException {

        String stmt = String.format("select ID_USLUGI, NAZWA_USLUGI from CENNIK");

        ResultSet rs = null;
        ObservableList<Services> list = FXCollections.observableArrayList();
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        while (rs.next()) {
            String name = rs.getString("NAZWA_USLUGI");
            int id = rs.getInt("ID_USLUGI");

            Services s = new Services(id,name);
            list.add(s);
        }
        return list;
    }

    public static void addWork(String serviceId, String workId ,String workerId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("CALL doService(%s, %s, %s)", serviceId, workId, workerId);

        try {
            DBUtils.dbExecuteUpdate(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while adding new account: " + e);
            //Return exception
            throw e;
        }
    }

}
