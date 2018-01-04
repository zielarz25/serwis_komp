package app.controller;

import app.model.LoginDAO;
import app.util.FXMLUtils;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ResourceBundle;


public class RootController {
    public static final String VIEW_LOGIN_POPUP_FXML = "../view/LoginPopup.fxml";
    @FXML
    TextField usernameTextField;

    @FXML
    PasswordField passwordField;

    @FXML
    Button loginButton;

    @FXML
    Label message;

    private String username;
    private String password;

    private ResourceBundle bundle;
    private FXMLLoader loader;

    private Stage loginStage;

    private AnchorPane loginLayout;

    RootController rootController;

    public void setRootController(RootController rootController) {
        this.rootController = rootController;
    }

    private static final String ROOT_ADMIN_FXML_PATH = "../view/RootAdminLayout.fxml";
    private static final String ROOT_USER_FXML_PATH = "../view/RootUserLayout.fxml";

    @FXML
    void initialize() {
        setRootController(this);
    }

    public RootController() {
        // Init login layout
//
        loader = new FXMLLoader();

        loader = FXMLUtils.getLoader(VIEW_LOGIN_POPUP_FXML);
        bundle = FXMLUtils.getResourceBundle();

    }

    @FXML
    public void login(ActionEvent event) throws SQLException {

        username = usernameTextField.getText();
        password = passwordField.getText();

//        if(LoginDAO.login(username, password)){
//
//            message.setTextFill(Color.rgb(0, 255, 0));
//            message.setText(bundle.getString("login.password.correct"));
//
//            // Start  application, if logged
//            RootAdminController appInstance = new RootAdminController();
//
//
//            try {
//                appInstance.startApp();
//            } catch (IOException e) {
//                System.err.println("Error launching app");
//                e.printStackTrace();
//            }
//            // Close login window
//            ((Node)(event.getSource())).getScene().getWindow().hide();
//
//
//        } else {
//
//            message.setTextFill(Color.rgb(255, 0, 0));
//            message.setText(bundle.getString("login.password.incorrect"));
//            System.out.println(loader.getResources());
//            usernameTextField.clear();
//            passwordField.clear();
//
//        }

        //////********
        int perm;
        if((perm = LoginDAO.login(username, password)) == -1){
            // Wrong pass
            message.setTextFill(Color.rgb(255, 0, 0));
            message.setText(bundle.getString("login.password.incorrect"));
            message.setVisible(true);
            System.out.println(loader.getResources());
            usernameTextField.clear();
            passwordField.clear();
        } else {
            // Admin
            if (perm == 1) {
                System.out.println("Logged as admin");
                message.setTextFill(Color.rgb(0, 255, 0));
                message.setText(bundle.getString("login.password.correct"));
                message.setVisible(true);


                FXMLLoader loader = FXMLUtils.getLoader(ROOT_ADMIN_FXML_PATH);
                Parent root = null;
                try {
                    root = loader.load();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Scene scene = new Scene(root);
                Stage currStage = (Stage) ((Node) event.getSource()).getScene().getWindow();
                currStage.setScene(scene);

                RootAdminController rootAdminController = loader.getController();
                rootAdminController.setRootController(rootController);


            }
            // User
            else if(perm == 0) {
                System.out.println("Logged as user");
                message.setTextFill(Color.rgb(0, 255, 0));
                message.setText(bundle.getString("login.password.correct"));
                message.setVisible(true);

                FXMLLoader loader = FXMLUtils.getLoader(ROOT_USER_FXML_PATH);
                Parent root = null;
                try {
                    root = loader.load();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Scene scene = new Scene(root);
                Stage currStage = (Stage) ((Node) event.getSource()).getScene().getWindow();
                currStage.setScene(scene);

                RootUserController rootUserController = loader.getController();
                rootUserController.setRootController(rootController);
            }

        }
    }


    public void showLoginWindow(Stage loginStage) {
        try {
            this.loginStage = loginStage;
            loginStage.setTitle(bundle.getString("app.title"));
            loginLayout = loader.load();

            // Show the scene
            Scene scene = new Scene(loginLayout);
            loginStage.setScene(scene);
            loginStage.show();

        } catch (IOException e) {
            System.err.println("Error while showing login window");
            e.printStackTrace();
        }
    }


}