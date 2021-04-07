package com.techelevator.model;

public class Restaurant {

    private String name;
    private Long restaurantId;
    private String cuisine;
    private String address;
    private String address2;
    private String city;
    private String region;
    private String zipCode;
    private String starRating;
    private String thumbnailImg;
    private String phoneNumber;
    private String openTime;
    private String closeTime;
    private String dayOfWeek;
    private String minutesOpen;


    public Restaurant(String name, Long id, String cuisine, String address, String address2, String city, String region, String zipCode, String starRating, String thumbnailImg, String phoneNumber, String openTime, String closeTime, String dayOfWeek, String minutesOpen) {
        this.name = name;
        this.restaurantId = id;
        this.cuisine = cuisine;
        this.address = address;
        this.address2 = address2;
        this.city = city;
        this.region = region;
        this.zipCode = zipCode;
        this.starRating = starRating;
        this.thumbnailImg = thumbnailImg;
        this.phoneNumber = phoneNumber;
        this.openTime = openTime;
        this.closeTime = closeTime;
        this.dayOfWeek = dayOfWeek;
        this.minutesOpen = minutesOpen;
    }

    public Restaurant(){}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(Long restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCuisine() {
        return cuisine;
    }

    public void setCuisine(String cuisine) {
        this.cuisine = cuisine;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getStarRating() {
        return starRating;
    }

    public void setStarRating(String starRating) {
        this.starRating = starRating;
    }

    public String getThumbnailImg() {
        return thumbnailImg;
    }

    public void setThumbnailImg(String thumbnailImg) {
        this.thumbnailImg = thumbnailImg;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public String getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(String closeTime) {
        this.closeTime = closeTime;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public String getMinutesOpen() {
        return minutesOpen;
    }

    public void setMinutesOpen(String minutesOpen) {
        this.minutesOpen = minutesOpen;
    }
}
