package com.techelevator.controller;

import com.techelevator.dao.RestaurantDAO;
import com.techelevator.model.Restaurant;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class RestaurantController {
    private RestaurantDAO restaurantDAO;

    public RestaurantController(RestaurantDAO dao){
        restaurantDAO = dao;
    }

    @RequestMapping(path="/restaurants", method = RequestMethod.GET)
        public List<Restaurant> getAllRestaurants(){
            return restaurantDAO.listAllRestaurants();
        }

        @RequestMapping(path= "/restaurants/{id}", method = RequestMethod.GET)
    public Restaurant getRestaurantById(@PathVariable long id){
        return restaurantDAO.getRestaurantById(id);
        }





}
