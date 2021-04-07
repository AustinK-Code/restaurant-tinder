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
        time not available
        <button>Call to order</button>
        <img v-bind:src = restaurant.thumbnailImg alt="thumbnail not available">
    </div>
  </div>
</template>

<script>
import services from "@/services/BaseService";

export default {
  name: "restaurant-list",
  data() {
    return {
      restaurants: [],
    };
  },
  methods:{
  filterInput(input){
    if(this.hasLetters(input)){
      services.searchLocationZip(input).then((response) => {
      this.restaurants = response.data})
  }else{services.searchLocationZip(input).then((response) => {
      this.restaurants = response.data})}
  },
  hasLetters(string){
    return /^[a-zA-z]+$/.test(string)}
  },
  created(){
    this.filterInput(this.$store.state.searchInput)
  }
}
</script>

<style>
</style>