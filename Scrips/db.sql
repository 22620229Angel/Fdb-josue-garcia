CREATE DATABASE papeleria;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS papeleria;


CREATE TABLE papeleria.persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(10), -- Para distinguir entre proveedores y clientes
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
);

-- Migrar los datos de proveedor a persona
INSERT INTO papeleria.persona (tipo, nombre, direccion, telefono, correo_electronico)
SELECT 'Proveedor', nombre, direccion, telefono, correo_electronico FROM papeleria.proveedor;

-- Migrar los datos de cliente a persona
INSERT INTO papeleria.persona (tipo, nombre, direccion, telefono, correo_electronico)
SELECT 'Cliente', nombre, direccion, telefono, correo_electronico FROM papeleria.cliente;

-- Eliminar las tablas proveedor y cliente
DROP TABLE IF EXISTS papeleria.proveedor;
DROP TABLE IF EXISTS papeleria.cliente;

-- Crear la tabla producto
CREATE TABLE papeleria.producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    can_productos INT
);

-- Crear la tabla venta
CREATE TABLE papeleria.venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT,
    fecha DATE,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_persona) REFERENCES papeleria.persona(id_persona) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Crear la tabla compra
CREATE TABLE papeleria.compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT,
    id_producto INT,
    fecha DATE,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_persona) REFERENCES papeleria.persona(id_persona) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_producto) REFERENCES papeleria.producto(id_producto) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Insertar datos en la tabla producto
INSERT INTO papeleria.producto (nombre, descripcion, precio, can_productos) 
VALUES 
('Cuaderno', 'Cuaderno de tapa dura, tamaño carta', 5.99, 100),
('Lápiz', 'Lápiz HB nº2', 0.50, 500),
('Bolígrafo', 'Bolígrafo de tinta azul', 1.25, 300),
('Goma de borrar', 'Goma de borrar pequeña', 0.75, 200),
('Regla', 'Regla de plástico de 30 cm', 1.99, 150),
('Tijeras', 'Tijeras de acero inoxidable', 3.49, 120),
('Pegamento', 'Pegamento líquido para manualidades', 2.25, 250),
('Cinta adhesiva', 'Cinta adhesiva transparente', 1.99, 200),
('Marcador', 'Marcador de punta fina, color negro', 1.75, 300),
('Papel de colores', 'Paquete de papel de colores variados', 4.99, 80);

-- Insertar datos en la tabla venta
INSERT INTO papeleria.venta (id_persona, fecha, total) 
VALUES 
(1, '2024-05-01', 15.99),
(2, '2024-05-02', 7.50),
(3, '2024-05-03', 25.00),
(4, '2024-05-04', 10.50),
(5, '2024-05-05', 18.99),
(6, '2024-05-06', 32.75),
(7, '2024-05-07', 21.25),
(8, '2024-05-08', 14.99),
(9, '2024-05-09', 27.50),
(10, '2024-05-10', 19.75);

-- Insertar datos en la tabla compra
INSERT INTO papeleria.compra (id_persona, id_producto, fecha, cantidad, precio_unitario) 
VALUES 
(1, 1, '2024-04-25', 200, 4.50),
(2, 2, '2024-04-26', 1000, 0.35),
(3, 3, '2024-04-27', 500, 0.80),
(4, 4, '2024-04-28', 300, 0.60),
(5, 5, '2024-04-29', 150, 1.25),
(6, 6, '2024-04-30', 180, 2.75),
(7, 7, '2024-05-01', 250, 1.99),
(8, 8, '2024-05-02', 200, 1.50),
(9, 9, '2024-05-03', 300, 3.25),
(10, 10, '2024-05-04', 120, 4.99);

-- Consultas con la nueva estructura
-- Mostrar datos de la tabla persona
SELECT * FROM papeleria.persona;

-- Seleccionar datos específicos de la tabla persona:
SELECT nombre, telefono FROM papeleria.persona;

-- Filtrar por tipo de persona:
SELECT * FROM papeleria.persona WHERE tipo = 'Cliente';

-- Unir venta con persona usando INNER JOIN:
SELECT v.id_venta, p.nombre AS persona, v.fecha, v.total
FROM papeleria.venta v
INNER JOIN papeleria.persona p ON v.id_persona = p.id_persona;
