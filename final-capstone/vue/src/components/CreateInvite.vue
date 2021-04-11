<template>
<form id="InviteForm">
    <h2>Search for restaurants:</h2>
  <restaurant-list></restaurant-list>
</template>

<script>
import RestaurantList from './RestaurantList.vue'
export default {
  components: { RestaurantList },
    data(){
        return{
            newInvite:{
                eventId: "",
                restaurant1: "",
                restaurant2: "",
                restaurant3: "",
                restaurant4: "",
                restaurant5: ""       
            }
        }
    }

}
</script>

<style>

</style>