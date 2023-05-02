const express = require("express");
const router = express.Router();
const connection = require("../db");

// Mostrar todas las empresas
router.get("/empresas", (req, res) => {
    const sql = "SELECT * FROM empresas";

    connection.query(sql, (error, results) => {
        if (error) {
            console.error("Error al obtener empresas: ", error);
            res.status(500).send("Error al obtener empresas");
            return;
        }

        res.json(results);
    });
});

//  Información de la empresa con ID: **** ?
router.get("/empresas/:id_empresa", (req, res) => {
    const empresaId = req.params.id_empresa;
    const sql =
        "SELECT nombre_empresa, cif_empresa, email_empresa, email_recuperacion_empresa, ciudad_empresa, direccion_empresa, telefono1_empresa,telefono2_empresa, telefono3_empresa, pass_empresa, web_empresa,descripcion_empresa, fecha_creacion_empresa, horario_empresa, id_categoria_empresa FROM empresas WHERE id_empresa = ?";

    connection.query(sql, [empresaId], (error, results) => {
        if (error) {
            console.error("Error al obtener empresa: ", error);
            res.status(500).send("Error al obtener empresa");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("empresa no encontrada");
            return;
        }

        res.json(results[0]);
    });
});


module.exports = router;