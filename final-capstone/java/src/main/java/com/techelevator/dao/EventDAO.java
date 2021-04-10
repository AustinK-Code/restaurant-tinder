package com.techelevator.dao;

import com.techelevator.model.Event;

public interface EventDAO {

    Event getEventById(Long id);
    void createEvent(Event event);

}
