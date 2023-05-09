const express = require("express");
const router = express.Router();
const connection = require("../db");

// Mostrar todos los usuarios
router.get("/usuarios", (req, res) => {
    const sql = "SELECT * FROM usuarios";

    connection.query(sql, (error, results) => {
        if (error) {
            console.error("Error al obtener usuarios: ", error);
            res.status(500).send("Error al obtener usuarios");
            return;
        }

        res.json(results);
    });
});

//  Información del usuario con ID: **** ?
// ENCRIPTARLO
router.get("/usuarios/:id_usuario", (req, res) => {
    const userId = req.params.id_usuario;
    const sql =
        "SELECT nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario FROM usuarios WHERE id_usuario = ?";

    connection.query(sql, [userId], (error, results) => {
        if (error) {
            console.error("Error al obtener usuario: ", error);
            res.status(500).send("Error al obtener usuario");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("Usuario no encontrado");
            return;
        }

        res.json(results[0]);
    });
});


/*const crypto = require('crypto');
const algorithm = 'aes-256-ctr';
const key = 'clave-secreta';

const encrypt = (text) => {
    const iv = crypto.randomBytes(16);
    const cipher = crypto.createCipheriv(algorithm, key, iv);
    const encrypted = Buffer.concat([cipher.update(text), cipher.final()]);
    return `${iv.toString('hex')}:${encrypted.toString('hex')}`;
};

const decrypt = (text) => {
    const [ivHex, encryptedHex] = text.split(':');
    const iv = Buffer.from(ivHex, 'hex');
    const encrypted = Buffer.from(encryptedHex, 'hex');
    const decipher = crypto.createDecipheriv(algorithm, key, iv);
    const decrypted = Buffer.concat([decipher.update(encrypted), decipher.final()]);
    return decrypted.toString();
};

router.get("/usuarios/:id_usuario", (req, res) => {
    const userId = req.params.id_usuario;
    const sql =
        encrypt("SELECT nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario FROM usuarios WHERE id_usuario = ?");

    connection.query(decrypt(sql), [userId], (error, results) => {
        if (error) {
            console.error(decrypt("Error al obtener usuario: "), error);
            res.status(500).send(decrypt("Error al obtener usuario"));
            return;
        }

        if (results.length === 0) {
            res.status(404).send(decrypt("Usuario no encontrado"));
            return;
        }

        res.json(results[0]);
    });
});*/


// Añadir usuario
router.post("/usuarios", (req, res) => {
    const {
        nombre_usuario,
        apellidos_usuario,
        email_usuario,
        pass_usuario,
        fecha_nacimiento_usuario,
        telefono_usuario,
        email_recuperacion_usuario,
    } = req.body;
    const sql =
        "INSERT INTO usuarios (nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario) VALUES (?, ?, ?, ?, ?, ?, ?)";
    connection.query(
        sql,
        [
            nombre_usuario,
            apellidos_usuario,
            email_usuario,
            pass_usuario,
            fecha_nacimiento_usuario,
            telefono_usuario,
            email_recuperacion_usuario,
        ],
        (error, result) => {
            if (error) {
                console.error("Error al añadir usuario: ", error);
                res.status(500).send("Error al añadir usuario");
                return;
            }

            res.status(202).json(result);
        }
    );
});

// Actualizar usuario 
router.put("/usuarios/:id_usuario", (req, res) => {
    const userId = req.params.id_usuario;
    const {
        nombre_usuario,
        apellidos_usuario,
        email_usuario,
        pass_usuario,
        fecha_nacimiento_usuario,
        telefono_usuario,
        email_recuperacion_usuario,
    } = req.body;
    const sql =
        "UPDATE usuarios SET nombre_usuario=?, apellidos_usuario=?, email_usuario=?, pass_usuario=?, fecha_nacimiento_usuario=?, telefono_usuario=?, email_recuperacion_usuario=? WHERE id_usuario=?";

    connection.query(
        sql,
        [
            nombre_usuario,
            apellidos_usuario,
            email_usuario,
            pass_usuario,
            fecha_nacimiento_usuario,
            telefono_usuario,
            email_recuperacion_usuario,
            userId,
        ],
        (error, result) => {
            if (error) {
                console.error("Error al actualizar usuario: ", error);
                res.status(500).send("Error al actualizar usuario");
                return;
            }

            res.json(result);
        }
    );
});

module.exports = router;
