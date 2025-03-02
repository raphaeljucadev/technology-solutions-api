TechnologySolutions,

Este projeto é uma aplicação Laravel que utiliza Redis para filas e agendamentos, Passport para autenticação de API e Swagger para documentação.

Requisitos

Antes de iniciar, certifique-se de ter os seguintes requisitos instalados:

PHP 8.2 ou superior

Composer (Gerenciador de dependências do PHP)

Docker e Docker Compose

Redis (necessário para filas)

Node.js e npm (para compilar assets)

Banco de Dados MySQL

Instalação e Configuração

1. Clonar o repositório

git clone https://github.com/raphaeljucadev/technology-solutions-api.git
cd seu-repositorio

2. Instalar dependências PHP

composer install

3. Criar o arquivo de ambiente

cp .env.example .env

4. Configurar o banco de dados

Edite o arquivo .env e configure as credenciais do banco de dados:

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=technology_solutions_db
DB_USERNAME=root
DB_PASSWORD=senha

5. Configurar o Redis

O projeto utiliza Redis para filas, certifique-se de que ele está instalado e configurado corretamente.
No arquivo .env, verifique ou adicione as configurações:

QUEUE_CONNECTION=redis
REDIS_CLIENT=predis
REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

Se estiver rodando Redis via Docker, utilize:

docker run --name redis -d -p 6379:6379 redis

6. Configurar o e-mail

O Laravel utiliza SMTP para envio de e-mails. Configure seu .env conforme necessário:

MAIL_MAILER=smtp
MAIL_HOST=smtp.gmail.com
MAIL_PORT=587
MAIL_USERNAME=seuemail@gmail.com
MAIL_PASSWORD=sua_senha_de_app
MAIL_ENCRYPTION=tls
MAIL_FROM_ADDRESS=seuemail@gmail.com
MAIL_FROM_NAME="Seu Nome ou Empresa"

Caso esteja utilizando outro serviço de e-mail, ajuste as configurações conforme necessário.

7. Executar o banco de dados com Docker (opcional)

Se desejar rodar o banco de dados via Docker, utilize:

docker-compose up -d

Isso iniciará um container com MySQL e Redis.

8. Importar banco de dados (Opcional)

Se quiser importar um banco de dados já existente:

mysql -u root -p technology_solutions_db < technology_solutions_db.sql

Caso contrário, execute as migrações:

php artisan migrate --seed

9. Gerar a chave da aplicação

php artisan key:generate

10. Instalar dependências do frontend

npm install
npm run build

Como Rodar o Projeto

1. Iniciar o servidor Laravel

php artisan serve

2. Rodar as filas com Redis

php artisan queue:work --queue=convites

3. Iniciar as tarefas agendadas

php artisan schedule:work

4. Rodar a API e documentação Swagger

Caso esteja utilizando Swagger para documentar a API:

php artisan l5-swagger:generate

E acesse a documentação em: http://localhost:8000/api/documentation

5. Rodar ambiente de desenvolvimento

Se quiser rodar tudo junto em modo desenvolvimento:

composer run dev

Isso iniciará:

Servidor Laravel

Escuta de filas

Monitoramento de logs

Vite para assets

Testes

Para rodar os testes:

php artisan test

Ou com PHPUnit:

vendor/bin/phpunit

Considerações Finais

Agora o projeto está rodando! Para acessar a aplicação, abra seu navegador e acesse:

http://localhost:8000

Se houver dúvidas, consulte a documentação ou os arquivos de configuração do projeto.

