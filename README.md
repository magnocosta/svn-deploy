<h1>Svn-deploy</h1>

Script para automatizar o processo de deploy para aplicações que utilizam o svn como controlador de versão.

<h2>Instalando</h2>

Para instalar o svn-deploy no servidor basta executar o comando abaixo:
<pre>
wget wget https://raw.github.com/magnocosta/svn-deploy/master/svn-deploy.sh
</pre>

<h2>Configurando</h2>
Liberar as permissões de execução para o script:
<pre>
sudo chmod 700 svn-deploy.sh
</pre>

Alterar as variaveis do script de acordo com as suas configurações de svn:
<pre>
PROJETO='Nome do projeto no svn'
REPOSITORIO='URL do repositorio'
URL=${REPOSITORIO}${PROJETO}'/tags'
USUARIO='Usuario do repositorio'
SENHA='Senha do repositorio'
</pre>

<h2>Executando</h2>
Agora basta executar o arquivo com o comando abaixo:
<pre>
sudo ./svn-deploy.sh
</pre>
