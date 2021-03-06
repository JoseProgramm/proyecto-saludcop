<template>
  <div class="container my-5">
    <h1 class="text-center grey-text">Pacientes esperando por cama</h1>
    <p class="text-center text-muted">
      Listado de pacientes en cola a espera de cama en el hospital.
    </p>

    <div class="justify-content-center my-5">
      <div class="page-content page-container" id="page-content">
        <div class="padding">
          <div class="row container d-flex justify-content-center">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card" v-if="pacientesEnCola.length">
                <div class="card-body">
                  <h4 class="card-title">Listado de pacientes en cola</h4>
                  <p class="card-description">
                    El paciente se eliminara del listado automaticamente cuando
                    tenga una cama asignada.
                  </p>
                  <div class="text-center">
                    <input
                      v-model.trim="buscadorPacientesEnCola"
                      type="text"
                      placeholder="Filtrar pacientes en cola"
                      class="buscador mb-3"
                    />
                  </div>
                  <div class="table-responsive">
                    <table class="table table-striped">
                      <thead>
                        <tr>
                          <th>Sexo</th>
                          <th>Nombres</th>
                          <th>Motivo</th>
                          <th>Enfermedad</th>
                          <th>Fecha ingreso</th>
                          <th>Estado de salud</th>
                          <th>Acción</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr
                          v-for="paciente in pacientesAltaFiltrados"
                          :key="paciente.id"
                        >
                          <td class="py-1">
                            <img
                              :src="
                                paciente.sexo === 'Masculino'
                                  ? '/img/masculino.png'
                                  : '/img/femenina.png'
                              "
                              :alt="paciente.nombre"
                            />
                          </td>
                          <td class="text-capitalize">
                            {{ paciente.nombre }} {{ paciente.apellido }}
                          </td>
                          <td class="text-capitalize">{{ paciente.motivo }}</td>
                          <td class="text-capitalize">
                            {{ paciente.enfermedad }}
                          </td>
                          <td class="text-capitalize">
                            {{ formatearFecha(paciente.fecha_ingreso) }}
                          </td>
                          <td>
                            <div class="progress">
                              <div
                                class="progress-bar bg-warning"
                                role="progressbar"
                                :style="{ width: paciente.edad + '%' }"
                                aria-valuenow="25"
                                aria-valuemin="0"
                                aria-valuemax="100"
                              ></div>
                            </div>
                          </td>
                          <td>
                            <div>
                              <mdb-btn
                                @click="
                                  $router.push(`/paciente/${paciente.id}`)
                                "
                                dark-waves
                                size="md"
                                icon="procedures"
                                color="info"
                                >Detalles</mdb-btn
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
                  No hay pacientes en cola
                  <i class="fas fa-file-medical-alt"></i>
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
import { mdbBtn } from "mdbvue";
import axios from "axios";
import alertify from "alertifyjs";
export default {
  name: "PacienteAlta",
  components: {
    mdbBtn,
  },
  data() {
    return {
      pacientesEnCola: [],
      buscadorPacientesEnCola: "",
    };
  },
  mounted() {
    this.getPacientesCola();
  },
  computed: {
    pacientesAltaFiltrados() {
      return this.pacientesEnCola.filter((item) => {
        return (
          item.nombre
            .toLowerCase()
            .includes(this.buscadorPacientesEnCola.toLowerCase()) ||
          item.apellido
            .toLowerCase()
            .includes(this.buscadorPacientesEnCola.toLowerCase()) ||
          item.medicamento_hosp
            .toLowerCase()
            .includes(this.buscadorPacientesEnCola.toLowerCase()) ||
          item.motivo
            .toLowerCase()
            .includes(this.buscadorPacientesEnCola.toLowerCase()) ||
          item.enfermedad.includes(this.buscadorPacientesEnCola.toLowerCase())
        );
      });
    },
  },
  methods: {
    formatearFecha(fecha) {
      return new Date(fecha).toLocaleDateString();
    },
    async getPacientesCola() {
      try {
        const url = "http://localhost:5000/api/pacientes-en-cola";
        const {
          data: { pacientesCola },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.pacientesEnCola = pacientesCola;
      } catch (error) {
        alertify.error("Ocurrió un error obteniendo los pacientes en cola");
      }
    },
  },
};
</script>

<style scoped>
buscador {
  margin-bottom: 1em;
  text-align: center;
  display: flex;
  justify-content: center;
}
input[type="text"] {
  border: 1px solid grey;
  border-radius: 5px;
  width: 40%;
  padding: 2px 23px 2px 30px;
  outline: 0;
  background-color: #f5f5f5;
  padding: 6px;
  border: 1px solid #ccc;
  margin-top: 8px;
  font-size: 17px;
}
input[type="text"] {
  transition: width 0.4s ease-in-out;
}
input[type="text"]:focus {
  width: 45%;
}
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
    content: "Sexo";
  }
  td:nth-of-type(2):before {
    content: "Nombres";
  }
  td:nth-of-type(3):before {
    content: "Motivo";
  }
  td:nth-of-type(4):before {
    content: "Enfermedad";
  }
  td:nth-of-type(5):before {
    content: "Tratamientos";
  }
  td:nth-of-type(6):before {
    content: "Salud";
  }
  td:nth-of-type(7):before {
    content: "Acción";
  }
}
@media screen and (max-width: 600px) {
  input[type="text"] {
    float: none;
    display: block;
    text-align: center;
    width: 50%;
    margin: 0;
    padding: 14px;
  }
  input[type="text"] {
    border: 1px solid #ccc;
  }
}
.flex {
  -webkit-box-flex: 1;
  -ms-flex: 1 1 auto;
  flex: 1 1 auto;
}

.card {
  box-shadow: none;
  -webkit-box-shadow: none;
  -moz-box-shadow: none;
  -ms-box-shadow: none;
}

.pl-3,
.px-3 {
  padding-left: 1rem !important;
}

.card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 1px solid #d2d2dc;
  border-radius: 0;
}

.card .card-title {
  color: #000000;
  margin-bottom: 0.625rem;
  text-transform: capitalize;
  font-size: 0.875rem;
  font-weight: 500;
}

.card .card-description {
  margin-bottom: 0.875rem;
  font-weight: 400;
  color: #76838f;
}

p {
  font-size: 0.875rem;
  margin-bottom: 0.5rem;
  line-height: 1.5rem;
}

.table-responsive {
  display: block;
  width: 100%;
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
  -ms-overflow-style: -ms-autohiding-scrollbar;
}

.table,
.jsgrid .jsgrid-table {
  width: 100%;
  max-width: 100%;
  margin-bottom: 1rem;
  background-color: transparent;
}

.table thead th,
.jsgrid .jsgrid-table thead th {
  border-top: 0;
  border-bottom-width: 1px;
  font-weight: 500;
  font-size: 0.875rem;
  text-transform: uppercase;
}

.table td,
.jsgrid .jsgrid-table td {
  font-size: 0.875rem;
  padding: 0.875rem 0.9375rem;
}

.badge {
  border-radius: 0;
  font-size: 12px;
  line-height: 1;
  padding: 0.375rem 0.5625rem;
  font-weight: normal;
}

.progress {
  border-radius: 3px;
  height: 8px;
  margin-top: 7px;
}
</style>