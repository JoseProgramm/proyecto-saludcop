<template>
  <div class="container my-4">
    <div class="row">
      <mdb-btn
        @click="$router.go(-1)"
        class="btn btn-primary"
        rounded
        icon="arrow-left"
      >
        Volver
      </mdb-btn>

      <div class="col-md-12 my-5">
        <h2 v-if="paciente.dado_alta" class="text-center text-success mb-5">
          Paciente dado de alta <i class="fas fa-check"></i>
        </h2>
        <div v-if="cargando" class="text-center">
          <div class="spinner-border text-success" role="status">
            <span class="sr-only">Loading...</span>
          </div>
        </div>
        <mdb-card v-else>
          <mdb-card-body>
            <p class="h4 text-center py-4">
              Detalles del paciente <i class="fas fa-notes-medical"></i>
            </p>
            <p class="text-muted text-center">
              Datos personales del paciente e Historia medica. Completados en el
              registro del paciente. Estos campos son de solo lectura.
            </p>
            <div class="grey-text">
              <h4 class="text-left text-dark mt-5">
                Datos personales del paciente
              </h4>
              <div class="row">
                <div class="col-6">
                  <mdb-input
                    read-only
                    v-model.trim="paciente.nombre"
                    outline
                    class="my-4"
                    label="Nombres"
                    icon="user"
                    group
                    type="text"
                    validate
                    error="wrong"
                    success="right"
                  />
                </div>
                <div class="col-6">
                  <mdb-input
                    read-only
                    v-model.trim="paciente.apellido"
                    outline
                    class="my-4"
                    label="Apellidos"
                    icon="user"
                    group
                    type="email"
                    validate
                    error="wrong"
                    success="right"
                  />
                </div>
              </div>
              <div class="row">
                <div class="col-6">
                  <mdb-input
                    read-only
                    v-model.number="paciente.edad"
                    outline
                    class="my-4"
                    label="Edad"
                    icon="id-card"
                    group
                    type="number"
                    :min="0"
                    :max="100"
                    validate
                    error="wrong"
                    success="right"
                    invalidFeedback="Escribe una fecha a planificar"
                  />
                </div>
                <div class="col-6">
                  <label for="sexo" class="form-label"
                    >Sexo <i class="fas fa-user-friends"></i>
                  </label>
                  <select
                    disabled
                    class="form-control"
                    id="sexo"
                    v-model="paciente.sexo"
                  >
                    <option value="" disabled>Seleccionar</option>
                    <option value="Masculino">Masculino</option>
                    <option value="Femenino">Femenino</option>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col-6">
                  <mdb-input
                    read-only
                    v-model.number="paciente.numero_personal"
                    outline
                    class="my-4"
                    label="Teléfono personal"
                    icon="phone"
                    group
                    type="number"
                    validate
                    error="wrong"
                    success="right"
                  />
                </div>
                <div class="col-6">
                  <mdb-input
                    read-only
                    v-model.number="paciente.numero_familiar"
                    outline
                    class="my-4"
                    label="Teléfono familiar"
                    icon="phone"
                    group
                    type="number"
                    validate
                    error="wrong"
                    success="right"
                  />
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <mdb-input
                    read-only
                    v-model.trim="paciente.direccion"
                    outline
                    class="my-4"
                    label="Dirección"
                    icon="map-marker"
                    group
                    type="textarea"
                    invalidFeedback="Escribe una dirección"
                    validate
                    error="wrong"
                    success="right"
                  />
                </div>
              </div>
              <h4 class="text-left text-dark mt-5">
                Historia médica del paciente
              </h4>
              <transition-group
                name="custom-classes-transition"
                enter-active-class="animated flipInX"
                leave-active-class="animated flipOutY"
                :duration="500"
              >
                <div
                  :key="'transition' + 400"
                  v-if="paciente.enfermedad || paciente.medicamento_habitual"
                >
                  <div class="row" :key="'transition' + 1">
                    <div class="col-6" :key="'transition' + 20">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.enfermedad"
                        outline
                        class="my-4"
                        label="Enfermedad que padece"
                        icon="head-side-virus"
                        group
                        type="text"
                        validate
                      />
                    </div>
                    <div class="col-6" :key="'transition' + 21">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.medicamento_habitual"
                        outline
                        class="my-4"
                        label="Medicamentos que toma"
                        icon="capsules"
                        group
                        type="text"
                        validate
                      />
                    </div>
                  </div>
                  <div class="row" :key="'transition' + 2">
                    <div class="col-6" :key="'transition' + 22">
                      <mdb-input
                        read-only
                        v-model.number="paciente.cirugias"
                        outline
                        class="my-4"
                        label="N° de cirugias (marca 0 si no tiene)"
                        icon="syringe"
                        group
                        type="number"
                        validate
                        :min="0"
                        :max="10"
                      />
                    </div>
                    <div class="col-6" :key="'transition' + 23">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.habitos_alimentos"
                        outline
                        class="my-4"
                        label="Habitos alimenticios"
                        icon="utensils"
                        group
                        type="text"
                        validate
                      />
                    </div>
                  </div>
                  <div class="row" :key="'transition' + 3">
                    <div class="col-6" :key="'transition' + 24">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.habitos_ejercicio"
                        outline
                        class="my-4"
                        label="Habitos de ejercicio"
                        icon="dumbbell"
                        group
                        type="text"
                        validate
                      />
                    </div>
                    <div class="col-6" :key="'transition' + 25">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.enfermedad_familiar"
                        outline
                        class="my-4"
                        label="Antecedentes familiares"
                        icon="users"
                        group
                        type="textarea"
                        validate
                      />
                    </div>
                  </div>
                  <div class="row" :key="'transition' + 4">
                    <div class="col-4" :key="30 + 'transition'">
                      <div class="custom-control custom-switch">
                        <input
                          disabled
                          type="checkbox"
                          class="custom-control-input"
                          id="alcoholico"
                          :checked="paciente.alcoholico.includes('Si')"
                        />
                        <label class="custom-control-label" for="alcoholico"
                          >Es Alcoholico <i class="fas fa-wine-bottle"></i
                        ></label>
                      </div>
                    </div>
                    <div class="col-4" :key="31 + 'transition'">
                      <div class="custom-control custom-switch">
                        <input
                          disabled
                          type="checkbox"
                          class="custom-control-input"
                          id="fumador"
                          :checked="paciente.fumador.includes('Si')"
                        />
                        <label class="custom-control-label" for="fumador"
                          >Es fumador <i class="fas fa-smoking"></i>
                        </label>
                      </div>
                    </div>
                    <div class="col-4" :key="32 + 'transition'">
                      <div class="custom-control custom-switch">
                        <input
                          disabled
                          type="checkbox"
                          class="custom-control-input"
                          id="toma-cafe"
                          :checked="
                            paciente.toma_cafe.startsWith('Si') ? true : false
                          "
                        />
                        <label class="custom-control-label" for="toma-cafe"
                          >Toma cafe <i class="fas fa-mug-hot"></i>
                        </label>
                      </div>
                    </div>
                  </div>
                  <div class="row" :key="'transition' + 5">
                    <div class="col-4">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.alcoholico"
                        outline
                        class="my-4"
                        label="Frecuencia"
                        icon="wine-bottle"
                        group
                        type="text"
                        validate
                      />
                    </div>
                    <div class="col-4">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.fumador"
                        outline
                        class="my-4"
                        label="Frencuencia"
                        icon="smoking"
                        group
                        type="text"
                        validate
                      />
                    </div>
                    <div class="col-4">
                      <mdb-input
                        read-only
                        outline
                        v-model.trim="paciente.toma_cafe"
                        class="my-4"
                        label="Frecuencia"
                        icon="mug-hot"
                        group
                        type="text"
                        validate
                      />
                    </div>
                  </div>
                  <div class="col-12">
                    <mdb-input
                      read-only
                      v-model.trim="paciente.motivo"
                      outline
                      class="my-4"
                      label="Motivo de hospitalización"
                      icon="user-injured"
                      group
                      type="textarea"
                      validate
                      error="wrong"
                      success="right"
                    />
                  </div>
                  <div class="row" :key="'transition' + 6">
                    <div class="col-6" :key="'transition' + 26">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.medicamento_hosp"
                        outline
                        class="my-4"
                        label="Medicamento a suministrar"
                        icon="stethoscope"
                        group
                        type="text"
                        validate
                      />
                    </div>
                    <div class="col-6" :key="'transition' + 27">
                      <mdb-input
                        read-only
                        v-model.trim="paciente.observacion"
                        outline
                        class="my-4"
                        label="Observación"
                        icon="exclamation"
                        group
                        type="text"
                        validate
                      />
                    </div>
                  </div>
                </div>
              </transition-group>
            </div>
            <div
              class="text-center py-4 mt-3"
              v-if="!paciente.dado_alta && paciente.id_cama"
            >
              <mdb-btn
                :disabled="cargando"
                color="success"
                dark-waves
                :icon="cargando ? 'circle-notch' : 'check'"
                :icon-class="[{ 'fa-spin': cargando }]"
                type="button"
                @click="pacienteDarAlta(paciente.id)"
                >Dar de alta</mdb-btn
              >
            </div>
            <div
              class="text-center py-4 mt-3"
              v-if="!paciente.dado_alta && !paciente.id_cama"
            >
              <mdb-btn
                :disabled="cargando || centidadCamasDisponibles === 0"
                color="primary"
                dark-waves
                :icon="cargando ? 'circle-notch' : 'procedures'"
                :icon-class="[{ 'fa-spin': cargando }]"
                type="button"
                title="Asigna cama al paciente en cola"
                @click="asinarCamaPacientesEnCola"
                >Asignar cama a pacientes en cola</mdb-btn
              >
              <span
                v-if="centidadCamasDisponibles === 0"
                class="text-center text-muted d-block mt-2"
                >Actualmente no hay camas disponibles</span
              >
            </div>
          </mdb-card-body>
        </mdb-card>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import alertify from "alertifyjs";
import { mdbInput, mdbBtn, mdbCard, mdbCardBody } from "mdbvue";

export default {
  name: "DetallesPaciente",
  components: {
    mdbInput,
    mdbBtn,
    mdbCard,
    mdbCardBody,
  },
  data() {
    return {
      paciente: {},
      tomaCafe: "",
      alcoholico: "",
      fumador: "",
      cargando: true,
      centidadCamasDisponibles: null,
      pacientesEnCola: null,
    };
  },
  mounted() {
    this.obtenerPaciente();
    this.getPacientesEnCola();
    this.getCamasDisponibles();
  },
  methods: {
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
              setTimeout(() => {
                this.$router.push("/");
              }, 2000);
            } catch (error) {
              alertify.error(
                "Ocurió un error asginado automaticamente la cama del paciente en cola"
              );
            }
          }
        }
      }
    },
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
                this.obtenerPaciente();
                this.asinarCamaPacientesEnCola();
              })
              .catch((err) => {
                alertify.error(err.response.data.msg);
              });
          },
          () => {}
        )
        .set("labels", { ok: "Si!", cancel: "Cancelar" });
    },
    async obtenerPaciente() {
      try {
        this.cargando = true;
        const url = `http://localhost:5000/api/paciente/${this.$route.params.pacienteID}`;
        const {
          data: { paciente },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        if (!paciente.length) {
          alertify.error("El paciente no existe");
          setTimeout(() => {
            this.$router.push("/");
          }, 3000);
          return;
        }
        this.paciente = paciente[0];
        this.cargando = false;
      } catch (error) {
        alertify.error("Error al obtener paciente");
        this.cargando = false;
        setTimeout(() => {
          this.$router.push("/");
        }, 3000);
      }
    },
  },
};
</script>

<style>
</style>