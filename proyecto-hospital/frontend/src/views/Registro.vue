<template>
  <div class="limiter">
    <div class="container-login100">
      <div class="wrap-registro100">
        <div class="registro100-pic">
          <img src="/img/registro.png" alt="imagen-registro" />
        </div>
        <form @submit.prevent="registroUsuario" class="registro100-form">
          <span class="registro100-form-title"> Registrate Salud COP</span>
          <div class="wrap-input100">
            <input
              class="input100"
              type="text"
              placeholder="Nombre"
              v-model.trim="registro.nombre"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fa fa-user" aria-hidden="true"></i>
            </span>
            <small v-if="errorObligatorio" class="text-danger"
              >El nombre es requerido</small
            >
          </div>
          <div class="wrap-input100">
            <input
              class="input100"
              type="email"
              placeholder="Usuario"
              v-model.trim="registro.usuario"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fa fa-envelope" aria-hidden="true"></i>
            </span>
            <small v-if="errorObligatorio" class="text-danger"
              >El usuario es requerido</small
            >
          </div>
          <div class="wrap-input100">
            <input
              class="input100"
              type="password"
              placeholder="Clave"
              v-model.trim="registro.clave"
            />
            <small v-if="errorClave" class="text-danger">
              {{ errorClaveMsg }}
            </small>
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fa fa-lock" aria-hidden="true"></i>
            </span>
            <small v-if="errorObligatorio" class="text-danger"
              >La clave es requerida</small
            >
          </div>
          <div class="wrap-input100">
            <input
              class="input100"
              type="password"
              placeholder="Confirmación de clave"
              v-model.trim="registro.repetir"
            />
            <span class="focus-input100"></span>
            <span class="symbol-input100">
              <i class="fa fa-lock" aria-hidden="true"></i>
            </span>
            <small v-if="errorObligatorio" class="text-danger"
              >La confirmacion de clave es requerida</small
            >
          </div>
          <div class="container-registro100-form-btn">
            <button :disabled="botonDeshabilitado" class="registro100-form-btn">
              Registrarse <span><i class="fas fa-user-shield"></i> </span>
            </button>
          </div>
          <div class="text-center p-t-136 mt-4">
            <router-link class="txt2" to="/login">
              ¿Ya tienes cuenta? Inicia sesión aqui
              <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
            </router-link>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Registro",
  data() {
    return {
      botonDeshabilitado: false,
      errorClave: false,
      errorClaveMsg: null,
      errorObligatorio: false,
      registro: {
        nombre: "",
        usuario: "",
        clave: "",
        repetir: "",
      },
    };
  },
  methods: {
    registroUsuario() {
      const URL = "http://localhost:5000/api/registro-usuario";
      this.botonDeshabilitado = true;
      this.errorObligatorio = false;
      this.errorClaveMsg = null;
      this.errorClave = false;
      if (
        !this.registro.usuario ||
        !this.registro.clave ||
        !this.registro.nombre
      ) {
        this.botonDeshabilitado = false;
        alertify.set("notifier", "position", "top-right");
        alertify.error("Todos los campos son obligatorios");
        this.errorObligatorio = true;
        return;
      }
      if (this.registro.clave.length < 5) {
        this.botonDeshabilitado = false;
        alertify.set("notifier", "position", "top-right");
        alertify.error("La clave debe ser minimo de 5 caracteres");
        this.errorClave = true;
        this.errorClaveMsg = "La clave debe ser minimo de 5 caracteres";
        return;
      }
      if (this.registro.clave !== this.registro.repetir) {
        this.botonDeshabilitado = false;
        alertify.set("notifier", "position", "top-right");
        alertify.error("Las claves deben ser iguales");
        this.errorClave = true;
        this.errorClaveMsg = "Las claves deben ser iguales";
        return;
      }
      delete this.registro.confirmar;
      axios
        .post(URL, this.registro)
        .then((response) => {
          if (response.data.msg.includes("correctamente")) {
            this.botonDeshabilitado = false;
            alertify.set("notifier", "position", "top-right");
            alertify.success("Usuario registrado éxitosamente!");
            this.$router.push("/login");
          } else {
            this.botonDeshabilitado = false;
            alertify.set("notifier", "position", "top-right");
            alertify.error(response.data.msg);
          }
        })
        .catch((error) => {
          this.deshabilitado = false;
          alertify.error("Ha ocurridó un error logueando al usuario " + error)
            .response.data.msg;
        });
    },
  },
};
</script>

<style>
* {
  margin: 0px;
  padding: 0px;
  box-sizing: border-box;
}

body,
html {
  height: 100%;
  font-family: Poppins-Regular, sans-serif;
}

a {
  font-family: Poppins-Regular;
  font-size: 14px;
  line-height: 1.7;
  color: #666666;
  margin: 0px;
  transition: all 0.4s;
  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
}

a:focus {
  outline: none !important;
}

a:hover {
  text-decoration: none;
  color: #57b846;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  margin: 0px;
}

p {
  font-family: Poppins-Regular;
  font-size: 14px;
  line-height: 1.7;
  color: #666666;
  margin: 0px;
}

ul,
li {
  margin: 0px;
  list-style-type: none;
}

input {
  outline: none;
  border: none;
}

textarea {
  outline: none;
  border: none;
}

textarea:focus,
input:focus {
  border-color: transparent !important;
}

input:focus::-webkit-input-placeholder {
  color: transparent;
}
input:focus:-moz-placeholder {
  color: transparent;
}
input:focus::-moz-placeholder {
  color: transparent;
}
input:focus:-ms-input-placeholder {
  color: transparent;
}

textarea:focus::-webkit-input-placeholder {
  color: transparent;
}
textarea:focus:-moz-placeholder {
  color: transparent;
}
textarea:focus::-moz-placeholder {
  color: transparent;
}
textarea:focus:-ms-input-placeholder {
  color: transparent;
}

input::-webkit-input-placeholder {
  color: #999999;
}
input:-moz-placeholder {
  color: #999999;
}
input::-moz-placeholder {
  color: #999999;
}
input:-ms-input-placeholder {
  color: #999999;
}

textarea::-webkit-input-placeholder {
  color: #999999;
}
textarea:-moz-placeholder {
  color: #999999;
}
textarea::-moz-placeholder {
  color: #999999;
}
textarea:-ms-input-placeholder {
  color: #999999;
}

button {
  outline: none !important;
  border: none;
  background: transparent;
}

button:hover {
  cursor: pointer;
}

iframe {
  border: none !important;
}
.txt1 {
  font-family: Poppins-Regular;
  font-size: 13px;
  line-height: 1.5;
  color: #999999;
}

.txt2 {
  font-family: Poppins-Regular;
  font-size: 13px;
  line-height: 1.5;
  color: #666666;
}
.limiter {
  width: 100%;
  margin: 0 auto;
}

.container-login100 {
  width: 100%;
  min-height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  padding: 15px;
  background: #9053c7;
  background: linear-gradient(-135deg, #50c86e, #4158d0);
}

.wrap-registro100 {
  width: 960px;
  background: #fff;
  border-radius: 10px;
  overflow: hidden;

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
  padding: 177px 130px 33px 95px;
}

.registro100-pic {
  width: 316px;
}

.registro100-pic img {
  max-width: 100%;
}

.registro100-form {
  width: 290px;
}

.registro100-form-title {
  font-family: Poppins-Bold;
  font-size: 24px;
  color: #333333;
  line-height: 1.2;
  text-align: center;

  width: 100%;
  display: block;
  padding-bottom: 54px;
}

.wrap-input100 {
  position: relative;
  width: 100%;
  z-index: 1;
  margin-bottom: 10px;
}

.input100 {
  font-family: Poppins-Medium;
  font-size: 15px;
  line-height: 1.5;
  color: #666666;

  display: block;
  width: 100%;
  background: #e6e6e6;
  height: 50px;
  border-radius: 25px;
  padding: 0 30px 0 68px;
}
.focus-input100 {
  display: block;
  position: absolute;
  border-radius: 25px;
  bottom: 0;
  left: 0;
  z-index: -1;
  width: 100%;
  height: 100%;
  box-shadow: 0px 0px 0px 0px;
  color: rgba(87, 184, 70, 0.8);
}

.input100:focus + .focus-input100 {
  -webkit-animation: anim-shadow 0.5s ease-in-out forwards;
  animation: anim-shadow 0.5s ease-in-out forwards;
}

@-webkit-keyframes anim-shadow {
  to {
    box-shadow: 0px 0px 70px 25px;
    opacity: 0;
  }
}

@keyframes anim-shadow {
  to {
    box-shadow: 0px 0px 70px 25px;
    opacity: 0;
  }
}

.symbol-input100 {
  font-size: 15px;

  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  align-items: center;
  position: absolute;
  border-radius: 25px;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  padding-left: 35px;
  pointer-events: none;
  color: #666666;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.input100:focus + .focus-input100 + .symbol-input100 {
  color: #57b846;
  padding-left: 28px;
}
.container-registro100-form-btn {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  padding-top: 20px;
}

.registro100-form-btn {
  font-family: Montserrat-Bold;
  font-size: 15px;
  line-height: 1.5;
  color: #fff;
  text-transform: uppercase;

  width: 100%;
  height: 50px;
  border-radius: 25px;
  background: #57b846;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 25px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.registro100-form-btn:hover {
  background: #333333;
}

@media (max-width: 992px) {
  .wrap-registro100 {
    padding: 177px 90px 33px 85px;
  }

  .registro100-pic {
    width: 35%;
  }

  .registro100-form {
    width: 50%;
  }
}

@media (max-width: 768px) {
  .wrap-registro100 {
    padding: 100px 80px 33px 80px;
  }

  .registro100-pic {
    display: none;
  }

  .registro100-form {
    width: 100%;
  }
}

@media (max-width: 576px) {
  .wrap-registro100 {
    padding: 100px 15px 33px 15px;
  }
}

.validate-input {
  position: relative;
}

.alert-validate::before {
  content: attr(data-validate);
  position: absolute;
  max-width: 70%;
  background-color: white;
  border: 1px solid #c80000;
  border-radius: 13px;
  padding: 4px 25px 4px 10px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  right: 8px;
  pointer-events: none;

  font-family: Poppins-Medium;
  color: #c80000;
  font-size: 13px;
  line-height: 1.4;
  text-align: left;

  visibility: hidden;
  opacity: 0;

  -webkit-transition: opacity 0.4s;
  -o-transition: opacity 0.4s;
  -moz-transition: opacity 0.4s;
  transition: opacity 0.4s;
}

.alert-validate::after {
  content: "\f06a";
  font-family: FontAwesome;
  display: block;
  position: absolute;
  color: #c80000;
  font-size: 15px;
  top: 50%;
  -webkit-transform: translateY(-50%);
  -moz-transform: translateY(-50%);
  -ms-transform: translateY(-50%);
  -o-transform: translateY(-50%);
  transform: translateY(-50%);
  right: 13px;
}

.alert-validate:hover:before {
  visibility: visible;
  opacity: 1;
}

@media (max-width: 992px) {
  .alert-validate::before {
    visibility: visible;
    opacity: 1;
  }
}
</style>