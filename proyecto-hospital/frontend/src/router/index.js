import Vue from 'vue';
import VueRouter from 'vue-router';
import Home from '../views/Home.vue';
import DetallesPaciente from '../views/DetallesPaciente.vue';
import Usuarios from '../views/Usuarios.vue';
import { isAuthenticated, isNotAuthenticated } from '../helper/index';
Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    beforeEnter: isAuthenticated,
  },
  {
    path: '*',
    redirect: '/',
  },
  {
    path: '/paciente/:pacienteID',
    name: 'DetallesPaciente',
    component: DetallesPaciente,
    beforeEnter: isAuthenticated,
  },
  {
    path: '/usuarios',
    name: 'Usuarios',
    component: Usuarios,
    beforeEnter: isAuthenticated,
  },
  {
    path: '/paciente-agregar',
    name: 'PacienteAgregar',
    component: () => import('../views/Paciente-Agregar.vue'),
    beforeEnter: isAuthenticated,
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Login.vue'),
    beforeEnter: isNotAuthenticated,
  },
  {
    path: '/registro',
    name: 'Registro',
    component: () => import('../views/Registro.vue'),
    beforeEnter: isNotAuthenticated,
  },
  {
    path: '/paciente-alta',
    name: 'PacienteAlta',
    component: () => import('../views/Paciente-Alta.vue'),
    beforeEnter: isAuthenticated,
  },
  {
    path: '/paciente-cola',
    name: 'PacienteCola',
    component: () => import('../views/Paciente-Cola.vue'),
    beforeEnter: isAuthenticated,
  },
];

const router = new VueRouter({
  base: process.env.BASE_URL,
  routes,
});

export default router;
