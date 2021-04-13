<template>
<div>
  <br> <!--- need to add css to replace br -->
  <br>
  <br>
    <h2>My Events:</h2>
    <router-link to="/pendinginvites">
   <h2> Pending Invites </h2>
    </router-link>
   <h2> Upcoming Events </h2>

<!---adding the user's events --->
  
</div>
</template>

<script>

import BaseService from "../services/BaseService"
export default {
    data(){
        return{
            invites:[],
            restaurants: []
        }
    },
    created(){
     BaseService.getInvitesByUserId(this.$store.state.user.id).then((response) =>{
          this.invites = response.data;
        });
        
    },
    methods: {
    
    }
    
}
</script>

<style>

</style>