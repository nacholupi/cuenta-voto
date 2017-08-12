package com.tripodes.voto.core.exception;

public class InvalidAmountException extends Exception {

    public InvalidAmountException(String totalAAgrupaciones) {
        super(totalAAgrupaciones);
    }
}
