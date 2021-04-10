
<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >
        Thank you for registering, please sign in.
      </div>
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
      <div>
        <h1>About Us</h1>
        <p>
          Welcome to Restaurant Tinder, the only app designed to find the
          perfect dining experience for any occasion. Our goal here is simple:
          to find the very best local restaurants with only the highest quality
          of ingredients, and an atmosphere to match. If you’re looking for
          bland, or the same-old thing you’ve had a hundred times, you’re on the
          wrong app. We stand by each and every restaurant that we feature here,
          and if their quality ever declines, we remove them. This is an app for
          foodies, by foodies. Individually selected and tested, every dining
          experience will be a treat.
        </p>
      </div>
      <div>
        <h1>User Testimonial:</h1>
        <p>
          I’ve been spending a lot more time with friends since
          I started using the app, it makes it so easy to plan a meal together -
          Random lady we found on the street
        </p>
        <p>
          Found the best meal of my life on there - Guy that looked like Gordon Ramsey
        </p>
        <p>
          This app is so easy to use that even I figured it out! - My Grandma
        </p>
        <p>
          Never heard of it, how did you get inside my house? - Elon Musk
        </p>
      </div>
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
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>
<style scoped>
form.form-signin {
  background-color: rgba(212, 211, 211, 0.404);
  margin: 10vw;
}
#login {
  background-image: url("/pics/bbq2.png");
  background-size: cover;
  text-align: center;
  display: flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  align-items: center;
  font-family: sans-serif;
  box-sizing: border-box;
}
form {
  display: flex;
  flex-direction: column;
  flex-basis: 100%;
  align-items: center;
}
.myButton {
  color: rgb(255, 255, 255);
  font-size: 20px;
  line-height: 10px;
  padding: 9px;
  border-radius: 45px;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
  background-image: rgb(255, 88, 100);
  border: 2px solid rgb(255, 255, 255);
  display: inline-block;
}
</style>

