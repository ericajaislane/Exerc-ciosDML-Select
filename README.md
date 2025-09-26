 ExerciciosDML-Select
-- Tabela Empregado
CREATE TABLE Empregado (
    RG INT PRIMARY KEY,
    sexo CHAR(1),
    dt_nasc DATE,
    pnome VARCHAR(50),
    unome VARCHAR(50),
    rua VARCHAR(100),
    cidade VARCHAR(50),
    estado CHAR(2),
    salario DECIMAL(10,2),
    dnum INT,
    supRG INT,
    FOREIGN KEY (supRG) REFERENCES Empregado(RG),
    FOREIGN KEY (dnum) REFERENCES Departamento(dnum)
);

-- Tabela Departamento
CREATE TABLE Departamento (
    dnum INT PRIMARY KEY,
    dnome VARCHAR(50),
    gerRG INT,
    dt_inicio DATE,
    FOREIGN KEY (gerRG) REFERENCES Empregado(RG)
);

-- Tabela Projeto
CREATE TABLE Projeto (
    pnum INT PRIMARY KEY,
    pnome VARCHAR(50),
    localizacao VARCHAR(100),
    dnum INT,
    FOREIGN KEY (dnum) REFERENCES Departamento(dnum)
);

-- Tabela Dependente
CREATE TABLE Dependente (
    dep_nome VARCHAR(50),
    dep_sexo CHAR(1),
    dep_dt_nasc DATE,
    empRG INT,
    PRIMARY KEY (dep_nome, empRG),
    FOREIGN KEY (empRG) REFERENCES Empregado(RG)
);

-- Tabela Trabalha_em
CREATE TABLE Trabalha_em (
    RG INT,
    pnum INT,
    horas DECIMAL(5,2),
    PRIMARY KEY (RG, pnum),
    FOREIGN KEY (RG) REFERENCES Empregado(RG),
    FOREIGN KEY (pnum) REFERENCES Projeto(pnum)
);

-- Tabela Localizacao
CREATE TABLE Localizacao (
    localizacao VARCHAR(100) PRIMARY KEY,
    dnum INT,
    FOREIGN KEY (dnum) REFERENCES Departamento(dnum)
);


