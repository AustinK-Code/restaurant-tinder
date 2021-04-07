<template>
  <div class="home">
    <h1>Home</h1>
    <form>
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
  background-image: url("/public/pics/bbq2.png");
  background-repeat: no-repeat;
  background-size: cover;
  height: 100vh;
  width: 100vw;
  text-align: center;
  flex-direction: column;
  flex-wrap: wrap;
  display:flex;
  color: red;
  font-family: sans-serif;
}
</style>
