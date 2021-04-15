<template>
<div class="invitepage">
  <create-invite></create-invite>
</div>
</template>

<script>

import CreateInvite from '../components/CreateInvite.vue'
export default {
  components: {  CreateInvite },

}
</script>

<style>
.invitepage{
  background-image: url("/pics/bbq2.png");
  background-size: cover;
  text-align: center;
  width: 100vw;
  height: 100vh;
  background-attachment: fixed;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>