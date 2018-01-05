package app.model;

import javafx.beans.property.*;

public class Account {
    private IntegerProperty accId = new SimpleIntegerProperty();
    private IntegerProperty contractId = new SimpleIntegerProperty();
    private StringProperty firstName = new SimpleStringProperty("");
    private StringProperty secondName = new SimpleStringProperty("");
    private StringProperty address = new SimpleStringProperty("");
    private IntegerProperty postCode = new SimpleIntegerProperty();
    private StringProperty city = new SimpleStringProperty("");
    private StringProperty state = new SimpleStringProperty("");
    private IntegerProperty phone = new SimpleIntegerProperty();
    private IntegerProperty accPriv = new SimpleIntegerProperty();
    private StringProperty contractStart = new SimpleStringProperty("");
    private StringProperty contractEnd = new SimpleStringProperty("");
    private StringProperty login = new SimpleStringProperty("");
    private StringProperty pass = new SimpleStringProperty("");
    private DoubleProperty salary = new SimpleDoubleProperty();

    public Account() {
    }

    public Account(int accId, int contractId, String firstName, String secondName, String address,
                   int postCode, String city, String state, int phone, int accPriv, String contractStart,
                   String contractEnd, String login, String pass, Double salary) {
        this.accId.setValue(accId);
        this.contractId.setValue(contractId);
        this.firstName.setValue(firstName);
        this.secondName.setValue(secondName);
        this.address.setValue(address);
        this.postCode.setValue(postCode);
        this.city.setValue(city);
        this.state.setValue(state);
        this.phone.setValue(phone);
        this.accPriv.setValue(accPriv);
        this.contractStart.setValue(contractStart);
        this.contractEnd.setValue(contractEnd);
        this.login.setValue(login);
        this.pass.setValue(pass);
        this.salary.setValue(salary);


    }

    public int getAccId() {
        return accId.get();
    }

    public IntegerProperty accIdProperty() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId.set(accId);
    }

    public int getContractId() {
        return contractId.get();
    }

    public IntegerProperty contractIdProperty() {
        return contractId;
    }

    public void setContractId(int contractId) {
        this.contractId.set(contractId);
    }

    public String getFirstName() {
        return firstName.get();
    }

    public StringProperty firstNameProperty() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName.set(firstName);
    }

    public String getSecondName() {
        return secondName.get();
    }

    public StringProperty secondNameProperty() {
        return secondName;
    }

    public void setSecondName(String secondName) {
        this.secondName.set(secondName);
    }

    public String getAddress() {
        return address.get();
    }

    public StringProperty addressProperty() {
        return address;
    }

    public void setAddress(String address) {
        this.address.set(address);
    }

    public int getPostCode() {
        return postCode.get();
    }

    public IntegerProperty postCodeProperty() {
        return postCode;
    }

    public void setPostCode(int postCode) {
        this.postCode.set(postCode);
    }

    public String getCity() {
        return city.get();
    }

    public StringProperty cityProperty() {
        return city;
    }

    public void setCity(String city) {
        this.city.set(city);
    }

    public String getState() {
        return state.get();
    }

    public StringProperty stateProperty() {
        return state;
    }

    public void setState(String state) {
        this.state.set(state);
    }

    public int getPhone() {
        return phone.get();
    }

    public IntegerProperty phoneProperty() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone.set(phone);
    }

    public int getAccPriv() {
        return accPriv.get();
    }

    public IntegerProperty accPrivProperty() {
        return accPriv;
    }

    public void setAccPriv(int accPriv) {
        this.accPriv.set(accPriv);
    }

    public String getContractStart() {
        return contractStart.get();
    }

    public StringProperty contractStartProperty() {
        return contractStart;
    }

    public void setContractStart(String contractStart) {
        this.contractStart.set(contractStart);
    }

    public String getContractEnd() {
        return contractEnd.get();
    }

    public StringProperty contractEndProperty() {
        return contractEnd;
    }

    public void setContractEnd(String contractEnd) {
        this.contractEnd.set(contractEnd);
    }

    public String getLogin() {
        return login.get();
    }

    public StringProperty loginProperty() {
        return login;
    }

    public void setLogin(String login) {
        this.login.set(login);
    }

    public String getPass() {
        return pass.get();
    }

    public StringProperty passProperty() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass.set(pass);
    }

    public double getSalary() {
        return salary.get();
    }

    public DoubleProperty salaryProperty() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary.set(salary);
    }

    @Override
    public String toString() {
        return "Account{" +
                "accId=" + accId +
                ", contractId=" + contractId +
                ", firstName=" + firstName +
                ", secondName=" + secondName +
                ", address=" + address +
                ", postCode=" + postCode +
                ", city=" + city +
                ", state=" + state +
                ", phone=" + phone +
                ", accPriv=" + accPriv +
                ", contractStart=" + contractStart +
                ", contractEnd=" + contractEnd +
                ", login=" + login +
                ", pass=" + pass +
                ", salary=" + salary +
                '}';
    }

}
