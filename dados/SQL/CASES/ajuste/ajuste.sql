SELECT TipoAjuste, CodRegistro, CodComerciante, DataTransacao, DataLancamento, CodPedido, CodAjuste, DescMotivoAjuste, TipoLancamento, NumCartao,
       FORMAT(ValorBruto, 'N', 'pt-BR') AS ValorBrutoFormatado,
       FORMAT(ValorLiq, 'N', 'pt-BR') AS ValorLiqFormatado
FROM ItensArquivoAdiq
WHERE (CodAjuste = 032 OR CodAjuste = 220)
      AND CodComerciante = 1782323120123421
      AND YEAR(DataTransacao) = 2023;
