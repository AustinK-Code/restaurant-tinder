import axios from 'axios';

// Base services used to do anything that would need to talk to Java API
export default {
    getList(location) {
        return axios.get(`/search/${location}`)
      },
    getDetails(id) {
        return axios.get(`/search/${id}`)
    }
        
}