import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import 'mdbvue/lib/css/mdb.min.css';
import 'bootstrap-css-only/css/bootstrap.min.css';
import '@fortawesome/fontawesome-free/css/all.min.css';
import '../public/css/estilos.scss';
Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
