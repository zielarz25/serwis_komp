package app.controller;

import app.model.Repair;
import app.model.RepairDAO;
import app.util.FXMLUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.paint.Color;

import java.sql.SQLException;
import java.util.ResourceBundle;

public class TakeRepairController {
    String activeUserName;
    int activeUserId;

    @FXML
    private TableView<Repair> newRepairsTableView;

    @FXML
    private TableColumn<Repair, Integer> repairIdColumn;

    @FXML
    private TableColumn<Repair, String> repairInfoColumn;

    @FXML
    private TableColumn<Repair, String> statusColumn;

    @FXML
    private TableColumn<Repair, String> startDateColumn;

    @FXML
    private TextField repairIdTextField;

    private ResourceBundle bundle = FXMLUtils.getResourceBundle();


    @FXML
    private Label message;

    @FXML
    void initialize() {
        repairIdColumn.setCellValueFactory( cellData -> cellData.getValue().repairIdProperty().asObject());
        repairInfoColumn.setCellValueFactory(cellData -> cellData.getValue().repairInfoProperty());
        statusColumn.setCellValueFactory(cellData -> cellData.getValue().statusProperty());
        startDateColumn.setCellValueFactory(cellData -> cellData.getValue().startDateProperty());

        refreshTableView();
        message.setVisible(false);
    }

    private void refreshTableView() {

        try {
            newRepairsTableView.setItems(RepairDAO.getAllNewRepairs());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    @FXML
    private void takeRepair(ActionEvent event) {
        getLoggedUserId();
        Boolean flag = false;
        String repairId = repairIdTextField.getText();
        try {
            flag = RepairDAO.takeWork(activeUserId+"", repairId);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (flag) {
            message.setTextFill(Color.rgb(0, 255, 0));
            message.setText(bundle.getString("user.workTaken"));
            message.setVisible(true);
        }
        else {
            message.setTextFill(Color.rgb(255, 0, 0));
            message.setText(bundle.getString("user.workNotTaken"));
            message.setVisible(true);
        }
        refreshTableView();
    }
    private void getLoggedUserId() {
        try {
            activeUserId = RepairDAO.getLoggedUserId(activeUserName);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void setUserLogin(String userLogin) {
        this.activeUserName = userLogin;
    }
}
