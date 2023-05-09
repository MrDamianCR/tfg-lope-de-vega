const express = require("express");
const router = express.Router();
const connection = require("../db");

//Mostrar todas las reservas
router.get("/reservas", (req, res) => {
    const sql = "SELECT * FROM reservas";

    connection.query(sql, (error, results) => {
        if (error) {
            console.error("Error al obtener reservas: ", error);
            res.status(500).send("Error al obtener reservas");
            return;
        }

        res.json(results);
    });
});
 
//AÑADIR RESERVA //
 router.post("/reservas", (req, res) => {
    const nuevaReserva = req.body;
  
    // Obtener el ID del usuario que hizo la reserva
    const idUsuarioReserva = nuevaReserva.id_usuario_reserva;
  
    // Insertar la nueva reserva en la tabla de reservas
    const sql = "INSERT INTO reservas (fecha_hora_reserva, comentario_reserva, id_usuario_reserva, id_empresa_reserva, id_servicio_reserva) VALUES (?, ?, ?, ?, ?)";
  
    connection.query(sql, [nuevaReserva.fecha_hora_reserva, nuevaReserva.comentario_reserva, idUsuarioReserva, nuevaReserva.id_empresa_reserva, 
        nuevaReserva.id_servicio_reserva], (error, result) => {
      if (error) {
        console.error("Error al agregar reserva: ", error);
        res.status(500).send("Error al agregar reserva");
        return;
      }
  
      res.status(201).json({ id_reserva: result.insertId });
    });
  });
  
  
  
  

  

// Borrar reservas
router.delete("/reservas/:id_reserva", (req, res) => {
    const idReserva = req.params.id_reserva;

    // Eliminar facturas relacionadas
    const deleteFacturas = "DELETE FROM facturas WHERE id_reserva_factura = ?";
    connection.query(deleteFacturas, [idReserva], (error, result) => {
        if (error) {
            console.error("Error al borrar facturas: ", error);
            res.status(500).send("Error al borrar facturas");
            return;
        }

        // Eliminar reserva
        const deleteReserva = "DELETE FROM reservas WHERE id_reserva = ?";
        connection.query(deleteReserva, [idReserva], (error, result) => {
            if (error) {
                console.error("Error al borrar reserva: ", error);
                res.status(500).send("Error al borrar reserva");
                return;
            }

            if (result.affectedRows === 0) {
                res.status(404).send("Reserva no encontrada");
                return;
            }

            res.send("Reserva borrada correctamente");
        });
    });
});

module.exports = router;
