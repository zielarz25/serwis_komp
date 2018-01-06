package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CategoriesDAO {

    public static ObservableList<Categories> getAvalibleCategories() throws SQLException, ClassNotFoundException {

        String stmt = String.format("select ID_KATEGORII, NAZWA_KATEGORII from KATEGORIE");

        ResultSet rs = null;
        ObservableList<Categories> list = FXCollections.observableArrayList();
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        while (rs.next()) {
            int id = rs.getInt("ID_KATEGORII");
            String name = rs.getString("NAZWA_KATEGORII");

            Categories c = new Categories(id,name);
            list.add(c);
        }
        return list;
    }
}
