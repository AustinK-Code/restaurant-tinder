<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
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
      <label for="password" class="sr-only">Confirm Password</label>
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <router-link :to="{ name: 'login' }">Have an account?</router-link>
      <button class=" myButton" type="submit">
        Create Account
      </button>
    </form>
    <password-meter :password="user.password" id="meter" />
  </div>
</template>

<script>
import passwordMeter from "vue-simple-password-meter";
import authService from "../services/AuthService";

export default {
  name: "register",
  components: { passwordMeter },
  data() {
    return {
      user: {
        username: "",
        password: null,
        confirmPassword: "",
        role: "user",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    // start of method to do password security
    checkIfSecure(pass) {
      let score = 0;
      let length = 0;
      let specialChar = 0;
      let caseMix = 0;
      let passHasNum = 0;
      let specialCharRegex = /[^A-Za-z0-9]/g;
      let lowercaseRegex = /(.*[a-z].*)/g;
      let uppercaseRegex = /(.*[A-Z].*)/g;
      let numberRegex = /(.*[0-9].*)/g;
      let hasSpecialChar = specialCharRegex.test(pass);
      let hasLowerCase = lowercaseRegex.test(pass);
      let hasUpperCase = uppercaseRegex.test(pass);
      let hasNumber = numberRegex.test(pass);
      

      if (pass.length > 7) {
        if (hasNumber) {
          passHasNum = 1;
        }

        if (hasUpperCase && hasLowerCase) {
          caseMix = 1;
        }

        if ((hasLowerCase || hasUpperCase || hasNumber) && hasSpecialChar) {
          specialChar = 1;
        }

        if (pass.length > 8) {
          length = 1;
        }

        score = length + specialChar + caseMix + passHasNum;

        if (score > 4) {
          score = 4;
        }
      }

      return score;
    },
    // end
  
  register() {
    this.clearErrors()
    let passwordToCheck = this.user.password; //this is where the error is
    if (this.checkIfSecure(passwordToCheck) != 4) {
      this.registrationErrors = true; 
      this.registrationErrorMsg =
        "Password is not secure. Password must contain: At least 8 characters, 1 uppercase, 1 lowercase character, 1 special character, and 1 number.";
      return
    }
    if (this.user.password != this.user.confirmPassword) {
      this.registrationErrors = true;
      this.registrationErrorMsg = "Password & Confirm Password do not match.";
    } 
    else {
      authService
        .register(this.user)
        .then((response) => {
          if (response.status == 201) {
            this.$router.push({
              path: "/login",
              query: { registration: "success" },
            });
          }
        })
        .catch((error) => {
          const response = error.response;
          this.registrationErrors = true;
          if (response.status === 400) {
            this.registrationErrorMsg = "Email Is Already In Use";
          }
        });
    }
  },
  clearErrors() {
    this.registrationErrors = false;
    this.registrationErrorMsg = "There were problems registering this user.";
  }}
};
</script>

<style scoped>
#meter{
  width: 50vw;
}
#register{
  background-image: url("../pics/cookingpizza.jpg");
  background-size: cover;
  display: flex;
  height: 100vh;
  width: 100vw;
  color: rgb(0, 0, 0);
  flex-direction: column;
  align-items: center;
  justify-content: center;
   background-attachment: fixed;
}
form{
  background-color: rgba(212, 211, 211, 0.404);
  display:flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 50vw;
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

/* this is for password color bar */

.po-password-strength-bar {
  
  border-radius: 2px;
  transition: all 0.2s linear;
  height: 1FR;
  margin-top: 0px;
}

.po-password-strength-bar.risky {
  background-color: #f95e68;
}

.po-password-strength-bar.guessable {
  background-color: #fb964d;
}

.po-password-strength-bar.weak {
  background-color: #fdd244;
}

.po-password-strength-bar.safe {
  background-color: #b0dc53;
}

.po-password-strength-bar.secure {
  background-color: #35cc62;
}
/* end of color bar */
</style>
