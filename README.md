<h1>Svn-deploy</h1>

Script para automatizar o processo de deploy para aplicações que utilizam o svn como controlador de versão. 

<h2>Como funciona</h2>
O script baixa automaticamente a próxima versão a ser deployada no servidor, para isso basta configura-lo conforme indicado abaixo e após isso, criar uma tag a cada versão a ser deployada no servidor, conforme indicado abaixo.
<pre>
.Projeto-no-svn
|-- branch
|-- tags
|   `-- REL-1.0
|   `-- REL-1.1
|   `-- REL-1.2
|   `-- REL-1.2.1
|   `-- REL-2.0
|   `-- REL-2.1
`-- trunk
</pre>


É interessante criar uma tarefa no cron para executar de tempos em tempos o script.



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
