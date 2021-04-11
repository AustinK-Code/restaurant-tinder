<template>
  <div>
    <form id="eventform">
      <!-- date event is held on field  -->
      <label for="dateOfEvent">Date of event</label>
      <input type="datetime-local" id="dateOfEvent" v-model="eventDate"/>

      <!-- poll end date and time  -->
      <label for="dateOfPoll">Poll end date</label>
      <input type="datetime-local" id="dateOfEvent" v-model='endDate'/>

      <!-- Add recipients field  -->
      <label for="search">Add recipients</label>
      <!-- search through an array of all users -->
      <input v-model="invitedInput" placeholder="email" />
      <p> {{ invited }}</p>
      <button type="button" v-on:click='addUser(invitedInput)'>Add</button>

      <!-- location search input field  -->
      <locationSearch />
    </form>
  </div>
</template>

<script>
import services from "@/services/BaseService.js";
import locationSearch from "@/components/SearchLocation.vue";
export default {
  data() {
    return {
      endDate: "",
      eventDate: "",
      invitedInput:"",
      invited: [],
      users: []
    };
  },
  methods:{
    addUser(input){
      this.invited.push(input)
    }
  },
  components: {
    locationSearch,
  },
  created() {
    services.getAllUsers().then((response) => {
      this.users = response.data;
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
</style>