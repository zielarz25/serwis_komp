package app;

import app.util.DBUtils;
import app.util.FXMLUtils;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.sql.SQLException;

public class Main extends Application {
    private final String ROOT_LAYOUT_FXML_PATH = "../view/RootLayout.fxml";
    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLUtils.fxmlLoad(ROOT_LAYOUT_FXML_PATH);
        Scene scene = new Scene(root);
        primaryStage.setScene(scene);
        primaryStage.show();

    }


    public static void main(String[] args) throws SQLException {
        launch(args);

    }
}
