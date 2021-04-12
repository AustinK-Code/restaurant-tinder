package com.techelevator.model;

public class Invitation {

    private Long invitationId;
    private Long eventId;
    private Long guestId;
    private String guestUsername;
    private Boolean vote1;
    private Boolean vote2;
    private Boolean vote3;
    private Boolean vote4;
    private Boolean vote5;

    public Invitation() {
    }


    public Long getGuestId() {
        return guestId;
    }

    public void setGuestId(Long guestId) {
        this.guestId = guestId;
    }

    public String getGuestUsername() {
        return guestUsername;
    }

    public void setGuestUsername(String guestUsername) {
        this.guestUsername = guestUsername;
    }

    public Long getInvitationId() {
        return invitationId;
    }

    public void setInvitationId(Long invitationId) {
        this.invitationId = invitationId;
    }

    public Boolean getVote1() {
        return vote1;
    }

    public void setVote1(Boolean vote1) {
        this.vote1 = vote1;
    }

    public Boolean getVote2() {
        return vote2;
    }

    public void setVote2(Boolean vote2) {
        this.vote2 = vote2;
    }

    public Boolean getVote3() {
        return vote3;
    }

    public void setVote3(Boolean vote3) {
        this.vote3 = vote3;
    }

    public Boolean getVote4() {
        return vote4;
    }

    public void setVote4(Boolean vote4) {
        this.vote4 = vote4;
    }

    public Boolean getVote5() {
        return vote5;
    }

    public void setVote5(Boolean vote5) {
        this.vote5 = vote5;
    }

    public Long getEventId() {
        return eventId;
    }

    public void setEventId(Long eventId) {
        this.eventId = eventId;
    }
}
