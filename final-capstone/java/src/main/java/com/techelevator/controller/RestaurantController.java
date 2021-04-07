package com.techelevator.controller;

import com.techelevator.dao.RestaurantDAO;
import com.techelevator.model.Restaurant;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
public class RestaurantController {

  private RestaurantDAO restaurantDAO;

  public RestaurantController(RestaurantDAO restaurantDAO){
      this.restaurantDAO = restaurantDAO;
  }



    @RequestMapping(path = "/restaurants", method = RequestMethod.GET)
    public List<Restaurant> getAllRestaurants() {
        return restaurantDAO.listAllRestaurants();
    }


    @RequestMapping(path = "/restaurant/{id}", method = RequestMethod.GET)
    public Restaurant getRestaurantById(@PathVariable long id) {
        return restaurantDAO.getRestaurantById(id);
    }


    @RequestMapping(path = "/search/{zipCode}", method = RequestMethod.GET)
    public List<Restaurant> getRestaurantsByZip(@PathVariable String zipCode) {
        return restaurantDAO.getRestaurantsByZip(zipCode);
    }


    @RequestMapping(path = "/search/", method = RequestMethod.GET)
    public List<Restaurant> getRestaurantByCity(@RequestParam("city") String city){
        return restaurantDAO.getRestaurantByCity(city);
    }


}
