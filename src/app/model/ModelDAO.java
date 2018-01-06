package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ModelDAO {

    public static ObservableList<Model> getAvaliblePartModels(String categoryId, String producerId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("SELECT c.ID_CZESCI, MODEL, CENA FROM CZESCI_ZAMIENNE c LEFT JOIN MAGAZYN m " +
                "ON m.id_czesci = c.ID_CZESCI WHERE c.ID_KATEGORII = %s AND c.ID_PRODUCENTA = %s",categoryId, producerId);

        ResultSet rs = null;
        ObservableList<Model> list = FXCollections.observableArrayList();
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        while (rs.next()) {

            int id = rs.getInt("ID_CZESCI");
            String model = rs.getString("MODEL");
            double price  = rs.getDouble("CENA");

            Model c = new Model(id, model, price);
            list.add(c);
        }
        return list;
    }

    public static void exchangeClientPart(String repairId, String partId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("call exchangePart(%s, %s)", repairId, partId);

        try {
            DBUtils.dbExecuteUpdate(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while changing part: " + e);
            //Return exception
            throw e;
        }
    }
}
