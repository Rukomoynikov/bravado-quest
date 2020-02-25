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
    }
  },
  actions: {
    checkAuthentication({commit, state}) {
      api.whoAmI().then((response) => {
        commit('updateUser', response.data.data)
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
