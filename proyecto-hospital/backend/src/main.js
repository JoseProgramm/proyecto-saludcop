const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const DB = require('./config/database');
const app = express();
const dotenv = require('dotenv');
const path = require('path');
const router = require('./router/index');
dotenv.config({ path: 'entorno.env' });

const port = process.env.PORT || 3000;

app.use(morgan('dev'));
app.use(cors());
app.use(express.json());
app.use(router);
app.use(express.static(path.join(__dirname, 'dist')));
app.listen(port, async () => {
  console.log(`Servidor en el puerto ${port}`);
  try {
    await DB.sync();
    console.log('Base de datos conectada correctamente');
  } catch (error) {
    console.log('Algo salió mal con la DB', error);
  }
});
