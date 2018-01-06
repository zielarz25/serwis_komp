package app.controller;

import app.model.*;
import app.util.FXMLUtils;
import javafx.application.Platform;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;

import java.sql.SQLException;
import java.util.ResourceBundle;

public class ManageRepairsController {
    String activeUserName;
    int activeUserId;
    private int workId;

    private ObservableList<Integer> worksList;
    private ObservableList<Services> servicesList;
    private ObservableList<Producers> producersList;
    private ObservableList<Categories> categoriesList;
    private ObservableList<Model> modelsList;
    @FXML
    private ChoiceBox<Integer> worksListChoiceBox;

    @FXML
    private TableView<Repair> uslugiTableView;

    @FXML
    private TableColumn<Repair, String> nazwaUslugiTableColumn;

    @FXML
    private TableColumn<Repair, Double> priceTableColumn;

    @FXML
    private TableView<Repair> partsTableView;

    @FXML
    private TableColumn<Repair, String> categoryTableColumn;

    @FXML
    private TableColumn<Repair, String> producerTableColumn;

    @FXML
    private TableColumn<Repair, String> modelTableColumn;

    @FXML
    private TableColumn<Repair, Double> price2TableColumn;

    @FXML
    private ChoiceBox<Services> servicesChoiceBox;

    @FXML
    private ChoiceBox<Categories> categoriesChoiceBox;

    @FXML
    private ChoiceBox<Producers> producersChoiceBox;

    @FXML
    private ChoiceBox<Model> modelChoiceBox;

    @FXML
    void endRepair(ActionEvent event) {
        try {
            RepairDAO.endRepair(workId+"");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        refreshTableView1();
        refreshTableView2();
        initChoiceBox();
    }

    @FXML
    void changePartConfirm(ActionEvent event) {
        String partId = modelChoiceBox.getValue().getModelId()+"";
        try {
            ModelDAO.exchangeClientPart(workId+"", partId);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        refreshTableView2();
    }

    @FXML
    void producerConfirm(ActionEvent event) {
        String categoryId = categoriesChoiceBox.getValue().getCategoryId()+"";
        String producerId = producersChoiceBox.getValue().getProducerId()+"";
        try {
            modelsList = ModelDAO.getAvaliblePartModels(categoryId, producerId);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        modelChoiceBox.setItems(modelsList);
    }

    @FXML
    void doService(ActionEvent event) {
        String serviceId = servicesChoiceBox.getValue().getServiceId()+"";
        try {
            ServicesDAO.addWork( serviceId, workId+"", activeUserId+"");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        refreshTableView1();
    }

    private void initChoiceBoxCategories() {

        try {
            categoriesList = CategoriesDAO.getAvalibleCategories();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        categoriesChoiceBox.setItems(categoriesList);


    }

    private void initChoiceBoxProducers() {

        try {
            producersList = ProducersDAO.getAvalibleProducers();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        producersChoiceBox.setItems(producersList);

    }

    @FXML
    void showActiveWorks(ActionEvent event) {
       nazwaUslugiTableColumn.setCellValueFactory( cellData -> cellData.getValue().serviceNameProperty());
       priceTableColumn.setCellValueFactory(cellData -> cellData.getValue().priceProperty().asObject());

       categoryTableColumn.setCellValueFactory(cellData -> cellData.getValue().categoryProperty());
       producerTableColumn.setCellValueFactory(cellData -> cellData.getValue().producerProperty());
       modelTableColumn.setCellValueFactory(cellData -> cellData.getValue().modelProperty());
       price2TableColumn.setCellValueFactory(cellData -> cellData.getValue().price2Property().asObject());


       workId = worksListChoiceBox.getValue();
        refreshTableView1();
        refreshTableView2();
        initChoiceBox2();

        initChoiceBoxCategories();
        initChoiceBoxProducers();

    }
    @FXML
    void initialize(){
        Platform.runLater(()-> initChoiceBox());


    }

    public void refreshTableView1() {

        try {
            uslugiTableView.setItems(RepairDAO.getAllDoneRepairs(workId+""));
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public void refreshTableView2() {

        try {
            partsTableView.setItems(RepairDAO.getChangedParts(workId+""));
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void initChoiceBox() {
        getLoggedUserId();
        try {
            worksList = RepairDAO.getAllUsersActiveWorksIDs(activeUserId+"");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        worksListChoiceBox.setItems(worksList);
    }
    private void initChoiceBox2() {

        try {
            servicesList = ServicesDAO.getAvalibleServices();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        servicesChoiceBox.setItems(servicesList);
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
