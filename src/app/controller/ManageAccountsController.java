package app.controller;

import app.model.AccountDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.CheckBox;
import javafx.scene.control.RadioButton;
import javafx.scene.control.TextField;

import java.sql.SQLException;

public class ManageAccountsController {

    @FXML
    private TextField firstNameTextField;

    @FXML
    private TextField secondNameTextField;

    @FXML
    private TextField addressTextField;

    @FXML
    private TextField postCodeTextField;

    @FXML
    private TextField cityTextField;

    @FXML
    private TextField stateTextField;

    @FXML
    private TextField phoneTextField;

    @FXML
    private TextField loginTextField;

    @FXML
    private TextField passTextField;

    @FXML
    private TextField contractStartTextField;

    @FXML
    private TextField salaryTextField;

    @FXML
    private CheckBox admAccCheckBox;

    @FXML
    private TextField contractEndTextField;

    @FXML
    void addAccount(ActionEvent event) {
        String firstName = firstNameTextField.getText();
        String secondName = secondNameTextField.getText();
        String address = addressTextField.getText();
        String postCode = postCodeTextField.getText();
        String city = cityTextField.getText();
        String state = stateTextField.getText();
        String phone = phoneTextField.getText();
        String adminAcc = admAccCheckBox.isSelected() ? "1" : "0";
        String contractStart = contractStartTextField.getText();
        String contractEnd = contractEndTextField.getText();
        String login = loginTextField.getText();
        String pass = passTextField.getText();
        String salary = salaryTextField.getText();

        try {
            AccountDAO.addNewUser(firstName, secondName, address, postCode, city, state, phone,
                    adminAcc, contractStart, contractEnd, login, pass , salary);
            System.out.println("Account added");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}