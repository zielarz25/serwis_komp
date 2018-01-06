package app.model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Producers {
    private IntegerProperty producerId = new SimpleIntegerProperty();
    private StringProperty producerName = new SimpleStringProperty("");

    public Producers() {
    }

    public Producers(int producerId, String producerName) {
        this.producerId.setValue(producerId);
        this.producerName.setValue(producerName);
    }

    public int getProducerId() {
        return producerId.get();
    }

    public IntegerProperty producerIdProperty() {
        return producerId;
    }

    public void setProducerId(int producerId) {
        this.producerId.set(producerId);
    }

    public String getProducerName() {
        return producerName.get();
    }

    public StringProperty producerNameProperty() {
        return producerName;
    }

    public void setProducerName(String producerName) {
        this.producerName.set(producerName);
    }

    @Override
    public String toString() {
        return producerName.getValue();
    }
}
