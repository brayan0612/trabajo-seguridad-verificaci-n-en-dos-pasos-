-- ============================================================
-- Droguería Balmoral - Esquema de Base de Datos
-- ============================================================

CREATE DATABASE IF NOT EXISTS balmoral_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE balmoral_db;

CREATE TABLE IF NOT EXISTS administradores (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  usuario     VARCHAR(50)  NOT NULL UNIQUE,
  contrasena  VARCHAR(255) NOT NULL,
  `2fa_secret`  VARCHAR(64)  DEFAULT NULL,
  `2fa_enabled` TINYINT(1)   NOT NULL DEFAULT 0,
  creado_en   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- usuario: admin | contraseña: admin123
INSERT IGNORE INTO administradores (usuario, contrasena)
VALUES ('admin', '$2b$10$yyRq8ILKElpKk2iFgG2s4OTNrQjsD9KvIAI5C.b/FGdhsSfxPDW12');

CREATE TABLE IF NOT EXISTS medicamentos (
  id             INT AUTO_INCREMENT PRIMARY KEY,
  nombre         VARCHAR(150) NOT NULL,
  descripcion    TEXT,
  precio         DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  stock          INT           NOT NULL DEFAULT 0,
  categoria      VARCHAR(80),
  creado_en      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizado_en DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP
                               ON UPDATE CURRENT_TIMESTAMP
);

INSERT IGNORE INTO medicamentos (id, nombre, descripcion, precio, stock, categoria) VALUES
  (1, 'Acetaminofén 500mg',  'Analgésico y antipirético de uso general',         3500.00, 200, 'Analgésicos'),
  (2, 'Ibuprofeno 400mg',    'Antiinflamatorio no esteroideo (AINE)',             4200.00, 150, 'Antiinflamatorios'),
  (3, 'Amoxicilina 500mg',   'Antibiótico de amplio espectro - requiere fórmula',8900.00,  80, 'Antibióticos'),
  (4, 'Loratadina 10mg',     'Antihistamínico para alergias',                    2800.00, 120, 'Antihistamínicos'),
  (5, 'Omeprazol 20mg',      'Inhibidor de la bomba de protones para gastritis', 6500.00,  90, 'Gastrointestinales'),
  (6, 'Metformina 850mg',    'Antidiabético oral - requiere fórmula',            5200.00,  60, 'Antidiabéticos'),
  (7, 'Atorvastatina 20mg',  'Reductor de colesterol - requiere fórmula',        9800.00,  45, 'Cardiovasculares'),
  (8, 'Vitamina C 1000mg',   'Suplemento vitamínico efervescente',               3100.00, 300, 'Vitaminas');
