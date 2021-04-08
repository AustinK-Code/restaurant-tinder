<template>
<!-- This component is used to get the list of restaurants from the back end API. -->
  <div class="restaurant-list">
    <div
      v-for="restaurant in restaurants"
      v-bind:key="restaurant.id"
      class="restaurant"
    >
        {{ restaurant.name }},
        {{restaurant.cuisine}},
        {{restaurant.address}},
        {{restaurant.address2}},
        {{restaurant.openTime}}-{{restaurant.closeTime}}
        <button v-if="restaurant.phoneNumber">Call to order</button>
        <img v-bind:src = restaurant.thumbnailImg alt="thumbnail not available">,
        <span v-if="isOpen(time, restaurant.openTime, restaurant.closeTime)">We are open</span>
        <span v-else>We are closed</span>

    </div>
  </div>
</template>

<script>
import services from "@/services/BaseService";
let today = new Date()
let time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds()

export default {
  name: "restaurant-list",
  time,
  data() {
    return {
      restaurants: [],
    };
  },
  methods:{
  filterInput(input){
    if(this.hasLetters(input)){
      services.searchLocationCity(input).then((response) => {
      this.restaurants = response.data})
      return
  }else{services.searchLocationZip(input).then((response) => {
      this.restaurants = response.data})}
  },

  hasLetters(string){
    return /^[a-zA-z]+$/.test(string)},

  isOpen(current, open, closed){
    if (current > open && current < closed){
      return true
    }
    else return false
  }
  },
  


  created(){
    this.filterInput(this.$store.state.searchInput)
  }
}
</script>

<style>
.restaurant-list{
    background-image: url("../pics/happytable.jpg");
  background-size: cover;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  font-family: sans-serif;
  box-sizing: border-box;
}
.restaurant{
  background-color: rgba(212, 211, 211, 0.404);
}
</style>