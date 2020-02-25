<template>
  <div class='container'>
    <SearchForm @onSearch='onSearch'v-model='searchQuery' />
    <transition name='list'>
      <UsersList :users='users' :highlightText='searchQuery' v-if='!loading' />
    </transition>
    <LoadingIndicator v-if='loading' />
  </div>
</template>

<script>
import SearchForm from 'components/search_form'
import UsersList from 'components/users_list'
import LoadingIndicator from 'components/loading_indicator'
import axios from 'axios'
import {UrlManager} from './utilities/url_manager'

export default {
  components: {
    SearchForm,
    UsersList,
    LoadingIndicator
  },
  data() {
    return {
      searchQuery: '',
      users: [],
      loading: true
    }
  },
  mounted() {
    const searchQuery = UrlManager.fetchSearchQuery()

    if (searchQuery) {
      this.searchQuery = searchQuery
    }

    this.fetchUsers()
  },
  methods: {
    onSearch() {
      this.fetchUsers(this.searchQuery)
    },
    fetchUsers() {
      this.loading = true
      UrlManager.updateUrl(this.searchQuery)

      const params = { params: { query: this.searchQuery }}
      axios.get('/api/v1/users/search', params).then((response) => {
        this.users = response.data.data
        this.loading = false
      })
    }
  }
}
</script>

<style>
@import 'utilities/variables.css';
@import 'utilities/animations.css';

html, body {
  margin: 0;
  padding: 0;
  height: 100vh;
}

*, :after, :before {
  box-sizing: border-box;
}

body {
  background: var(--background-color-grey);
  font-family: Roboto,sans-serif;
}
</style>

<style scoped>
@import 'utilities/variables.css';

.container {
  background: var(--background-color-white);
  max-width: 564px;
  height: calc(100vh - 108px);
  margin: 54px auto;
  padding: 19px 12px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
}
</style>
