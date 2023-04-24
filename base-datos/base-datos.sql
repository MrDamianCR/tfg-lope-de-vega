CREATE TABLE usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY,
  nombre_usuario VARCHAR(45) NOT NULL,
  apellidos_usuario VARCHAR(45) NOT NULL,
  email_usuario VARCHAR(255) NOT NULL UNIQUE,
  pass_usuario VARCHAR(255) NOT NULL,
  fecha_nacimiento_usuario DATE NOT NULL,
  telefono_usuario VARCHAR(45),
  email_recuperacion_usuario VARCHAR(255) NOT NULL,
  fecha_creacion_usuario TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categorias (
  id_categoria INT AUTO_INCREMENT PRIMARY KEY,
  nombre_categoria VARCHAR(45) NOT NULL,
  descripcion_categoria VARCHAR(455) NOT NULL
);

CREATE TABLE empresas (
  id_empresa INT AUTO_INCREMENT PRIMARY KEY,
  nombre_empresa VARCHAR(45) NOT NULL,
  cif_empresa VARCHAR(10) NOT NULL UNIQUE,
  email_empresa VARCHAR(255) NOT NULL UNIQUE,
  email_recuperacion_empresa VARCHAR(255) NOT NULL,
  ciudad_empresa VARCHAR(45) NOT NULL,
  direccion_empresa VARCHAR(255) NOT NULL,
  telefono1_empresa VARCHAR(45) NOT NULL,
  telefono2_empresa VARCHAR(45),
  telefono3_empresa VARCHAR(45),
  pass_empresa VARCHAR(255) NOT NULL,
  web_empresa VARCHAR(255),
  descripcion_empresa VARCHAR(455),
  fecha_creacion_empresa TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  horario_empresa VARCHAR(255),
  id_categoria_empresa INT NOT NULL,
  FOREIGN KEY (id_categoria_empresa) REFERENCES categorias (id_categoria)
);

CREATE TABLE servicios (
  id_servicio INT AUTO_INCREMENT PRIMARY KEY,
  nombre_servicio VARCHAR(45) NOT NULL,
  id_categoria_servicio INT NOT NULL,
  FOREIGN KEY (id_categoria_servicio) REFERENCES categorias (id_categoria)
);

CREATE TABLE reservas (
  id_reserva INT AUTO_INCREMENT PRIMARY KEY,
  fecha_hora_reserva DATETIME NOT NULL,
  comentario_reserva VARCHAR(455),
  id_usuario_reserva INT NOT NULL,
  id_empresa_reserva INT NOT NULL,
  id_servicio_reserva INT NOT NULL,
  FOREIGN KEY (id_usuario_reserva) REFERENCES usuarios (id_usuario),
  FOREIGN KEY (id_empresa_reserva) REFERENCES empresas (id_empresa),
  FOREIGN KEY (id_servicio_reserva) REFERENCES servicios (id_servicio)
);

CREATE TABLE facturas (
  id_factura INT AUTO_INCREMENT PRIMARY KEY,
  id_reserva_factura INT NOT NULL,
  precio_factura FLOAT NOT NULL,
  FOREIGN KEY (id_reserva_factura) REFERENCES reservas (id_reserva)
);

CREATE TABLE chat (
  id_chat INT AUTO_INCREMENT PRIMARY KEY,
  id_usuario_chat INT NOT NULL,
  id_empresa_chat INT NOT NULL,
  mensaje_chat VARCHAR(1000) NOT NULL,
  fecha_hora_envio_chat DATETIME NOT NULL,
  FOREIGN KEY (id_usuario_chat) REFERENCES usuarios (id_usuario),
  FOREIGN KEY (id_empresa_chat) REFERENCES empresas (id_empresa)
);
