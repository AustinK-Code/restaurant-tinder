<template>
  <div>
      <button v-on:click="makeEvent()">Make a new Event</button>
  </div>
</template>

<script>
export default {
methods:{
    makeEvent(){
        this.router.push({name:'make-event'})
    }
}
}
</script>

<style>

</style>