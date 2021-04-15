<template>
  <div class="home">
    <form id="search-form">
      <h1>Search for Restaurants</h1>
      <p>Input a City or Zip Code and search for restaurants. Invite your friends to pick thier favorites and plan the perfect meal! </p>
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
  font: sans-Serif;
  background-image: url("../pics/steakhouse2.jpg");
  background-size: cover;
  display: flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  justify-content: center;
   background-attachment: fixed;
}
#search-form{
  background-color: rgba(236, 235, 235, 0.801);
  border-radius: 10px;
  padding: 5%;
  display:flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 40vw;
  height: 45vh;
  margin: 1vw;
  text-align: center;

}
</style>
