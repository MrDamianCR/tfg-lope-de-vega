const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const bodyParser = require("body-parser");
const usuariosRouter = require("./routes/usuarios");
const empresasRouter = require("./routes/empresas");
const connection = require("./db");


const PORT = process.env.PORT || 3000;

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Montar las rutas
app.use("/api", usuariosRouter);
app.use("/api", empresasRouter);

// Iniciar el servidor
app.listen(PORT, () => console.log(`Servidor iniciado en el puerto ${PORT}`));