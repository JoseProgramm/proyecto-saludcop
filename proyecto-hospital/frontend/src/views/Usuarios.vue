<template>
  <div class="container my-5">
    <h1 class="text-center grey-text">Usuarios disponibles</h1>
    <p class="text-center text-muted">
      Listado de usuarios disponibles con acceso a Salud COP
      <i class="fas fa-user-circle"></i>
    </p>

    <div class="justify-content-center my-5">
      <div class="page-content page-container" id="page-content">
        <div class="padding">
          <div class="row container d-flex justify-content-center">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card" v-if="usuarios.length">
                <div class="card-body">
                  <h4 class="card-title">Listado de usuarios disponibles</h4>
                  <p class="card-description">
                    El usuario administrador solo tiene acceso a eliminar otros
                    usuarios. <i class="fas fa-user-lock"></i>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Nombre</th>
                          <th>Usuario</th>
                          <th>Fecha de creación</th>
                          <th v-if="rol">Acción</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr v-for="usuario in usuarios" :key="usuario.id">
                          <td class="text-capitalize">
                            {{ usuario.nombre }}
                          </td>
                          <td class="text-capitalize">{{ usuario.usuario }}</td>
                          <td class="text-capitalize">
                            {{ formatearFecha(usuario.fecha_creacion) }}
                          </td>
                          <td v-if="rol">
                            <div>
                              <mdb-btn
                                @click="eliminarUsuario(usuario.id)"
                                dark-waves
                                size="md"
                                icon="user-minus"
                                color="danger"
                                :disabled="
                                  usuario.usuario === 'admin@email.com'
                                "
                                >Eliminar</mdb-btn
                              >
                            </div>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              <div v-else>
                <h4 class="text-muted text-center">
                  No hay usuarios disponibles
                  <i class="fas fa-users-slash"></i>
                </h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import alertify from "alertifyjs";
import { mdbBtn } from "mdbvue";
export default {
  name: "Usuarios",
  components: {
    mdbBtn,
  },
  data() {
    return {
      usuarios: [],
      rol: null,
    };
  },
  mounted() {
    this.getUsuarios();
    this.getRolUsuario();
  },
  methods: {
    formatearFecha(fecha) {
      return new Date(fecha).toLocaleDateString();
    },
    async getUsuarios() {
      try {
        const url = "http://localhost:5000/api/obtener-usuarios";
        const {
          data: { usuarios },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.usuarios = usuarios;
      } catch (error) {
        alertify.error("Ocurrió un error obteniendo los usuarios");
      }
    },
    eliminarUsuario(usuarioId) {
      alertify.set("notifier", "position", "top-right");
      alertify
        .confirm(
          "Eliminar usuario",
          "¿Está seguro que desea eliminar el usuario?",
          () => {
            const url = `http://localhost:5000/api/usuario-eliminar/${usuarioId}`;
            axios
              .delete(url, {
                headers: {
                  autenticacion: `${localStorage.getItem("admin-login")}`,
                },
              })
              .then((res) => {
                alertify.success(res.data.msg);
                this.getUsuarios();
                this.getRolUsuario();
              })
              .catch((e) => {
                alertify.error(e.response.data.msg);
              });
          },
          () => {}
        )
        .set("labels", { ok: "Si!", cancel: "Cancelar" });
    },
    async getRolUsuario() {
      try {
        const url = "http://localhost:5000/api/rol-usuarios";
        const {
          data: { rol },
        } = await axios.get(`${url}/${localStorage.getItem("admin-login")}`, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.rol = rol;
      } catch (error) {
        alertify.error("Ocurrió un error obteniendo el rol del usuario");
      }
    },
  },
};
</script>

<style scoped>
@media only screen and (max-width: 1100px),
  (min-device-width: 768px) and (max-device-width: 1024px) {
  table,
  thead,
  tbody,
  td,
  tr {
    display: block;
  }
  th {
    display: none;
  }

  thead tr {
    position: absolute;
    top: -9999px;
    left: -9999px;
  }

  tr {
    border: 1px solid #ccc;
  }

  td {
    text-transform: capitalize !important;
    border: none;
    border-bottom: 1px solid #eee;
    position: relative;
    padding-left: 50% !important;
  }

  td:before {
    text-transform: capitalize !important;
    position: absolute;
    top: 6px;
    left: 6px;
    width: 45%;
    padding-right: 10px;
    white-space: nowrap;
  }

  td:nth-of-type(1):before {
    content: "Nombre";
  }
  td:nth-of-type(2):before {
    content: "Usuario";
  }
  td:nth-of-type(3):before {
    content: "Fecha de creeación";
  }
  td:nth-of-type(4):before {
    content: "Acción";
  }
}
</style>