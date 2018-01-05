package app.model;

import app.util.DBUtils;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {
    public static void addNewUser(String firstName, String secondName, String address,
                                  String postCode, String city, String state, String phone,
                                  String admin, String contractStart, String contractEnd,
                                  String login, String pass, String salary)
            throws SQLException, ClassNotFoundException {

        String stmt = String.format("CALL ADD_ACCOUNT('%s','%s','%s',%s,'%s'," +
                        "'%s',%s,%s,'%s','%s','%s','%s',%s)",
                firstName, secondName, address, postCode, city, state, phone, admin,
                contractStart, contractEnd, login, pass, salary);


        try {

            DBUtils.dbExecuteUpdate(stmt);

        } catch (SQLException e) {
            System.out.println("An error occurred while adding new account: " + e);
            //Return exception
            throw e;
        }

    }

    public static ObservableList<Account> getAllUsers() throws SQLException {
        String stmt = "SELECT * FROM SERWIS.PRACOWNICY NATURAL JOIN SERWIS.UMOWY";
        ResultSet rs = null;
        try {
            rs= DBUtils.dbExecuteQuery(stmt);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        ObservableList<Account> list = FXCollections.observableArrayList();

        while (rs.next()) {
//            int userNo = rs.getInt(1);
//            String userLogin = rs.getString(2);
//            String userPass = rs.getString(3);
//            //String permType = rs.getString(3);
//            String firstName = rs.getString(5);
//            String lastName = rs.getString(6);
//            int phone = rs.getInt(7);
//            String email = rs.getString(8);
            int accId = rs.getInt("ID_PRACOWNIKA");
            int contractId = rs.getInt("NR_UMOWY");
            String firstName = rs.getString("IMIE");
            String secondName = rs.getString("NAZWISKO");
            String address = rs.getString("ADRES");
            int postCode = rs.getInt("KOD_POCZTOWY");
            String city = rs.getString("MIASTO");
            String state = rs.getString("WOJEWODZTWO");
            int phone = rs.getInt("NR_TEL");
            int accPriv = rs.getInt("UPRAWNIENIA_ADMIN");
            String contractStart = rs.getString("DATA_ROZPOCZECIA");
            String contractEnd = rs.getString("DATA_ZAKONCZENIA");
            String login = rs.getString("LOGIN");
            String pass = rs.getString("HASLO");
            Double salary = rs.getDouble("WYPLATA");


            Account a = new Account(accId, contractId, firstName, secondName, address, postCode, city, state,
                    phone, accPriv,contractStart, contractEnd, login, pass, salary);
            list.add(a);
        }
        return list;


    }


}
