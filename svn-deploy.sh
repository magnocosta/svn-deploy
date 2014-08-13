#!/bin/bash
# teste

PROJETO='help-word'
REPOSITORIO='http://teste.com/svn'
URL=${REPOSITORIO}${PROJETO}'/tags'
USUARIO='svn_user'
SENHA='svn_pass'

echo 'Fala ae rapa, estou de volta, vou verificar se tem agluma coisa pra fazer'

ULTIMA_VERSAO=`svn list ${URL} --username=${USUARIO} --password=${SENHA}|tail -1`

URL=${URL}'/'${ULTIMA_VERSAO}

if [ -d $PROJETO ]; then
        echo 'Encontrei uma versao no servidor, estou verificando se ha atualizaoes para realizar'
        NOVA_REVISAO=`svn info ${URL} --username=${USUARIO} --password=${SENHA}|grep 'Last Changed Rev:'`
        ANTIGA_REVISAO=`cd ${PROJETO};svn info|grep 'Last Changed Rev:'`        
        
        NOVA_VERSAO=${NOVA_REVISAO:17}  
        ANTIGA_VERSAO=${ANTIGA_REVISAO:17}

        if [ ${NOVA_VERSAO} -gt ${ANTIGA_VERSAO} ]; then
                echo 'Encontrei uma versao chamada de '${ULTIMA_VERSAO} ' vou baixa-la para realizar a atualizacao'
                rm -rf ${PROJETO}
                svn checkout ${URL} --username=${USUARIO} --password=${SENHA} ${PROJETO}
        else
                echo 'Meu trabalho esta em dia, nao tem nada para ser atualizado'
        fi
else
        echo 'Eu nao encontrei nenhuma versao no servidor, estou verficando se existe alguma versao para aualizacao no svn'
        if [ ${ULTIMA_VERSAO} != '' ]; then
                echo 'Encontrei uma versao chamada de '${ULTIMA_VERSAO} ' vou baixa-la para realizar a atualizacao'
                svn checkout ${URL} --username=${USUARIO} --password=${SENHA} ${PROJETO}
        else
                echo 'Sinto muito mas nao encontrei nada para atualizar'
        fi
fi

echo 'Valeuu, terminei o meu trabalho, se precisar me chama ae ...'
