<template>
  <div class="container">
    <h1 class="text-center m-3"></h1>
    <section id="team" class="pb-5">
      <div class="container">
        <div class="container mb-2">
          <div class="row justify-content-between responsive">
            <mdb-btn
              @click="obtenerDatos"
              flat
              dark-waves
              icon="redo-alt"
              class="
                btn btn-default btn-rounded
                p-2
                text-white
                boton-actualizar
              "
            >
              Actualizar
            </mdb-btn>
            <div class="badge-contenedor">
              <mdb-badge pill color="success" class="p-3 mt-2">
                <span>Pacientes en cama <i class="fas fa-procedures"></i></span>
                <mdb-badge pill color="danger" class="ml-2">{{
                  cantidadPacientesCama
                }}</mdb-badge>
              </mdb-badge>
              <mdb-badge pill color="primary" class="p-3 ml-2 mt-2">
                <span>Pacientes en cola <i class="fas fa-wheelchair"></i></span>
                <mdb-badge pill color="danger" class="ml-2">{{
                  pacientesEnCola
                }}</mdb-badge>
              </mdb-badge>
            </div>
          </div>
        </div>
        <div class="container mt-4" v-if="pacientesHospitalizados.length">
          <div class="justify-content-center row">
            <mdb-input
              class="max"
              icon="search"
              type="text"
              label="Buscar pacientes (Nombre, Apellido, Edad, Sexo, Enfermedad o Cama)"
              outline
              v-model="buscador"
            />
          </div>
          <h5 class="section-title h1 mt-2">
            Pacientes hospitalizados {{ buscador.length ? "Filtrados" : null }}
          </h5>

          <div class="row" :key="'transition' + 400">
            <template v-for="paciente in pacientesFiltrados">
              <div class="col-xs-12 col-sm-6 col-md-3" :key="paciente.id">
                <div class="image-frontal">
                  <div class="contendio flip-0">
                    <div class="frontal">
                      <div class="card">
                        <div class="card-body text-center">
                          <p>
                            <img
                              class="img-fluid"
                              :src="
                                paciente.sexo === 'Masculino'
                                  ? '/img/paciente-masculino.jpg'
                                  : '/img/paciente-femenino.jpg'
                              "
                              :alt="paciente.nombre"
                            />
                          </p>
                          <h4 class="card-title">Paciente en cama</h4>
                          <p class="card-text">
                            Nombre:
                            <strong class="text-capitalize"
                              >{{ paciente.nombre }} {{ paciente.apellido }}
                            </strong>
                            <br />
                            Edad: <strong>{{ paciente.edad }} años</strong>
                            <br />
                            Sexo: <strong>{{ paciente.sexo }}</strong> <br />
                            Enfermedad:
                            <strong>{{ paciente.enfermedad }}</strong> <br />
                            N° Sala: <strong>{{ paciente.id_cama }}</strong>
                          </p>
                        </div>
                      </div>
                    </div>
                    <div class="posterior">
                      <div class="card">
                        <div class="card-body text-center mt-4">
                          <h4 class="card-title">Motivo & Obseración</h4>
                          <p class="card-text">
                            Motivo de consulta:
                            <strong
                              >{{ paciente.motivo.substring(0, 50) }}...</strong
                            >
                            <br />
                            Observaciones:
                            <strong
                              >{{
                                paciente.observacion.substring(0, 50)
                              }}...</strong
                            >
                          </p>
                          <ul class="list-inline">
                            <li class="list-inline-item">
                              <a
                                class="text-xs-center"
                                @click="detallesPaciente(paciente.id)"
                              >
                                Ir a detalles <i class="fa fa-arrow-right"></i>
                              </a>
                            </li>
                            <li class="list-inline-item">
                              <a
                                class="text-xs-center"
                                @click="pacienteDarAlta(paciente.id)"
                              >
                                Dar de alta <i class="fa fa-check"></i>
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </template>
          </div>
        </div>
        <div v-else class="container my-5">
          <h4 class="text-center text-muted">
            No existen pacientes registrados
            <i class="fas fa-laptop-medical"></i>
          </h4>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "axios";
import alertify from "alertifyjs";
import { mdbBtn, mdbBadge, mdbInput } from "mdbvue";
export default {
  name: "Home",
  components: {
    mdbBadge,
    mdbBtn,
    mdbInput,
  },
  data() {
    return {
      buscador: "",
      pacientesHospitalizados: [],
      cantidadPacientesCama: null,
      centidadCamasDisponibles: null,
      pacientesEnCola: null,
    };
  },
  computed: {
    pacientesFiltrados() {
      return this.pacientesHospitalizados.filter((item) => {
        return (
          item.nombre.toLowerCase().includes(this.buscador.toLowerCase()) ||
          item.apellido.toLowerCase().includes(this.buscador.toLowerCase()) ||
          item.enfermedad.toLowerCase().includes(this.buscador.toLowerCase()) ||
          item.sexo.toLowerCase().includes(this.buscador.toLowerCase()) ||
          item.enfermedad.includes(this.buscador.toLowerCase()) ||
          `${item.id_cama}`.includes(this.buscador.toLowerCase())
        );
      });
    },
  },
  methods: {
    pacienteDarAlta(pacienteId) {
      alertify.set("notifier", "position", "top-right");
      alertify
        .confirm(
          "Dar de alta paciente",
          "¿Está seguro que desea dar de alta al paciente?",
          () => {
            const url = `http://localhost:5000/api/paciente-alta/${pacienteId}`;
            axios({
              url,
              method: "PUT",
              headers: {
                autenticacion: `${localStorage.getItem("admin-login")}`,
              },
            })
              .then((res) => {
                alertify.success(res.data.msg);
                this.getCamasDisponibles();
                setTimeout(() => {
                  this.obtenerDatos();
                }, 100);
              })
              .catch((err) => {
                alertify.error(err.response.data.msg);
              });
          },
          () => {
            alertify.warning("Operación cancelada");
          }
        )
        .set("labels", { ok: "Si!", cancel: "Cancelar" });
    },
    detallesPaciente(pacienteID) {
      this.$router.push({ name: "DetallesPaciente", params: { pacienteID } });
    },
    obtenerDatos() {
      this.getCantidadPacienteHospitalizados();
      this.getPacientesEnCola();
      this.getPacientesHospitalizados();
      this.getCamasDisponibles();
      this.asinarCamaPacientesEnCola();
    },
    async getCantidadPacienteHospitalizados() {
      let url = "http://localhost:5000/api/cantidad-pacientes-hospitalizados";
      try {
        const {
          data: { cantidadPacientesHospitalizados },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.cantidadPacientesCama = cantidadPacientesHospitalizados;
      } catch (error) {
        alertify.error(
          "Error al obtener la cantidad de pacientes hospitalizados"
        );
      }
    },
    async getCamasDisponibles() {
      let url = "http://localhost:5000/api/cantidad-camas-disponibles";
      try {
        const {
          data: { camasDisponibles },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.centidadCamasDisponibles = camasDisponibles;
      } catch (error) {
        alertify.error("Error al obtener la cantidad de camas disponibles");
      }
    },
    async asinarCamaPacientesEnCola() {
      if (this.pacientesEnCola >= 1 && this.centidadCamasDisponibles >= 1) {
        for (let index = 0; index < this.pacientesEnCola; index++) {
          if (this.centidadCamasDisponibles !== 0) {
            let url = "http://localhost:5000/api/pacienteCola/asignar-cama";
            try {
              const {
                data: { msg },
              } = await axios.get(url, {
                headers: {
                  autenticacion: `${localStorage.getItem("admin-login")}`,
                },
              });
              alertify.success(msg);
              await this.getPacientesEnCola();
              await this.getCamasDisponibles();
              await this.getPacientesHospitalizados();
            } catch (error) {
              alertify.error(
                "Ocurió un error asginado automaticamente la cama del paciente en cola"
              );
            }
          }
        }
      }
    },
    async getPacientesEnCola() {
      let url = "http://localhost:5000/api/cantidad-pacientes-en-cola";
      try {
        const {
          data: { cantidadPacienteCola },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.pacientesEnCola = cantidadPacienteCola;
      } catch (error) {
        alertify.error("Error al obtener la cantidad de pacientes en cola");
      }
    },
    async getPacientesHospitalizados() {
      let url = "http://localhost:5000/api/pacientes-hospitalizados";
      try {
        const {
          data: { pacientesHospital },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.pacientesHospitalizados = pacientesHospital;
      } catch (error) {
        alertify.error("Error al obtener los pacientes hospitalizados");
      }
    },
  },
  mounted() {
    this.obtenerDatos();
  },
};
</script>
<style scoped>
.max {
  width: 36em !important;
}

.max:focus {
  width: 65% !important ;
}

.section-table {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 2em;
  padding: 2em;
  max-width: 52em;
}
.sin-resultados {
  text-align: center;
  text-transform: capitalize;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  font-size: 1.5em;
  font-weight: 200;
}
@media screen and (max-width: 450px) {
  .responsive {
    text-align: center;
    margin: auto;
  }
  .boton-actualizar {
    margin: auto;
  }
}

.btn-primary:hover,
.btn-primary:focus {
  background-color: #108d6f;
  border-color: #108d6f;
  box-shadow: none;
  outline: none;
}

.btn-primary {
  color: #fff;
  background-color: #007b5e;
  border-color: #007b5e;
}

section {
  padding: 60px 0;
}

section .section-title {
  text-align: center;
  color: #007b5e;
  margin-bottom: 50px;
  text-transform: uppercase;
}

#team .card {
  border: none;
  background: #ffffff;
}

.image-frontal:hover .posterior,
.image-frontal.hover .posterior {
  -webkit-transform: rotateY(0deg);
  -moz-transform: rotateY(0deg);
  -o-transform: rotateY(0deg);
  -ms-transform: rotateY(0deg);
  transform: rotateY(0deg);
  border-radius: 0.25rem;
}

.image-frontal:hover .frontal,
.image-frontal.hover .frontal {
  -webkit-transform: rotateY(180deg);
  -moz-transform: rotateY(180deg);
  -o-transform: rotateY(180deg);
  transform: rotateY(180deg);
}

.contendio {
  -webkit-transition: 1s;
  -webkit-transform-style: preserve-3d;
  -ms-transition: 1s;
  -moz-transition: 1s;
  -moz-transform-style: preserve-3d;
  -ms-transform-style: preserve-3d;
  transition: 1s;
  transform-style: preserve-3d;
  position: relative;
}

.frontal {
  position: relative;
  z-index: 2;
  margin-bottom: 30px;
}

.posterior {
  position: absolute;
  top: 0;
  left: 0;
  background: white;
  -webkit-transform: rotateY(-180deg);
  -moz-transform: rotateY(-180deg);
  -o-transform: rotateY(-180deg);
  -ms-transform: rotateY(-180deg);
  transform: rotateY(-180deg);
  -webkit-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
  -moz-box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
  box-shadow: 5px 7px 9px -4px rgb(158, 158, 158);
}

.frontal,
.posterior {
  -webkit-backface-visibility: hidden;
  -moz-backface-visibility: hidden;
  -ms-backface-visibility: hidden;
  backface-visibility: hidden;
  -webkit-transition: 1s;
  -webkit-transform-style: preserve-3d;
  -moz-transition: 1s;
  -moz-transform-style: preserve-3d;
  -o-transition: 1s;
  -o-transform-style: preserve-3d;
  -ms-transition: 1s;
  -ms-transform-style: preserve-3d;
  transition: 1s;
  transform-style: preserve-3d;
}

.frontal .card,
.posterior .card {
  min-height: 312px;
}

.posterior .card a {
  font-size: 18px;
  color: #007b5e !important;
}

.frontal .card .card-title,
.posterior .card .card-title {
  color: #007b5e !important;
}

.frontal .card .card-body img {
  width: 120px;
  height: 120px;
  border-radius: 50%;
}
.badge-contenedor {
  text-align: center !important;
}
</style>