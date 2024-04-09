SELECT 
    CONVERT(varchar, CAST(c.DataTransacao AS DATE), 103) as DataTransacao,
    c.IdentificadorComerciante as ECC,
    REPLACE(SUM(sy.MontanteBruto), '.', ',') as ValorBruto,
    COUNT(sy.MontanteBruto) as 'N transacoes',
    REPLACE(SUM(sy.MontanteLiquido), '.', ',') as ValorLiquido,
    REPLACE(SUM(sy.MontanteAntecipado), '.', ',') as ValorAntecipado
FROM VendaParcela sy
INNER JOIN VendasB2B c ON sy.IdVenda = cs.IdVenda
WHERE sy.StatusVendaId IN (1,4,22)
      AND CAST(c.DataTransacao AS DATE) BETWEEN '2019-01-01' AND GETDATE()
GROUP BY CAST(c.DataTransacao AS DATE), c.IdentificadorComerciante
ORDER BY CAST(c.DataTransacao AS DATE) ASC;
