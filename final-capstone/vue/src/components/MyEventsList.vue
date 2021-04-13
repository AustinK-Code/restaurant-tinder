<template>
<div>
  <br> <!--- need to add css to replace br -->
  <br>
  <br>
    <h2>My Events:</h2>
    <p>
        {{user.myEvents}}
    </p>
<!---adding the user's events --->
  
</div>
</template>

<script>

import BaseService from "../services/BaseService"
export default {
    data(){
        return{
            eventId: "",
            users:[],
            invited:[]
        }
    },
    created(){
      BaseService.getEventById(this.eventId).then((response) => {
          this.users = response.data;
      });
    }
}
</script>

<style>

</style>