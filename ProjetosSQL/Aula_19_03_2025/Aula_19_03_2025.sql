-- Exemplo de Junção
SELECT *
FROM medicos as m, consultas as c
WHERE m.codm = c.codm;


-- count pesquisar mais sobre.

SELECT *
FROM medicos as m
	JOIN consultas as c ON m.codm = c.codm;
	WHERE m.especialidade  IN ('pediatria', 'ortopedia');
	


SELECT *
FROM medicos ;