CREATE DATABASE Tarea1;

USE Tarea1;

CREATE TABLE Aerolinea(
Codigo_Aero VARCHAR(6)PRIMARY KEY NOT NULL,
Decuento DECIMAL
);

CREATE TABLE Boleto(
Codigo_Boleto VARCHAR(5) PRIMARY KEY NOT NULL,
No_Vuelo VARCHAR(10)NOT NULL,
Fecha DATE NOT NULL,
Destino VARCHAR(60)
);

CREATE TABLE Boleto_Aerolinea (
Codigo_boleto VARCHAR(5)NOT NULL,
Codigo_Aero VARCHAR(6)NOT NULL
);

ALTER TABLE Boleto_Aerolinea ADD CONSTRAINT pk_Cod_B_Cod_A 
PRIMARY KEY (Codigo_boleto,Codigo_Aero);

ALTER TABLE Boleto_Aerolinea ADD CONSTRAINT fk_Cod_B_Cod_A_Boleto
FOREIGN KEY (Codigo_boleto) REFERENCES Boleto(Codigo_boleto);

ALTER TABLE Boleto_Aerolinea ADD CONSTRAINT fk_Cod_B_Cod_A_Aerolinea
FOREIGN KEY (Codigo_Aero) REFERENCES Aerolinea(Codigo_Aero);


CREATE TABLE Hotel(
Codigo_Hotel VARCHAR(5) PRIMARY KEY NOT NULL,
Nombre VARCHAR(60) NOT NULL,
Direccion VARCHAR(80));

CREATE TABLE Cliente(
DNI VARCHAR(13) PRIMARY KEY NOT NULL,
Nombre1 VARCHAR(30) NOT NULL,
Nombre2 VARCHAR(30),
Apellido1 VARCHAR(30) NOT NULL,
Apellido2 VARCHAR(30),
Telefono VARCHAR(8),
Codigo_Boleto VARCHAR(5) NOT NULL
);

ALTER TABLE Cliente ADD CONSTRAINT fk_Cod_Boleto
FOREIGN KEY (Codigo_boleto) REFERENCES Boleto(Codigo_boleto);

CREATE TABLE Hotel_Client(
Codigo_Hotel VARCHAR(5) NOT NULL,
DNI VARCHAR(13) NOT NULL,
Fecha_Entrada DATE NOT NULL,
Fecha_Salida DATE NOT NULL,
Cantidad_Personas INTEGER
);

ALTER TABLE Hotel_Client ADD CONSTRAINT pk_CodH_DNI 
PRIMARY KEY (Codigo_Hotel,DNI);

ALTER TABLE Hotel_Client ADD CONSTRAINT fk_CodH_DNI_Cod
FOREIGN KEY (Codigo_Hotel) REFERENCES Hotel(Codigo_Hotel);

ALTER TABLE Hotel_Client ADD CONSTRAINT fk_CodH_DNI_DNI
FOREIGN KEY (DNI) REFERENCES Cliente(DNI);

ALTER TABLE Boleto ADD CONSTRAINT ck_destino 
CHECK (Destino in ('Mexico', 'Guatemala', 'Panama'));

INSERT  INTO Boleto Values (00015, 5500058956,'23-04-2020','El Salvador');

ALTER TABLE Aerolinea ADD CONSTRAINT ck_descuento CHECK (Decuento >= 10);

INSERT  INTO Aerolinea Values (000158,5);
INSERT  INTO Aerolinea Values (000158,12);