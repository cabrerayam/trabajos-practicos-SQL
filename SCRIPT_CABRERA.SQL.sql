-- create schema
CREATE SCHEMA dbo;
go


-- create tables
CREATE TABLE dbo.Clientes (
	ID_CLIENTE INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
  	NOMBRE VARCHAR (20) NOT NULL,
  	APELLIDO VARCHAR (20) NOT NULL,
 	ID_PROVINCIA SMALLINT NOT NULL, 
  	CUIT VARCHAR (11) NOT NULL,
  	FOREIGN KEY (ID_PROVINCIA) REFERENCES dbo.Provincias (ID_PROVINCIA) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE dbo.Compra (
	ID_COMPRA INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
  	ID_CLIENTE INT  NOT NULL,
  	FECHA DATETIME NOT NULL,
  	ID_FORMAPAGO INT NOT NULL,
  	FOREIGN KEY (ID_CLIENTE) REFERENCES dbo.Clientes (ID_CLIENTE) ON DELETE CASCADE ON UPDATE CASCADE,
  	FOREIGN KEY (ID_FORMAPAGO) REFERENCES dbo.FormaPago (ID_FORMAPAGO) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE dbo.DetalleCompra (
	ID_DETALLE_COMPRA INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	ID_COMPRA INT  NOT NULL,
	ID_PRODUCTO INT  NOT NULL,
	PRECIOTOTAL INT NOT NULL,
	CANTIDAD INT NOT NULL,
    FOREIGN KEY (ID_COMPRA) REFERENCES dbo.Compra (ID_COMPRA) ON DELETE CASCADE ON UPDATE CASCADE,
  	FOREIGN KEY (ID_PRODUCTO) REFERENCES dbo.Producto (ID_PRODUCTO) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dbo.FormaPago (
	ID_FORMAPAGO INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	DESCRIPCION VARCHAR (50)  NOT NULL
);

CREATE TABLE dbo.Producto (
	ID_PRODUCTO INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	NOMBRE VARCHAR (20)  NOT NULL,
	PRECIO INT  NOT NULL,
	STOCK INT NOT NULL
);

CREATE TABLE dbo.Provincias (
	ID_PROVINCIA INT IDENTITY (1, 1) NOT NULL PRIMARY KEY,
	NOMBRE VARCHAR (20)  NOT NULL
);

 ---carga de datos--

INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (1, N'JORGE', N'GOMEZ', 1, N'20123456881')
GO
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (2, N'ABEL', N'ARDO', 2, N'20254773212')
GO
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (3, N'MARIA', N'PEREZ', 5, N'23456754652')
GO
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (4, N'ANGELICA', N'GONZALEZ', 2, N'20484848282')
GO
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (5, N'MABEL ', N'RODRIGUEZ', 1, N'23959493931')
GO
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (6, N'ERMENEGILDO', N'ZEGNA', 2, N'20934853234')
GO
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (7, N'ENRIQUETA', N'FERNANDEZ ', 4, N'23584838348')
GO
INSERT [dbo].[Compra] ([Id_Compra], [Id_Cliente], [Fecha], [Id_FormaPago]) VALUES (1, 1, CAST(N'2019-07-01' AS Date), 1)
GO
INSERT [dbo].[Compra] ([Id_Compra], [Id_Cliente], [Fecha], [Id_FormaPago]) VALUES (2, 1, CAST(N'2019-07-04' AS Date), 2)
GO
INSERT [dbo].[Compra] ([Id_Compra], [Id_Cliente], [Fecha], [Id_FormaPago]) VALUES (3, 1, CAST(N'2019-07-05' AS Date), 1)
GO
INSERT [dbo].[Compra] ([Id_Compra], [Id_Cliente], [Fecha], [Id_FormaPago]) VALUES (4, 3, CAST(N'2019-07-12' AS Date), 3)
GO
INSERT [dbo].[Compra] ([Id_Compra], [Id_Cliente], [Fecha], [Id_FormaPago]) VALUES (5, 5, CAST(N'2019-07-13' AS Date), 3)
GO
INSERT [dbo].[DetalleCompra] ([Id_DetalleCompra], [Id_Compra], [Id_Producto], [PrecioTotal], [Cantidad]) VALUES (1, 1, 1, 7000, 2)
GO
INSERT [dbo].[DetalleCompra] ([Id_DetalleCompra], [Id_Compra], [Id_Producto], [PrecioTotal], [Cantidad]) VALUES (2, 1, 2, 1500, 2)
GO
INSERT [dbo].[DetalleCompra] ([Id_DetalleCompra], [Id_Compra], [Id_Producto], [PrecioTotal], [Cantidad]) VALUES (3, 2, 5, 6230, 1)
GO
INSERT [dbo].[DetalleCompra] ([Id_DetalleCompra], [Id_Compra], [Id_Producto], [PrecioTotal], [Cantidad]) VALUES (4, 3, 3, 3200, 3)
GO
INSERT [dbo].[DetalleCompra] ([Id_DetalleCompra], [Id_Compra], [Id_Producto], [PrecioTotal], [Cantidad]) VALUES (5, 5, 4, 1000, 1)
GO
INSERT [dbo].[FormaPago] ([Id_FormaPago], [Descripcion]) VALUES (1, N'EFECTIVO')
GO
INSERT [dbo].[FormaPago] ([Id_FormaPago], [Descripcion]) VALUES (2, N'TARJETA DEBITO')
GO
INSERT [dbo].[FormaPago] ([Id_FormaPago], [Descripcion]) VALUES (3, N'TARJETA CREDITO 1 CUOTA')
GO
INSERT [dbo].[FormaPago] ([Id_FormaPago], [Descripcion]) VALUES (4, N'TARJETA CREDITO 3 CUOTAS ')
GO
INSERT [dbo].[FormaPago] ([Id_FormaPago], [Descripcion]) VALUES (5, N'DEPOSITO - TRANSFERENCIA')
GO
INSERT [dbo].[FormaPago] ([Id_FormaPago], [Descripcion]) VALUES (6, N'CHEQUE')
GO
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Precio], [stock]) VALUES (1, N'MONITOR', 3500, 100)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Precio], [stock]) VALUES (2, N'MOUSE', 185, 5)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Precio], [stock]) VALUES (3, N'PAD', 50, 1000)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Precio], [stock]) VALUES (4, N'HEADSET', 500, 450)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Precio], [stock]) VALUES (5, N'TECLADO', 320, 10)
GO
INSERT [dbo].[Producto] ([Id_Producto], [Nombre], [Precio], [stock]) VALUES (6, N'PARLANTE INALAM', 1860, 12)
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre]) VALUES (1, N'BUENOS AIRES')
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre]) VALUES (2, N'CABA')
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre]) VALUES (3, N'SAN LUIS')
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre]) VALUES (4, N'SANTA FE')
GO
INSERT [dbo].[Provincias] ([Id_Provincia], [Nombre]) VALUES (5, N'CHACO')
GO


--- consultas---

/*1. Crear una consulta, que dado un CUIT devuelve , todos los datos de la compra , su detalle , la
descripción de la forma de pago y el nombre , apellido y Nombre de la provincia */

SELECT
COMPRA.ID_COMPRA,
COMPRA.FECHA,
DETALLECOMPRA.PRECIOTOTAL,
DETALLECOMPRA.CANTIDAD,
FORMAPAGO.DESCRIPCION,
CLIENTES.NOMBRE,
CLIENTES.APELLIDO,
PROVINCIAS.NOMBRE
FROM CLIENTES
INNER JOIN COMPRA ON CLIENTES.ID_CLIENTE = COMPRA.ID_CLIENTE
INNER JOIN DETALLECOMPRA ON COMPRA.ID_COMPRA = DETALLECOMPRA.ID_COMPRA
INNER JOIN FORMAPAGO ON COMPRA.ID_FORMAPAGO = FORMAPAGO.ID_FORMAPAGO
INNER JOIN PROVINCIAS ON CLIENTES.ID_PROVINCIA = PROVINCIAS.ID_PROVINCIA
WHERE CLIENTES.CUIT = '20123456881'; 


/*2. Crear una consulta, que recibe como el Id_FormaPago y devuelve el total de compras de esa forma
de pago*/

SELECT
COMPRA.ID_FORMAPAGO,
SUM(DETALLECOMPRA.PRECIOTOTAL) AS TOTAL_COMPRAS
FROM COMPRA
INNER JOIN DETALLECOMPRA ON COMPRA.ID_COMPRA = DETALLECOMPRA.ID_COMPRA
WHERE COMPRA.ID_FORMAPAGO = 3
GROUP BY COMPRA.ID_FORMAPAGO;

/*3. Crear una consulta, que dodo el nombre de una provincia o una parte de su nombre y devuelve el
CUIT , Nombre y Apellido de todos los clientes que pertenecen a esa provincia.*/

SELECT
CLIENTES.CUIT,
CLIENTES.NOMBRE,
CLIENTES.APELLIDO
FROM PROVINCIAS
INNER JOIN CLIENTES ON CLIENTES.ID_PROVINCIA = PROVINCIAS.ID_PROVINCIA
WHERE PROVINCIAS.NOMBRE LIKE '%CABA%'

/*4. Crear una consulta , para Alta un cliente , de la provincia de San Luis*/

--PRIMERO CONSULTA CUAL ES EL ID DE LA PROVINCIA DE SAN LUIS---
SELECT 
PROVINCIA.ID_PROVINCIA
FROM PROVINCIA
WHERE PROVINCIA.NOMBRE = 'SAN LUIS'
--- DESPUES DOY EL ALTA DEL CLIENTE EN LA DBO DE CLIENTES USANDO EL ID_PROVINCIA DE LA CONSULTA ANTERIOR.
INSERT [dbo].[Clientes] ([Id_Cliente], [Nombre], [Apellido], [Id_Provincia], [CUIT]) VALUES (8, N'DANIEL', N'HERNANDEZ', 3, N'20123456800')
GO

/*5. Generar una consulta que aumente el precio de todos los productos a 50% más que el actual.*/

SELECT 
ID_PRODUCTO,
PRECIO,
PRECIO * 1.50 AS NUEVO_PRECIO
FROM PRODUCTOS
ORDER BY ID_PRODUCTO





