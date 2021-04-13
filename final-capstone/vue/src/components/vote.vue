<template>
  <div>
    <br />
    <br />
    <br />
    <h2>Vote for your Top Choices:</h2>
    <button v-on:click="getEvent(21)"></button>
    <button v-on:click=" getRestaurants()"></button>

    {{ restaurantArr }}

  </div>
</template>

<script>
import BaseService from "../services/BaseService";
export default {
  data() {
    return {
      invitation: [],
      event: {},
      restaurantArr: [],
      restaurant: {
        name: "",
        cuisine: "",
        thumbnailImg: "",
      }}
  },
  methods: {
    getEvent(id) {
      BaseService.getEventById(id).then((response) => {
        this.event = response.data;
      });
    },
    getRestaurants() {
        BaseService.getRestaurantById(this.invitation[0].restaurantChoice1).then(
          (results) => {this.restaurantArr.push(results);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice2).then(
          (results) => {this.restaurantArr.push(results);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice3).then(
          (results) => {this.restaurantArr.push(results);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice4).then(
          (results) => {this.restaurantArr.push(results);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice5).then(
          (results) => {this.restaurantArr.push(results);})
      
    },
  },
  created() {
    BaseService.getInvitesByUserId(this.$store.state.user.id).then(
      (response) => {
        this.invitation = response.data;
      }
    );
  },
};
</script>

<style>
</style>