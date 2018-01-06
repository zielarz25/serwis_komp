package app.controller;

import app.util.FXMLUtils;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.ResourceBundle;

public class RootUserController {

    RootController rootController;
    private ResourceBundle bundle = FXMLUtils.getResourceBundle();
    private String loggedUser;
    private static final String TAKE_REPAIR_FXML_PATH = "../view/TakeRepairPane.fxml";
    private static final String MANAGE_REPAIRS_FXML_PATH = "../view/ManageRepairsPane.fxml";
    @FXML
    private Label label;

    @FXML
    private BorderPane rootPane;

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
    void takeRepair(ActionEvent event) {

        Pane pane = null;
        FXMLLoader loader = FXMLUtils.getLoader(TAKE_REPAIR_FXML_PATH);

        try {
            pane = loader.load();
        } catch (IOException e) {
            e.printStackTrace();
        }

        TakeRepairController controller = loader.getController();
        controller.setUserLogin(loggedUser);
        rootPane.setCenter(pane);

    }

    @FXML
    void manageRepairs(ActionEvent event) {
        Pane pane = null;
        FXMLLoader loader = FXMLUtils.getLoader(MANAGE_REPAIRS_FXML_PATH);

        try {
            pane = loader.load();
        } catch (IOException e) {
            e.printStackTrace();
        }

        ManageRepairsController controller = loader.getController();
        controller.setUserLogin(loggedUser);
        rootPane.setCenter(pane);
    }


    @FXML
    void logout(ActionEvent event) {
        Stage currStage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        rootController.showLoginWindow(currStage);
    }
}
