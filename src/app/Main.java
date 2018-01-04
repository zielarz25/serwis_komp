package app;

import app.controller.RootController;
import javafx.application.Application;
import javafx.stage.Stage;

import java.sql.SQLException;

public class Main extends Application {
    private final String ROOT_LAYOUT_FXML_PATH = "../view/RootLayout.fxml";
    @Override
    public void start(Stage primaryStage) throws Exception{
//        Parent root = FXMLUtils.fxmlLoad(ROOT_LAYOUT_FXML_PATH);
//        Scene scene = new Scene(root);
//        primaryStage.setScene(scene);
//        primaryStage.show();

        RootController loginInstance = new RootController();
        loginInstance.showLoginWindow(primaryStage);

    }


    public static void main(String[] args) throws SQLException {
        launch(args);

    }
}
