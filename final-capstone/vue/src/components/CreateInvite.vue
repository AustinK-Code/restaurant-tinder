<template>
<div>
  <br> <!--- need to add css to replace br -->
  <br>
  <br>
    <h2>Select Friends to Invite:</h2>
    <div v-for="user in users" v-bind:key="user.userid">
     <h3> {{user.username}}</h3>
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
            users:[]
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