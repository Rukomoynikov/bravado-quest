import Vue from 'vue';
import Vuex from 'vuex';
import api from '../utilities/api'

Vue.use(Vuex);

export const store = new Vuex.Store({
  state: {
    user: null
  },
  mutations: {
    updateUser(state, userData) {
      state.user = {...userData}
    },
    removeUser(state) {
      state.user = null
    }
  },
  actions: {
    checkAuthentication({commit, state}) {
      api.whoAmI().then((response) => {
        commit('updateUser', response.data.data)
      })
    },
    signOut({commit, state}) {
      api.signOut().then((response) => {
        commit('removeUser')
      })
    }
  },
  getters: {
    isAuthenticated(state) {
      return !!state.user
    }
  },
  modules: {
  },
});
