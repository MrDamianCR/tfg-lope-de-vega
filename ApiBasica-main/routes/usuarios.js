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

// INICIAR SEION
function verificarCredenciales(nombre, contrasena) {
    const sql =
        "SELECT * FROM usuarios WHERE nombre_usuario = ? AND pass_usuario = ?";
    const values = [nombre, contrasena];

    return new Promise((resolve, reject) => {
        connection.query(sql, values, (error, result) => {
            if (error) {
                reject(error);
                return;
            }

            // Verificar si se encontró un usuario con las credenciales proporcionadas
            resolve(result.length > 0);
        });
    });
}

function obtenerInformacionUsuario(nombre) {
    const sql = "SELECT * FROM usuarios WHERE nombre_usuario = ?";
    const values = [nombre];

    return new Promise((resolve, reject) => {
        connection.query(sql, values, (error, result) => {
            if (error) {
                reject(error);
                return;
            }

            if (result.length === 0) {
                reject("Usuario no encontrado");
                return;
            }

            const usuarioEncontrado = result[0];

            const informacionUsuario = {
                id: usuarioEncontrado.id_usuario,
                nombre: usuarioEncontrado.nombre_usuario,
                apellidos: usuarioEncontrado.apellidos_usuario,
                email: usuarioEncontrado.email_usuario,
                fechaNacimiento: usuarioEncontrado.fecha_nacimiento_usuario,
                telefono: usuarioEncontrado.telefono_usuario,
                emailRecuperacion: usuarioEncontrado.email_recuperacion_usuario,
            };

            resolve(informacionUsuario);
        });
    });
}

router.post("/iniciar_sesion", async (req, res) => {
    const { nombre, contrasena } = req.body;

    try {
        const credencialesValidas = await verificarCredenciales(nombre, contrasena);

        if (credencialesValidas) {
            const informacionUsuario = await obtenerInformacionUsuario(nombre);
            res.json(informacionUsuario);
        } else {
            res.status(401).send("Credenciales inválidas");
        }
    } catch (error) {
        console.error("Error al verificar las credenciales: ", error);
        res.status(500).send("Error al verificar las credenciales");
    }
});


//cambiar contraseña

router.put("/usuarios/cambiarcontrasena/:nombre_usuario", async (req, res) => {
    const username = req.params.nombre_usuario;
    const { oldPassword, newPassword } = req.body;

    try {
        // Verificar la contraseña antigua
        const isOldPasswordCorrect = await verificarContrasenaAntigua(username, oldPassword);

        if (isOldPasswordCorrect) {
            // Actualizar la contraseña en la base de datos
            const sql = "UPDATE usuarios SET pass_usuario = ? WHERE nombre_usuario = ?";
            connection.query(sql, [newPassword, username], (error, result) => {
                if (error) {
                    console.error("Error al actualizar contraseña: ", error);
                    res.status(500).send("Error al actualizar contraseña");
                    return;
                }

                res.json(result);
            });
        } else {
            // La contraseña antigua es incorrecta
            res.status(401).send("Contraseña antigua incorrecta");
        }
    } catch (error) {
        console.error("Error al verificar la contraseña antigua: ", error);
        res.status(500).send("Error al verificar la contraseña antigua");
    }
});

function verificarContrasenaAntigua(username, oldPassword) {
    return new Promise((resolve, reject) => {
        const sql = "SELECT pass_usuario FROM usuarios WHERE nombre_usuario = ?";
        connection.query(sql, [username], (error, result) => {
            if (error) {
                reject(error);
                return;
            }

            if (result.length === 0) {
                resolve(false);
                return;
            }

            const actualPassword = result[0].pass_usuario;
            resolve(actualPassword === oldPassword);
        });
    });
}





module.exports = router;
