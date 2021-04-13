<template>
  <div>
      <br>
      <br>
      <br>
      <h2>Vote for your Top Choices:</h2>
      {{this.invitation[0].restaurantChoice1}}
      {{invitation.restaurantChoice2}}
      {{invitation.restaurantChoice3}}
      {{invitation.restaurantChoice4}}
      {{invitation.restaurantChoice5}}
     
  </div>

</template>

<script>
import BaseService from "../services/BaseService"
export default {
    data(){
    return{
        invitation:[]
    }
    },
    created(){
        BaseService.getInvitesByUserId(this.$store.state.user.id).then((response) =>{
            this.invitation = response.data;
        })
    }


}
</script>

<style>

</style>