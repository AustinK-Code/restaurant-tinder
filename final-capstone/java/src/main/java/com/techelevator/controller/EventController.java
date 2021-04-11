package com.techelevator.controller;

import com.techelevator.dao.EventDAO;
import com.techelevator.dao.InvitationDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.Event;
import com.techelevator.model.EventResult;
import com.techelevator.model.Invitation;
import com.techelevator.model.User;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class EventController {

    private EventDAO eventDAO;
    private InvitationDAO invitationDAO;
    private UserDAO userDAO;

    public EventController(EventDAO eventDAO, InvitationDAO invitationDAO, UserDAO userDAO) {
        this.eventDAO = eventDAO;
        this.invitationDAO = invitationDAO;
        this.userDAO = userDAO;
    }

    //create event
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/event", method = RequestMethod.POST)
    public void createEvent(@RequestBody Event event){
        eventDAO.createEvent(event);
    }
    //create Invite
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/event/invite", method = RequestMethod.POST)
    public void createInvite(@RequestBody Invitation invite){
        invitationDAO.createInvitation(invite);
    }
    //vote for restaurants
    @RequestMapping(path = "/event/invite/{id}", method = RequestMethod.PUT)
    public void updateVotes(@RequestBody Invitation invite, @PathVariable long id){
        invitationDAO.voteForRestaurants(invite);
    }
    //get event by id
    @RequestMapping(path = "/event/{id}", method = RequestMethod.GET)
    public Event getEventById(@PathVariable long id){
        return eventDAO.getEventById(id);
    }
    //get invite by id
    @RequestMapping(path = "/event/invite/{id}", method = RequestMethod.GET)
    public Invitation getInviteById(@PathVariable long id){
        return invitationDAO.getInvitationById(id);
    }
    //get invites by event id
    @RequestMapping(path = "/event/{id}/invites", method = RequestMethod.GET)
    public List<Invitation> getInvitesByEventId(@PathVariable("id") long eventId){
        return invitationDAO.getInvitesByEventId(eventId);
    }
    //get invites by userid
    @RequestMapping(path = "/users/{id}/invites", method = RequestMethod.GET)
    public List<Invitation> getInvitesByUserId(@PathVariable("id") long userId){
        return invitationDAO.getInvitesByUserId(userId);
    }
    //calculate votes
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/event/results", method = RequestMethod.POST)
    public void calculateResults(@RequestBody Event event){
        eventDAO.calculateResults(event);
    }
    //get results by eventId
    @RequestMapping(path = "/event/{id}/results", method = RequestMethod.GET)
        public EventResult getResultsById(@PathVariable("id") long eventId){
        return eventDAO.getResultsById(eventId);
    }
    //get all users
    @RequestMapping(path = "/users/list", method = RequestMethod.GET)
    public List<User> getAllUsers(){
        return userDAO.findAll();
    }
}
