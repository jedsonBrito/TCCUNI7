#!/bin/bash
# Script desenvolvido pela Equipe da REDEMET para Consulta Automática de Mensagens, utilizando a API da REDEMET
#
# Trata-se apenas de um exemplo de como pode ser utilizada a API da REDEMET 
# para consultas de mensagens meteorológicas para períodos maiores que 24 horas.
# 
# Utilize os recursos de forma consciente, solicitando apenas as informações necessárias para que possamos atender à maior 
# quantidade de usuários com a melhor qualidade possível.
#
#
#################################################################################################################################
# Inicio da Personalização do Usuario
#################################################################################################################################
# Parâmetros da API de consulta de mensagens
# Estes parâmetros, devem ser preenchidos de acordo com as instruções para a utilização da API, contidas no
# endereço: http://www.redemet.aer.mil.br/api/consulta_automatica/
exibir_data_hora="sim"
exibir_cabecalho="nao"
tipos_de_mensagem="metar"
localidades_ou_sinoticos="sbfz"
#
# Parâmetros do SCRIPT
# Arquivo texto onde será gravado o resultado final da consulta
arquivo_resultado="metar_teste_13072020.txt"

# Data do início da consulta. Formato YYYmmdd
data_inicio="20200713"

# Quantidade de dias desejados para a Consulta. À partir da data_hora_inicio, o script buscará mensagens para a quantidade de dias
# especificados na variável abaixo
dias_da_consulta="1"

# Define se a consulta será feira por meio da internet ou da intraer (Rede interna da Aeronáutica)
# São aceitas as opções "internet" ou "intraer"
#meio_consulta="internet"
meio_consulta="internet"

#################################################################################################################################
# Fim da Personalização do Usuario
#################################################################################################################################




##################################################################################################################################
# A T E N C A O   A T E N C A O   A T E N C A O    A T E N C A O    A T E N C A O    A T E N C A O   A T E N C A O   A T E N C A O 
# 		 		Caso os parâmetros abaixo sejam alterados, o script pode deixar de funcionar corretamente        # 
#   Apenas as alterações nos campos acima já são suficientes para a consulta de todos os tipos de mensagem por qualquer período  #
##################################################################################################################################
# Configurações do Servidor
if [ $meio_consulta == "intraer" ] ; then
      nome_servidor="www.redemet.intraer";
else
      nome_servidor="www.redemet.aer.mil.br";
fi

user_agent="--user-agent=\"Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)\""
base_url="--base=\"http://$nome_servidor/api/consulta_automatica/index.php\""
referer="--referer=\"http://$nome_servidor/api/consulta_automatica/index.php\""
url_consulta="http://$nome_servidor/api/consulta_automatica/index.php"
#

# Cria o Arquivo com o resultado e limpa caso ja exista
echo "" > $arquivo_resultado

contador_dia="1"
while [ $contador_dia -le $dias_da_consulta ]
do
  ano_inicio=$(echo $data_inicio | cut -c 1-4)
  mes_inicio=$(echo $data_inicio | cut -c 5-6)
  dia_inicio=$(echo $data_inicio | cut -c 7-8)

  data_inicio=$ano_inicio$mes_inicio$dia_inicio
  
  data_hora_inicio=$data_inicio'00'

  data_fim=$(date +%Y%m%d --date="$ano_inicio-$mes_inicio-$dia_inicio +24hour")

  data_hora_fim=$data_inicio"23"
  
  wget="wget $user_agent $base_url $referer --post-data=\"&local=$localidades_ou_sinoticos&msg=$tipos_de_mensagem&data_ini=$data_hora_inicio&data_fim=$data_hora_fim&data_hora=$exibir_data_hora&cabecalho=$exibir_cabecalho\" -O resultado.tmp $url_consulta"

  eval $wget

  cat resultado.tmp >> $arquivo_resultado
  > resultado.tmp
  data_inicio=$data_fim
  ((contador_dia=$contador_dia+1))
done
