<template>
  <div class="home">
    <form id="search-form">
      <h1>
        Search
      </h1>
      <label for ="location">City/ZipCode</label>
      <input
      type="text"
      id="location"
      v-model="search.searchInput"
      required
      autofocus
      />
      <button v-on:click="transferInput()"> Search </button>
      </form>
  </div>
</template>

<script>

export default {
  name: "home",
  
  data() {
    return {
    search: {
      searchInput : ""
    }}

  },    
   methods:{
     transferInput(){
       this.$store.commit("LOAD_SEARCH_INPUT",this.search.searchInput)
       this.$router.push({name:'list'})
     }
     
   }
};
</script>
<style scoped>
.home{
  background-image: url("../pics/steakhouse2.jpg");
  background-size: cover;
  display:flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  justify-content: center;
}
#search-form{
  background-color: rgba(212, 211, 211, 0.404);
  
}
</style>
