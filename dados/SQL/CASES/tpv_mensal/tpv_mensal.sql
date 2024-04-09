SELECT 
    CONVERT(varchar, CAST(s.DataTransacao AS DATE), 103) as DataTransacao,
    REPLACE(SUM(si.MontanteBruto), '.', ',') as ValorBruto,
    COUNT(MontanteBruto) as 'N transacoes',
    REPLACE(SUM(si.MontanteLiquido), '.', ',') as ValorLiquido,
    REPLACE(SUM(si.MontanteAntecipado), '.', ',') as ValorAntecipado
FROM VendaParcela si
INNER JOIN Venda s ON si.IdVenda = s.IdVenda
WHERE si.StatusVendaId IN (22,5,11)
      AND CAST(s.DataTransacao AS DATE) BETWEEN '2024-04-01' AND '2024-04-30'
GROUP BY CAST(s.DataTransacao AS DATE)
ORDER BY CAST(s.DataTransacao AS DATE) ASC;