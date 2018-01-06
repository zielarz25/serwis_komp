package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StockDAO {

    public static ObservableList<Stock> getStockStatus() throws SQLException, ClassNotFoundException {

        String stmt = String.format("select CZESCI_ZAMIENNE.ID_CZESCI, NAZWA_KATEGORII, " +
                        "NAZWA_PRODUCENTA, MODEL, CENA, LICZBA_SZTUK from (CZESCI_ZAMIENNE NATURAL JOIN" +
                        " PRODUCENCI NATURAL JOIN KATEGORIE) LEFT JOIN MAGAZYN " +
                        "ON magazyn.id_czesci = CZESCI_ZAMIENNE.ID_CZESCI" );

        ResultSet rs = null;
        ObservableList<Stock> list = FXCollections.observableArrayList();
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        while (rs.next()) {

            int id = rs.getInt("ID_CZESCI");
            String category = rs.getString("NAZWA_KATEGORII");
            String producer = rs.getString("NAZWA_PRODUCENTA");
            String model = rs.getString("MODEL");
            double price = rs.getDouble("CENA");
            int numberOnStock = rs.getInt("LICZBA_SZTUK");

            Stock s = new Stock(id, category, producer, model, price, numberOnStock);
            list.add(s);
        }
        return list;
    }

    public static void addNewItem(String category, String producer, String model, String price)
            throws SQLException, ClassNotFoundException {

        String stmt = String.format("CALL add_new_item('%s', '%s', '%s', %s)", category, producer, model, price);

        try {
            DBUtils.dbExecuteUpdate(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while adding new item: " + e);
            System.out.println(stmt);
            //Return exception
            throw e;
        }
    }

    public static void addItemPieces(String id, String pieces)
            throws SQLException, ClassNotFoundException {

        String stmt = String.format("CALL add_items(%s, %s)", id, pieces);

        try {
            DBUtils.dbExecuteUpdate(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while adding new item: " + e);
            System.out.println(stmt);
            //Return exception
            throw e;
        }
    }

}
