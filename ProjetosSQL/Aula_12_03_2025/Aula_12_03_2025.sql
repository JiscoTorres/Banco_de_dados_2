SELECT especialidade
FROM medicos;


SELECT count(*)
FROM medicos;

SELECT *
FROM medicos
WHERE idade > 30
	OR especialidade = 'pediatria';
    
    