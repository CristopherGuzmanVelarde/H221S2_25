DROP DATABASE MATRICULA;

/* Creamos base de datos MATRICULA*/
CREATE DATABASE MATRICULA;

/* Poner en uso la base de datos */
USE MATRICULA;

/* Creamos la tabla APODERADO */
CREATE TABLE APODERADO
(
	IDAPO CHAR(8),
    NOMAPO VARCHAR(50),
    APEAPO VARCHAR(50),
    DNIAPO CHAR(8),
    CELAPO CHAR(9),
    EMAAPO INT,
    DIRAPO INT,
    CONSTRAINT IDAPO_PK PRIMARY KEY (IDAPO)
);

/* Creamos la tabla ALUMNO */
CREATE TABLE ALUMNO
(
	IDALU CHAR(8),
    DNIALU CHAR(8),
    NOMALU VARCHAR(50),
    APEALU VARCHAR(50),
    EMAALU VARCHAR(50),
    CELALU CHAR(9),
    DIRALU VARCHAR(50),
    FECALU DATE,
    CONSTRAINT IDALU_PK PRIMARY KEY (IDALU)
);

/* Creamos la tabla GRADO */
CREATE TABLE GRADO
(
	IDGRA CHAR(8),
    NIACA INT,
    GRA INT,
    SECC INT,
    CONSTRAINT IDGRA_PK PRIMARY KEY (IDGRA)
);

/* Creamos la tabla ENCARGADOMATRICULA */
CREATE TABLE ENCARGADOMATRICULA
(
	CODEMA CHAR(4),
    DNIEMA CHAR(8),
    NOMEMA VARCHAR(50),
    APEEMA VARCHAR(50),
    CELEMA CHAR(9),
    EMAEN VARCHAR(60),
    CONSTRAINT CODEMA_PK PRIMARY KEY (CODEMA)
);

/* Creamos la tabla MATRICULA */
CREATE TABLE MATRICULA
(
	IDMAT CHAR(8),
    COSMAT VARCHAR(25),
    FECMAT DATE,
    HORMAT TIME,
    CONSTRAINT IDMAT_PK PRIMARY KEY (IDMAT)
);

/* Agregar campo IDALU*/
ALTER TABLE MATRICULA
	ADD IDALU CHAR(8);
    
/* Agregar campo CODEMA*/
ALTER TABLE MATRICULA
	ADD CODEMA CHAR(4);
    
/* Agregar campo IDAPO*/
ALTER TABLE MATRICULA
	ADD IDAPO CHAR(6);
    
/* Agregar campo IDGRA*/
ALTER TABLE MATRICULA
	ADD IDGRA CHAR(8);
    
/* Relacion MATRICULA - APODERADO */
ALTER TABLE MATRICULA
	ADD CONSTRAINT IDAPO_FK FOREIGN KEY (IDAPO)
    REFERENCES APODERADO (IDAPO);
    
/* Relacion MATRICULA - ALUMNO*/
ALTER TABLE MATRICULA
	ADD CONSTRAINT IDALU_FK FOREIGN KEY (IDALU)
    REFERENCES ALUMNO (IDALU);
    
/* Relacion MATRICULA - GRADO */
ALTER TABLE MATRICULA
	ADD CONSTRAINT IDGRA_FK FOREIGN KEY (IDGRA)
    REFERENCES GRADO (IDGRA);
    
/* Relacion MATRICULA - ENCARGADOMATRICULA */
ALTER TABLE MATRICULA
	ADD CONSTRAINT CODEMA_FK FOREIGN KEY (CODEMA)
    REFERENCES ENCARGADOMATRICULA (CODEMA);
    
