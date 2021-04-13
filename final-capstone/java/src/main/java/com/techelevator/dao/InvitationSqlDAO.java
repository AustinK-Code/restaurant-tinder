package com.techelevator.dao;

import com.techelevator.model.Invitation;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class InvitationSqlDAO implements InvitationDAO {
    private JdbcTemplate jdbcTemplate;

    public InvitationSqlDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    String inviteSql = "SELECT invitation_id, invitation_choices.event_id, event_guest_id, events.restaurant_choice_1, events.restaurant_choice_2,\n" +
            "events.restaurant_choice_3, events.restaurant_choice_4, events.restaurant_choice_5, vote_1, vote_2, vote_3, vote_4, vote_5\n" +
            "FROM invitation_choices\n" +
            "INNER JOIN events ON events.event_id = invitation_choices.event_id \n";

    @Override
    public void createInvitation(Invitation invite) {
        String sql = "INSERT INTO invitation_choices(event_id, event_guest_id)\n" +
                "VALUES(?,?)";
        jdbcTemplate.update(sql, invite.getEventId(), invite.getGuestId());
    }

    @Override
    public Invitation getInvitationById(Long id) {
        Invitation invite = new Invitation();
        String sql = inviteSql + "WHERE invitation_id = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        if(results.next()){
            invite = mapRowToInvite(results);
        }
        return invite;
    }

    @Override
    public List<Invitation> getInvitesByEventId(Long eventId) {
        List<Invitation> invites = new ArrayList<>();
        String sql = inviteSql + "WHERE invitation_choices.event_id = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, eventId);
        while(results.next()){
            invites.add(mapRowToInvite(results));
        }
        return invites;
    }

    @Override
    public void voteForRestaurants(Invitation invite) {
        String sql = "UPDATE invitation_choices SET vote_1 = ?, vote_2 = ?, vote_3 = ?, vote_4 = ?, vote_5 = ?\n" +
                "WHERE invitation_id = ?";
        jdbcTemplate.update(sql,invite.getVote1(), invite.getVote2(), invite.getVote3(),
                invite.getVote4(), invite.getVote5(), invite.getInvitationId());

    }

    @Override
    public List<Invitation> getInvitesByUserId(Long id) {
        List<Invitation> invites = new ArrayList<>();
        String sql = inviteSql + "WHERE invitation_choices.event_guest_id = ? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        while(results.next()){
            invites.add(mapRowToInvite(results));
        }
        return invites;
    }

    private Invitation mapRowToInvite(SqlRowSet results){
        Invitation invite = new Invitation();
        invite.setEventId(results.getLong("event_id"));
        invite.setInvitationId(results.getLong("invitation_id"));
        invite.setGuestId(results.getLong("event_guest_id"));
        invite.setVote1(results.getBoolean("vote_1"));
        invite.setVote2(results.getBoolean("vote_2"));
        invite.setVote3(results.getBoolean("vote_3"));
        invite.setVote4(results.getBoolean("vote_4"));
        invite.setVote5(results.getBoolean("vote_5"));
        invite.setRestaurantChoice1(results.getLong("restaurant_choice_1"));
        invite.setRestaurantChoice2(results.getLong("restaurant_choice_2"));
        invite.setRestaurantChoice3(results.getLong("restaurant_choice_3"));
        invite.setRestaurantChoice4(results.getLong("restaurant_choice_4"));
        invite.setRestaurantChoice5(results.getLong("restaurant_choice_5"));
        return invite;
    }
}
