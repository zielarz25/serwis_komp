package app.controller;

import app.util.FXMLUtils;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

import java.util.ResourceBundle;

public class RootAdminController {
    RootController rootController;
    private ResourceBundle bundle = FXMLUtils.getResourceBundle();
    private String loggedUser;
    private static final String MANAGE_ACC_FXML_PATH = "../view/ManageAccountsPane.fxml";

    @FXML
    private BorderPane rootPane;

    @FXML
    private Label label;

    public void setRootController(RootController rootController) {
        this.rootController = rootController;
    }

    public String getLoggedUser() {
        return loggedUser;
    }

    public void setLoggedUser(String loggedUser) {
        this.loggedUser = loggedUser;
    }

    @FXML
    void initialize() {
        Platform.runLater(()-> label.setText(bundle.getString("logged.user") + loggedUser));

    }

    @FXML
    void manageAccounts(ActionEvent event) {
        rootPane.setCenter(FXMLUtils.fxmlLoad(MANAGE_ACC_FXML_PATH));

    }

    @FXML
    void logout(ActionEvent event) {
        Stage currStage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        rootController.showLoginWindow(currStage);
    }

}