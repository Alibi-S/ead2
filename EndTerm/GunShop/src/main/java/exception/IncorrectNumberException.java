package exception;

public class IncorrectNumberException extends ArithmeticException{
    public IncorrectNumberException() {
        super("Bro, You entered the incorrect number");
    }

    public IncorrectNumberException(String s) {
        super(s);
    }
}