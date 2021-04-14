<template>
  <div>
    <br />
    <br />
    <br />
    
    <div v-for="invite in invitation" v-bind:key="invite.id">
      
    <button v-on:click="getRestaurants()">Vote for Restaurants</button>
    <div v-for="restaurant in restaurantArr"
    v-bind:key="restaurant.name">
     <h4>{{restaurant.name}}</h4>
      <h3>{{restaurant.cuisine}}</h3>
      <p>{{restaurant.address}}</p>

      <img
            class="thumbnail"
            v-bind:src="'../pics/' + restaurant.thumbnailImg"
            alt="thumbnail not available"
          />
    </div>
     <!--- <button v-on:click="getEvent(21)"></button>--->
    </div>
  </div>
</template>

<script>
import BaseService from "../services/BaseService";

export default {
  components: { },
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
          (results) => {this.restaurantArr.push(results.data);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice2).then(
          (results) => {this.restaurantArr.push(results.data);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice3).then(
          (results) => {this.restaurantArr.push(results.data);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice4).then(
          (results) => {this.restaurantArr.push(results.data);})
                  BaseService.getRestaurantById(this.invitation[0].restaurantChoice5).then(
          (results) => {this.restaurantArr.push(results.data);})
      
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