CREATE DATABASE papeleria;

CREATE TABLE papeleria.proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
    
	
);


CREATE TABLE papeleria.producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio DECIMAL(10, 2),
    can_productos INT
);


CREATE TABLE papeleria.cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100)
);


CREATE TABLE papeleria.venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha DATE,
    total DECIMAL(10, 2)
  
);


CREATE TABLE papeleria.compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_proveedor INT,
    id_producto INT,
    fecha DATE,
    cantidad INT,
    precio_unitario DECIMAL(10, 2)
    
);

ALTER TABLE papeleria.compra add foreign key (id_proveedor) references papeleria.proveedor(id_proveedor)ON UPDATE CASCADE  ON DELETE CASCADE;
ALTER TABLE papeleria.compra add foreign key (id_producto) references papeleria.producto(id_producto)ON UPDATE CASCADE  ON DELETE CASCADE;
ALTER TABLE papeleria.venta add foreign key (id_cliente) references papeleria.cliente(id_cliente)ON UPDATE CASCADE  ON DELETE CASCADE;

INSERT INTO papeleria.proveedor (nombre, direccion, telefono, correo_electronico) 
VALUES 
('Proveedor 1', 'Calle Principal 123, Ciudad A', '1111111111', 'proveedor1@example.com'),
('Proveedor 2', 'Avenida Central 456, Ciudad B', '2222222222', 'proveedor2@example.com'),
('Proveedor 3', 'Calle Secundaria 789, Ciudad C', '3333333333', 'proveedor3@example.com'),
('Proveedor 4', 'Avenida Norte 012, Ciudad D', '4444444444', 'proveedor4@example.com'),
('Proveedor 5', 'Calle Sur 345, Ciudad E', '5555555555', 'proveedor5@example.com'),
('Proveedor 6', 'Avenida Oeste 678, Ciudad F', '6666666666', 'proveedor6@example.com'),
('Proveedor 7', 'Calle Este 901, Ciudad G', '7777777777', 'proveedor7@example.com'),
('Proveedor 8', 'Avenida Central 234, Ciudad H', '8888888888', 'proveedor8@example.com'),
('Proveedor 9', 'Calle Principal 567, Ciudad I', '9999999999', 'proveedor9@example.com'),
('Proveedor 10', 'Avenida Norte 890, Ciudad J', '1010101010', 'proveedor10@example.com');

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

INSERT INTO papeleria.cliente (nombre, direccion, telefono, correo_electronico) 
VALUES 
('Cliente 1', 'Calle Principal 123, Ciudad A', '1111111111', 'cliente1@example.com'),
('Cliente 2', 'Avenida Central 456, Ciudad B', '2222222222', 'cliente2@example.com'),
('Cliente 3', 'Calle Secundaria 789, Ciudad C', '3333333333', 'cliente3@example.com'),
('Cliente 4', 'Avenida Norte 012, Ciudad D', '4444444444', 'cliente4@example.com'),
('Cliente 5', 'Calle Sur 345, Ciudad E', '5555555555', 'cliente5@example.com'),
('Cliente 6', 'Avenida Oeste 678, Ciudad F', '6666666666', 'cliente6@example.com'),
('Cliente 7', 'Calle Este 901, Ciudad G', '7777777777', 'cliente7@example.com'),
('Cliente 8', 'Avenida Central 234, Ciudad H', '8888888888', 'cliente8@example.com'),
('Cliente 9', 'Calle Principal 567, Ciudad I', '9999999999', 'cliente9@example.com'),
('Cliente 10', 'Avenida Norte 890, Ciudad J', '1010101010', 'cliente10@example.com');

INSERT INTO papeleria.venta (id_cliente, fecha, total) 
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

INSERT INTO papeleria.compra (id_proveedor, id_producto, fecha, cantidad, precio_unitario) 
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


-- CONSULTAS BASICAS

-- SELECCIONAR TODOS LOS DATOS DE UNA TABLA
-- Mostrar los datos de la tabla proveedor
SELECT * FROM papeleria.proveedor;

-- Mostrar los datos de la tabla producto
SELECT * FROM papeleria.producto;

-- Mostrar datos de la tabla cliente
SELECT * FROM papeleria.cliente;

-- Mostrar datos de la tabla venta
SELECT * FROM papeleria.venta;

-- Mostrar datos de la tabla compra
SELECT * FROM papeleria.compra;

-- Seleccionar datos específicos de una tabla:
SELECT nombre, telefono FROM papeleria.cliente;


-- Seleccionar datos filtrados por una condición:
SELECT * FROM papeleria.cliente WHERE nombre = 'C';

-- Ordenar resultados en orden ascendente o descendente:
SELECT * FROM papeleria.cliente ORDER BY id_cliente DESC;
SELECT * FROM papeleria.cliente ORDER BY id_cliente ASC;



-- Sumar valores de una columna:
SELECT SUM(total) FROM papeleria.venta;

-- Obtener el valor máximo y mínimo de una columna:
SELECT MAX(precio), MIN(precio) FROM papeleria.producto;

-- Unir dos tablas usando INNER JOIN:
SELECT v.id_venta, c.nombre AS cliente, v.fecha, v.total
FROM papeleria.venta 
INNER JOIN papeleria.cliente c ON v.id_cliente = c.id_cliente;


-- Consultas intermedias
SELECT c.id_cliente, c.nombre AS cliente, v.id_venta, v.fecha, v.total
FROM papeleria.cliente c
INNER JOIN papeleria.venta v ON c.id_cliente = v.id_cliente
WHERE v.total > 100;

SELECT p.id_producto, p.nombre AS producto, c.id_compra, c.fecha, c.cantidad, c.precio_unitario
FROM papeleria.producto p
INNER JOIN papeleria.compra c ON p.id_producto = c.id_producto
WHERE c.cantidad > 200;

-- Consulta con subconsultas correlacionadas:
SELECT p.nombre AS producto, p.precio
FROM papeleria.producto p
WHERE p.precio > (
    SELECT AVG(precio) FROM papeleria.producto
);

-- Consulta con funciones de agregación y GROUP BY:
SELECT id_cliente, AVG(total) AS total_promedio
FROM papeleria.venta
GROUP BY id_cliente;

-- Consulta con funciones de fecha:
SELECT fecha
FROM papeleria.venta
WHERE YEAR(fecha) ='2024-05-01';
;

-- Consulta con UNION para combinar resultados:
SELECT nombre, 'Cliente' AS tipo
FROM papeleria.cliente
UNION
SELECT nombre, 'Proveedor' AS tipo
FROM papeleria.proveedor;

-- Consulta con operadores LIKE para búsqueda de texto parcial:
SELECT nombre, direccion
FROM papeleria.proveedor
WHERE direccion LIKE '%Calle%';

-- Consulta con subconsultas y operadores EXISTS o NOT EXISTS:
SELECT nombre
FROM papeleria.proveedor
WHERE EXISTS (
    SELECT 1 FROM papeleria.compra WHERE compra.id_proveedor = proveedor.id_proveedor
);

-- Consulta con ordenamiento y paginación:
SELECT nombre, fecha_contratacion
FROM papeleria.proveedor
ORDER BY fecha_contratacion DESC
LIMIT 5 OFFSET 5;