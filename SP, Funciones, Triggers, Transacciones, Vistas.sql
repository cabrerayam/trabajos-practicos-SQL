
-- STORE PROCEDURE CREAR CLIENTE

CREATE PROCEDURE ACTUALIZAR_CLIENTE @tipo_documento varchar(15),@nro_documento varchar(15),@nombre varchar(15),@apellido varchar(15), @fecha_nacimiento date,@email varchar(15)
AS
		declare @resultado varchar (50);
		declare @estado_cliente int;
		declare @id_cliente int;
		select @resultado varchar(50) ='';
		select @id_cliente=-1;
		select @estado_cliente = 0 
		
		BEGIN TRY
			INSERT INTO [dbo].CLIENTES(TIPO_DOCUMENTO,NRO_DOCUMENTO,NOMBRE,APELLIDO, FECHA_NACIMIENTO, EMAIL) values(@tipo_documento,@nro_documento,@nombre,@apellido, @fecha_nacimiento, @email);
			set @id_cliente=SCOPE_IDENTITY();
			set @estado_cliente = 3 --- prospecto
		END TRY
		BEGIN CATCH
			SET @id_cliente=-1;
			set @estado_cliente = 0;
			select @resultado='Error en insercion';
		END CATCH;
GO;

BEGIN
					UPDATE [dbo].[CLIENTES] INSERT INTO [dbo].CLIENTES VALUES (@tipo_documento)


--- STORE PROCEDURE ACTUALIZAR ESTADO DE UN TICKET

CREAR PROCEDURE UPDATE_ESTADO_TICKET @id_ticket int, @estado_ticket int
AS
	DECLARE @estado int
	DECLARE @resultado int 

	SELECT @estado_ticket = estado FROM TICKETS WHERE id_ticket = @id_ticket
	SELECT @resultado = count(*) FROM TICKETS WHERE id_ticket = @id_ticket
	
	IF (@resultado >=1 AND @estado = 1 and @estado_ticket = 2)
		OR (@estado = 2 AND @estado_ticket IN (3,4))
		OR (@estado = 3 AND @estado_ticket = 2)
		OR (@estado = 4 AND @estado_ticket = 5)))

		UPDATE TICKETS SET estado = @estado_ticket WHERE id_ticket = @id_ticket
	
	ELSE
		('ERROR EN DATOS DEL TICKET')

/*Funcion Crear Cliente:
Agrega un cliente en estado “Prospecto”, pero antes verifica que los datos sean válidos: mayor de 18 años, documento y tipo de documentos correcto, 
nombre y apellido válidos, email válido. En caso de que los datos no sean válidos devuelve un mensaje, invoca al SP Crear cliente.*/

CREATE PROCEDURE [CREAR_CLIENTE] @tipo_documento varchar(15),@nro_documento varchar(15),@nombre varchar(15),@apellido varchar(15), @fecha_nacimiento date,@email varchar(15), 
@estado_cliente int OUTPUT,@id_cliente int OUTPUT, @error_code int OUTPUT, @error_description char (50) OUTPUT
AS 
	SELECT @error_code = 0;
	SELECT @error_description = '';
	SELECT @id_cliente = -1;
	SELECT @estado_cliente = 0;
 
			IF(@tipo_documento<>'DNI' OR @tipo_documento<>'LC' OR @tipo_documento<>'LE')
				BEGIN
					SELECT @error_code = 1;
					SELECT @error_description = 'Tipo de documento invalido';
					RETURN;
			END;

			IF (len(@nro_documento)<7  OR ISNUMERIC(@nro_documento)=0)
				BEGIN
					SELECT @error_code = 2;
					SELECT @error_description = 'Numero de Documento Invalido';
					RETURN;
			END;


			IF (YEAR(GETDATE()) - YEAR(@fecha_nacimiento) < 18)
				BEGIN
					SELECT @error_code = 3;
					SELECT @error_description = 'Debe ser mayor de edad';
					RETURN;
			END;

			IF (len(@nombre)= 0 OR len(@apellido)=0)
				BEGIN
					SELECT @error_code = 4;
					SELECT @error_description = 'Nombre o Apellido Invalido';
					RETURN;
			END;

			IF (CHARINDEX ('@', @email))
				BEGIN
					SELECT @error_code = 5;
					SELECT @error_description = 'Email Invalido';
					RETURN;
			END;
			
			BEGIN TRY 
				INSERT INTO CLIENTES (TIPO_DOCUMENTO, NRO_DOCUMENTO, NOMBRE, APELLIDO, FECHA_NACIMIENTO, EMAIL)
					   VALUES (@tipo_documento, @nro_documento, @nombre, @apellido, @fecha_nacimiento, @email);
				SET @id_cliente = SCOPE_IDENTITY();
				SET @estado_cliente = 3 --- define al cliente como prospecto.
			END TRY

			BEGIN CATCH
				SET @id_cliente = -1;
				SELECT @error_code = 99;
				SELECT @error_description = 'Error en insercion';
			END CATCH;

GO;


/* Funcion Alta Servicio para un Cliente: Da de alta a un servicio dentro de un cliente, valida los datos de ingreso,
que el cliente exista, si es prospecto que tenga fecha de nacimiento y email y si todo esta correcto cambio de estado a Activo*/

--TRANSACCION

BEGIN TRAN

	BEGIN TRY 

		UPDATE [dbo].CLIENTES 
			SET @estado_cliente = 1 -- cambia a activo
			WHERE @estado_cliente = 3 OR @estado_cliente = 2
				AND @fecha_nacimiento NOT NULL,
				AND @email NOT NULL,
				AND @id_cliente = SELECT id_cliente FROM CLIENTES 
				AND @id_servicio =SELECT id_servicio FROM SERVICIOS
		COMMIT TRAN

	END TRY

	BEGIN CATCH
		PRINT @@ERROR
		ROLLBACK TRAN
	END CATCH


---VISTAS---
 --1) Cumplimiento de SLA
 CREATE VIEW SLA
 AS 
 SELECT ID_TICKET, TIPO_TICKET, ESTADO_TICKET, ID_SERVICIO, FECHA_APERTURA, FECHA_RESOLUCION,
 MAX (CASE WHEN TIPO_SERVICIO = 1 AND DATEDIFF(FECHA_RESOLUCION - FECHA_APERTURA) <= 48 THEN 1 ELSE 0
		WHEN TIPO_SERVICIO = 2 AND DATEDIFF(FECHA_RESOLUCION - FECHA_APERTURA) <= 24 THEN 1 ELSE 0
		WHEN TIPO_SERVICIO = 3 AND DATEDIFF(FECHA_RESOLUCION - FECHA_APERTURA) <= 72 THEN 1 ELSE 0)AS CUMPLE_SLA 
 FROM TICKETS
 GROUP BY ID_TICKET,TIPO_TICKET, TESTADO_TICKET, ID_SERVICIO, FECHA_APERTURA, FECHA_RESOLUCION

  --2) Prospectos
 CREATE VIEW SLA
 AS 
 SELECT C.ID_CLIENTE, C.NRO_DOCUMENTO, C_EMAIL, E.DESC_ESTADO_CLIENTE
 FROM CLIENTES AS C 
 INNER JOIN ESTADO_CLIENTE AS E ON C.ESTADO_CLIENTE = E.ID_ESTADO_CLIENTE
 WHERE E.DESC_ESTADO_CLIENTE = 'PROSPECTO'

 ---3) Tickets pendientes por resolucion y tipo de servicio asociado
 CREATE VIEW
 AS
 SELECT T.ID_TICKET, T.TIPO_TICKET, T.ID_SERVICIO, E.DESC_ESTADO_TICKET, T.FECHA_APERTURA, T.ID_CLIENTE
 FROM TICKETS AS T
 INNER JOIN ESTADO_TICKET AS E ON T.ESTADO_TICKET = E_ID_ESTADO_TICKET
 WHERE E.DESC_ESTADO_TICKET = 'ABIERTO' OR E.DESC_ESTADO_TICKET ='EN PROGRESO' OR E.DESC_ESTADO_TICKET = 'PENDIENTE CLIENTE'
 AND FECHA_RESOLUCION IS NULL






