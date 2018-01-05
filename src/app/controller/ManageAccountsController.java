package app.controller;

import app.model.Account;
import app.model.AccountDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;

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
    private TextField contractEndTextField;

    @FXML
    private CheckBox admAccCheckBox;

    @FXML
    private TableView<Account> usersTableView;

    @FXML
    private TableColumn<Account, Integer> userIdColumn;

    @FXML
    private TableColumn<Account, Integer> contractIdColumn;

    @FXML
    private TableColumn<Account, String> firstNameColumn;

    @FXML
    private TableColumn<Account, String> secondNameColumn;

    @FXML
    private TableColumn<Account, String> addressColumn;

    @FXML
    private TableColumn<Account, Integer> postCodeColumn;

    @FXML
    private TableColumn<Account, String> cityColumn;

    @FXML
    private TableColumn<Account, String> stateCoulmn;

    @FXML
    private TableColumn<Account, Integer> phoneColumn;

    @FXML
    private TableColumn<Account, Double> salaryColumn;

    @FXML
    private TableColumn<Account, String> loginColumn;

    @FXML
    private TableColumn<Account, String> passColumn;

    @FXML
    private TableColumn<Account, String> contractStartColumn;

    @FXML
    private TableColumn<Account, String> contractEndColumn;

    @FXML
    private TableColumn<Account, Integer> admPrivColumn;

    @FXML
    private TextField userIdDelTextField;

    @FXML
    private TextField userIdFireTextField;

    @FXML
    void initialize() {
        userIdColumn.setCellValueFactory( cellData -> cellData.getValue().accIdProperty().asObject());
        contractIdColumn.setCellValueFactory(cellData -> cellData.getValue().contractIdProperty().asObject());
        firstNameColumn.setCellValueFactory(cellData -> cellData.getValue().firstNameProperty());
        secondNameColumn.setCellValueFactory(cellData -> cellData.getValue().secondNameProperty());
        addressColumn.setCellValueFactory(cellData -> cellData.getValue().addressProperty());
        postCodeColumn.setCellValueFactory(cellData -> cellData.getValue().postCodeProperty().asObject());
        cityColumn.setCellValueFactory( cellData -> cellData.getValue().cityProperty());
        stateCoulmn.setCellValueFactory(cellData -> cellData.getValue().stateProperty());
        phoneColumn.setCellValueFactory(cellData -> cellData.getValue().phoneProperty().asObject());
        salaryColumn.setCellValueFactory(cellData -> cellData.getValue().salaryProperty().asObject());
        loginColumn.setCellValueFactory(cellData -> cellData.getValue().loginProperty());
        passColumn.setCellValueFactory(cellData -> cellData.getValue().passProperty());
        contractStartColumn.setCellValueFactory(cellData -> cellData.getValue().contractStartProperty());
        contractEndColumn.setCellValueFactory(cellData -> cellData.getValue().contractEndProperty());
        admPrivColumn.setCellValueFactory(cellData -> cellData.getValue().accPrivProperty().asObject());

        refreshTableView();

    }

    public void refreshTableView() {

        try {
            usersTableView.setItems(AccountDAO.getAllUsers());
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
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

    @FXML
    void deleteAccount(ActionEvent event) {
        String userIdToDelete = userIdDelTextField.getText();
        try {
            AccountDAO.deleteAccount(userIdToDelete);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        refreshTableView();
    }

    @FXML
    void dismissWorker(ActionEvent event) {
        String userIdToDismiss = userIdFireTextField.getText();
        try {
            AccountDAO.dismissEmployee(userIdToDismiss);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}