package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PricesDAO {
    public static ObservableList<Prices> getAllPrices() throws SQLException {
        String stmt = "SELECT * FROM CENNIK";
        ResultSet rs = null;
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ObservableList<Prices> list = FXCollections.observableArrayList();

        while (rs.next()) {
            int priceId = rs.getInt("ID_USLUGI");
            String priceName = rs.getString("NAZWA_USLUGI");
            double priceValue = rs.getDouble("CENA");

            Prices a = new Prices(priceId, priceName, priceValue);
            list.add(a);
        }
        return list;


    }


    public static void updatePrices(int index, String colName, Object newValue) {
        String stmt;
        if (colName.equals("CENA")) {
            stmt = String.format("UPDATE CENNIK SET %s = %s WHERE ID_USLUGI = %s", colName, newValue, index);
        } else {
            stmt = String.format("UPDATE CENNIK SET %s = '%s' WHERE ID_USLUGI = %s", colName, newValue, index);
        }
        System.out.println(stmt);
        try {
            DBUtils.dbExecuteUpdate(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


}
