<template>
  <div class="container my-5">
    <div class="row">
      <div class="col-md-12">
        <mdb-card>
          <mdb-card-body>
            <form novalidate @submit.prevent="agregarPaciente">
              <p class="h4 text-center py-4">Registo de pacientes</p>
              <p class="text-muted text-center">
                Completa los datos solicitados para el registro del paciente. La
                cama se asignada automaticamente en caso se encuentre
                disponible. En caso no existan camas disponibles entrara en la
                cola <br />
                <i class="fas fa-warning"></i>
                Solo hay disponibles 50 camas para los pacientes <br />
                <template v-if="cantidadCamasDisponibles <= 0">
                  <i class="fas fa-times"></i>
                  <strong>
                    Actualmente no hay camas disponibles, entrara en
                    cola</strong
                  >
                </template>
                <template v-else>
                  <i class="fas fa-bell"></i> Actualmente cuentas con:
                  <strong>{{ cantidadCamasDisponibles }}</strong>
                </template>
              </p>
              <div class="grey-text">
                <h4 class="text-left text-dark mt-5">
                  Datos personales del paciente
                </h4>
                <div class="row">
                  <div class="col-6">
                    <mdb-input
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
                      :validation="paciente.edad === 'invalido'"
                    />
                  </div>
                  <div class="col-6">
                    <label for="sexo" class="form-label"
                      >Sexo <i class="fas fa-user-friends"></i
                    ></label>
                    <select
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
                  <mdb-btn
                    v-show="
                      !paciente.medicamento_habitual || !paciente.enfermedad
                    "
                    group
                    dark-waves
                    size="md"
                    class="animated flipInX"
                    @click="historiaMedica = !historiaMedica"
                    :disabled="deshabilitado"
                    color="info"
                    :icon="historiaMedica ? 'eye-slash' : 'eye'"
                    :icon-class="[{ 'fa-spin': deshabilitado }]"
                    >{{ historiaMedica ? "Ocultar" : "Mostrar" }}</mdb-btn
                  >
                </h4>
                <transition-group
                  name="custom-classes-transition"
                  enter-active-class="animated flipInX"
                  leave-active-class="animated flipOutY"
                  :duration="500"
                >
                  <div
                    :key="'transition' + 400"
                    v-if="
                      historiaMedica ||
                      paciente.enfermedad ||
                      paciente.medicamento_habitual
                    "
                  >
                    <div class="row" :key="'transition' + 1">
                      <div class="col-6" :key="'transition' + 20">
                        <mdb-input
                          v-model.trim="paciente.enfermedad"
                          outline
                          class="my-4"
                          label="Enfermedad que padece"
                          icon="head-side-virus"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                      <div class="col-6" :key="'transition' + 21">
                        <mdb-input
                          v-model.trim="paciente.medicamento_habitual"
                          outline
                          class="my-4"
                          label="Medicamentos que toma"
                          icon="capsules"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                    </div>
                    <div class="row" :key="'transition' + 2">
                      <div class="col-6" :key="'transition' + 22">
                        <mdb-input
                          v-model.number="paciente.cirugias"
                          outline
                          class="my-4"
                          label="N° de cirugias (marca 0 si no tiene)"
                          icon="syringe"
                          group
                          type="number"
                          validate
                          error="wrong"
                          success="right"
                          :min="0"
                          :max="10"
                        />
                      </div>
                      <div class="col-6" :key="'transition' + 23">
                        <mdb-input
                          v-model.trim="paciente.habitos_alimentos"
                          outline
                          class="my-4"
                          label="Habitos alimenticios"
                          icon="utensils"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                    </div>
                    <div class="row" :key="'transition' + 3">
                      <div class="col-6" :key="'transition' + 24">
                        <mdb-input
                          v-model.trim="paciente.habitos_ejercicio"
                          outline
                          class="my-4"
                          label="Habitos de ejercicio"
                          icon="dumbbell"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                      <div class="col-6" :key="'transition' + 25">
                        <mdb-input
                          v-model.trim="paciente.enfermedad_familiar"
                          outline
                          class="my-4"
                          label="Antecedentes familiares"
                          icon="users"
                          group
                          type="textarea"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                    </div>
                    <div class="row" :key="'transition' + 4">
                      <div class="col-4" :key="30 + 'transition'">
                        <div class="custom-control custom-switch">
                          <input
                            type="checkbox"
                            class="custom-control-input"
                            id="alcoholico"
                            v-model="alcoholico"
                          />
                          <label class="custom-control-label" for="alcoholico"
                            >Es Alcoholico <i class="fas fa-wine-bottle"></i
                          ></label>
                        </div>
                      </div>
                      <div class="col-4" :key="31 + 'transition'">
                        <div class="custom-control custom-switch">
                          <input
                            type="checkbox"
                            class="custom-control-input"
                            id="fumador"
                            v-model="fumador"
                          />
                          <label class="custom-control-label" for="fumador"
                            >Es fumador <i class="fas fa-smoking"></i>
                          </label>
                        </div>
                      </div>
                      <div class="col-4" :key="32 + 'transition'">
                        <div class="custom-control custom-switch">
                          <input
                            type="checkbox"
                            class="custom-control-input"
                            id="toma-cafe"
                            v-model="tomaCafe"
                          />
                          <label class="custom-control-label" for="toma-cafe"
                            >Toma cafe <i class="fas fa-mug-hot"></i>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="row" :key="'transition' + 5">
                      <div class="col-4" v-if="alcoholico">
                        <mdb-input
                          v-model.trim="paciente.alcoholico"
                          outline
                          class="my-4"
                          label="Frecuencia"
                          icon="wine-bottle"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                      <div class="col-4" v-if="fumador">
                        <mdb-input
                          v-model.trim="paciente.fumador"
                          outline
                          class="my-4"
                          label="Frencuencia"
                          icon="smoking"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                      <div class="col-4" v-if="tomaCafe">
                        <mdb-input
                          outline
                          v-model.trim="paciente.toma_cafe"
                          class="my-4"
                          label="Frecuencia"
                          icon="mug-hot"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                    </div>
                    <div class="col-12">
                      <mdb-input
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
                          v-model.trim="paciente.medicamento_hosp"
                          outline
                          class="my-4"
                          label="Medicamento a suministrar"
                          icon="stethoscope"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                      <div class="col-6" :key="'transition' + 27">
                        <mdb-input
                          v-model.trim="paciente.observacion"
                          outline
                          class="my-4"
                          label="Observación"
                          icon="exclamation"
                          group
                          type="text"
                          validate
                          error="wrong"
                          success="right"
                        />
                      </div>
                    </div>
                  </div>
                </transition-group>
              </div>
              <div class="text-center py-4 mt-3">
                <mdb-btn
                  :disabled="deshabilitado"
                  color="success"
                  :icon="deshabilitado ? 'circle-notch' : 'user-nurse'"
                  :icon-class="[{ 'fa-spin': deshabilitado }]"
                  class="btn btn-block"
                  type="submit"
                  >Registrar paciente</mdb-btn
                >
              </div>
            </form>
          </mdb-card-body>
        </mdb-card>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mdbInput, mdbBtn, mdbCard, mdbCardBody } from "mdbvue";
export default {
  name: "Paciente-Agregar",
  components: {
    mdbInput,
    mdbBtn,
    mdbCard,
    mdbCardBody,
  },
  data() {
    return {
      cantidadCamasDisponibles: [],
      deshabilitado: false,
      historiaMedica: false,
      paciente: {
        nombre: "",
        apellido: "",
        edad: null,
        sexo: "",
        numero_personal: null,
        numero_familiar: null,
        direccion: "",
        enfermedad: "",
        medicamento_habitual: "",
        cirugias: null,
        habitos_alimentos: "",
        habitos_ejercicio: "",
        fumador: null,
        alcoholico: null,
        toma_cafe: null,
        enfermedad_familiar: "",
        motivo: "",
        medicamento_hosp: "",
        observacion: "",
      },
      tomaCafe: "",
      alcoholico: "",
      fumador: "",
    };
  },
  mounted() {
    this.obtenerCamasDisponibles();
  },
  methods: {
    async obtenerCamasDisponibles() {
      let url = "http://localhost:5000/api/cantidad-camas-disponibles";
      try {
        const {
          data: { camasDisponibles },
        } = await axios.get(url, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        });
        this.cantidadCamasDisponibles = camasDisponibles;
      } catch (error) {
        alertify.error("Error al obtener la cantidad de camas disponibles");
      }
    },
    limpiarCampos() {
      this.tomaCafe = "";
      this.alcoholico = "";
      this.fumador = "";
      this.paciente = {
        nombre: "",
        apellido: "",
        edad: null,
        sexo: "",
        numero_personal: null,
        numero_familiar: null,
        direccion: "",
        enfermedad: "",
        medicamento_habitual: "",
        cirugias: null,
        habitos_alimentos: "",
        habitos_ejercicio: "",
        fumador: null,
        alcoholico: null,
        toma_cafe: null,
        enfermedad_familiar: "",
        motivo: "",
        medicamento_hosp: "",
        observacion: "",
      };
      this.deshabilitado = false;
    },
    agregarPaciente(event) {
      this.deshabilitado = true;
      if (
        this.paciente.numero_personal === null ||
        this.paciente.numero_familiar === null
      ) {
        this.deshabilitado = false;
        alertify.error("El numero de personal y familiar son obligatorios");
        return;
      }
      if (this.paciente.numero_personal === this.paciente.numero_familiar) {
        this.deshabilitado = false;
        alertify.error(
          "El numero de personal y familiar no pueden ser iguales"
        );
        return;
      }
      if (
        this.paciente.nombre === "" ||
        this.paciente.apellido === "" ||
        this.paciente.edad === null ||
        this.paciente.sexo === "" ||
        this.paciente.numero_personal === null ||
        this.paciente.numero_familiar === null ||
        this.paciente.direccion === "" ||
        this.paciente.enfermedad === "" ||
        this.paciente.medicamento_habitual === "" ||
        this.paciente.cirugias === null ||
        this.paciente.habitos_alimentos === "" ||
        this.paciente.habitos_ejercicio === "" ||
        this.paciente.enfermedad_familiar === "" ||
        this.paciente.motivo === "" ||
        this.paciente.medicamento_hosp === "" ||
        this.paciente.observacion === ""
      ) {
        alertify.set("notifier", "position", "top-right");
        alertify.error("Todos los campos son obligatorios");
        this.deshabilitado = false;
        return;
      }
      if (this.paciente.fumador) {
        this.paciente.fumador = `Si. ${this.paciente.fumador} `;
      } else {
        this.paciente.fumador = `No`;
      }
      if (this.paciente.alcoholico) {
        this.paciente.alcoholico = `Si. ${this.paciente.alcoholico} `;
      } else {
        this.paciente.alcoholico = `No`;
      }
      if (this.paciente.toma_cafe) {
        this.paciente.toma_cafe = `Si. ${this.paciente.toma_cafe} `;
      } else {
        this.paciente.toma_cafe = `No`;
      }
      let paciente = this.paciente;
      let url = "http://localhost:5000/api/paciente-registro";
      event.target.classList.add("was-validated");
      axios
        .post(url, paciente, {
          headers: {
            autenticacion: `${localStorage.getItem("admin-login")}`,
          },
        })
        .then((response) => {
          alertify.set("notifier", "position", "top-right");
          alertify.success("Paciente registrado con exito");
          if (response.data.id_cama) {
            alertify.success(
              "El número de cama asignado es " + response.data.id_cama
            );
          } else {
            alertify.warning(
              "El paciente no tiene cama asignada, se ha agregado a la cola."
            );
          }
          this.deshabilitado = false;
          this.limpiarCampos();
          setTimeout(() => {
            this.$router.push("/");
          }, 2000);
        })
        .catch((error) => {
          this.deshabilitado = false;
          alertify.error(
            "Error al registrar paciente. Recuerde que los números personales & Familiar son unicos" +
              error
          );
        });
    },
  },
};
</script>

<style >
</style>