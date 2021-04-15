<template>
  <div>
    <br />
    <br />
    <br />
    <h2>My Invitations:</h2>
    <div v-for="(invite, index) in invitation" v-bind:key="invite.id">
      <button v-on:click="getRestaurants(index), temp=index" v-bind="temp" >Invitation #{{ index + 1 }}</button>
      <!-- <button v-on:click="location.reload()">X</button> -->
      <button v-on:click="saveVotes(index)">Submit Votes for Invitation #{{index + 1}}</button>
      
    </div>


    <div
      
      v-for="(restaurant, index) in restaurantArr"
      v-bind:key="restaurant.name"
    >
      
      <h4>{{ restaurant.name }}</h4>
      <h3>{{ restaurant.cuisine }}</h3>
      <p>{{ restaurant.address }}</p>
      <input
        v-on:click="vote(true,index,temp)"
        type="image"
        src="../pics/Thumbs_Up_Sign.svg"
        alt="thumbs-up"
      />
      <input
        v-on:click="vote(false,index,temp)"
        type="image"
        src="../pics/Thumbs_Down_Sign.svg"
        alt="thumbs-down"
      />

      <img
        class="thumbnail"
        v-bind:src="'../pics/' + restaurant.thumbnailImg"
        alt="thumbnail not available"
      />

      <!--- <button v-on:click="getEvent(21)"></button>--->
    </div>
    <h2>Events I'm Hosting:</h2>
    <div class="hostedEvents" v-for="event in hostedEvents" v-bind:key="event.id">
     <button v-on:click="showResults(event,event.eventId)">See Results for event # {{event.eventId}}</button>
     
     <div v-if="Object.keys(eventResults).length != 0">{{eventResults}}test
       <div></div>
     </div>
     


    
    </div>
     
  </div>
 
</template>

<script>
import BaseService from "../services/BaseService";

export default {
  components: {},
  data() {
    return {
      result: {},
      temp: "",
      restaurantVoteIndex: "",
      invitation: [],
      event: {},
      restaurantArr: [],
      restaurant: {
        name: "",
        cuisine: "",
        thumbnailImg: "",
      },
      hostedEvents: "",
      eventResults: "",
    };
  },
  methods: {
    saveVotes(index) {
      BaseService.updateVotes(this.invitation[index]);
    },
    getResults(event) {
      BaseService.calculateResults(event);
    },
    showResults(eventId) {
      BaseService.getVotingResults(eventId).then((response) => {
        this.eventResults = response.data;
      });
    },
    getEvent(id) {
      BaseService.getEventById(id).then((response) => {
        this.event = response.data;
      });
    },
    getRestaurants(index) {
      this.resetArray();
      if (this.invitation[index].restaurantChoice1 != 0) {
        BaseService.getRestaurantById(
          this.invitation[index].restaurantChoice1
        ).then((results) => {
          this.restaurantArr.push(results.data);
        });
      }

      if (this.invitation[index].restaurantChoice2 != 0) {
        BaseService.getRestaurantById(
          this.invitation[index].restaurantChoice2
        ).then((results) => {
          this.restaurantArr.push(results.data);
        });
      }

      if (this.invitation[index].restaurantChoice3 != 0) {
        BaseService.getRestaurantById(
          this.invitation[index].restaurantChoice3
        ).then((results) => {
          this.restaurantArr.push(results.data);
        });
      }

      if (this.invitation[index].restaurantChoice4 != 0) {
        BaseService.getRestaurantById(
          this.invitation[index].restaurantChoice4
        ).then((results) => {
          this.restaurantArr.push(results.data);
        });
      }

      if (this.invitation[index].restaurantChoice5 != 0) {
        BaseService.getRestaurantById(
          this.invitation[index].restaurantChoice5
        ).then((results) => {
          this.restaurantArr.push(results.data);
        });
      }
    },
    pushNum() {
      this.invNum.push(this.invCount);
    },
    resetArray() {
      this.restaurantArr.length = 0;
    },
    vote(value, index, arrPos) {
      if (index == 0) {
        this.invitation[arrPos].vote1 = value;
      }
      if (index == 1) {
        this.invitation[arrPos].vote2 = value;
      }
      if (index == 2) {
        this.invitation[arrPos].vote3 = value;
      }
      if (index == 3) {
        this.invitation[arrPos].vote4 = value;
      }
      if (index == 4) {
        this.invitation[arrPos].vote5 = value;
      }
    },
    findWinner() {
      let arr = [];
      arr.push(this.eventResults.choice1Results);
      arr.push(this.eventResults.choice2Results);
      arr.push(this.eventResults.choice3Results);
      arr.push(this.eventResults.choice4Results);
      arr.push(this.eventResults.choice5Results);
    },
    findRestaurantName(id) {
      let eventt = {};
      let restaurantt = {};
      BaseService.getEventById(id)
        .then((response) => {
          eventt = response.data;
        })
        .then(
          BaseService.getDetails(eventt.restaurantId).then((response) => {
            restaurantt = response.data;
          })
        );
      return restaurantt.name;
    },
  },
  created() {
    BaseService.getInvitesByUserId(this.$store.state.user.id).then(
      (response) => {
        this.invitation = response.data;
      }
    ),
      BaseService.getEventsByHostId(this.$store.state.user.id).then(
        (response) => {
          this.hostedEvents = response.data;
        }
      );
  },
};
</script>

<style>
</style>