package com.techelevator.dao;

import com.techelevator.model.Restaurant;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class RestaurantSqlDAO implements RestaurantDAO {
    private JdbcTemplate jdbcTemplate;

    public RestaurantSqlDAO(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    String restaurantSql = "SELECT r.restaurant_name, r.restaurant_id, r.cuisine_id, restaurant_type,\n" +
            "r.phone_number,r.star_rating, r.thumbnail_img, \n" +
            "restaurant_location.location_id, restaurant_location.street_address, restaurant_location.address_2,\n" +
            "restaurant_location.city, restaurant_location.region,restaurant_location.zip_code,\n" +
            "restaurant_hours.restaurant_id, restaurant_hours.day_id, restaurant_hours.open_time,\n" +
            "restaurant_hours.close_time, restaurant_hours.duration_in_minutes, day_table.day_of_week\n" +
            "FROM restaurant r\n" +
            "INNER JOIN restaurant_location ON r.restaurant_id = restaurant_location.restaurant_id\n" +
            "INNER JOIN restaurant_hours ON r.restaurant_id = restaurant_hours.restaurant_id\n" +
            "INNER JOIN day_table ON restaurant_hours.day_id = day_table.day_id\n" +
            "INNER JOIN cuisine_type ON r.cuisine_id = cuisine_type.cuisine_id";

    @Override
    public List<Restaurant> listAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        SqlRowSet results = jdbcTemplate.queryForRowSet(restaurantSql);
        while(results.next()){
            Restaurant r = mapRowToRestaurant(results);
            list.add(r);
        }
        return list;
    }

    @Override
    public Restaurant getRestaurantById(long id) {
         String sql = restaurantSql + " WHERE restaurant_id = ?";
         SqlRowSet results = jdbcTemplate.queryForRowSet(sql,id);
         if(results.next()){
             return mapRowToRestaurant(results);
         } else {
             throw new RuntimeException("Restaurant "+id+ " was not found");
         }
    }

    private Restaurant mapRowToRestaurant(SqlRowSet results){
        Restaurant r = new Restaurant();
        r.setName(results.getString("restaurant_name"));
        r.setRestaurantId(results.getLong("restaurant_id"));
        r.setAddress(results.getString("address"));
        r.setAddress2(results.getString("address_2"));
        r.setCity(results.getString("city"));
        r.setCuisine(results.getString("restaurant_type"));
        r.setOpenTime(results.getLong("open_time"));
        r.setCloseTime(results.getLong("close_time"));
        r.setDayOfWeek(results.getString("day_of_week"));
        r.setMinutesOpen(results.getLong("duration_in_minutes"));
        r.setZipCode(results.getLong("zip_code"));
        r.setRegion(results.getString("region"));
        r.setStarRating(results.getLong("star_rating"));
        r.setThumbnailImg(results.getString("thumbnail_img"));
        r.setPhoneNumber(results.getLong("phone_number"));
        return r;
    }

}
