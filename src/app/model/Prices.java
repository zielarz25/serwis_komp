package app.model;

import javafx.beans.property.*;

public class Prices {
    private IntegerProperty priceId = new SimpleIntegerProperty();
    private StringProperty priceName = new SimpleStringProperty("");
    private DoubleProperty priceValue = new SimpleDoubleProperty();

    public Prices(int priceId, String priceName, double priceValue) {
        this.priceId.setValue(priceId);
        this.priceName.setValue(priceName);
        this.priceValue.setValue(priceValue);
    }

    public Prices() {
    }

    public int getPriceId() {
        return priceId.get();
    }

    public IntegerProperty priceIdProperty() {
        return priceId;
    }

    public void setPriceId(int priceId) {
        this.priceId.set(priceId);
    }

    public String getPriceName() {
        return priceName.get();
    }

    public StringProperty priceNameProperty() {
        return priceName;
    }

    public void setPriceName(String priceName) {
        this.priceName.set(priceName);
    }

    public double getPriceValue() {
        return priceValue.get();
    }

    public DoubleProperty priceValueProperty() {
        return priceValue;
    }

    public void setPriceValue(double priceValue) {
        this.priceValue.set(priceValue);
    }
}
