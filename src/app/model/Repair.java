package app.model;

import javafx.beans.property.*;

public class Repair {
    private IntegerProperty repairId = new SimpleIntegerProperty();
    private StringProperty repairInfo = new SimpleStringProperty("");
    private StringProperty status = new SimpleStringProperty("");
    private StringProperty startDate = new SimpleStringProperty("");

    //----------
    private StringProperty serviceName = new SimpleStringProperty("");
    private DoubleProperty price = new SimpleDoubleProperty();

    //-------
    private StringProperty producer = new SimpleStringProperty("");
    private StringProperty category = new SimpleStringProperty("");
    private StringProperty model = new SimpleStringProperty("");
    private DoubleProperty price2 = new SimpleDoubleProperty();
    // price


    public Repair() {
    }

    public Repair(int repairId, String repairInfo, String status, String startDate) {
        this.repairId.setValue(repairId);
        this.repairInfo.setValue(repairInfo);
        this.status.setValue(status);
        this.startDate.setValue(startDate);

    }

    public Repair(String serviceName, double price) {
        this.serviceName.setValue(serviceName);
        this.price.setValue(price);
    }

    public Repair(String producer, String category, String model, double price2) {
        this.price2.setValue(price2);
        this.producer.setValue(producer);
        this.category.setValue(category);
        this.model.setValue(model);
    }

    public int getRepairId() {
        return repairId.get();
    }

    public IntegerProperty repairIdProperty() {
        return repairId;
    }

    public void setRepairId(int repairId) {
        this.repairId.set(repairId);
    }

    public String getRepairInfo() {
        return repairInfo.get();
    }

    public StringProperty repairInfoProperty() {
        return repairInfo;
    }

    public void setRepairInfo(String repairInfo) {
        this.repairInfo.set(repairInfo);
    }

    public String getStatus() {
        return status.get();
    }

    public StringProperty statusProperty() {
        return status;
    }

    public void setStatus(String status) {
        this.status.set(status);
    }

    public String getStartDate() {
        return startDate.get();
    }

    public StringProperty startDateProperty() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate.set(startDate);
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

    public double getPrice() {
        return price.get();
    }

    public DoubleProperty priceProperty() {
        return price;
    }

    public void setPrice(double price) {
        this.price.set(price);
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

    public String getCategory() {
        return category.get();
    }

    public StringProperty categoryProperty() {
        return category;
    }

    public void setCategory(String category) {
        this.category.set(category);
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

    public double getPrice2() {
        return price2.get();
    }

    public DoubleProperty price2Property() {
        return price2;
    }

    public void setPrice2(double price2) {
        this.price2.set(price2);
    }

    @Override
    public String toString() {
        return "Repair{" +
                "repairId=" + repairId +
                ", repairInfo=" + repairInfo +
                ", status=" + status +
                ", startDate=" + startDate +
                '}';
    }
}
