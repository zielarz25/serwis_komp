package app.model;

import javafx.beans.property.*;

public class Model {
    private IntegerProperty modelId = new SimpleIntegerProperty();
    private StringProperty modelName = new SimpleStringProperty("");
    private DoubleProperty price = new SimpleDoubleProperty();

    public Model() {
    }

    public Model(int modelId, String modelName, Double price) {
        this.modelId.setValue(modelId);
        this.modelName.setValue(modelName);
        this.price.setValue(price);
    }

    public int getModelId() {
        return modelId.get();
    }

    public IntegerProperty modelIdProperty() {
        return modelId;
    }

    public void setModelId(int modelId) {
        this.modelId.set(modelId);
    }

    public String getModelName() {
        return modelName.get();
    }

    public StringProperty modelNameProperty() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName.set(modelName);
    }

    public double getPrice() {
        return price.get();
    }

    public DoubleProperty priceProperty() {
        return price;
    }

    public void setPrice(double price) {
        this.price.set(price);
    }

    @Override
    public String toString() {
        return modelName.getValue();
    }
}
