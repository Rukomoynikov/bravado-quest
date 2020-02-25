<template>
  <div>
    <div v-if='isAuthenticated'>
      {{ user.email }}
    </div>
    <div v-else>
      <router-link to='/sign_in'>Sign In</router-link>
      <router-link to='/sign_up'>Sign up</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Header',
  computed: {
    isAuthenticated() {
      return this.$store.getters.isAuthenticated
    },
    user() {
      return this.$store.state.user
    }
  }
}
</script>

<style>

</style>
