package com.firstproj.common.validate;

import org.springframework.validation.BindingResult;

public interface Validator {
    public static void insertValidate(BindingResult result, Object obj);
}
