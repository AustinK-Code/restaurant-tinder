<template>
  <div class="myEvents-page" id="page">
    <form id="myEvents-form">
      <h1>My Events</h1>
      <my-events-list/>
      <!-- need to implement event invites --->
    </form>
  </div>
</template>

<script>
import MyEventsList from "@/components/MyEventsList.vue"
export default {
  name: "events",
components:{
  MyEventsList
},

  methods: {
    retrieveEvent() {
      this.$router.post({ name: "retrieve-event" });
    },
  },
};
</script>
<style scoped>

#page {
  background-image: url("../pics/Restaurant_Tinder_final_png.png");
  background-size: cover;
  display: flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  justify-content: center;
   background-attachment: fixed;
}
form{
  background-color: rgba(212, 211, 211, 0.404);
  display:flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 40vw;
  height: 45vh;
  margin: 1vw

}
</style>