
<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Email</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Email"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <router-link :to="{ name: 'register' }">Need an account?</router-link>
      <button type="submit" class="myButton">Sign in</button>
      
    </form>
  </div>
</template>

<script>


import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>
<style scoped>
form.form-signin{
  background-color: rgba(212, 211, 211, 0.404);
  margin: 10vw;
}
#login{
  background-image: url("/pics/bbq2.png");
  background-size: cover;
  text-align: center;
  display:flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  font-family: sans-serif;
  box-sizing: border-box;
}
form{
  display:flex;
  flex-direction: column;
  flex-basis: 100%;
  align-items: center;
}
input{
  margin-bottom: 1em;
  padding-top: 15px;
  padding-bottom: 10px;
  border-radius: 3px;
  width: 60%;
}
label{
  padding-bottom: 15px;
  padding-top: 5px;
}
.flex-container {
  display: flex;
  flex-direction: row;
}
.myButton {
color: rgb(255, 255, 255); 
font-size: 20px; 
line-height: 10px; 
padding: 9px; 
border-radius: 45px; 
font-family: Georgia, serif; 
font-weight: normal; 
text-decoration: none; 
font-style: normal; 
font-variant: normal; 
text-transform: none; 
background-image: linear-gradient(to right, rgb(255, 88, 100) 0%, rgb(255, 88, 100) 50%, rgb(255, 88, 100) 100%); 

 border: 2px solid rgb(255, 255, 255); 
 display: inline-block;}
.myButton:hover {
background: #ff5864; }
.myButton:active {
background: #ff5864; }

</style>

