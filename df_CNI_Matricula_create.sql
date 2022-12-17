-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-11-04 14:44:32.792

-- tables
-- Table: ALUMNO
CREATE TABLE ALUMNO (
    IDALU Char(8) NOT NULL COMMENT 'Contiene el identificador de la matricula. Por ejemplo: M0000001.',
    DNIALU Char(8) NOT NULL COMMENT 'Contiene el DNI del alumno',
    NOMALU Varchar(50) NOT NULL COMMENT 'Contiene los nombres del alumno',
    APEALU Varchar(50) NOT NULL COMMENT 'Contiene los apellidos del alumno.',
    EMAALU Varchar(50) NOT NULL COMMENT 'Contiene el Email del alumno.',
    CELALU Char(9) NOT NULL COMMENT 'Contiene el número de celular del alumno.',
    DIRALU Varchar(50) NOT NULL COMMENT 'Contiene la dirección del alumno.',
    FECALU date NOT NULL COMMENT 'Contiene la fecha de nacimiento del alumno.',
    CONSTRAINT ALUMNO_pk PRIMARY KEY (IDALU)
) COMMENT 'Contiene los datos del alumno.';

-- Table: APODERADO
CREATE TABLE APODERADO (
    IDAPO char(6) NOT NULL COMMENT 'Contiene el identificador del apoderado. Por ejemplo 000001',
    NOMAPO varchar(50) NOT NULL COMMENT 'Contiene los nombres del apoderado',
    APEAPO varchar(50) NOT NULL COMMENT 'Contiene los apellidos del apoderado.',
    DNIAPO Char(8) NOT NULL COMMENT 'Contiene el DNI del apoderado.',
    CELAPO Char(9) NOT NULL COMMENT 'Contiene el número celular del apoderado.',
    EMAAPO int NOT NULL COMMENT 'Contiene el Email del apoderado.',
    DIRAPO int NOT NULL COMMENT 'Contiene la dirección del apoderado.',
    CONSTRAINT APODERADO_pk PRIMARY KEY (IDAPO)
) COMMENT 'Contiene los datos del apoderado.';

-- Table: ENCARGADOMATRICULA
CREATE TABLE ENCARGADOMATRICULA (
    CODEMA Char(4) NOT NULL COMMENT 'Contiene el código del encargado de las matrículas. Por ejemplo: E001',
    DNIEMA Char(8) NOT NULL COMMENT 'Contiene el DNI del encargado de las matrículas.',
    NOMEMA Varchar(50) NOT NULL COMMENT 'Contiene los nombres del Encargado de las matrículas. ',
    APEEMA Varchar(50) NOT NULL COMMENT 'Contiene losapellidos del Encargado de las matrículas. ',
    CELEMA Char(9) NOT NULL COMMENT 'Contiene el número de celular del encargado de las matrículas.',
    EMAEN varchar(60) NOT NULL COMMENT 'Contiene el correo electronico del encargado',
    CONSTRAINT ENCARGADOMATRICULA_pk PRIMARY KEY (CODEMA)
) COMMENT 'Se encarga del informe y la realización de la matrícula.';

-- Table: GRADO
CREATE TABLE GRADO (
    IDGRA char(8) NOT NULL,
    NIACA int NOT NULL COMMENT 'Contiene el nivel academico: por ejemplo inicial, primaria y secundaria.',
    GRA int NOT NULL,
    SECC int NOT NULL,
    CONSTRAINT GRADO_pk PRIMARY KEY (IDGRA)
) COMMENT 'Contiene los datos del grado.';

-- Table: MATRICULA
CREATE TABLE MATRICULA (
    IDMAT char(8) NOT NULL,
    IDALU Char(8) NOT NULL COMMENT 'Contiene el identificador del alumno. Por ejemplo: A0000001',
    CODEMA char(4) NOT NULL COMMENT 'Contiene el código del encargado de las matrículas. Por ejemplo: E001',
    IDAPO char(6) NOT NULL COMMENT 'Contiene el identificador del apoderado.',
    COSMAT Varchar(25) NOT NULL COMMENT 'Contiene el costo de la matricula.',
    FECMAT date NOT NULL COMMENT 'Contiene la fecha en que se realizó la matricula',
    HORMAT time NOT NULL COMMENT 'Contiene la hora en que se realizó la matricula.',
    IDGRA char(8) NOT NULL,
    CONSTRAINT MATRICULA_pk PRIMARY KEY (IDMAT)
) COMMENT 'Contiene los datos de la matrícula.';

-- foreign keys
-- Reference: MATRICULA_ALUMNO (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_ALUMNO FOREIGN KEY MATRICULA_ALUMNO (IDALU)
    REFERENCES ALUMNO (IDALU);

-- Reference: MATRICULA_APODERADO (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_APODERADO FOREIGN KEY MATRICULA_APODERADO (IDAPO)
    REFERENCES APODERADO (IDAPO);

-- Reference: MATRICULA_ENCARGADOMATRICULA (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_ENCARGADOMATRICULA FOREIGN KEY MATRICULA_ENCARGADOMATRICULA (CODEMA)
    REFERENCES ENCARGADOMATRICULA (CODEMA);

-- Reference: MATRICULA_GRADO (table: MATRICULA)
ALTER TABLE MATRICULA ADD CONSTRAINT MATRICULA_GRADO FOREIGN KEY MATRICULA_GRADO (IDGRA)
    REFERENCES GRADO (IDGRA);

-- End of file.

