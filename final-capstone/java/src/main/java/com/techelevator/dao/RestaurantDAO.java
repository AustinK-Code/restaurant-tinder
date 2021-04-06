package com.techelevator.dao;

import com.techelevator.model.Restaurant;

import java.util.List;

public interface RestaurantDAO {

    List<Restaurant> listAllRestaurants();

    Restaurant getRestaurantById(long id);


}
