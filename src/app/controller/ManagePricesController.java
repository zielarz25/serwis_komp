package app.controller;

import app.model.Prices;
import app.model.PricesDAO;
import app.util.FXMLUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.TextFieldTableCell;
import javafx.scene.layout.BorderPane;
import javafx.util.converter.DoubleStringConverter;

import java.sql.SQLException;
import java.util.ResourceBundle;

public class ManagePricesController {


    @FXML
    private TextField serviceNameTextField;

    @FXML
    private TextField priceTextField;

    @FXML
    private TableView<Prices> pricesTableView;

    @FXML
    private TableColumn<Prices, Integer> serviceIdColumn;

    @FXML
    private TableColumn<Prices, String> serviceNameColumn;

    @FXML
    private TableColumn<Prices, Double> servicePriceColumn;

    @FXML
    void initialize() {
        serviceIdColumn.setCellValueFactory( cellData -> cellData.getValue().priceIdProperty().asObject());
        serviceNameColumn.setCellValueFactory(cellData -> cellData.getValue().priceNameProperty());
        servicePriceColumn.setCellValueFactory(cellData -> cellData.getValue().priceValueProperty().asObject());

        serviceNameColumn.setCellFactory(TextFieldTableCell.<Prices>forTableColumn());
        servicePriceColumn.setCellFactory(TextFieldTableCell.<Prices, Double>forTableColumn(new DoubleStringConverter()));
        pricesTableView.setEditable(true);

        refreshTableView();
    }

    public void refreshTableView() {

        try {
            pricesTableView.setItems(PricesDAO.getAllPrices());
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    public void editColumnItem(TableColumn.CellEditEvent<Prices, String> e) throws SQLException {

        serviceNameColumn.setCellValueFactory(cellData -> cellData.getValue().priceNameProperty());
        servicePriceColumn.setCellValueFactory(cellData -> cellData.getValue().priceValueProperty().asObject());


        String colId = e.getTableColumn().getId();
        String colName = convertColNames(colId);
        System.out.println(colId);
        System.out.println(colName);

        // AccountID of account to be edited
        int index = (e.getTableView().getItems().get(e.getTablePosition().getRow()).getPriceId());
//        System.out.println(index);

        Object newValue = e.getNewValue();
//        System.out.println(newValue.toString());  // e.getNewValue().toString() nie działą

        PricesDAO.updatePrices(index, colName, newValue);
    }

    /**
     * Method converts TableView columns names to corresponding in Database
     * @param colId - column name in TableView
     *
     * @return - column name in Database
     */
    private String convertColNames(String colId) {
        String colName = "";
        switch (colId){
            case "serviceNameColumn":
                colName = "NAZWA_USLUGI";
                break;
            case "servicePriceColumn":
                colName = "CENA";
                break;
        }
        return colName;
    }

    @FXML
    void addPrice(ActionEvent event) {

    }


}
