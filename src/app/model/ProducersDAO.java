package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProducersDAO {

    public static ObservableList<Producers> getAvalibleProducers() throws SQLException, ClassNotFoundException {

        String stmt = String.format("select ID_PRODUCENTA, NAZWA_PRODUCENTA from PRODUCENCI");

        ResultSet rs = null;
        ObservableList<Producers> list = FXCollections.observableArrayList();
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        while (rs.next()) {
            int id = rs.getInt("ID_PRODUCENTA");
            String name = rs.getString("NAZWA_PRODUCENTA");

            Producers s = new Producers(id,name);
            list.add(s);
        }
        return list;
    }
}
