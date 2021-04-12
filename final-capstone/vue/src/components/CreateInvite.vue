<template>
<div>
  <br> <!--- need to add css to replace br -->
  <br>
  <br>
    <h2>Select Friends to Invite:</h2>
    <div v-for="user in users" v-bind:key="user.userid">
     
     <input type="checkbox" v-bind:value="user.userid" v-model="invited" />
     <label for="checkbox"> {{user.username}}</label>
<!---add checkboxes --->
    </div>
  
</div>
</template>

<script>

import BaseService from "../services/BaseService"
export default {
    data(){
        return{
            newInvite:{
                eventId: "",
                restaurant1: "",
                restaurant2: "",
                restaurant3: "",
                restaurant4: "",
                restaurant5: ""       
            },
            users:[],
            invited:[]
        }
    },
    created(){
        BaseService.getAllUsers().then((response) =>{
          this.users = response.data;
        });
      }
    }
</script>

<style>

</style>