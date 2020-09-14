***
# <font color=green size=10> DESENVOLVIMENTO DE ESTAÇÃO METEOROLÓGICA PADRÃO EMS-3 COM A PLATAFORMA ARDUINO PARA AEROPORTOS REGIONAIS </font>
***

## Introdução
O conhecimento de dados meteorológicos precisos e atuais são de suma importância para o planejamento de voos. 
Fenômenos de meteorologia adversos podem interferir nas atividades aeronáuticas de diversas formas suspendendo operações gerando cancelamentos, 
atrasos de voos (COSTA, 2008). Nos últimos anos, a evolução tecnológica aprimorou várias ferramentas usadas para obtenção de dados do estado atmosférico, podemos destacar: sensores meteorológicos, imagens de satélite e radares. Apesar das suas diferenças, na forma de uso, todas convergem para o mesmo fim: monitorar e alertar sobre fenômenos climáticos, auxiliado na tomada de decisões.

Uma das estruturas da aviação que tem uma alta necessidade de possuir informações meteorológicas são os aeroportos, pois, 
estão vulneráveis a riscos resultantes da mudança climática repentina. 
Como exemplo, podemos citar uma ocorrência no começo do ano de 2020 quando uma grande parte da cobertura metálica que protege o 
teto do Aeroporto Internacional Pinto Martins, em Fortaleza, foi levada pela ação do vento (DIARIO DO NORDESTE, 2020). Além do vento, a redução da visibilidade, variação de temperatura e umidade podem gerar riscos operacionais e comerciais. Esses fatores, por diminuírem ou anularem a capacidade operacional, justificam o esforço de aquisição de meios que permitam mensurar essas informações no local.

Uma estratégia utilizada para suprir a necessidade por dados nos locais é a instalação e operação de estações meteorológicas 
que podem ser classificadas como convencionais ou automáticas (GUIMARÃES,2020). Nas estações convencionais os dados são inseridos por 
usuários que ficam monitorando instrumentos meteorológicos. Nas estações automáticas todos os dados são gerados pelas configurações 
dos equipamentos não necessitando da intervenção humana. Essas características permitem uma taxa de amostragem maior, uma menor manutenção 
além da possibilidade de transmissão e armazenamento dos dados em tempo real, agilizando operações e mitigando a probabilidade de erros em todo o 
processo (BRAGA;BRAGA,FERNANDES,2011).

No contexto aeronáutico é salutar a redução de erros. Por isso nesse trabalho iremos abordar apenas as estações automáticas. 
Entretanto, tem um custo acoplado à implantação e manutenção de uma estação meteorológica que nem
sempre é barato e muitas vezes foge do escopo de aeroportos regionais. Poucos aeroportos regionais possuem sua própria estação meteorológica 
como o aeroporto de Varginha que adquiriu uma pelo valor de 2,6 milhões de reais. Essa estação e capaz de detectar informações como pressão atmosférica, 
temperatura, umidade relativa do ar, precipitação, radiação solar, direção e velocidade do vento (EPTV,2019). 

O Brasil, através da Força Aérea Brasileira(FAB), possui uma rede de estações meteorológicas(REM) por todo o território brasileiro. São componentes 
dessa rede as estações meteorológicas de superfície(EMS) que são instaladas em aeródromos para coletar dados meteorológicos indicativos das condições 
climáticas na(s) pista(s) de pouso  (HENRIQUE; MATSCHINSKE,2005). Podendo ser uma alternativa para suprir o alto investimento em uma estação meteorológica própria.
Não são todos os aeródromos do Brasil que possuem uma estação meteorológica da FAB no local apenas os aeroportos com grande movimentação
de passageiros normalmente os aeroportos regionais não são contemplados. A FAB faz uma classificação das EMS em três níveis com base na composição 
de equipamentos. A classificação de terceira categoria(EMS-3) deve possuir minimamente instrumentos capazes de medir temperatura, pressão, umidade relativa, 
direção e velocidade do vento (BRASILMCA10-1,2018).

Esse trabalho tem como finalidade construir um protótipo de estação meteorológica automatizada, de baixo custo, com os instrumentos necessários 
para ser considerada uma EMS-3 com base na classificação da FAB. Para a elaboração serão utilizados sensores disponíveis no mercado 
é uma plataforma de armazenamento de nuvem para manter os dados coletados. 



## Problema

 Segundo (HILEMAN; ROOF,2014) r recentes extremos das condições da meteorologia tem criado alerta em alguns
 aeroportos sobre a necessidade de se preparar para as alterações climáticas e os riscos de atingir limites associados. 
 As estações meteorológicas de superfície servem para fornecer informações precisas de condições do tempo, porém, 
 o alto custo associado para a implantação e manutenção de uma EMS pode ser um empecilho para os aeroportos regionais. 
 Explorar alternativas da junção de conceito como Internet das coisas com os sensores da plataforma arduino pode ser uma alternativa 
 para a redução dos altos custos associados. 


## Hipótese

As médias das variáveis meteorológicas coletadas no protótipo de baixo custo para um nível de significância 5\% são iguais às da plataforma REDEMET.

## Justificativa

Além de ser possível coletar os dados meteorológicos de uma maneira acessível com o protótipo. 
É necessário verificar a precisão das informações, não teria muita finalidade um equipamento de baixo custo que coleta dados sem a exatidão 
que o contexto requer. As informações das variáveis meteorológicas serão utilizadas para tomada de decisão e muito importante 
comprovar a confiabilidade desse tipo de informação com uma plataforma amplamente utilizada no meio aeronáutico como a REDEMET.

## Objetivos

### Objetivo Geral

O Objetivo desse trabalho é criar um protótipo de uma estação de meteorológica, com as características da EMS-3. 
Para comprovar a precisão do equipamento será feito um teste de hipótese estatística de igualdade entre as médias entre duas amostras:
a do protótipo, e da REDEMET respeitando um nível de significância de 5\%. Se comprovada a hipótese os dados coletados poderão ser utilizados 
para auxiliar no caso de acidentes ou incidentes aeronáuticos.


### Objetivos Específicos


- Analisar os principais sensores do mercado para a composição da estação de modo a descobrir suas vantagens, limitações e custos.
- Verificar no escopo de entendimento aeronáutico quais os requisitos mínimos para uma estação meteorológica. 
- Divulgar os dados coletados pela estação em uma plataforma em nuvem.
- Comparar dados obtidos no projeto com de meteorologia da plataforma REDEMET.


## Organização do Trabalho

O trabalho está organizado da seguinte forma:

O primeiro capítulo apresenta a contextualização do tema de pesquisa. 
Expõe as hipóteses, relevância e os objetivos gerais e específicos do trabalho.

No capítulo seguinte demonstra os conceitos teóricos que embasam o desenvolvimento do trabalho. A teoria abrange a concepção de Internet das coisas, plataforma arduino, estrutura meteorológica brasileira para o contexto aeronáutico, sensores, plataforma Thingspeak e protocolo MQTT. No final do capítulo é feita uma comparação com trabalhos relacionados já publicados.

A parte prática do trabalho e demonstrada no terceiro capítulo onde são detalhados os elementos de hardware e software que compõe a estação meteorológica. São demonstrados os procedimentos para a comunicação com a nuvem utilizando o protocolo MQTT. É explicado a experiência que será feita para demonstrar a eficiência do protótipo e por fim é demonstrado os passos do teste de hipótese estatística utilizada para comprovar a igualdade entre as amostras coletadas.

No quarto capítulo é apresentado uma comparação de custos entre a estação desenvolvida no trabalho e outras estações vendidas no mercado. São mostrados gráficos de distribuição e gráfico de BoxPlot de cada variáveis meteorológicas do experimento além dos resultados do teste de hipótese estatística do trabalho.

No último capítulo são expostas às considerações finais do trabalho, de modo a declarar se as hipóteses e os objetivos foram atingidos e por fim uma seção com trabalhos futuros.


## Referências

COSTA, M. M. G. A meteorologia aeronáutica no aeroporto de guarulhos.Anais do VII Simpósiode Transporte Aéreo, p. 539–550, 2008.

DIARIO DO NORDESTE.Parte do teto do Aeroporto de Fortaleza é arrancado com forte venta-nia deste domingo. 2020. Disponível em: <https://diariodonordeste.verdesmares.com.br/metro/parte-do-teto-do-aeroporto-de-fortaleza-e-arrancado-com-forte-ventania-deste-domingo-1.2203237>. Acesso em: 27 abr 2020.

GUIMARÃES, D. P. Clima e agricultura.Embrapa Milho e Sorgo-Capítulo em livro científico(ALICE), In: LANDAU, EC; SILVA, GA da; MOURA, L.; HIRSCH, A.; GUIMARAES, DP(Ed ..., 2020.

BRAGA, A. S.; BRAGA, S. M.; FERNANDES, C. V. S. Estações meteorológicas automáticas:relato de uma experiência com sensores independentes em bacia experimental.XIX SimpósioBrasileiro De Recursos Hídricos, p. 1–16, 2011.

EPTV.Aeroporto de Varginha recebe estação meteorológica de R$ 2,6 milhões.2019. Disponível em: <https://g1.globo.com/mg/sul-de-minas/noticia/2019/08/14/aeroporto-de-varginha-recebe-estacao-meteorologica-de-r-26-milhoes.ghtml>. Acesso em: 20abr 2020

HENRIQUE, R.; MATSCHINSKE, M. R. Meteorologia aeronáutica do sistema de controle doespaço aéreo brasileiro.Boletim da Sociedade Brasileira de Meteorologia, v. 29, p. 13–18, 2005.

BRASILMCA10-1.Manual do Comando da Aeronáutica. 2. ed. Brasília, 2018. Instalação deEstações Meteorológicas de Superfície e de Altitude.

HILEMAN, J.; ROOF, C. Critical issues in aviation and the environment 2014: Aviationenvironmental modeling tool suite.Transportation Research Circular, n. E-C184, 2014.
