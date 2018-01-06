package app.model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Categories {
    private IntegerProperty categoryId = new SimpleIntegerProperty();
    private StringProperty categoryName = new SimpleStringProperty("");

    public Categories() {
    }

    public Categories(int categoryId, String categoryName) {
        this.categoryId.setValue(categoryId);
        this.categoryName.setValue(categoryName);
    }

    public int getCategoryId() {
        return categoryId.get();
    }

    public IntegerProperty categoryIdProperty() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId.set(categoryId);
    }

    public String getCategoryName() {
        return categoryName.get();
    }

    public StringProperty categoryNameProperty() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName.set(categoryName);
    }

    @Override
    public String toString() {
        return categoryName.getValue();
    }
}
