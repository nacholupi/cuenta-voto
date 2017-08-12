package com.tripodes.voto.core.exception;

public class ForeignKeyException extends Exception {

    public ForeignKeyException(Exception e) {
        super(e);
    }
}
