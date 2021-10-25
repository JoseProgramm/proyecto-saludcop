import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';
import DetallesPaciente from '../views/DetallesPaciente.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
  },
  {
    path: '/paciente/:pacienteID',
    name: 'DetallesPaciente',
    component: DetallesPaciente,
  },
  {
    path: '/paciente-agregar',
    name: 'PacienteAgregar',
    component: () => import('../views/Paciente-Agregar.vue'),
  },
  {
    path: '/paciente-alta',
    name: 'PacienteAlta',
    component: () => import('../views/Paciente-Alta.vue'),
  },
  {
    path: '/paciente-cola',
    name: 'PacienteCola',
    component: () => import('../views/Paciente-Cola.vue'),
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
