package com.techelevator.dao;

import com.techelevator.model.Event;
import com.techelevator.model.EventResult;
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

    @Override
    public void calculateResults(Event event) {
        String sql = "INSERT INTO event_choices_results(event_id,choice_1_result, choice_2_result, choice_3_result, choice_4_result, choice_5_result)\n" +
                "SELECT event_id, COUNT(*) filter (WHERE \"vote_1\") AS votes_1, COUNT(*) filter (WHERE \"vote_2\") AS votes_2,\n" +
                "COUNT(*) filter (WHERE \"vote_3\") AS votes_3, COUNT(*) filter (WHERE \"vote_4\") AS votes_4,COUNT(*) filter (WHERE \"vote_5\") AS votes_5\n" +
                "FROM invitation_choices\n" +
                "WHERE event_id = ?\n" +
                "GROUP BY event_id";
        jdbcTemplate.update(sql, event.getEventId());
    }
    @Override
    public EventResult getResultsById(Long id){
        String sql = "SELECT result_id, event_id,choice_1_result, choice_2_result, choice_3_result, choice_4_result, choice_5_result\n" +
                "FROM event_choices_results\n" +
                "WHERE event_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        if(results.next()){
            return mapRowToResult(results);
        }else throw new RuntimeException("Event "+id+ " was not found");
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

    private EventResult mapRowToResult(SqlRowSet results){
        EventResult r = new EventResult();
        r.setEventId(results.getLong("event_id"));
        r.setResultId(results.getLong("result_id"));
        r.setChoice1Result(results.getLong("choice_1_result"));
        r.setChoice2Result(results.getLong("choice_2_result"));
        r.setChoice3Result(results.getLong("choice_3_result"));
        r.setChoice4Result(results.getLong("choice_4_result"));
        r.setChoice5Result(results.getLong("choice_5_result"));
        return r;
    }

}
