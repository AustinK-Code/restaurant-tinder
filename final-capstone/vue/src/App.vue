
<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" style: vertical-align: middle >Home</router-link>&nbsp;&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      <router-link v-bind:to="{ name: 'events' }" v-if="$store.state.token != ''">My Events</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
html, body {
    width: 100vw;
    height: 100vh;
    }
    body {
        margin: 0;
        padding: 0;
        }
#app{
  height: 100vh;
  width: 100vw;
}
#nav{
  text-align: center;
  flex-direction: column;
  flex-wrap: wrap;
  display:flex;
  width: 100%;
  font-family: sans-serif;
  background-color: gray;
  

}


</style>
