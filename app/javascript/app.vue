<template>
  <div>
    <Header />
    <router-view/>
  </div>
</template>

<script>
import Header from './components/header'

export default {
  name: 'App',
  components: {
    Header
  },
  mounted() {
    this.$store.dispatch('checkAuthentication')
  },
  computed: {
    user() {
      return this.$store.getters.isAuthenticated
      // return this.$store.state.user
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
