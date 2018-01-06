package app.model;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Repair {
    private IntegerProperty repairId = new SimpleIntegerProperty();
    private StringProperty repairInfo = new SimpleStringProperty("");
    private StringProperty status = new SimpleStringProperty("");
    private StringProperty startDate = new SimpleStringProperty("");

    public Repair() {
    }

    public Repair(int repairId, String repairInfo, String status, String startDate) {
        this.repairId.setValue(repairId);
        this.repairInfo.setValue(repairInfo);
        this.status.setValue(status);
        this.startDate.setValue(startDate);

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
