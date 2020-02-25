import Vue from 'vue'
import App from '../app.vue'
import { router } from '../routes/router'

document.addEventListener('DOMContentLoaded', () => {
  Vue.config.productionTip = false;

  const app = new Vue({
    router,
    render: (h) => h(App),
  }).$mount('#app')
})
