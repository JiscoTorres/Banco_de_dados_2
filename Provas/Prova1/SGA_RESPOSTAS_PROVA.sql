USE sga;
-- Aluno: João Francisco Torres;
-- RA: 22451894;
-- Curso: Ciência da Computação.


-- PROVA - BANCO DE DADOS II 



-- 1 - Liste os cursos e suas ofertas que têm data de início entre 2023-01-01 e 2023-06-30.  (1 ponto)
SELECT  ofe.id_oferta AS Oferta, Cu.nome AS Curso, ofe.data_inicio AS Inicio_do_Curso
FROM oferta ofe

LEFT JOIN curso Cu ON ofe.id_curso = Cu.id_curso

WHERE ofe.data_inicio >'2023-01-01' AND ofe.data_inicio < '2023-06-30';





-- 2 - Qual é o total de inscrições por tipo de público  alvo?  (1 ponto)
SELECT ofe.publico_alvo AS Publico_Alvo, count(id_inscricao) AS Quantidade_de_Inscricoes
FROM inscricao ins

JOIN oferta ofe ON ofe.id_oferta = ins.id_oferta

GROUP BY ofe.publico_alvo;






-- 3 - Quantas inscrições existem por curso? (2 pontos)
SELECT cu.nome AS Curso, COUNT(id_inscricao) AS Inscricoes
FROM curso cu

JOIN oferta ofe ON ofe.id_curso = cu.id_curso
JOIN inscricao ins ON ins.id_oferta = ofe.id_oferta

GROUP BY cu.nome;






-- 4 - Liste os 10 usuários mais recentes que se inscreveram em ofertas. (2 pontos) 
-- Então será, o nome do usuario e um indicador de o quao recente foi a oferta, no caso, a data da inscricao
SELECT U.nome AS Usuarios, data_inscricao As Data_de_Inscricao_da_Oferta
FROM usuario U

JOIN inscricao Ins ON Ins.id_usuario = U.id_usuario
ORDER BY data_inscricao DESC -- Para fazer com que seja da inscricao mais recente até a menos recente

LIMIT 10;





-- 5 - Liste os cursos que têm ofertas com inscrições de usuários que nasceram entre 1980 e 2000, e calcule a média de carga horária desses cursos.
-- Além disso, ordene os resultados pela média de carga horária em ordem decrescente e limite a lista aos 5 primeiros cursos. (2 pontos)

-- primeiro:  Então vou pegar o nome do curso, e pegar os usuários INSCRITOS limitando que a data de nascimento deve ser maior que 1980 e menor que 200
-- Segundo: depois vou calcular a média (AVG()) da carga horaria do curso.
-- terceiro: ordenar  a media em ordem decrescente DESC e limitar com os 5 primeiros
SELECT Cu.nome AS Nome_do_Curso, AVG(Cu.carga_horaria) AS Media_da_Carga_Horaria
FROM curso CU

JOIN oferta Ofe ON CU.id_curso = Ofe.id_curso
JOIN inscricao Ins ON Ins.id_oferta = Ofe.id_oferta
JOIN usuario Us ON Ins.id_usuario = Us.id_usuario -- Tive que fazer "likar" (fazer o Join) em Oferta e Inscricao porque se não, eu não iria conseguir chegar no Usuario.

WHERE Us.data_nascimento > '1980-01-01' AND Us.data_nascimento < '2000-01-02'
GROUP BY Cu.nome
ORDER BY Media_da_Carga_Horaria DESC
LIMIT 5;








-- 6 - Gere o CROSS JOIN das tabelas cursos e ofertas  (1 ponto)
-- Ou seja, com o CROSS JOIN vou pegar todo o conteudo (*) de cada tabela (Cursos e Ofertas) e juntar em uma só.
SELECT *
FROM oferta Ofe
CROSS JOIN curso Cu;



-- ------------------------FIM--------------------------------



-- 7 - Gere o modelo do banco de poste a imagem aqui.
-- Passos para gerar o modelo do banco:
-- Abra o MySQL Workbench.
-- Vá no menu: Database > Reverse Engineer...
-- Escolha sua conexão com o banco de dados.
-- Selecione o banco desejado.
-- Siga os passos até o final → ele vai gerar o modelo ER automaticamente, com as tabelas, colunas e relacionamentos.



