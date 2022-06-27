### Resumo sobre o ODBC no NODE.JS
No node a conexão a um banco de dados postgres pode ser feita através da instalação do pacote pg (npm install pg) que possui os comando necessário para efetuar tão conexão. que pode ser feita dessa maneira

const {Client} = require("pg")

const client = new Client({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "postgres",
    database: "AtividadesBD"
})

client.connect();

Onde por meio de uma nova instância da classe Client podemos criar a conexão desejada informando as opções necessárias.

### Resumo sobre ORM no NODE.JS
Nós utilizamos um ORM devido a diferença de paradigmas de um banco de dados relacional e da orientação a objetos. Neste caso o Framework ou biblioteca utilizados faz a conciliação e o mapeamento dos dois modelos quase que eliminando a necessidade de ter que utilizar alguma query com código SQL.

O Sequelize é um ORM (Mapeamento relacional de objetos) baseado em promessas do Node.js para Postgres, MySQL, MariaDB, SQLite e Microsoft SQL Server. Possui suporte sólido a transações, relações, carregamento rápido e lento, replicação de leitura e muito mais.

Uma grande coisa sobre o Sequelize é que ele não se importa com seu banco de dados subjacente. Você pode alternar facilmente os bancos de dados ajustando o arquivo de configuração e seu código permanecerá praticamente o mesmo.

### Links para os scripts ODBC

#### Link para a conexão: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/odbc/conection.js>
#### Link para o insert: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/odbc/inserts.js>
#### Link para o update: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/odbc/select.js>
#### LInk para o select: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/odbc/update.js>

### Links para os scripts ORM

#### Link para a conexão: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/ORM/connection_sequelize.js>
#### Link para o insert: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/ORM/inserts.js>
#### Link para o update: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/ORM/update.js>
#### LInk para o select: <https://github.com/GuilhermeAngelo/Projeto-e-Administra-o-de-Banco-de-Dados/blob/master/tarefas/t03/ORM/select.js>