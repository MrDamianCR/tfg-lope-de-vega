//informacion del chat de id de empresa
const express = require("express");
const router = express.Router();
const connection = require("../db");

// Mostrar todos los chat
router.get("/chat", (req, res) => {
    const sql = "SELECT * FROM chat";

    connection.query(sql, (error, results) => {
        if (error) {
            console.error("Error al obtener chat: ", error);
            res.status(500).send("Error al obtener chat");
            return;
        }

        res.json(results);
    });
});

//  Información de la chat con ID: **** ?
router.get("/chat/:id_chat", (req, res) => {
    const chatId = req.params.id_chat;
    const sql =
        "SELECT mensaje_chat, fecha_hora_envio_chat FROM chat WHERE id_chat = ?";

    connection.query(sql, [chatId], (error, results) => {
        if (error) {
            console.error("Error al obtener chat: ", error);
            res.status(500).send("Error al obtener chat");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("chat no encontrada");
            return;
        }

        res.json(results[0]);
    });
});


// informacion del chat de id de usuario
router.get("/chat/usuario/:id_usuario_chat", (req, res) => {
    const usuarioId = req.params.id_usuario_chat;
    const sql =
        "SELECT * FROM chat WHERE id_usuario_chat = ?";

    connection.query(sql, [usuarioId], (error, results) => {
        if (error) {
            console.error("Error al obtener chat: ", error);
            res.status(500).send("Error al obtener chat");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("Chat no encontrado");
            return;
        }

        res.json(results);
    });
});

// informacion del chat de id de empresa
router.get("/chat/empresa/:id_empresa_chat", (req, res) => {
    const empresaId = req.params.id_empresa_chat;
    const sql =
        "SELECT * FROM chat WHERE id_empresa_chat = ?";

    connection.query(sql, [empresaId], (error, results) => {
        if (error) {
            console.error("Error al obtener chat: ", error);
            res.status(500).send("Error al obtener chat");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("Chat no encontrado");
            return;
        }

        res.json(results);
    });
});
// enviar un mensaje de chat 

router.post("/chat", (req, res) => {
    const { mensaje_chat, id_usuario_chat, id_empresa_chat } = req.body;
    const sql = "INSERT INTO chat (mensaje_chat, id_usuario_chat, id_empresa_chat) VALUES (?, ?, ?)";
    const values = [mensaje_chat, id_usuario_chat, id_empresa_chat];

    connection.query(sql, values, (error, results) => {
        if (error) {
            console.error("Error al agregar mensaje: ", error);
            res.status(500).send("Error al agregar mensaje");
            return;
        }

        res.status(201).json({ message: "Mensaje agregado exitosamente", messageId: results.insertId });
    });
});

module.exports = router;