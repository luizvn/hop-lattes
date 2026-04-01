SELECT nomeartigo, anoartigo 
FROM producoes 
WHERE texto_busca @@ to_tsquery('portuguese', 'dengue');

SELECT nomeartigo, anoartigo 
FROM producoes 
WHERE texto_busca @@ to_tsquery('portuguese', 'lixo & ensino');

SELECT nomeartigo, anoartigo 
FROM producoes 
WHERE texto_busca @@ plainto_tsquery('portuguese', 'lixo eletrônico');

SELECT 
    nomeartigo, 
    anoartigo,
    ts_rank(texto_busca, to_tsquery('portuguese', 'dengue | covid')) AS relevancia
FROM 
    producoes 
WHERE 
    texto_busca @@ to_tsquery('portuguese', 'dengue | covid')
ORDER BY 
    relevancia DESC;

SELECT 
    p.nome AS pesquisador, 
    pr.nomeartigo AS titulo_artigo, 
    pr.anoartigo 
FROM 
    producoes pr
INNER JOIN 
    pesquisadores p ON pr.pesquisadores_id = p.pesquisadores_id
WHERE 
    pr.texto_busca @@ to_tsquery('portuguese', 'robos | patentes')
    AND p.nome ILIKE '%Hugo%';

SELECT nomeartigo, anoartigo 
FROM producoes 
WHERE texto_busca @@ to_tsquery('portuguese', 'immun:*');