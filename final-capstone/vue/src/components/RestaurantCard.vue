
<template>
<!--This card is going to be used to display each restaurant on the home screen after a search -->
<div id ="card">
    <p>Name: {{this.restaurant.name}}
       Cuisine: {{this.restaurant.cuisine}}
       Address: {{this.restaurant.address}}
        {{this.restaurant.address2}}
       Hours of operation:{{this.restaurant.openTime}} - {{this.restaurant.closeTime}}
       </p>
       <!-- make this a red or green dot -->
       <div id="isItOpen"></div>  
       <!-- make this a button with a phone -->
       <a href="call">Call to order</a>
       <img id="pics" src="" alt= "thumbnail pic">
</div>
</template>

<script>
import individualService from `@/services/BaseServices`
export default {
  data() {
    return {
      restaurant: {
        id: "",
        name: "",
        restaurantId: "",
        cuisine: "",
        address: "",
        address2: "",
        city: "",
        region: "",
        zipCode: "",
        starRating: "",
        thumbnailImg: "",
        phoneNumber: "",
        openTime: "",
        closeTime: "",
        dayOfWeek: "",
        minutesOpen: "",
        isOpen: null
      },
    };
  },
  created(){
    individualService.getDetails(this.$route.params.id).then((Response)=>{
      this.restaurant = Response.data
    })
  }
};
</script>

<style>
</style>