import axios from 'axios';


export default {

  login(user) {
    return axios.post('/login', user)
  },

  register(user) {
    return axios.post('/register', user)
  },
    // takes an input from search and pushes to backend to perform

}
