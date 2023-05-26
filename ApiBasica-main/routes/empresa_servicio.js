const express = require("express");
const router = express.Router();
const connection = require("../db");

//  Información de la empresa-servicio con ID: **** ?
/*router.get("/empresa-servicio/:id", (req, res) => {
    const empresaservicioId = req.params.id;
    const sql =
        "SELECT id_empresa, id_servicio, precio FROM empresa-servicio WHERE id = ?";

    connection.query(sql, [empresaservicioId], (error, results) => {
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
});*/


//  Información de la empresa-servicio con Id_servicio: **** ?
router.get("/empresa-servicio/:id_servicio", (req, res) => {
    const empresaservicioId = req.params.id_servicio;
    const sql =
        "SELECT es.precio, e.nombre_empresa FROM `empresa-servicio` AS es INNER JOIN empresas AS e ON es.id_empresa = e.id_empresa WHERE es.id_servicio = ?";

    connection.query(sql, [empresaservicioId], (error, results) => {
        if (error) {
            console.error("Error al obtener información de la empresa y el precio: ", error);
            res.status(500).send("Error al obtener información de la empresa y el precio");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("Empresa o servicio no encontrados");
            return;
        }

        res.json(results[0]);
    });
});






module.exports = router;