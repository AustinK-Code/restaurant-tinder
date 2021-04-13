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
        return axios.get(`/search?city=${city}`)
    },

    //get all users
    getAllUsers(){
        return axios.get(`/users/list`)
    },

    //get event by event id
    getEventById(eventId){
        return axios.get(`/event/${eventId}`)
    },

    //get invite by invite id
    getInviteByInviteId(inviteId){
        return axios.get(`/event/invite/${inviteId}`)
    },

    //get invites by event id
    getInvitesByEventId(eventId){
        return axios.get(`/event/${eventId}/invites`)
    },
    // get invites by user id
    getInvitesByUserId(userId){
        return axios.get(`/users/${userId}/invites`)
    },

    //create event
    createEvent(event){
        return axios.post( `/event`, event)
    },
    //create invite
    createInvite(invite){
        return axios.post(`/event/invite`, invite)
    },

    //update invite with votes
    updateVotes(invite){
        return axios.put(`/event/invite/${invite.inviteId}`, invite)
    },

    //calculate votes
    calculateResults(event){
        return axios.post(`/event/results`, event)
    },

    //get voting results
    getVotingResults(eventId){
        return axios.get(`/event/${eventId}/results`)
    },

    getCurrentEventId(userId){
        return axios.get(`/currentevent/${userId}`)
    },

    getRestaurantById(id){
        return axios.get(`/restaurant/${id}`)
    }

        
}