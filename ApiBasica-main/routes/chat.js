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

// Enviar un mensaje de chat 
// Definimos una ruta POST para enviar un mensaje de chat 
router.post("/chat", (req, res) => {
    // Extraemos los datos del cuerpo de la solicitud
    const { mensaje_chat, id_usuario_chat, id_empresa_chat } = req.body;
    
    // Creamos una consulta SQL para insertar un nuevo mensaje de chat en la tabla 'chat'
    const sql = "INSERT INTO chat (mensaje_chat, id_usuario_chat, id_empresa_chat, fecha_hora_envio_chat) VALUES (?, ?, ?, NOW())";

    // Creamos una matriz con los valores a insertar en la consulta SQL
    const values = [mensaje_chat, id_usuario_chat, id_empresa_chat];

    // Ejecutamos la consulta SQL usando la conexión a la base de datos
    connection.query(sql, values, (error, results) => {
        // Si hay un error, enviamos una respuesta con el código de estado 500 y un mensaje de error
        if (error) {
            console.error("Error al agregar mensaje: ", error);
            res.status(500).send("Error al agregar mensaje");
            return;
        }

        // Si la consulta se ejecutó correctamente, enviamos una respuesta con el código de estado 201 y un mensaje de éxito
        res.status(201).json({ message: "Mensaje agregado exitosamente", messageId: results.insertId });
    });
});

module.exports = router;