<template>
    <div>
    <br />
    <br />
    <br />

    <div v-for="(invite, index) in invitation" v-bind:key="invite.id">
      <button v-on:click="getRestaurants(index), temp=index" v-bind="temp" >{{ index + 1 }}</button>
      <!-- <button v-on:click="location.reload()">X</button> -->
      <button v-on:click="BaseService.updateVotes(this.invitation[index])">Submit</button>
    </div>
</template>

<script>
import BaseService from "../services/BaseService";
export default {

}
</script>

<style>

</style>