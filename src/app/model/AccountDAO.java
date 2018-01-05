package app.model;

import app.util.DBUtils;

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
}
