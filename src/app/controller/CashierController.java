package app.controller;

import app.model.Cashier;
import app.model.CashierDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;

import java.sql.SQLException;

public class CashierController {
        @FXML
        private TextField workIdTextField;

        @FXML
        private TableView<Cashier> finishedRepairsTableView;

        @FXML
        private TableColumn<Cashier, Integer> repairIdColumn;

        @FXML
        private TableColumn<Cashier, String> customerNameColumn;

        @FXML
        private TableColumn<Cashier, String> customerSecondNameColumn;

        @FXML
        private TableColumn<Cashier, String> startDateColumn;

        @FXML
        private TableColumn<Cashier, String> endDateColumn;

        @FXML
        private TableColumn<Cashier, String> statusColumn;

        @FXML
        private TableColumn<Cashier, Double> toPayColumn;

        @FXML
        void initialize() {
            repairIdColumn.setCellValueFactory( cellData -> cellData.getValue().workIdProperty().asObject());
            customerNameColumn.setCellValueFactory(cellData -> cellData.getValue().clientFirstNameProperty());
            customerSecondNameColumn.setCellValueFactory(cellData -> cellData.getValue().clientSecondNameProperty());
            startDateColumn.setCellValueFactory(cellData -> cellData.getValue().startDateProperty());
            endDateColumn.setCellValueFactory(cellData -> cellData.getValue().endDateProperty());
            statusColumn.setCellValueFactory(cellData -> cellData.getValue().statusProperty());
            toPayColumn.setCellValueFactory(cellData -> cellData.getValue().toPayProperty().asObject());

            refreshTableView();
        }

    public void refreshTableView() {
        try {
            finishedRepairsTableView.setItems(CashierDAO.getAllUnpaidRepairs());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

        @FXML
        void confirmPayment(ActionEvent event) {
            String workIdToPay = workIdTextField.getText();
            try {
                CashierDAO.payConfirm(workIdToPay);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            refreshTableView();
        }

    }
