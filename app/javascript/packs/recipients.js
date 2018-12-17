import Vue from 'vue'
import App from '../recipients.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById("recipients-app")
  const app = new Vue({
    el,
    render: h => h(App)
  })
})
