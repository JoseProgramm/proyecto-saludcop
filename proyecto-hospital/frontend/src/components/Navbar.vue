<template>
  <mdb-navbar
    expand="large"
    dark
    color="success-color-dark"
    class="justify-content-between"
  >
    <div class="container">
      <mdb-navbar-brand>
        <router-link to="/" class="color text-decoration-none">
          <img src="/img/logo.png" alt="logo" />
        </router-link>
      </mdb-navbar-brand>
      <mdb-navbar-toggler>
        <mdb-navbar-nav right>
          <mdb-nav-item active>
            <router-link to="/" class="text-decoration-none color"
              >Inicio</router-link
            >
          </mdb-nav-item>
          <mdb-nav-item active>
            <router-link to="/usuarios" class="text-decoration-none color"
              >Usuarios</router-link
            >
          </mdb-nav-item>
          <mdb-nav-item active>
            <router-link
              to="/paciente-agregar"
              class="text-decoration-none color"
              >Registrar Pacientes</router-link
            >
          </mdb-nav-item>
          <mdb-dropdown tag="li" class="nav-item">
            <mdb-dropdown-toggle
              tag="a"
              navLink
              color="success-color-dark"
              slot="toggle"
              waves-fixed
              >Pacientes</mdb-dropdown-toggle
            >
            <mdb-dropdown-menu>
              <mdb-dropdown-item>
                <router-link to="/paciente-cola">Pacientes en cola</router-link>
              </mdb-dropdown-item>
              <mdb-dropdown-item>
                <router-link to="/paciente-alta">Pacientes de alta</router-link>
              </mdb-dropdown-item>
            </mdb-dropdown-menu>
          </mdb-dropdown>
          <mdb-nav-item
            @click="logout"
            class="btn btn-danger text-white btn-sm radius"
          >
            Salir <i class="fas fa-arrow-right"></i>
          </mdb-nav-item>
        </mdb-navbar-nav>
      </mdb-navbar-toggler>
    </div>
  </mdb-navbar>
</template>

<script>
import {
  mdbDropdownToggle,
  mdbDropdownMenu,
  mdbContainer,
  mdbNavbar,
  mdbNavbarBrand,
  mdbNavbarToggler,
  mdbNavbarNav,
  mdbNavItem,
  mdbDropdown,
  mdbDropdownItem,
} from "mdbvue";
export default {
  name: "Navbar",
  components: {
    mdbDropdownToggle,
    mdbDropdownMenu,
    mdbContainer,
    mdbNavbar,
    mdbNavbarBrand,
    mdbNavbarToggler,
    mdbNavbarNav,
    mdbNavItem,
    mdbDropdown,
    mdbDropdownItem,
  },
  methods: {
    logout() {
      localStorage.removeItem("admin-login");
      this.$router.push("/login");
      setTimeout(() => {
        window.location.reload();
      }, 5);
    },
  },
};
</script>

<style scoped>
html {
  overflow-x: hidden;
}
.radius {
  border-radius: 9em !important;
}
.color {
  color: white;
}
</style>