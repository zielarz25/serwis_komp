package app.model;

import javafx.beans.property.*;

public class Cashier {
    private IntegerProperty workId = new SimpleIntegerProperty();
    private StringProperty clientFirstName = new SimpleStringProperty("");
    private StringProperty clientSecondName = new SimpleStringProperty("");
    private StringProperty startDate = new SimpleStringProperty("");
    private StringProperty endDate = new SimpleStringProperty("");
    private StringProperty status = new SimpleStringProperty("");
    private DoubleProperty toPay = new SimpleDoubleProperty();

    public Cashier(int workId, String clientFirstName, String clientSecondName, String startDate, String endDate, String status, double toPay) {
        this.workId.setValue(workId);
        this.clientFirstName.setValue(clientFirstName);
        this.clientSecondName.setValue(clientSecondName);
        this.startDate.setValue(startDate);
        this.endDate.setValue(endDate);
        this.status.setValue(status);
        this.toPay.setValue(toPay);
    }

    public Cashier() {
    }

    public int getWorkId() {
        return workId.get();
    }

    public IntegerProperty workIdProperty() {
        return workId;
    }

    public void setWorkId(int workId) {
        this.workId.set(workId);
    }

    public String getClientFirstName() {
        return clientFirstName.get();
    }

    public StringProperty clientFirstNameProperty() {
        return clientFirstName;
    }

    public void setClientFirstName(String clientFirstName) {
        this.clientFirstName.set(clientFirstName);
    }

    public String getClientSecondName() {
        return clientSecondName.get();
    }

    public StringProperty clientSecondNameProperty() {
        return clientSecondName;
    }

    public void setClientSecondName(String clientSecondName) {
        this.clientSecondName.set(clientSecondName);
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

    public String getEndDate() {
        return endDate.get();
    }

    public StringProperty endDateProperty() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate.set(endDate);
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

    public double getToPay() {
        return toPay.get();
    }

    public DoubleProperty toPayProperty() {
        return toPay;
    }

    public void setToPay(double toPay) {
        this.toPay.set(toPay);
    }
}
