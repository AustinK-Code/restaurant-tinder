package com.techelevator.model;

public class Restaurant {

    private String name;
    private Long restaurantId;
    private String cuisine;
    private String address;
    private String address2;
    private String city;
    private String region;
    private Long zipCode;
    private Long starRating;
    private String thumbnailImg;
    private Long phoneNumber;
    private Long openTime;
    private Long closeTime;
    private String dayOfWeek;
    private Long minutesOpen;


    public Restaurant(String name, Long id, String cuisine, String address, String address2, String city, String region, Long zipCode, Long starRating, String thumbnailImg, Long phoneNumber, Long openTime, Long closeTime, String dayOfWeek, Long minutesOpen) {
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

    public Long getZipCode() {
        return zipCode;
    }

    public void setZipCode(Long zipCode) {
        this.zipCode = zipCode;
    }

    public Long getStarRating() {
        return starRating;
    }

    public void setStarRating(Long starRating) {
        this.starRating = starRating;
    }

    public String getThumbnailImg() {
        return thumbnailImg;
    }

    public void setThumbnailImg(String thumbnailImg) {
        this.thumbnailImg = thumbnailImg;
    }

    public Long getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Long phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Long getOpenTime() {
        return openTime;
    }

    public void setOpenTime(Long openTime) {
        this.openTime = openTime;
    }

    public Long getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Long closeTime) {
        this.closeTime = closeTime;
    }

    public String getDayOfWeek() {
        return dayOfWeek;
    }

    public void setDayOfWeek(String dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public Long getMinutesOpen() {
        return minutesOpen;
    }

    public void setMinutesOpen(Long minutesOpen) {
        this.minutesOpen = minutesOpen;
    }
}
