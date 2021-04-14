
<template>
  <div id="app">
    <div id="nav">
      <ul id="navlist">
      <li><router-link v-bind:to="{ name: 'home' }"  active-class="link" ></router-link></li>
      <li><router-link v-bind:to="{ name: 'home' }"  active-class="link" v-if="$store.state.token != ''"
      style="  display: block;
  color: white;
  font-family:tahoma;
  text-align: center;
  padding: 14px 16px;
  margin: 5px;
  text-decoration: none;">Home</router-link></li>
      <li><router-link v-bind:to="{ name: 'logout' }" active-class="link2" v-if="$store.state.token != ''" 
      style="  display: block;
  color: white;
  font-family:tahoma;
  text-align: center;
  padding: 14px 16px;
  margin: 5px;
  text-decoration: none;">Logout</router-link></li>
      <li><router-link v-bind:to="{ name: 'events' }" active-class="link" v-if="$store.state.token != ''" 
      style="  display: block;
  color: white;
  font-family:tahoma;
  text-align: center;
  padding: 14px 16px;
  margin: 5px;
  text-decoration: none;">My Events</router-link></li>
      </ul>
    </div>
    <router-view />
  </div>
</template>

<style>
html,
body {
  width: 100vw;
  height: 100vh;
}
body {
  margin: 0;
  padding: 0;
}
#app {
  font-family:tahoma;
  height: 100vh;
  width: 100vw;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  position: fixed;
  top: 0;
  width: 100%;
}

li {
  float: left;
  border-right: 1px solid #bbb;
}
li.link:hover{
  background-color: #111;
}
li:last-child{
  border-right: none;
}
</style>

