package com.store.servlet.models;

public class UserOrdinary extends User{
    public UserOrdinary(String login, String password) {
        super(login, password);
    }
    public UserOrdinary(int id, String login, String password) {
        super(id, login, password);
    }
    public UserOrdinary(int id, String login, String password, double balance) {
        super(id, login, password, balance);
    }
}
