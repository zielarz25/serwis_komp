package app.controller;

import app.util.FXMLUtils;
import javafx.application.Platform;
import javafx.fxml.FXML;
import javafx.scene.control.Label;

import java.util.ResourceBundle;

public class RootAdminController {
    RootController rootController;
    private ResourceBundle bundle = FXMLUtils.getResourceBundle();
    private String loggedUser;
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
}
