package app.model;

import javafx.beans.property.*;

public class Stock {
    private IntegerProperty itemId = new SimpleIntegerProperty();
    private StringProperty category = new SimpleStringProperty("");
    private StringProperty producer = new SimpleStringProperty("");
    private StringProperty model = new SimpleStringProperty("");
    private DoubleProperty price = new SimpleDoubleProperty();
    private IntegerProperty numberOnStock = new SimpleIntegerProperty();


    public Stock(int itemId, String category, String producer, String model, double price, int numberOnStock) {
        this.itemId.setValue(itemId);
        this.category.setValue(category);
        this.producer.setValue(producer);
        this.model.setValue(model);
        this.price.setValue(price);
        this.numberOnStock.setValue(numberOnStock);
    }

    public Stock() {

    }

    public int getItemId() {
        return itemId.get();
    }

    public IntegerProperty itemIdProperty() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId.set(itemId);
    }

    public String getCategory() {
        return category.get();
    }

    public StringProperty categoryProperty() {
        return category;
    }

    public void setCategory(String category) {
        this.category.set(category);
    }

    public String getProducer() {
        return producer.get();
    }

    public StringProperty producerProperty() {
        return producer;
    }

    public void setProducer(String producer) {
        this.producer.set(producer);
    }

    public String getModel() {
        return model.get();
    }

    public StringProperty modelProperty() {
        return model;
    }

    public void setModel(String model) {
        this.model.set(model);
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

    public int getNumberOnStock() {
        return numberOnStock.get();
    }

    public IntegerProperty numberOnStockProperty() {
        return numberOnStock;
    }

    public void setNumberOnStock(int numberOnStock) {
        this.numberOnStock.set(numberOnStock);
    }
}
