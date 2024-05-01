/* Crear base de datos dbGamarraMarket */
CREATE DATABASE dbGamarraMarket;
USE dbGamarraMarket;

/* Crear tablas de dbGamarraMarket */
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    id int  NOT NULL COMMENT 'Contiene el identificador único de un cliente.',
    tipo_documento char(3)  NOT NULL COMMENT 'Contiene el tipo de documento_ DNI - CNE',
    numero_documento char(15)  NOT NULL COMMENT 'Numero de documento de identidad.',
    nombres varchar(60)  NOT NULL COMMENT 'Nombres del cliente',
    apellidos varchar(90)  NOT NULL COMMENT 'Apellidos del cliente',
    email varchar(60)  NULL COMMENT 'Correo electronico del cliente',
    celular char(9)  NULL COMMENT 'Numero de celular del cliente.',
    fecha_nacimiento date  NOT NULL COMMENT 'Fecha de nacimiento del cliente.',
    activo bool  NOT NULL COMMENT 'Estado activo o inactivo del cliente.',
    CONSTRAINT CLIENTE_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos del cliente.';

-- Table: PRENDA
CREATE TABLE PRENDA (
    id int  NOT NULL COMMENT 'Contiene el identificador único de una prenda.',
    descripcion varchar(90)  NOT NULL COMMENT 'Contiene la descripción de la prenda.',
    marca varchar(60)  NOT NULL COMMENT 'Contiene el nombre de la marca de la prenda.',
    cantidad int  NOT NULL COMMENT 'Cantidad de prendas con las que cuenta la tienda.',
    talla varchar(10)  NOT NULL COMMENT 'Contiene la talla de cada prenda.',
    precio decimal(8,2)  NOT NULL,
    activo bool  NOT NULL COMMENT 'Estado activo o inactivo de la prenda.',
    CONSTRAINT PRENDA_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de la prenda.';

-- Table: VENDEDOR
CREATE TABLE VENDEDOR (
    id int  NOT NULL COMMENT 'Contiene el identificador único de un vendedor.',
    tipo_documento char(3)  NOT NULL COMMENT 'Contiene el tipo de documento: DNI - CNE.',
    numero_documento char(15)  NOT NULL COMMENT 'Numero de documento de identidad.',
    nombres varchar(60)  NOT NULL COMMENT 'Nombres del vendedor.',
    apellidos varchar(90)  NOT NULL COMMENT 'Apellidos del vendedor.',
    salario decimal(8,2)  NOT NULL COMMENT 'Contiene el salario del vendedor.',
    celular char(9)  NULL COMMENT 'Numero de celular del vendedor.',
    email varchar(80)  NULL COMMENT 'Correo electrónico del vendedor.',
    activo bool  NOT NULL COMMENT 'Estado activo o inactivo del vendedor.',
    CONSTRAINT VENDEDOR_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de los vendedores.';

-- Table: VENTA
CREATE TABLE VENTA (
    id int  NOT NULL COMMENT 'Contiene el identificador de cada venta.',
    fecha_hora timestamp  NOT NULL COMMENT 'Fecha y hora en que se realizo la venta.',
    activo bool  NOT NULL COMMENT 'Estado activo o inactivo de la venta.',
    cliente_id int  NOT NULL COMMENT 'Identificador del cliente previamente registrado.',
    VENDEDOR_id int  NOT NULL,
    CONSTRAINT VENTA_pk PRIMARY KEY (id)
) COMMENT 'Contiene los datos de registro de la venta.';

-- Table: VENTA_DETALLE
CREATE TABLE VENTA_DETALLE (
    id int  NOT NULL COMMENT 'Contiene el identificador de detalle de venta.',
    cantidad int  NOT NULL COMMENT 'Cantidad de las prendas en el detalle de venta.',
    venta_id int  NOT NULL COMMENT 'Contiene el identificador de la venta.',
    PRENDA_id int  NOT NULL,
    CONSTRAINT VENTA_DETALLE_pk PRIMARY KEY (id, venta_id),
    CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY (venta_id) REFERENCES VENTA(id)
) COMMENT 'Contiene los datos de registro de la venta detalle.';

/* Listar estructura de tabla CLIENTE */
SHOW COLUMNS FROM CLIENTE; 
SHOW COLUMNS FROM PRENDA;
SHOW COLUMNS FROM VENDEDOR; 
SHOW COLUMNS FROM VENTA;
SHOW COLUMNS FROM VENTA_DETALLE;

/* Listar tablas existentes en la base de datos en uso */
SHOW TABLES;

-- foreign keys(relaciones)
-- Reference: VENTA_CLIENTE (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_CLIENTE FOREIGN KEY VENTA_CLIENTE (cliente_id)
    REFERENCES CLIENTE (id);

-- Reference: VENTA_DETALLE_PRENDA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_PRENDA FOREIGN KEY VENTA_DETALLE_PRENDA (PRENDA_id)
    REFERENCES PRENDA (id);

-- Reference: VENTA_DETALLE_VENTA (table: VENTA_DETALLE)
ALTER TABLE VENTA_DETALLE ADD CONSTRAINT VENTA_DETALLE_VENTA FOREIGN KEY VENTA_DETALLE_VENTA (VENTA_id)
    REFERENCES VENTA (id);

-- Reference: VENTA_VENDEDOR (table: VENTA)
ALTER TABLE VENTA ADD CONSTRAINT VENTA_VENDEDOR FOREIGN KEY VENTA_VENDEDOR (VENDEDOR_id)
    REFERENCES VENDEDOR (id);

-- Listar relaciones de tablas de la base de datos activa
SELECT 
    i.constraint_name, k.table_name, k.column_name, 
    k.referenced_table_name, k.referenced_column_name
FROM 
    information_schema.TABLE_CONSTRAINTS i 
LEFT JOIN information_schema.KEY_COLUMN_USAGE k 
ON i.CONSTRAINT_NAME = k.CONSTRAINT_NAME 
WHERE i.CONSTRAINT_TYPE = 'FOREIGN KEY' 
AND i.TABLE_SCHEMA = DATABASE();