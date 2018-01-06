package app.model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Services {
    private IntegerProperty serviceId = new SimpleIntegerProperty();
    private StringProperty serviceName = new SimpleStringProperty("");

    public Services(int serviceId, String serviceName) {
        this.serviceId.setValue(serviceId);
        this.serviceName.setValue(serviceName);
    }

    public Services() {
    }

    public int getServiceId() {
        return serviceId.get();
    }

    public IntegerProperty serviceIdProperty() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId.set(serviceId);
    }

    public String getServiceName() {
        return serviceName.get();
    }

    public StringProperty serviceNameProperty() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName.set(serviceName);
    }

    @Override
    public String toString() {
        return serviceName.getValue();
    }
}
