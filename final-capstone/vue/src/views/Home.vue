<template>
  <div class="home">
    <form>
      <h1>Make New Event</h1>
      <button v-on:click="makeEvent()">Event</button>
      </form>
    <form id="search-form">
      <h1>Search</h1>
      <locationSearch />
    </form>
  </div>
</template>

<script>
import locationSearch from "@/components/SearchLocation.vue"
export default {
  name: "home",
components:{
  locationSearch
},

  methods: {
    makeEvent() {
      this.$router.push({ name: "make-event" });
    },
  },
};
</script>
<style scoped>
.home {
  background-image: url("../pics/steakhouse2.jpg");
  background-size: cover;
  display: flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  justify-content: center;
}
</style>
