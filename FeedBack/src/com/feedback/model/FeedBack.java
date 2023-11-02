package com.feedback.model;

/**
 * User.java
 * This is a model class representing a User entity
 */
public class FeedBack {
    protected int id;
    protected String name;
    protected String email;
    protected String address;
    protected String feedback; // New field for feedback

    public FeedBack() {
    }

    public FeedBack(String name, String email, String address, String feedback) {
        super();
        this.name = name;
        this.email = email;
        this.address = address;
        this.feedback = feedback;
    }

    public FeedBack(int id, String name, String email, String address, String feedback) {
        super();
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.feedback = feedback;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }
}
