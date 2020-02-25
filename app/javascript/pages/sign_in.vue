<template>
  <div>
    <form action="" @submit.prevent="sendForm">
      <div>
        <label for=""></label>
        <input type="text" v-model="form.username">
      </div>

      <div>
        <label for=""></label>
        <input type="text" v-model="form.password">
      </div>

      <button @click="sendForm">Submit</button>
    </form>
  </div>
</template>

<script>
  import api from '../utilities/api'

  export default {
    name: 'SignIn',
    data() {
      return {
        form: {
          username: '',
          password: ''
        },
        errors: []
      }
    },
    methods: {
      sendForm() {
        const params = { email: this.form.username, password: this.form.password }

        api.signIn(params).then((response) => {
          if (response.data.errors) {
            this.errors = response.data.errors
            return
          }

          this.$store.commit('updateUser', response.data.data)
          this.$router.push({ path: '/' })
        })
      }
    }
  }
</script>

<style scoped>

</style>
