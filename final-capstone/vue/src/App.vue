
<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" style: vertical-align: middle >Home</router-link>&nbsp;&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
#nav{
  text-align: center;
  flex-direction: column;
  flex-wrap: wrap;
  display:flex;
  width: 100%;
  font-family: sans-serif;
  background-color: gray;
}
#app{
  background-color: rgba(63, 57, 57, 0.473);
  background-size: cover;
  margin: 0%;
  border: 0%;
  padding: 0%;
}

</style>
