<template>
  <div class="home">
    <h1></h1>
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
  text-align: center;
  display:flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  font-family: sans-serif;
  box-sizing: border-box;
}
#search-form{
  background-color: gray;
  opacity: .5;
}
</style>
