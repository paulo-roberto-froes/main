SELECT
    tabela_datas.date,
    SUM(tabela_usuarios_mes.usuarios_mes)
FROM 
    (SELECT DISTINCT date FROM tabela) tabela_datas
LEFT JOIN 
    (
    SELECT
        date,
        COUNT(fullVisitorId) usuarios_mes
    FROM
    (
        SELECT 
            MIN(date) as date, 
            fullVisitorId 
        FROM tabela 
        GROUP BY fullVisitorId
    )
    ) tabela_usuarios_mes ON tabela_usuarios_mes.date <= tabela_datas.date
GROUP BY 
    tabela_datas.date