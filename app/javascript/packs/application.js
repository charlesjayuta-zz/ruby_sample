import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import App from '../components/app.vue'
import axios from 'axios'
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap-vue/dist/bootstrap-vue.css"

Vue.use(BootstrapVue)

// CSRF token for axios http client
let token = document.getElementsByName('csrf-token')[0].getAttribute('content')
axios.defaults.headers.common['X-CSRF-Token'] = token
axios.defaults.headers.common['Accept'] = 'application/json'

document.addEventListener('DOMContentLoaded', function() {
    const app = new Vue({
        el: 'app',
        components: { App }
    })
});