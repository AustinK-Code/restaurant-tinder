<template>
  <div class="my-events">
    <br />
    <br />
    <br />
    <h1 id="invitations-header">My Invitations:</h1>
    <div id="invited" v-for="(invite, index) in invitation" v-bind:key="invite.id">
      <button id="invite" v-on:click="getRestaurants(index), (temp = index)" v-bind="temp">
        Invitation #{{ invite.eventId }}
      </button>
      <!-- <button v-on:click="location.reload()">X</button> -->
      <button id="invite" v-on:click="saveVotes(index)">
        Submit Votes for Invitation #{{ index + 1 }}
      </button>
    </div>

    <div id="array"
      v-for="(restaurant, index) in restaurantArr"
      v-bind:key="index"
    >
      <h2 id='restaurant-name'>{{ restaurant.name }}</h2>
      <h3>{{ restaurant.cuisine }}</h3>
      <p>{{ restaurant.address }}</p>
      <input id="up"
        v-on:click="vote(true, index, temp)"
        type="image"
        src="../pics/Thumbs_Up_Sign.svg"
        alt="thumbs-up"
      />
      <input id="up"
        v-on:click="vote(false, index, temp)"
        type="image"
        src="../pics/Thumbs_Down_Sign.svg"
        alt="thumbs-down"
      />

      <img id="restaurant-img"
        class="thumbnail"
        v-bind:src="'../pics/' + restaurant.thumbnailImg"
        alt="thumbnail not available"
      />

      <!--- <button v-on:click="getEvent(21)"></button>--->
    </div>
    <h2 id='invitations-header'>Events I'm Hosting:</h2>
    <h3 id='invitations'>Click once for score <br/> Click twice to reveal restaurant names</h3>
    <div
      class="hostedEvents"
      v-for="event in hostedEvents"
      v-bind:key="event.id"
    >
      <button id="invite" v-on:click="showResults(event, event.eventId)">
        See Results for event # {{ event.eventId }}
      </button>
    </div>
    <div id='score' v-if="Object.keys(eventResults).length != 0">
      <div v-for="thing in thingArr" v-bind:key="thing.restaurantName">
        <div v-if="thing.voteTotal > 0">
        Score: {{thing.voteTotal}}      
        Restaurant: {{thing.restaurantName}}
        </div>
        
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
      this.choiceResultArr.length = []
      this.thingArr.length = []
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
      this.thingArr.sort(function(a,b){return b.voteTotal - a.voteTotal})

    },

    findRestaurantName(id) {
      let eventt = {};
      let restaurantt = {};
      BaseService.getEventById(id).then((response) => {
        eventt = response.data;
        if(eventt.restaurantChoice1 > 0){
        BaseService.getDetails(eventt.restaurantChoice1).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name)
        })}
        if(eventt.restaurantChoice2 > 0){
        BaseService.getDetails(eventt.restaurantChoice2).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        })}
        if(eventt.restaurantChoice3 > 0){
        BaseService.getDetails(eventt.restaurantChoice3).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        })}
        if(eventt.restaurantChoice4 > 0){
        BaseService.getDetails(eventt.restaurantChoice4).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        })}
        if(eventt.restaurantChoice5 > 0){
        BaseService.getDetails(eventt.restaurantChoice5).then((response) => {
          restaurantt = response.data;
          this.restaurantNameArr.push(restaurantt.name);
        })}
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
#invite {
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
#invite:hover {
  color: rgb(82, 18, 124);
  font-size: 20px;
  line-height: 10px;
  padding: 9px;
  border-radius: 45px;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  background-color: rgb(142, 247, 229);
  border: 2px solid rgb(82, 18, 124);
  display: inline-block;
}
#up {
  width: 20%;
  height: 20%;
  padding: 10px;
  align-items: center;
  display: inline-flex;
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 50%;
  background-size: 20%;
  margin: 2vw 4vh;
  padding: 1%;
}
#up:hover {
  color: rgb(82, 18, 124);
  font-size: 20px;
  line-height: 10px;
  padding: 9px;
  border-radius: 45px;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  background-color: rgb(142, 247, 229);
  border: 2px solid rgb(82, 18, 124);
  display: inline-block;
}
#array {
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 10px;
  background-size: 50%;
  margin: 5vw 5vh;
  padding: 1%;
  width: 40%;
  height: 15%;
  padding: 20px;
  align-items: center;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
}
#invitations {
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 10px;
  background-size: 10%;
  margin: 2vw 2vh;
  padding: 1%;
  width: 80vw;
  height: 15%;
  padding: 20px;
  align-items: center;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
}

#invitations-header {
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 10px;
  background-size: 10%;
  margin: 2vw 2vh;
  padding: 1%;
  width: 80vw;
  height: 15%;
  padding: 20px;
  align-items: center;
  display: inline-block;
  font-size: 18px;
  margin: 4px 2px;
  font-weight: bold;
}

.my-events {
  margin-top: -40px;
  background-size: cover;
  overflow: hidden;
  background-attachment: fixed;
  background-image: url("../pics/food_party.jpg");
  background-size: cover;
  height: 125%;
}

#score {
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 10px;
  background-size: 10%;
  margin: 2vw 2vh;
  padding: 1%;
  width: 80vw;
  height: 15%;
  padding: 20px;
  align-items: center;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  font-weight: bold;
}

#restaurant-name {
  font-weight: bold;
}

#app {
  background-size: cover;
  background-image: url("../pics/food_party.jpg");
}

</style>