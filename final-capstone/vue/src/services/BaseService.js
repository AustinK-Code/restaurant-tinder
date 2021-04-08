import axios from 'axios';

// Base services used to do anything that would need to talk to Java API
export default {
    searchLocationZip(location) {
        return axios.get(`/search/${location}`)
      },
    getDetails(id) {
        return axios.get(`/restaurant/${id}`)
    },
    getAllRestaurants(){
        return axios.get(`/restaurants`)
    },
    //this needs wired up properly
    searchLocationCity(city){
        return axios.get(`/search/?city=${city}`)
    }
        
}