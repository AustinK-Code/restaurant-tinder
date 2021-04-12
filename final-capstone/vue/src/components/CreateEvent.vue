<template>
  <div>
    <form id="eventform" @submit.prevent="addNewEvent" >
      <!-- date event is held on field  -->
      <label for="dateOfEvent">Date and time of event</label>
      <input type= "date" v-model="newEvent.eventDate"/>
      <input type="time" v-model="newEvent.eventTime"/>

      <!-- poll end date and time  -->
      <label for="dateOfPoll">Poll end date and time</label>
      <input type= "date" v-model="newEvent.respondByDate"/>
      <input type="time" v-model="newEvent.respondByTime"/>
      <button class=" myButton" type="submit" v-on:click="commitEventToStore()">
        Create Event
      </button>
      

    </form>
  </div>
</template>

<script>
import services from "@/services/BaseService.js";
import authService from "@/services/AuthService.js";

export default {
  props:{
    formEvent:null
  },
  data() {
    return {
      newEvent: {
        eventDate: "",
        eventTime: "",
        respondByDate: "",
        respondByTime: "",
        hostId: "",
        restaurantChoice1: this.formEvent[0],
        restaurantChoice2: this.formEvent[1],
        restaurantChoice3: this.formEvent[2],
        restaurantChoice4: this.formEvent[3],
        restaurantChoice5: this.formEvent[4]
      },
    };
  },
  methods:{
    commitEventToStore(){
      this.$store.commit("LOAD_EVENT_ARRAY", this.formEvent)
    },
   addNewEvent(){
     services.createEvent(this.newEvent).then((response) => {
       if(response.status == 201){
         this.$router.push({
           path: "/invite"
         })
       }
     })
   }
  },


  components: {
    
  },
  created() {
    services.getAllUsers().then((response) => {
     this.users = response.data;
   });
    authService.getLoggedInUserId().then((response) => {
        this.newEvent.hostId = response.data;
      });
  },
};
</script>

<style scoped>
form {
  margin: 10vh;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.myButton {
color: rgb(255, 255, 255); 
font-size: 20px; 
line-height: 10px; 
padding: 9px; 
border-radius: 45px; 
font-family: Georgia, serif; 
font-weight: normal; 
text-decoration: none; 
font-style: normal; 
font-variant: normal; 
text-transform: none; 
background-image: linear-gradient(to right, rgb(255, 88, 100) 0%, rgb(255, 88, 100) 50%, rgb(255, 88, 100) 100%); 

 border: 2px solid rgb(255, 255, 255); 
 display: inline-block;}
.myButton:hover {
background: #ff5864; }
.myButton:active {
background: #ff5864; }
</style>