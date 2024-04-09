# Query 1: Relatório de Ajustes Anuais por Código

## Descrição Geral
  sta query foca em ajustes com códigos 032 ou 220 para o ano de 2023, aplicando uma filtragem por status para refinar os resultados. Essa especificidade permite uma análise detalhada dos ajustes ocorridos, essenciais para o controle financeiro e auditorias internas. O filtro por status é crucial para identificar ajustes que impactam diretamente o balanço financeiro e a saúde fiscal do comerciante.

A filtragem por status nas queries não apenas refina os dados para análises mais precisas, mas também destaca a importância de entender as diferentes categorias de transações e ajustes que afetam a saúde financeira e operacional do comerciante.
<hr>

``` SQL
SELECT TipoAjuste, CodRegistro, CodComerciante, DataTransacao, DataLancamento, CodPedido, CodAjuste, DescMotivoAjuste, TipoLancamento, NumCartao,
       FORMAT(ValorBruto, 'N', 'pt-BR') AS ValorBrutoFormatado,
       FORMAT(ValorLiq, 'N', 'pt-BR') AS ValorLiqFormatado
FROM ItensArquivoAdiq
WHERE (CodAjuste = 032 OR CodAjuste = 220)
      AND CodComerciante = 1782323120123421
      AND YEAR(DataTransacao) = 2023;


```

## Colaborador
[<img src="https://avatars.githubusercontent.com/u/64026100?v=4" width=115> <br><sub>Leon Ortega</sub>](https://github.com/Leonkoc)

[Linkedin](https://www.linkedin.com/in/leon-ortega-cerqueira-frontend/)