
<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }" style: vertical-align: middle >Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
#app{
  text-align: center;
  flex-direction: column;
  display:flex;
  width: 100%;
  font-family: sans-serif;
  box-sizing: border-box;
}

</style>
