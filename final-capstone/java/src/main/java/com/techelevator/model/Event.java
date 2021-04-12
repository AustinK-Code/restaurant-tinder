package com.techelevator.model;

import java.sql.Time;
import java.time.LocalTime;
import java.util.Date;


public class Event {

    private Long eventId;
    private Long hostId;
    private String hostUsername;
    private Date eventDate;
    private LocalTime eventTime;
    private Date respondByDate;
    private LocalTime respondByTime;
    private Long restaurantChoice1;
    private Long restaurantChoice2;
    private Long restaurantChoice3;
    private Long restaurantChoice4;
    private Long restaurantChoice5;


    public Event(){}

    public Event(Long eventId, Long hostId, String hostUsername, Date eventDate, LocalTime eventTime, Date respondByDate,
                 LocalTime respondByTime) {
        this.eventId = eventId;
        this.hostId = hostId;
        this.hostUsername = hostUsername;
        this.eventDate = eventDate;
        this.eventTime = eventTime;
        this.respondByDate = respondByDate;
        this.respondByTime = respondByTime;


    }

    public Long getEventId() {
        return eventId;
    }

    public void setEventId(Long eventId) {
        this.eventId = eventId;
    }

    public Long getHostId() {
        return hostId;
    }

    public void setHostId(Long hostId) {
        this.hostId = hostId;
    }

    public String getHostUsername() {
        return hostUsername;
    }

    public void setHostUsername(String hostUsername) {
        this.hostUsername = hostUsername;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public LocalTime getEventTime() {
        return eventTime;
    }

    public void setEventTime(LocalTime eventTime) {
        this.eventTime = eventTime;
    }

    public Date getRespondByDate() {
        return respondByDate;
    }

    public void setRespondByDate(Date respondByDate) {
        this.respondByDate = respondByDate;
    }

    public LocalTime getRespondByTime() {
        return respondByTime;
    }

    public void setRespondByTime(LocalTime respondByTime) {
        this.respondByTime = respondByTime;
    }

    public Long getRestaurantChoice1() {
        return restaurantChoice1;
    }

    public void setRestaurantChoice1(Long restaurantChoice1) {
        this.restaurantChoice1 = restaurantChoice1;
    }

    public Long getRestaurantChoice2() {
        return restaurantChoice2;
    }

    public void setRestaurantChoice2(Long restaurantChoice2) {
        this.restaurantChoice2 = restaurantChoice2;
    }

    public Long getRestaurantChoice3() {
        return restaurantChoice3;
    }

    public void setRestaurantChoice3(Long restaurantChoice3) {
        this.restaurantChoice3 = restaurantChoice3;
    }

    public Long getRestaurantChoice4() {
        return restaurantChoice4;
    }

    public void setRestaurantChoice4(Long restaurantChoice4) {
        this.restaurantChoice4 = restaurantChoice4;
    }

    public Long getRestaurantChoice5() {
        return restaurantChoice5;
    }

    public void setRestaurantChoice5(Long restaurantChoice5) {
        this.restaurantChoice5 = restaurantChoice5;
    }


}
