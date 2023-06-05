INSERT INTO usuarios (nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario)
VALUES ('Negrito', 'Doe', 'johndoe@example.com', 'password123', '1990-01-01', '+1-555-555-5555', 'johndoe_recovery@example.com');

INSERT INTO usuarios (nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario)
VALUES ('Jane', 'Doe', 'janedoe@example.com', 'password123', '1995-05-05', '+1-555-555-5555', 'janedoe_recovery@example.com');

INSERT INTO usuarios (nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario)
VALUES ('Bob', 'Smith', 'bobsmith@example.com', 'password123', '1985-12-12', '+1-555-555-5555', 'bobsmith_recovery@example.com');

INSERT INTO usuarios (nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario)
VALUES ('Alice', 'Johnson', 'alicejohnson@example.com', 'password123', '1988-09-15', '+1-555-555-5555', 'alicejohnson_recovery@example.com');

INSERT INTO usuarios (nombre_usuario, apellidos_usuario, email_usuario, pass_usuario, fecha_nacimiento_usuario, telefono_usuario, email_recuperacion_usuario)
VALUES ('Tom', 'Davis', 'tomdavis@example.com', 'password123', '1992-06-30', '+1-555-555-5555', 'tomdavis_recovery@example.com');

INSERT INTO categorias (nombre_categoria, descripcion_categoria)
VALUES ('Tecnología', 'Categoría para productos electrónicos y tecnológicos.');

INSERT INTO categorias (nombre_categoria, descripcion_categoria)
VALUES ('Ropa', 'Categoría para ropa y accesorios de moda.');

INSERT INTO categorias (nombre_categoria, descripcion_categoria)
VALUES ('Hogar', 'Categoría para productos para el hogar como muebles y electrodomésticos.');

INSERT INTO categorias (nombre_categoria, descripcion_categoria)
VALUES ('Salud y Belleza', 'Categoría para productos de cuidado personal y belleza.');

INSERT INTO categorias (nombre_categoria, descripcion_categoria)
VALUES ('Deportes y Aire libre', 'Categoría para productos relacionados con deportes y actividades al aire libre.');

INSERT INTO empresas (nombre_empresa, cif_empresa, email_empresa, email_recuperacion_empresa, ciudad_empresa, direccion_empresa, telefono1_empresa, telefono2_empresa, telefono3_empresa, pass_empresa, web_empresa, descripcion_empresa, horario_empresa, id_categoria_empresa)
VALUES ('Electrodomésticos S.A.', 'A1234567', 'electrodomesticos@example.com', 'electrodomesticos_recovery@example.com', 'Madrid', 'Calle Mayor 1', '+34 911 111 111', '+34 911 111 222', '', 'password123', 'www.electrodomesticos.com', 'Empresa dedicada a la venta de electrodomésticos de alta calidad', 'Lunes a Viernes de 9:00 a 18:00', 3);

INSERT INTO empresas (nombre_empresa, cif_empresa, email_empresa, email_recuperacion_empresa, ciudad_empresa, direccion_empresa, telefono1_empresa, telefono2_empresa, telefono3_empresa, pass_empresa, web_empresa, descripcion_empresa, horario_empresa, id_categoria_empresa)
VALUES ('Moda y Complementos S.L.', 'B2345678', 'modaycomplementos@example.com', 'modaycomplementos_recovery@example.com', 'Barcelona', 'Avenida Diagonal 100', '+34 922 222 111', '+34 922 222 222', '', 'password123', 'www.modaycomplementos.com', 'Empresa dedicada a la venta de ropa y accesorios de moda', 'Lunes a Viernes de 10:00 a 20:00', 2);

INSERT INTO empresas (nombre_empresa, cif_empresa, email_empresa, email_recuperacion_empresa, ciudad_empresa, direccion_empresa, telefono1_empresa, telefono2_empresa, telefono3_empresa, pass_empresa, web_empresa, descripcion_empresa, horario_empresa, id_categoria_empresa)
VALUES ('Tecnología e Informática S.L.', 'C3456789', 'tecnologiainformatica@example.com', 'tecnologiainformatica_recovery@example.com', 'Valencia', 'Calle San Vicente 25', '+34 933 333 111', '+34 933 333 222', '', 'password123', 'www.tecnologiainformatica.com', 'Empresa dedicada a la venta de productos electrónicos y tecnológicos', 'Lunes a Viernes de 9:00 a 18:00', 1);

INSERT INTO empresas (nombre_empresa, cif_empresa, email_empresa, email_recuperacion_empresa, ciudad_empresa, direccion_empresa, telefono1_empresa, telefono2_empresa, telefono3_empresa, pass_empresa, web_empresa, descripcion_empresa, horario_empresa, id_categoria_empresa)
VALUES ('Deportes y Aire Libre S.A.', 'D4567890', 'deportesyairelibre@example.com', 'deportesyairelibre_recovery@example.com', 'Sevilla', 'Calle Sierpes 10', '+34 944 444 111', '+34 944 444 222', '', 'password123', 'www.deportesyairelibre.com', 'Empresa dedicada a la venta de productos relacionados con deportes y actividades al aire libre', 'Lunes a Viernes de 10:00 a 20:00', 5);

INSERT INTO empresas (nombre_empresa, cif_empresa, email_empresa, email_recuperacion_empresa, ciudad_empresa, direccion_empresa, telefono1_empresa, telefono2_empresa, telefono3_empresa, pass_empresa, web_empresa, descripcion_empresa, horario_empresa, id_categoria_empresa)
VALUES ('Muebles y Decoración S.A.', 'E5678901', 'mueblesydecoracion@example.com', 'mueblesydecoracion_recovery@example.com', 'Bilbao', 'Calle Gran Vía 50', '+34 955 555 111', '+34 955 555 222', '', 'password123', 'www.mueblesydecoracion.com', 'Empresa dedicada a la venta de muebles y artículos de decoración para el hogar', 'Lunes a Viernes de 9:00 a 18:00', 4);

-- Category 1: Tecnología
INSERT INTO servicios (nombre_servicio, id_categoria_servicio)
VALUES ('Reparación de ordenadores', 1),
       ('Mantenimiento de redes', 1),
       ('Diseño de páginas web', 1);

-- Category 2: Comida
INSERT INTO servicios (nombre_servicio, id_categoria_servicio)
VALUES ('Catering para eventos', 2),
       ('Comida a domicilio', 2),
       ('Postres y pasteles personalizados', 2);

-- Category 3: Belleza
INSERT INTO servicios (nombre_servicio, id_categoria_servicio)
VALUES ('Corte de cabello', 3),
       ('Manicura y pedicura', 3),
       ('Maquillaje profesional', 3);

-- Category 4: Hogar y decoración
INSERT INTO servicios (nombre_servicio, id_categoria_servicio)
VALUES ('Decoración de interiores', 4),
       ('Montaje de muebles', 4),
       ('Limpieza del hogar', 4);

-- Category 5: Deportes y actividades al aire libre
INSERT INTO servicios (nombre_servicio, id_categoria_servicio)
VALUES ('Entrenamiento personal', 5),
       ('Caminatas y senderismo', 5),
       ('Alquiler de bicicletas', 5);

-- Reservations for User 1
INSERT INTO reservas (fecha_hora_reserva, comentario_reserva, id_usuario_reserva, id_empresa_reserva, id_servicio_reserva)
VALUES ('2023-05-01 10:00:00', 'Quiero reservar para dos personas', 1, 3, 8),
       ('2023-06-15 16:30:00', 'Necesito una mesa para cuatro personas', 1, 1, 5),
       ('2023-07-20 12:00:00', 'Quiero reservar una habitación doble', 1, 2, 10);

-- Reservations for User 2
INSERT INTO reservas (fecha_hora_reserva, comentario_reserva, id_usuario_reserva, id_empresa_reserva, id_servicio_reserva)
VALUES ('2023-05-10 15:00:00', 'Necesito un presupuesto para un proyecto', 2, 4, 13),
       ('2023-06-25 18:00:00', 'Quiero reservar una sesión de entrenamiento', 2, 5, 15),
       ('2023-08-05 10:30:00', 'Necesito un presupuesto para el diseño de una página web', 2, 1, 3);

-- Reservations for User 3
INSERT INTO reservas (fecha_hora_reserva, comentario_reserva, id_usuario_reserva, id_empresa_reserva, id_servicio_reserva)
VALUES ('2023-05-17 19:00:00', 'Quiero reservar una mesa para dos personas', 3, 3, 7),
       ('2023-06-30 11:00:00', 'Quiero reservar una habitación individual', 3, 2, 11),
       ('2023-07-15 14:00:00', 'Necesito un presupuesto para la reparación de mi ordenador', 3, 4, 1);

-- Reservations for User 4
INSERT INTO reservas (fecha_hora_reserva, comentario_reserva, id_usuario_reserva, id_empresa_reserva, id_servicio_reserva)
VALUES ('2023-05-08 12:30:00', 'Quiero reservar una sesión de manicura y pedicura', 4, 3, 9),
       ('2023-06-20 16:00:00', 'Quiero reservar una sesión de maquillaje', 4, 5, 12),
       ('2023-08-10 09:00:00', 'Necesito un presupuesto para el mantenimiento de mi red', 4, 1, 2);

-- Reservations for User 5
INSERT INTO reservas (fecha_hora_reserva, comentario_reserva, id_usuario_reserva, id_empresa_reserva, id_servicio_reserva)
VALUES ('2023-05-25 20:00:00', 'Quiero reservar una mesa para cuatro personas', 5, 3, 7),
       ('2023-06-10 14:00:00', 'Quiero reservar una habitación doble', 5, 2, 10),
       ('2023-07-05 11:00:00', 'Quiero reservar una sesión de entrenamiento personal', 5, 5, 15);

INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (1, 25.99);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (2, 15.50);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (3, 32.75);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (4, 45.00);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (5, 28.99);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (6, 39.50);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (7, 20.00);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (8, 55.00);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (9, 30.99);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (10, 18.50);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (11, 27.75);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (12, 50.00);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (13, 33.99);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (14, 45.50);
INSERT INTO facturas (id_reserva_factura, precio_factura) VALUES (15, 28.00);

INSERT INTO chat (id_usuario_chat, id_empresa_chat, mensaje_chat, fecha_hora_envio_chat)
VALUES
(1, 1, 'Hola, ¿puedo reservar una mesa para dos personas el próximo sábado a las 8 pm?', '2023-04-24 13:30:00'),
(1, 1, 'Claro, ¿en qué nombre hago la reserva?', '2023-04-24 13:35:00'),
(2, 2, 'Buenas tardes, quisiera solicitar información sobre sus servicios de catering para eventos', '2023-04-23 10:15:00'),
(2, 2, '¡Hola! Claro, tenemos diferentes opciones de menú y servicios, ¿me puede proporcionar más detalles sobre el evento?', '2023-04-23 10:20:00'),
(3, 3, 'Buen día, ¿tienen disponibilidad para un masaje de 60 minutos esta tarde?', '2023-04-22 16:45:00'),
(3, 3, 'Sí, tenemos disponibilidad a las 18:00 horas. ¿Le interesa agendar la cita?', '2023-04-22 16:50:00'),
(4, 4, 'Hola, quisiera reservar una habitación doble para el fin de semana del 6 al 8 de mayo', '2023-04-21 14:00:00'),
(4, 4, 'Perfecto, ¿en qué nombre se hará la reserva?', '2023-04-21 14:05:00'),
(5, 5, 'Buenas tardes, quisiera solicitar información sobre su servicio de diseño web', '2023-04-20 11:30:00'),
(5, 5, 'Hola, con gusto le puedo proporcionar información, ¿en qué puedo ayudarle específicamente?', '2023-04-20 11:35:00');
