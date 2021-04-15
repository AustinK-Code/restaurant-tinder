<template>
  <div>
    <br />
    <br />
    <br />
    <h2>My Invitations:</h2>
    <div v-for="(invite, index) in invitation" v-bind:key="invite.id">
      <button v-on:click="getRestaurants(index), (temp = index)" v-bind="temp">
        Invitation #{{ index + 1 }}
      </button>
      <!-- <button v-on:click="location.reload()">X</button> -->
      <button v-on:click="saveVotes(index)">
        Submit Votes for Invitation #{{ index + 1 }}
      </button>
    </div>

    <div
      v-for="(restaurant, index) in restaurantArr"
      v-bind:key="restaurant.name"
    >
      <h4>{{ restaurant.name }}</h4>
      <h3>{{ restaurant.cuisine }}</h3>
      <p>{{ restaurant.address }}</p>
      <input
        v-on:click="vote(true, index, temp)"
        type="image"
        src="../pics/Thumbs_Up_Sign.svg"
        alt="thumbs-up"
      />
      <input
        v-on:click="vote(false, index, temp)"
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
    <div
      class="hostedEvents"
      v-for="event in hostedEvents"
      v-bind:key="event.id"
    >
      <button v-on:click="showResults(event, event.eventId)">
        See Results for event # {{ event.eventId }}
      </button>
    </div>
    <div v-if="Object.keys(eventResults).length != 0">
      <div v-for="thing in thingArr" v-bind:key="thing.restaurantName">
        {{thing.restaurantName}}{{thing.voteTotal}}
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
      choiceResultArr: [],
      restaurantNameArr: [],
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
      eventResults: {},
      thing: {
        voteTotal: 0,
        restaurantName: "",
      },
      thingArr: [],
    };
  },
  methods: {
    saveVotes(index) {
      BaseService.updateVotes(this.invitation[index]);
    },
    showResults(event, eventId) {
      this.eventResults = {};
      BaseService.calculateResults(event).then(
        BaseService.getVotingResults(eventId).then((response) => {
          this.eventResults = response.data;
          this.findRestaurantName(eventId);
          this.findWinner()
        })
      )
      
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
      this.choiceResultArr.length = 0
      this.thingArr.length = 0
      this.choiceResultArr.push(this.eventResults.choice1Result);
      this.choiceResultArr.push(this.eventResults.choice2Result);
      this.choiceResultArr.push(this.eventResults.choice3Result);
      this.choiceResultArr.push(this.eventResults.choice4Result);
      this.choiceResultArr.push(this.eventResults.choice5Result);
      for (let x = 0; x < this.choiceResultArr.length; x++) {
        this.thing = {}
        this.thing.voteTotal = this.choiceResultArr[x]
        this.thing.restaurantName = this.restaurantNameArr[x];
        this.thingArr.push(this.thing);
      }
      this.thingArr.reverse(function(a,b){return b.voteTotal - a.voteTotal})

    },

    findRestaurantName(id) {
      let eventt = {};
      let restaurantt = {};
      BaseService.getEventById(id).then((response) => {
        eventt = response.data;
        BaseService.getDetails(eventt.restaurantChoice1).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        });
        BaseService.getDetails(eventt.restaurantChoice2).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        });
        BaseService.getDetails(eventt.restaurantChoice3).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        });
        BaseService.getDetails(eventt.restaurantChoice4).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        });
        BaseService.getDetails(eventt.restaurantChoice5).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        });
      });

      return eventt;
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