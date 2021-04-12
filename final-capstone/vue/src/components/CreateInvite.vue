<template>
<div>
  <br> <!--- need to add css to replace br -->
  <br>
  <br>
    <h2>Select Friends to Invite:</h2>
    <div v-for="user in users" v-bind:key="user.userid">
     
     <input type="checkbox" v-bind:value="user.id" v-bind:id="user.id" v-model="invited"/>
     <label for="checkbox"> {{user.username}}</label>
    </div>
    <button v-on:click="loadInvitedUsers()">ADD</button>
    <button v-on:click="sendInvites()">Send</button>
</div>
</template>

<script>

import BaseService from "../services/BaseService";
import authService from "@/services/AuthService.js";
export default {
    data(){
        return{
            newInvite:{
                eventId: "12",
                guestId: ""    
            },
            users: [],
            invited: [],
            LoggedInUserId:"",
            currentEventId:""
        }
    },
    methods:{
      loadInvitedUsers(){
        this.$store.commit("LOAD_INVITED_USERS",this.invited)
      },
      
      sendInvites(){
        this.invited.forEach(user =>{
          this.newInvite.guestId = user.id;
          BaseService.createInvite(this.newInvite)
        })
      //   for(this.user in this.invited){
      //   this.newInvite.eventId
      //   this.newInvite.guestId = this.user.id
      //   BaseService.createInvite(this.newInvite)
      // }
    }
    },
  
    created(){
        BaseService.getAllUsers().then((response) =>{
          this.users = response.data;
        });
        authService.getLoggedInUserId().then((response) => {
        this.LoggedInUserId = response.data;
      });
        
      }
    }
</script>

<style>

</style>