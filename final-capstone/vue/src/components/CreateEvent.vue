<template>
<div>
  <form id="eventform">
      <!-- date event is held on field  -->
      <label for="dateOfEvent">Date of event</label>
      <input type="datetime-local" id="dateOfEvent">

      <!-- poll end date and time  -->
      <label for="dateOfPoll">Poll end date</label>
      <input type="datetime-local" id="dateOfEvent">

      <!-- Add recipients field  -->
      <label for="search">Add recipients</label>
      <!-- search through an array of all users -->
      <input type="search">
      <button>Add</button>

      <!-- location search input field  -->
      <locationSearch />

  </form>
</div>
</template>

<script>
import locationSearch from "@/components/SearchLocation.vue"
export default {
components:{
    locationSearch
}
}
</script>

<style>

</style>