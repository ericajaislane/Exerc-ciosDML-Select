DROP DATABASE Empresa;
CREATE DATABASE Empresa;
USE Empresa;
CREATE TABLE Departamento (
    dnum INT PRIMARY KEY,
    dnome VARCHAR(50) NOT NULL,
    gerRG CHAR(11), 
    dt_inicio DATE
);

CREATE TABLE Empregado (
    RG CHAR(11) PRIMARY KEY,
    sexo CHAR(1) CHECK (sexo IN ('M','F')),
    dt_nasc DATE NOT NULL,
    pnome VARCHAR(30) NOT NULL,
    unome VARCHAR(30) NOT NULL,
    rua VARCHAR(50),
    cidade VARCHAR(30),
    estado CHAR(2),
    salario DECIMAL(10,2),
    dnum INT,
    supRG CHAR(11),
    CONSTRAINT fk_empregado_depto FOREIGN KEY (dnum)
        REFERENCES Departamento(dnum)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_empregado_supervisor FOREIGN KEY (supRG)
        REFERENCES Empregado(RG)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
ALTER TABLE Departamento
    ADD CONSTRAINT fk_departamento_gerente FOREIGN KEY (gerRG)
    REFERENCES Empregado(RG)
    ON DELETE SET NULL
    ON UPDATE CASCADE;
SHOW TABLES;
DESCRIBE Empregado;
INSERT INTO Departamento VALUES (1, 'Pesquisa', NULL, '2020-01-01');

INSERT INTO Empregado VALUES
('11111111111', 'M', '1980-05-10', 'João', 'Silva', 'Rua A', 'Brasília', 'DF', 5000, 1, NULL);

UPDATE Departamento SET gerRG = '11111111111' WHERE dnum = 1;

INSERT INTO Projeto VALUES (10, 'Sistema X', 'São Paulo', 1);

INSERT INTO Trabalha_em VALUES ('11111111111', 10, 40.0);



