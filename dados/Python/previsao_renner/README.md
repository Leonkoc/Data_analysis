# Projeto de Expansão de Receita da Empresa por Meio da Abertura de Novas Lojas
Este projeto tem como objetivo projetar a receita da empresa através da abertura de novas lojas, utilizando dados de lojas atuais da empresa e informações socioeconômicas dos municípios brasileiros.

## Coleta e Preparação de Dados das Lojas Atuais
Os dados das lojas atuais foram coletados do site da empresa Renner. As informações extraídas incluem o nome da empresa, data de abertura, país, estado, cidade e tipo de localização (shopping mall ou rua). Após a coleta, os dados foram filtrados para incluir apenas lojas da Renner no Brasil.

## Fonte de Dados:

- [Renner - Informações aos Investidores](https://lojasrenner.mzweb.com.br/info-aos-investidores/central-de-resultados/)


## Coleta e Preparação de Dados dos Municípios Brasileiros
Os dados dos municípios brasileiros foram obtidos do SIDRA, do IBGE, incluindo informações sobre o Produto Interno Bruto (PIB) e população de cada município. Os dados foram mesclados para criar um conjunto de dados abrangente contendo informações de PIB, população e PIB per capita.

- [SIDRA - IBGE](https://sidra.ibge.gov.br/)
- [SIDRA - IBGE (PIB Municipal)](https://sidra.ibge.gov.br/pesquisa/pib-munic/tabelas)


## Fusão dos Dados das Lojas e dos Municípios
Para enriquecer nossos dados e obter uma visão mais abrangente, realizamos a fusão dos dados das lojas atuais da empresa com as informações socioeconômicas dos municípios brasileiros.

```Python
# Fusão dos dados das lojas e dos municípios
dados_municipios = pib_cidades.merge(pop_municipios, on="City")

# Cálculo do PIB per capita
dados_municipios["pib_per_capta"] = dados_municipios["pib"] / dados_municipios["pop"]
```
*O PIB per capita é calculado dividindo o PIB de cada município pela sua população correspondente. Esse indicador nos permite avaliar a produtividade econômica média por habitante em cada localidade.*

Após a fusão, agora temos um conjunto de dados consolidado contendo informações sobre o PIB, população e PIB per capita de cada município onde as lojas estão localizadas.

## Separando City de UF na coluna city
O código divide os valores da coluna "City" do nosso dataframe, utilizando como o "(" como ponto de separação, depois atribuindo os resultados a coluna City e UF.
Lembrando que usamos ( como critério para splitar a coluna city.
<hr>

*Antes*


0	Alta Floresta D'Oeste (RO)	734469	21494	34.170885


*Depois*


0	Alta Floresta D'Oeste	734469	21494	34.170885	RO

```Python
dados_municipios[["City", "UF"]] = dados_municipios["City"].str.split("(", expand = true)
```


Após essa operação, a coluna "UF" contém informações adicionais que precisam ser limpas. Portanto, realizei a remoção do caractere ")" da coluna "UF":

```Python
dados_municipios["UF"] = dados_municipios["UF"].str.replace(")", "")

```
# Fusão (Merge) das Tabelas
Realizamos a fusão dos dados das lojas atuais da Renner com as informações socioeconômicas dos municípios brasileiros para obter uma visão mais completa.

```Python
dados_lojas_economia = dados_municipios.merge(planilha_renner, on=["City", "UF"])
```
Após a fusão, agora temos um conjunto de dados consolidado contendo informações sobre o PIB, população e PIB per capita de cada município onde as lojas estão localizadas.

# Tratamento de Espaços em Branco
Realizamos algumas etapas adicionais de limpeza e preparação dos dados, incluindo a separação da coluna "City" em "City" e "UF", e a remoção de espaços em branco.

```Python
dados_municipios["City"] = dados_municipios["City"].str.strip()
dados_municipios["UF"] = dados_municipios["UF"].str.strip()
planilha_renner["City"] = planilha_renner["City"].str.strip()
planilha_renner["UF"] = planilha_renner["UF"].str.strip()

```
# Observação sobre o Processo de Limpeza
Durante a execução do código, foi feita uma observação importante: sempre que se trata ou se faz um merge em strings, é recomendado utilizar o método strip(). Este método é útil para remover espaços em branco no início e no final de uma string, garantindo uma correspondência precisa durante operações de fusão (merge) ou comparação de dados textuais.

Ao final dessas operações, a tabela dados_lojas_economia está pronta para análises exploratórias e posteriores estudos sobre a relação entre os dados municipais e as informações fornecidas pela Renner.

------------------------

# Análise das Características Atuais das Lojas Renner
Nesta seção, são apresentadas análises exploratórias sobre as características atuais das lojas da Renner, incluindo a distribuição por tipo de localização, o perfil de renda e população das cidades onde estão localizadas, e a relação entre a distribuição das lojas e o Produto Interno Bruto (PIB) per capita das cidades.

# Distribuição das Lojas por Tipo de Localização
Primeiramente, realizei uma análise sobre a distribuição das lojas da Renner em diferentes tipos de localização, especificamente em shoppings e em ruas. Os resultados mostram que aproximadamente 87.6% das lojas estão localizadas em shoppings e 12.4% estão localizadas em ruas.

# Perfil de Renda e População das Cidades com Lojas Renner
Em seguida, procurei entender o perfil de renda e população das cidades onde a Renner possui lojas. Foram identificadas a menor e a maior cidade onde a Renner está presente, assim como a menor e a maior renda per capita entre essas cidades. Observou-se que Maricá se destaca como uma cidade atípica devido aos royalties do petróleo.

# Relação entre a Distribuição das Lojas e o PIB per Capita das Cidades
Uma análise foi realizada para entender a relação entre a distribuição das lojas da Renner e o PIB per capita das cidades. Para visualizar esses dados, foram retirados outliers e gerado um gráfico de distribuição comparando o PIB per capita das cidades com o número de lojas da Renner e o número de municípios no Brasil. O objetivo foi identificar se há uma tendência de evitar cidades com menor renda média.

# Gráfico de Relação entre PIB per Capita e Distribuição de Lojas Renner
Um histograma foi plotado para visualizar a distribuição das lojas da Renner e dos municípios brasileiros em relação ao PIB per capita. No gráfico, o eixo x representa a faixa de PIB per capita e o eixo y mostra o número de lojas da Renner (em laranja) e o número de municípios no Brasil (em azul).

Essas análises são fundamentais para entender a distribuição e a estratégia de localização das lojas da Renner, bem como para embasar decisões estratégicas relacionadas à expansão e atuação da empresa em diferentes mercados.

# Projeção de Abertura de Novas Lojas Renner
Nesta seção, foi realizada uma projeção para determinar o potencial de abertura de novas lojas Renner no Brasil, considerando a preferência da empresa por abrir lojas em shoppings e o perfil de renda das cidades.

# Preferência por Shoppings
Observou-se que a maioria das lojas da Renner está localizada em shoppings, indicando uma preferência por esse tipo de localização. Além disso, foi identificada uma forte correlação positiva entre o PIB per capita dos municípios e a presença de lojas da Renner, sugerindo que a empresa tende a abrir lojas em áreas com maior poder aquisitivo.

# Projeção de Aberturas
Para projetar novas aberturas, foram coletados dados sobre shoppings no Brasil e determinada a diferença entre o número de shoppings e o número de lojas da Renner em cada cidade. Essa diferença foi considerada como o potencial de abertura de novas lojas.

# No total, foram identificados 264 shoppings no país com potencial para abertura de uma nova loja Renner, considerando cidades populosas e com grande absorção de demanda. Além disso, foram consideradas 37 novas aberturas em lojas de rua.

# Considerações sobre Valuation
Considerando a taxa de abertura histórica da Renner de aproximadamente 25 lojas por ano, projetou-se a abertura de 25 novas lojas por ano até 2035. Isso resultaria em um total de 300 novas lojas nesse período.

Por fim, utilizando uma tabela de valuation, foram feitas estimativas sobre a receita líquida da Renner em 2035, a Taxa Interna de Retorno (TIR) esperada para a ação $LREN3, e o preço médio esperado da ação em 2035. Essas projeções fornecem insights sobre o potencial de crescimento e valorização da empresa no longo prazo.

O tier seria de 16% com um valor em 2035 de 19 reais, no dia de hoje o valor é de 17 Reais