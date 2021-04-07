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
  text-align: center;
  flex-direction: column;
  flex-wrap: wrap;
  display:flex;
  width: 100%;
  font-family: sans-serif;
  background-color: gray;
}
</style>
