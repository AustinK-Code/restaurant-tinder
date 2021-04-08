<template>
  <!-- This component is used to get the list of restaurants from the back end API. -->
  <div class="restaurant-list">
    <div
      v-for="restaurant in restaurantsOpenToday"
      v-bind:key="restaurant.id"
      class="restaurant">
      <span >
        {{ restaurant.name }}, {{ restaurant.cuisine }},
        {{ restaurant.address }}
        {{ restaurant.address2 }}, 
        {{ convertTime(restaurant.openTime) }} -
        {{ convertTime(restaurant.closeTime) }}
        <button v-if="restaurant.phoneNumber" id="myButton">
          Call to order
        </button>
        <img
          v-bind:src="restaurant.thumbnailImg"
          alt="thumbnail not available"
        />,
        <span v-if="isOpen(time, restaurant.openTime, restaurant.closeTime)"
          >We are open</span
        >
        <span v-else>We are closed</span>
      </span>
    </div>
  </div>
</template>

<script>
import services from "@/services/BaseService";
let today = new Date();

//get time right now
let time =
  today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

//get today's day as a word
var dayOfWeek = today;
var weekday = Array(7);
weekday[0] = "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";
var todayDay = weekday[dayOfWeek.getDay()];

export default {
  name: "restaurant-list",
  data() {
    return {
      todayDay,
      time,
      restaurants: [],
    };
  },
  methods: {
    //converts time from HH MM SS to 12 hour format
    convertTime(time) {
      let newTime = "";
      const hours = time.substr(0, 2);
      const minutes = time.substr(3, 5);
      if (hours >= 12) {
        newTime = hours - 12 + " PM";
        if (minutes > 0) {
          newTime = hours + ":" + minutes + "AM";
        }
      }
      if (hours < 12) {
        newTime = hours + " AM";
        if (minutes > 0) {
          newTime = hours + ":" + minutes + "AM";
        }
      }
      return newTime;
    },
    //Filters input for the search and pulls the array of locations
    filterInput(input) {
      if (this.hasLetters(input)) {
        services.searchLocationCity(input).then((response) => {
          this.restaurants = response.data;
        });
        return;
      } else {
        services.searchLocationZip(input).then((response) => {
          this.restaurants = response.data;
        });
      }
    },
    //checks to see if feild contains letters
    hasLetters(string) {
      return /^[a-zA-z]+$/.test(string);
    },
    //checks if restraunt is open
    isOpen(current, open, closed) {
      if (current > open && current < closed) {
        return true;
      } else return false;
    },
  },
  computed:{
    restaurantsOpenToday(){ return this.restaurants.filter(restraunt => restraunt.dayOfWeek == todayDay)}
  },
  created() {
    this.filterInput(this.$store.state.searchInput);
  },
};
</script>

<style>
.restaurant-list {
  background-image: url("../pics/happytable.jpg");
  background-size: cover;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  font-family: sans-serif;
  box-sizing: border-box;
}
.restaurant {
  background-color: rgba(212, 211, 211, 0.404);
}
#myButton {
  color: rgb(255, 255, 255);
  font-size: 20px;
  line-height: 10px;
  padding: 9px;
  border-radius: 45px;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  background-color: rgb(255, 88, 100);
  border: 2px solid rgb(255, 255, 255);
  display: inline-block;
}
</style>