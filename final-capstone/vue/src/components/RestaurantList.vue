<template>
  <!-- This component is used to get the list of restaurants from the back end API. -->
  <div class="restaurant-list">
    
    <div id="invite-instructions">
      <h2>Lets pick some restaurants to invite your friends to.</h2>
      <h3>
        Select 2 or more restaurants and then click Make an Event
        to get the party started!
      </h3>
      <button
      id="event-button"
      class="notEvent"
      v-on:click="showEventForm = true"
      v-if="event.length > 1 && event.length < 6"
      
    >
      Make an event
    </button>
    
    <div v-if="showEventForm"><create-event v-bind:formEvent="event" /></div>
    </div>
    <span id="restaurant-list-container">
      <div
        v-for="restaurant in restaurantsOpenToday"
        v-bind:key="restaurant.id"
        class="restaurant"
      >
        <span>
          <h2>{{ restaurant.name }}</h2>
          <div>
            <input class="checkbox"
              type="checkbox"
              v-bind:value="restaurant.restaurantId"
              v-bind:id="restaurant.restaurantId"
              v-model="event"
            /><b>Save to List</b>
          </div>
          <br>
          <div
            class="responsive"
            v-if="isOpen(time, restaurant.openTime, restaurant.closeTime)"
          >
            <!-- We are Open! -->
            <div class="image-cropper">
              <img
                src="/pics/New Open.svg"
                style="width: 150px; height: 150px"
              />
            </div>
          </div>

          <div v-else>
            <!--Currently Closed-->

            <div class="image-cropper">
              <img
                src="/pics/New Closed.svg"
                style="width: 100px; height: 100px"
              />
            </div>
          </div>
          
          <div>
            <b>{{ convertTime(restaurant.openTime) }} -
            {{ convertTime(restaurant.closeTime) }}</b>
          </div>
          <br>
            <div><b>{{ restaurant.cuisine }}</b></div>
          <div id="phoneNumber-alert-message">
            <button v-on:click="say(restaurant.name + ' phone number is ' + restaurant.phoneNumber)">
              Call to order
            </button>
          </div>
          <br>
<div><b>{{ restaurant.address }} {{ restaurant.address2 }}</b></div>
          <div id="directions">
            <button @click="webFunction(restaurant.name, restaurant.address)">
              Find Directions
            </button>
          </div>

          <img
            class="thumbnail"
            v-bind:src="'../pics/' + restaurant.thumbnailImg"
            alt="thumbnail not available"
          />
          
        </span>
      </div>
    </span>
  </div>
</template>

<script>
import services from "@/services/BaseService";
import CreateEvent from "./CreateEvent.vue";
let today = new Date();

//get time right now
let time =
  today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

//get today's day as a word
let dayOfWeek = today;
let weekday = Array(7);
weekday[0] = "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";
let todayDay = weekday[dayOfWeek.getDay()];

export default {
  components: {CreateEvent},
  name: "restaurant-list",
  data() {
    return {
      popupActivo: false,
      todayDay,
      time,
      restaurants: [],
      event: [],
      showEventForm: false,
    };
  },
  methods: {
    //converts time from HH MM SS to 12 hour format
    convertTime(time) {
      if (time === null) {
        return " ";
      }
      let newTime = "";
      const hours = time.substr(0, 2);
      const minutes = time.substr(3, 5);
      if (hours > 12) {
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
      if (hours == 12) {
        newTime = "Noon";
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
      return /^[a-z A-z]+$/.test(string);
    },
    //checks if restraunt is open
    isOpen(current, open, closed) {
      if (current > open && current < closed) {
        return true;
      } else return false;
    },
    addToEvent(restaurant) {
      this.event.push(restaurant.name);
    },
    //this method can be called to create an alert that prints a message
    say: function (message) {
      alert(message);
    },
    webFunction: function (name, nameTwo) {
      window.open(
        "https://www.google.com/maps/place/" + name + ", " + nameTwo,
        "_blank"
      );
    },
  },
  computed: {
    restaurantsOpenToday() {
      return this.restaurants.filter(
        (restaurant) => restaurant.dayOfWeek == todayDay
      );
    },
  },

  created() {
    this.filterInput(this.$store.state.searchInput);
  },
};
</script>

<style>
*,
*::before,
*::after {
  box-sizing: border-box;
}

#invite-instructions{
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 10px;
  padding: 5%;
  margin:5vh;
}
.restaurant-list {
  margin-top: 55px;
  background-image: url("../pics/happytable.jpg");
  background-size: cover;
  background-attachment: fixed;
  text-align: center;
  display: block;
  height: 100vh;
  width: 100vw;
  font-family: sans-serif;
  box-sizing: border-box;
}
.restaurant {
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 10px;
  background-size: 50%;
  margin: 5vw 5vh;
  padding: 5%;
}
#restaurant-list-container {
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  background-image: url("../pics/happytable.jpg");
  background-size: cover;
  background-attachment: fixed;
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

.thumbnail {
  border: 1px solid #ddd;
  border-radius: 4px;
  padding: 5px;
  width: 300px;
}
.responsive {
  max-width: 100%;
  height: auto;
}
button {
  color: rgb(255, 255, 255);
  font-size: 20px;
  line-height: 10px;
  padding: 9px;
  border-radius: 45px;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  background-color: rgb(255, 88, 100);
  border: 2px solid rgb(255, 255, 255);
  display: inline-block;
  margin: 1vw;
}
</style>