<template>
<div>
  <br> <!--- need to add css to replace br -->
  <br>
  <br>
    <vote/>

<!---adding the user's events --->
  
</div>
</template>

<script>
import vote from "../components/vote.vue"
import BaseService from "../services/BaseService"
export default {
    components:{vote},
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