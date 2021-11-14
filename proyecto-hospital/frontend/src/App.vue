<template>
  <div>
    <Navbar class="width" v-if="!ocultarNavbarEnLoginORegistro" />
    <transition name="animacion" mode="out-in">
      <router-view />
    </transition>
  </div>
</template>

<script>
import Navbar from "@/components/Navbar.vue";
export default {
  name: "App",
  components: {
    Navbar,
  },
  computed: {
    ocultarNavbarEnLoginORegistro() {
      return (
        window.location.pathname === "/registro" ||
        window.location.pathname === "/login"
      );
    },
    // estaLogueado() {
    // return window.localStorage.getItem("admin-login");
    // },
  },
};
</script>
<style>
@import url("https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css");
body {
  background: #fafafa;
}
.animacion-enter-active,
.animacion-leave-active {
  transition: opacity 0.5s;
}
.animacion-enter,
.animacion-leave-to {
  opacity: 0;
}
</style>