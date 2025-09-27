-- 1. Empregados do departamento 5
SELECT * FROM Empregado WHERE dnum = 5;

-- 2. Empregados com salário maior que 3000
SELECT * FROM Empregado WHERE salario > 3000;

-- 3. Empregados do depto 5 e salário > 3000
SELECT * FROM Empregado WHERE dnum = 5 AND salario > 3000;

-- 4. Empregados do depto 5 com salário > 3000 ou depto 4 com salário > 2000
SELECT * FROM Empregado 
WHERE (dnum = 5 AND salario > 3000) OR (dnum = 4 AND salario > 2000);

-- 5. Primeiro nome e salário de cada empregado
SELECT pnome, salario FROM Empregado;

-- 6. Primeiro nome e salário de empregados do depto 5
SELECT pnome, salario FROM Empregado WHERE dnum = 5;

-- 7. RG de empregados do depto 5 ou que supervisionam alguém do depto 5
SELECT RG FROM Empregado WHERE dnum = 5
UNION
SELECT DISTINCT supRG FROM Empregado WHERE dnum = 5 AND supRG IS NOT NULL;

-- 8. Primeiros nomes de empregados iguais a nomes de dependentes
SELECT DISTINCT e.pnome
FROM Empregado e
JOIN Dependente d ON e.pnome = d.dep_nome;

-- 9. Todas as combinações de primeiro nome de empregados e nome de dependentes
SELECT e.pnome, d.dep_nome
FROM Empregado e, Dependente d;

-- 10. Nome dos empregados e de seus dependentes
SELECT e.pnome, d.dep_nome
FROM Empregado e
JOIN Dependente d ON e.RG = d.empRG;

-- 11. Nome do gerente de cada departamento
SELECT e.pnome AS gerente, d.dnome AS departamento
FROM Departamento d
JOIN Empregado e ON d.gerRG = e.RG;

-- 12. Todas as localizações de cada departamento (junção natural)
SELECT * FROM Departamento NATURAL JOIN Localizacao;

-- 13. Nome do empregado e nome de cada projeto que ele trabalha
SELECT e.pnome, p.pnome AS projeto
FROM Empregado e
JOIN Trabalha_em t ON e.RG = t.RG
JOIN Projeto p ON t.pnum = p.pnum;

-- 14. Nome dos empregados que trabalham em algum projeto do depto 5
SELECT DISTINCT e.pnome
FROM Empregado e
JOIN Trabalha_em t ON e.RG = t.RG
JOIN Projeto p ON t.pnum = p.pnum
WHERE p.dnum = 5;

-- 15. Número de empregados da empresa
SELECT COUNT(*) AS total_empregados FROM Empregado;

-- 16. Número do depto e número de empregados de cada depto
SELECT dnum, COUNT(*) AS total_empregados
FROM Empregado
GROUP BY dnum;

-- 17. Número do depto e média do salário dos empregados de cada depto
SELECT dnum, AVG(salario) AS media_salario
FROM Empregado
GROUP BY dnum;

-- 18. Nome e endereço de empregados que trabalham no depto 'Pesquisa'
SELECT pnome, rua, cidade, estado
FROM Empregado e
JOIN Departamento d ON e.dnum = d.dnum
WHERE d.dnome = 'Pesquisa';

-- 19. Para cada projeto em 'Londrina', retorne info do projeto e gerente do depto
SELECT p.pnum, p.dnum, e.pnome AS gerente, e.sexo AS gerente_sexo
FROM Projeto p
JOIN Departamento d ON p.dnum = d.dnum
JOIN Empregado e ON d.gerRG = e.RG
WHERE p.localizacao = 'Londrina';
