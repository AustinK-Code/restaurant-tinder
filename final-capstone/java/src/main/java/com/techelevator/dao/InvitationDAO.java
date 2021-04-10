package com.techelevator.dao;

import com.techelevator.model.Invitation;

import java.util.List;

public interface InvitationDAO {

    void createInvitation(Invitation invite);
    Invitation getInvitationById(Long id);
    List<Invitation> getInvitesByEventId(Long eventId);
    void voteForRestaurants(Invitation invite);
    List<Invitation> getInvitesByUserId(Long id);
}
