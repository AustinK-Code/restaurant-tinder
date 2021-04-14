<template>
  <div>
    <br />
    <br />
    <br />

    <div v-for="(invite, index) in invitation" v-bind:key="invite.id">
      <button v-on:click="getRestaurants(index)">{{ index + 1 }}</button>
    </div>


    <div
      v-for="(restaurant, index) in restaurantArr"
      v-bind:key="restaurant.name"
      v-bind="vote(index)"
    >
      <h4>{{ restaurant.name }}</h4>
      <h3>{{ restaurant.cuisine }}</h3>
      <p>{{ restaurant.address }}</p>
      <input
        v-on:click="restaurantVoteIndex = true"
        type="image"
        src="../pics/Thumbs_Up_Sign.svg"
        alt="fuck you"
      />
      <input
        v-on:click="restaurantVoteIndex = false"
        type="image"
        src="../pics/Thumbs_Down_Sign.svg"
        alt="fuck you"
      />

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
      restaurantVoteIndex: "",
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
      this.resetArray();
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
      this.restaurantArr.length = 0;
    },
        vote(index) {
      let putIn = "";
      if (index == 0) {
        putIn = this.invite.restaurantChoice1;
      }
      if (index == 1) {
        putIn = this.invite.restaurantChoice2;
      }
      if (index == 1) {
        putIn = this.invite.restaurantChoice3;
      }
      if (index == 1) {
        putIn = this.invite.restaurantChoice4;
      }
      if (index == 1) {
        putIn = this.invite.restaurantChoice5;
      }
      this.restaurantVoteIndex = putIn;
    },
  },
  computed: {
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