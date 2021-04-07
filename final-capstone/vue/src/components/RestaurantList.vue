<template>
<!-- This component is used to get the list of restaurants from the back en API. -->
  <div class="restaurant-list">
    <div
      v-for="restaurant in restaurants"
      v-bind:key="restaurant.id"
      class="restaurant"
    >
      <router-link v-bind="{ name: 'Name', params: { id: restaurant.id } }">
        {{ restaurant.name }}
      </router-link>
    </div>
  </div>
</template>

<script>
import services from "@/services/BaseService";
import search from "@/views/Home.vue"
export default {
  name: "restaurant-list",
  data() {
    return {
      restaurants: [],
    };
  },
  created() {
    services.searchLocation(search.searchLocation).then((response) => {
      this.restaurants = response.data;
    });
  },
};
</script>

<style>
</style>