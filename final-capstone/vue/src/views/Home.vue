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
      v-bind="search.searchInput"
      required
      autofocus
      />
      <router-link :to="{name: 'searchresult'}" > Search </router-link>
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
    }
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

  font-family: sans-serif;
}
</style>
