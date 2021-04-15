<template>
  <form id="search-form">
    <label for="location">City or ZipCode</label>
    <div><input
      type="text"
      id="location"
      v-model="search.searchInput"
      required
      autofocus
    /></div>
    <button v-on:click="transferInput()" id="myButton">Search</button>
  </form>
</template>

<script>
export default {
  data() {
    return {
      search: {
        searchInput: "",
      },
    };
  },
  methods: {
    transferInput() {
      this.$store.commit("LOAD_SEARCH_INPUT", this.search.searchInput);
      this.$router.push({ name: "list" });
    },
}
}
</script>

<style>
#myButton {
  color: rgb(255, 255, 255);
  font-size: 20px;
  line-height: 10px;
  padding: 9px;
  border-radius: 45px;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  background-color: rgb(255, 88, 100);
  border: 2px solid rgb(255, 255, 255);
  display: inline-block;
}
</style>