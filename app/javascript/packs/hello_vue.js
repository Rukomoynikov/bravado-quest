import Vue from 'vue'
import App from '../app.vue'
import { router } from '../routes/router'
import { store } from '../store';

document.addEventListener('DOMContentLoaded', () => {
  Vue.config.productionTip = false;

  const app = new Vue({
    router,
    store,
    render: (h) => h(App),
  }).$mount('#app')
})
