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
    <router-link to="/events">
    <button v-on:click="sendInvites()">Send Invitations</button>
    </router-link>
</div>
</template>

<script>

import BaseService from "../services/BaseService";
export default {
    data(){
        return{
            users: [],
            invited: [],
            eventId: ""
        }
    },
    methods:{
      addInvites(){
        BaseService.createInvite(this.newInvite);
      },
      
      sendInvites(){
        this.invited.forEach(user =>{
          const invite = {guestId:user,
          eventId:this.eventId
          }
          BaseService.createInvite(invite);
        })
    }
    },
    created() {
       BaseService.getCurrentEventId(this.$store.state.user.id).then((response) =>{
          this.eventId = response.data;
        });
        BaseService.getAllUsers().then((response) =>{
          this.users = response.data;
        });
       
        
      }
    }
</script>

<style>

</style>