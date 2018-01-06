package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class RepairDAO {
    public static int getLoggedUserId(String userLogin) throws SQLException, ClassNotFoundException {

        String stmt = String.format("SELECT ID_PRACOWNIKA FROM PRACOWNICY WHERE LOGIN = '%s'", userLogin);

        ResultSet rs = null;
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int userId = -1;
        while (rs.next()) {
            userId = rs.getInt("ID_PRACOWNIKA");
        }
        return userId;
    }

    public static ObservableList<Repair> getAllNewRepairs() throws SQLException {
        String stmt = "SELECT ID_NAPRAWY, OPIS_USTERKI, STATUS, DATA_ROZPOCZECIA from ZAMOWIENIE_NAPRAWY WHERE STATUS = 'nowy'";
        ResultSet rs = null;
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ObservableList<Repair> list = FXCollections.observableArrayList();

        while (rs.next()) {
            int repairId = rs.getInt("ID_NAPRAWY");
            String repairInfo = rs.getString("OPIS_USTERKI");
            String status = rs.getString("STATUS");
            String startDate = rs.getString("DATA_ROZPOCZECIA");

            Repair r = new Repair(repairId, repairInfo, status, startDate);
            list.add(r);
        }
        return list;
    }

    public static boolean takeWork(String userId, String reportId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("select take_work(%s,%s) as \"result\" from dual", userId, reportId);
        ResultSet rs = null;
        try {
            rs = DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while taking work: " + e);
            //Return exception
            throw e;
        }
        int code = 0;
        while (rs.next()) {
            code = rs.getInt("result");
        }
        return (code == 1) ? true : false;
    }

    public static ObservableList<Integer> getAllUsersActiveWorksIDs(String userId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("select ID_NAPRAWY FROM PRACE_NAPRAWCZE p NATURAL JOIN" +
                        " ZAMOWIENIE_NAPRAWY z WHERE ID_PRACOWNIKA = %s AND STATUS NOT LIKE 'naprawiony' GROUP BY ID_NAPRAWY", userId);
        ResultSet rs = null;

        try {
            rs = DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while getting list of active works: " + e);
            throw e;
        }

        ObservableList<Integer> l = FXCollections.observableArrayList();

        while (rs.next()) {
            int id = rs.getInt("ID_NAPRAWY");
            l.add(id);
        }
        return l;
    }

    public static ObservableList<Repair> getAllDoneRepairs(String repairId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("select NAZWA_USLUGI, CENA FROM PRACE_NAPRAWCZE NATURAL JOIN CENNIK WHERE ID_NAPRAWY = %s", repairId);
        ResultSet rs = null;

        try {
            rs = DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while getting list of repairs: " + e);
            throw e;
        }

        ObservableList<Repair> l = FXCollections.observableArrayList();

        while (rs.next()) {
            String name = rs.getString("NAZWA_USLUGI");
            double price = rs.getInt("CENA");
            Repair r = new Repair(name, price);
            l.add(r);
        }

        return l;
    }

    public static ObservableList<Repair> getChangedParts(String repairId) throws SQLException, ClassNotFoundException {

        String stmt = String.format("select NAZWA_KATEGORII, NAZWA_PRODUCENTA, MODEL, CENA FROM PRACE_NAPRAWCZE" +
                "_CZESCI NATURAL JOIN CZESCI_ZAMIENNE NATURAL JOIN PRACE_NAPRAWCZE NATURAL JOIN KATEGORIE" +
                " NATURAL JOIN PRODUCENCI WHERE ID_NAPRAWY = %s", repairId);
        ResultSet rs = null;

        try {
            rs = DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            System.out.println("An error occurred while getting list of repairs: " + e);
            throw e;
        }

        ObservableList<Repair> l = FXCollections.observableArrayList();

        while (rs.next()) {
            String category = rs.getString("NAZWA_KATEGORII");
            String producer = rs.getString("NAZWA_PRODUCENTA");
            String model = rs.getString("MODEL");
            double price = rs.getInt("CENA");
            Repair r = new Repair(category, producer, model, price);
            l.add(r);
        }

        return l;
    }


}
