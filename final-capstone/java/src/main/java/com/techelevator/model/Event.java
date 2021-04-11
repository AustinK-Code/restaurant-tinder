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


}
