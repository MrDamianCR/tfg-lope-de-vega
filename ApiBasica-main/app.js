const express = require("express");
const mysql = require("mysql");
const cors = require("cors");
const bodyParser = require("body-parser");
const usuariosRouter = require("./routes/usuarios");
const empresasRouter = require("./routes/empresas");
const categoriasRouter = require("./routes/categorias");
const chatRouter = require("./routes/chat");
const serviciosRouter = require("./routes/servicios");
const facturasRouter = require("./routes/facturas");
const reservasRouter = require("./routes/reservas");
const empresaservicioRouter = require("./routes/empresa_servicio");
const horariosempresasRouter = require("./routes/horarios_empresas");


const connection = require("./db");


const PORT = process.env.PORT || 3000;

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Montar las rutas
app.use("/api", usuariosRouter);
app.use("/api", empresasRouter);
app.use("/api", categoriasRouter);
app.use("/api", chatRouter);
app.use("/api", serviciosRouter);
app.use("/api", facturasRouter);
app.use("/api", reservasRouter);
app.use("/api", empresaservicioRouter);
app.use("/api", horariosempresasRouter);


// Iniciar el servidor
app.listen(PORT, () => console.log(`Servidor iniciado en el puerto ${PORT}`));
