package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class CashierDAO {

    public static ObservableList<Cashier> getAllUnpaidRepairs() throws SQLException {
        String stmt = String.format("select ID_NAPRAWY, IMIE as \"IMIE_KLIENTA\", " +
                "NAZWISKO as \"NAZWISKO_KLIENTA\", DATA_ROZPOCZECIA, DATA_ZAKONCZENIA," +
                " STATUS, DO_ZAPLATY  FROM ZAMOWIENIE_NAPRAWY NATURAL JOIN KLIENCI" +
                " NATURAL JOIN PLATNOSCI WHERE STATUS = 'naprawiony'");
        ResultSet rs = null;
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ObservableList<Cashier> list = FXCollections.observableArrayList();

        while (rs.next()) {
            int workId = rs.getInt("ID_NAPRAWY");
            String clientFirstName = rs.getString("IMIE_KLIENTA");
            String clietSecondName = rs.getString("NAZWISKO_KLIENTA");
            String startDate = rs.getString("DATA_ROZPOCZECIA");
            String endDate = rs.getString("DATA_ZAKONCZENIA");
            String status = rs.getString("STATUS");
            double toPay = rs.getInt("DO_ZAPLATY");




            Cashier c = new Cashier(workId, clientFirstName, clietSecondName, startDate, endDate, status, toPay);
            list.add(c);
        }
        return list;
    }

    public static void payConfirm(String workId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("CALL confirm_payment(%s)", workId);

        try {
            DBUtils.dbExecuteUpdate(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while confirming payment: " + e);
            //Return exception
            throw e;
        }
    }
}
