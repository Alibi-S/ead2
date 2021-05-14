package com.store.servlet.exceptions;

public class IncorrectNumberException extends ArithmeticException{
    public IncorrectNumberException() {
        super("Incorrect number");
    }
    public IncorrectNumberException(String s) {
        super(s);
    }
}