const express = require("express");
const router = express.Router();
const connection = require("../db");

// Mostrar todos los servicios
router.get("/servicios", (req, res) => {
    const sql = "SELECT * FROM servicios";

    connection.query(sql, (error, results) => {
        if (error) {
            console.error("Error al obtener servicios: ", error);
            res.status(500).send("Error al obtener servicios");
            return;
        }

        res.json(results);
    });
});

//  Información del servicio con ID: **** ?

router.get("/servicios/:id_servicio", (req, res) => {
    const servicioId = req.params.id_servicio;
    const sql = "SELECT nombre_servicio FROM servicios WHERE id_servicio = ?";

    connection.query(sql, [servicioId], (error, results) => {
        if (error) {
            console.error("Error al obtener servicio: ", error);
            res.status(500).send("Error al obtener servicio");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("servicio no encontrado");
            return;
        }

        res.json(results[0]);
    });
});
module.exports = router;
