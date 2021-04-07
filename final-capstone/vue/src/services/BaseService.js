import axios from 'axios';

// Base services used to do anything that would need to talk to Java API
export default {
    searchLocation(location) {
        return axios.get(`/search/${location}`)
      },
    getDetails(id) {
        return axios.get(`/restaurant/${id}`)
    },
    getAllRestaurants(){
        return axios.get(`/restaurants`)
    }
        
}