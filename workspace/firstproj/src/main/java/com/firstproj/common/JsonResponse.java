package com.firstproj.common;

public class JsonResponse {
    private String status;
    private Object Result;
    
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public Object getResult() {
        return Result;
    }
    public void setResult(Object result) {
        Result = result;
    }
}
