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

//  Buscar nombre empresa: **** ?
router.get("/empresas/nombre/:nombre_empresa", (req, res) => {
    const nombreEmpresa = req.params.nombre_empresa;
    const sql =
        "SELECT nombre_empresa, cif_empresa, email_empresa, email_recuperacion_empresa, ciudad_empresa, direccion_empresa, telefono1_empresa,telefono2_empresa, telefono3_empresa, pass_empresa, web_empresa,descripcion_empresa, fecha_creacion_empresa, horario_empresa, id_categoria_empresa FROM empresas WHERE nombre_empresa LIKE ?";

    connection.query(sql, [`%${nombreEmpresa}%`], (error, results) => {
        if (error) {
            console.error("Error al obtener empresas por nombre: ", error);
            res.status(500).send("Error al obtener empresas por nombre");
            return;
        }

        if (results.length === 0) {
            res.status(404).send("Empresas no encontradas");
            return;
        }

        res.json(results);
    });
});


// INICIAR SEION
function verificarCredenciales(email, contrasena) {
    const sql =
        "SELECT * FROM empresas WHERE email_empresa = ? AND pass_empresa = ?";
    const values = [email, contrasena];

    return new Promise((resolve, reject) => {
        connection.query(sql, values, (error, result) => {
            if (error) {
                reject(error);
                return;
            }

            // Verificar si se encontró un email con las credenciales proporcionadas
            resolve(result.length > 0);
        });
    });
}

function obtenerInformacionEmpresa(email) {
    const sql = "SELECT * FROM empresas WHERE email_empresa = ?";
    const values = [email];

    return new Promise((resolve, reject) => {
        connection.query(sql, values, (error, result) => {
            if (error) {
                reject(error);
                return;
            }

            if (result.length === 0) {
                reject("email no encontrado");
                return;
            }

            const emailEncontrado = result[0];

            const informacionEmpresa = {
                id: emailEncontrado.id_empresa,
                nombre_empresa: emailEncontrado.nombre_empresa,
                Cif: emailEncontrado.cif_empresa,
                email: emailEncontrado.email_empresa,
                email_recuperacion: emailEncontrado.email_recuperacion_empresa,
                ciudad: emailEncontrado.ciudad_empresa,
                direccion: emailEncontrado.direccion_empresa,
                telefono1: emailEncontrado.telefono1_empresa,
                telefono2: emailEncontrado.telefono2_empresa,
                telefono3: emailEncontrado.telefono3_empresa,
                pass: emailEncontrado.pass_empresa,
                web: emailEncontrado.web_empresa,
                descripcion: emailEncontrado.descripcion_empresa,
                fecha_creacion_empresa: emailEncontrado.fecha_creacion_empresa,
                horario_empresa: emailEncontrado.horario_empresa,
                id_categoria: emailEncontrado.id_categoria_empresa,

                
            };

            resolve(informacionEmpresa);
        });
    });
}

router.post("/iniciar_sesion_empresa", async (req, res) => {
    const { email, contrasena } = req.body;

    try {
        const credencialesValidas = await verificarCredenciales(email, contrasena);

        if (credencialesValidas) {
            const informacionEmpresa = await obtenerInformacionEmpresa(email);
            res.json(informacionEmpresa);
        } else {
            res.status(401).send("Credenciales inválidas");
        }
    } catch (error) {
        console.error("Error al verificar las credenciales: ", error);
        res.status(500).send("Error al verificar las credenciales");
    }
});


module.exports = router;