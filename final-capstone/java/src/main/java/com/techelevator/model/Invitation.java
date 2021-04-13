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
    private Long restaurantChoice1;
    private Long restaurantChoice2;
    private Long restaurantChoice3;
    private Long restaurantChoice4;
    private Long restaurantChoice5;

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
