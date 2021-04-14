<template>
  <div>
    <br />
    <br />
    <br />

    <div v-for="(invite, index) in invitation" v-bind:key="invite.id">
      <button v-on:click="getRestaurants(index)">{{ index + 1 }}</button>
    </div>
    <div v-for="restaurant in restaurantArr" v-bind:key="restaurant.name">
      <h4>{{ restaurant.name }}</h4>
      <h3>{{ restaurant.cuisine }}</h3>
      <p>{{ restaurant.address }}</p>
      <input type="image" src="@./public/pics/Thumbs_Up_Sign.svg" alt="fuck you" />
      <button></button>

      <img
        class="thumbnail"
        v-bind:src="'../pics/' + restaurant.thumbnailImg"
        alt="thumbnail not available"
      />

      <!--- <button v-on:click="getEvent(21)"></button>--->
    </div>
  </div>
</template>

<script>
import BaseService from "../services/BaseService";

export default {
  components: {},
  data() {
    return {
      invitation: [],
      event: {},
      restaurantArr: [],
      restaurant: {
        name: "",
        cuisine: "",
        thumbnailImg: "",
      },
    };
  },
  methods: {
    getEvent(id) {
      BaseService.getEventById(id).then((response) => {
        this.event = response.data;
      });
    },
    getRestaurants(index) {
      this.resetArray()
      BaseService.getRestaurantById(
        this.invitation[index].restaurantChoice1
      ).then((results) => {
        this.restaurantArr.push(results.data);
      });
      BaseService.getRestaurantById(
        this.invitation[index].restaurantChoice2
      ).then((results) => {
        this.restaurantArr.push(results.data);
      });
      BaseService.getRestaurantById(
        this.invitation[index].restaurantChoice3
      ).then((results) => {
        this.restaurantArr.push(results.data);
      });
      BaseService.getRestaurantById(
        this.invitation[index].restaurantChoice4
      ).then((results) => {
        this.restaurantArr.push(results.data);
      });
      BaseService.getRestaurantById(
        this.invitation[index].restaurantChoice5
      ).then((results) => {
        this.restaurantArr.push(results.data);
      });
    },
    pushNum() {
      this.invNum.push(this.invCount);
    },
    resetArray() {
      this.restaurantArr.length = 0
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