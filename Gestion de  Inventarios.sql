CREATE SCHEMA inventarios;
USE inventarios;

CREATE TABLE categorias(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_corto VARCHAR(50) NOT NULL,
nombre_largo VARCHAR(50)
);

CREATE TABLE proveedores(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre_proveedor VARCHAR(50) NOT NULL,
nombre_contacto VARCHAR(50) NOT NULL,
telefono VARCHAR(20),
email VARCHAR(30)
);

CREATE TABLE clientes(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(30) NOT NULL,
telefono VARCHAR(20) NOT NULL,
email VARCHAR(30)
);

CREATE TABLE productos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
id_categoria INT NOT NULL,
precio_unitario INT NOT NULL,
stock INT NOT NULL,
FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

CREATE TABLE compras(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_producto INT NOT NULL,
id_proveedor INT NOT NULL,
cantidad INT NOT NULL,
precio_total INT NOT NULL,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);
 
CREATE TABLE pedidos(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
fecha DATE NOT NULL,
id_producto INT NOT NULL,
cantidad INT NOT NULL,
id_cliente INT NOT NULL,
precio_total INT NOT NULL,
FOREIGN KEY (id_cliente) REFERENCES clientes(id),
FOREIGN KEY (id_producto) REFERENCES productos(id)
);
 