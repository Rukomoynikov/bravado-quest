<template>
  <div class='container'>
    <SearchForm @onSearch='onSearch'v-model='searchQuery' />
    <UsersList :users='users' :highlightText='searchQuery'/>
  </div>
</template>

<script>
import SearchForm from 'components/search_form'
import UsersList from 'components/users_list'
import axios from 'axios'
import {UrlManager} from './utilities/url_manager'

export default {
  components: {
    SearchForm,
    UsersList
  },
  data() {
    return {
      searchQuery: '',
      users: []
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
      UrlManager.updateUrl(this.searchQuery)

      const params = { params: { query: this.searchQuery }}
      axios.get('/api/users/v1/search', params).then((response) => {
        this.users = response.data.data
      })
    }
  }
}
</script>

<style>
@import 'utilities/variables.css';

* > * {
  box-sizing: border-box;
}

body {
  min-height: 100vh;
  background: var(--background-color-grey);
  font-family: Roboto,sans-serif;
  overflow: hidden;
}
</style>

<style scoped>
@import 'utilities/variables.css';

.container {
  background: var(--background-color-white);
  max-width: 564px;
  min-height: calc(100vh - 108px);
  margin: 54px auto;
  padding: 19px 12px;
}
</style>
