package app.controller;

import app.model.Prices;
import app.model.PricesDAO;
import app.model.Stock;
import app.model.StockDAO;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.util.converter.DoubleStringConverter;

import java.sql.SQLException;

public class ManageStoreController {

    @FXML
    private TableView<Stock> pricesTableView;

    @FXML
    private TableColumn<Stock, Integer> itemIdColumn;

    @FXML
    private TableColumn<Stock, String> categoryNameColumn;

    @FXML
    private TableColumn<Stock, String> producerNameColumn;

    @FXML
    private TableColumn<Stock, String> modelColumn;

    @FXML
    private TableColumn<Stock, Double> priceColumn;

    @FXML
    private TableColumn<Stock, Integer> numberOnStockColumn;

    @FXML
    private TextField categoryTextField;

    @FXML
    private TextField producerTextField;

    @FXML
    private TextField modelTextField;

    @FXML
    private TextField priceTextField;

    @FXML
    private TextField itemIdTextField;

    @FXML
    private TextField itemPiecesTextField;




    @FXML
    void initialize() {
        itemIdColumn.setCellValueFactory( cellData -> cellData.getValue().itemIdProperty().asObject());
        categoryNameColumn.setCellValueFactory(cellData -> cellData.getValue().categoryProperty());
        producerNameColumn.setCellValueFactory(cellData -> cellData.getValue().producerProperty());
        modelColumn.setCellValueFactory(cellData -> cellData.getValue().modelProperty());
        priceColumn.setCellValueFactory(cellData -> cellData.getValue().priceProperty().asObject());
        numberOnStockColumn.setCellValueFactory(cellData -> cellData.getValue().numberOnStockProperty().asObject());

        refreshTableView();
    }

    public void refreshTableView() {
        try {
            pricesTableView.setItems(StockDAO.getStockStatus());
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @FXML
    void addItem(ActionEvent event) {
        String category = categoryTextField.getText();
        String producer = producerTextField.getText();
        String model = modelTextField.getText();
        String price = priceTextField.getText();
        try {
            StockDAO.addNewItem(category, producer, model, price);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        refreshTableView();
    }

    @FXML
    void addPieces(ActionEvent event) {
        String id = itemIdTextField.getText();
        String pieces = itemPiecesTextField.getText();

        try {
            StockDAO.addItemPieces(id, pieces);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        refreshTableView();
    }
}
