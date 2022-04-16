/* DDL de Creacion de Tablas */

/* Se agregan las restricciones de dominio NOT NULL*/

CREATE TABLE LIBRO (NRO_LIBRO int NOT NULL, 
                     TITULO char(40) NOT NULL,
                     AUTOR char(30) NOT NULL,
                     TIPO char(2)NOT NULL,
                     PRECIO_ORI smallmoney NOT NULL,
                     PRECIO_ACT smallmoney NOT NULL, 
                     EDICION smallint NOT NULL,
					 ESTADO char(1))
--
CREATE TABLE TIPOLIBRO (TIPO char(2) NOT NULL,
			DESCTIPO char(40))
--
CREATE TABLE LECTOR (NRO_LECTOR int NOT NULL,
                     NOMBRE char(22) NOT NULL,
                     DIRECCION char(30) NOT NULL,
                     TRABAJO char(10),
                     SALARIO smallmoney,
					 ESTADO char(1))
--
CREATE TABLE COPIAS (NRO_LIBRO int NOT NULL,
                       NRO_COPIA smallint NOT NULL,
					   ESTADO char(1)
                       )
--
CREATE TABLE PRESTAMO (NRO_LECTOR int NOT NULL,
                       NRO_LIBRO int NOT NULL,
                       NRO_COPIA smallint NOT NULL,
                       F_PREST datetime NOT NULL,
                       F_DEVOL datetime)
                       
/* Se agregan las restricciones de Primary Key y de Integridad Referencial*/                      
                       
ALTER TABLE LIBRO 
	ADD PRIMARY KEY (NRO_LIBRO)
ALTER TABLE TIPOLIBRO 
	ADD PRIMARY KEY (TIPO)
ALTER TABLE LECTOR 
	ADD PRIMARY KEY (NRO_LECTOR)
ALTER TABLE COPIAS 
	ADD PRIMARY KEY (NRO_LIBRO)
ALTER TABLE PRESTAMO 
	ADD PRIMARY KEY (NRO_LIBRO)
 
ALTER TABLE LIBRO 
	ADD FOREIGN KEY(TIPO) REFERENCES TIPOLIBRO
	ON DELETE CASCADE ON UPDATE CASCADE
     
ALTER TABLE PRESTAMO 
	ADD FOREIGN KEY(NRO_LIBRO) REFERENCES LIBRO
	ON DELETE CASCADE ON UPDATE CASCADE
    
/*Creo un indice para EL titulo de la tabla libro*/
CREATE INDEX TITULO ON LIBRO (TITULO)

/*Creo un indice unique para tipo y titulo de libro*/
CREATE UNIQUE INDEX TIPO_TITULO ON LIBRO (TITULO, TIPO);


