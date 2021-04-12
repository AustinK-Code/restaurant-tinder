package com.techelevator.dao;

import com.techelevator.model.Event;
import com.techelevator.model.EventResult;

public interface EventDAO {

    Event getEventById(Long id);
    void createEvent(Event event);
    void calculateResults(Event event);
    public EventResult getResultsById(Long id);
    public Long getCurrentEventId(Long userId);

}
