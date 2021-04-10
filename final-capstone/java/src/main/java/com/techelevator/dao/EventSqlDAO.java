package com.techelevator.dao;

import com.techelevator.model.Event;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class EventSqlDAO implements EventDAO{

    private JdbcTemplate jdbcTemplate;

    public EventSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    private String eventSql= "SELECT event_id, event_host_id, event_date, event_time, respond_by_date, respond_by_time, u.username\n" +
            "FROM events\n" +
            "INNER JOIN users u ON event_host_id = user_id";

    @Override
    public Event getEventById(Long id) {
        SqlRowSet results = jdbcTemplate.queryForRowSet(eventSql + " WHERE event_id = ?", id);
        if(results.next()){
            return mapRowToEvent(results);
        } else throw new RuntimeException("Event "+id+ " was not found");
    }

    @Override
    public void createEvent(Event event) {
        String sql= "INSERT INTO events (event_host_id, event_date, event_time, respond_by_date, respond_by_time)\n" +
                "VALUES(?,?,?,?,?)";
        jdbcTemplate.update(sql,event.getHostId(),event.getEventDate(),
                event.getEventTime(),event.getRespondByDate(),event.getRespondByTime());
    }



    private Event mapRowToEvent(SqlRowSet results){
        Event event = new Event();
        event.setEventId(results.getLong("event_id"));
        event.setEventDate(results.getDate("event_date"));
        event.setEventTime(results.getTime("event_time"));
        event.setHostId(results.getLong("event_host_id"));
        event.setHostUsername(results.getString("username"));
        event.setRespondByDate(results.getDate("respond_by_date"));
        event.setRespondByTime(results.getTime("respond_by_time"));
        return event;
    }

}
