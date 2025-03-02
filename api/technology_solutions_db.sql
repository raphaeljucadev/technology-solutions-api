-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/03/2025 às 20:50
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `technology_solutions_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `convites`
--

CREATE TABLE `convites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(150) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `convites`
--

INSERT INTO `convites` (`id`, `email`, `user_id`, `token`, `status_id`, `created_at`, `updated_at`, `expires_at`) VALUES
(17, 'raphael.oliveirajuca@gmail.com', 29, 'yQPgacU3Wh3Qh3F4c9vP3dBY6n0oQLll', 1, '2025-03-02 09:01:36', '2025-03-02 09:01:36', '2025-03-03 09:01:36'),
(18, 'reidopython@gmail.com', 29, 'nIVZ765cExQmL5sHx1uXd9JEOxKBj0ZK', 1, '2025-03-02 10:00:09', '2025-03-02 21:30:12', '2025-03-03 10:00:09');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cep` varchar(9) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `localidade` varchar(30) NOT NULL,
  `bairro` varchar(40) NOT NULL,
  `logradouro` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`id`, `user_id`, `cep`, `uf`, `localidade`, `bairro`, `logradouro`, `created_at`, `updated_at`) VALUES
(1, 29, '01001-000', 'SP', 'São Paulo', 'Centro', 'Rua Exemplo', '2025-03-02 15:25:08', '2025-03-02 15:25:08'),
(7, 76, '57083-043', 'AL', 'Maceió', 'Antares', 'Condomínio Campo do Jordão III', '2025-03-02 21:30:12', '2025-03-02 21:30:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'e6b19178-f277-4a2a-929c-804545efbc5b', 'redis', 'convites', '{\"uuid\":\"e6b19178-f277-4a2a-929c-804545efbc5b\",\"displayName\":\"App\\\\Jobs\\\\SendConviteEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendConviteEmailJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\SendConviteEmailJob\\\":2:{s:10:\\\"\\u0000*\\u0000convite\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Convite\\\";s:2:\\\"id\\\";i:11;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"queue\\\";s:8:\\\"convites\\\";}\"},\"id\":\"DZeC0vEssPVIeIRzJZUGmAIRvoPplbd1\",\"attempts\":0}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"250\" but got code \"502\", with message \"502 5.7.0 Your SMTP account is not yet activated. Please contact us at contact@sendinblue.com to request activation.\". in D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:342\nStack trace:\n#0 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(198): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'502 5.7.0 Your ...\', Array)\n#1 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(134): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'\\r\\n.\\r\\n\', Array)\n#2 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(234): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'\\r\\n.\\r\\n\', Array)\n#3 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#4 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#5 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#7 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(206): Illuminate\\Mail\\Mailer->send(\'emails.convite\', Array, Object(Closure))\n#8 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#9 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(199): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#10 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#11 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\ConviteMail))\n#12 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\ConviteMail))\n#13 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\app\\Jobs\\SendConviteEmailJob.php(26): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\ConviteMail))\n#14 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendConviteEmailJob->handle()\n#15 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#16 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#17 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#18 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#19 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#20 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#21 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#22 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#23 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendConviteEmailJob), false)\n#24 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#25 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#26 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(121): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#27 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\SendConviteEmailJob))\n#28 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#29 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(442): Illuminate\\Queue\\Jobs\\Job->fire()\n#30 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#31 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'convites\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'convites\')\n#34 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#35 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#36 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#37 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#38 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#39 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#40 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#41 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#43 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#48 {main}', '2025-03-01 08:04:37'),
(2, '04245a12-cc12-48c7-aea9-020b20ca3826', 'redis', 'convites', '{\"uuid\":\"04245a12-cc12-48c7-aea9-020b20ca3826\",\"displayName\":\"App\\\\Jobs\\\\SendConviteEmailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendConviteEmailJob\",\"command\":\"O:28:\\\"App\\\\Jobs\\\\SendConviteEmailJob\\\":2:{s:10:\\\"\\u0000*\\u0000convite\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:18:\\\"App\\\\Models\\\\Convite\\\";s:2:\\\"id\\\";i:12;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:5:\\\"queue\\\";s:8:\\\"convites\\\";}\"},\"id\":\"9uS9FhEeCaSc1nRwIHB1cV40DZlgeqd9\",\"attempts\":0}', 'Symfony\\Component\\Mailer\\Exception\\TransportException: Connection could not be established with host \"mailhog:1025\": stream_socket_client(): php_network_getaddresses: getaddrinfo for mailhog failed: Este host n?o ? conhecido.  in D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\Stream\\SocketStream.php:154\nStack trace:\n#0 [internal function]: Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\{closure}(2, \'stream_socket_c...\', \'D:\\\\Users\\\\Raphae...\', 157)\n#1 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\Stream\\SocketStream.php(157): stream_socket_client(\'mailhog:1025\', 0, \'\', 60.0, 4, Resource id #893)\n#2 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(279): Symfony\\Component\\Mailer\\Transport\\Smtp\\Stream\\SocketStream->initialize()\n#3 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(211): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->start()\n#4 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(138): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(585): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(332): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(206): Illuminate\\Mail\\Mailer->send(\'emails.convite\', Array, Object(Closure))\n#9 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#10 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(199): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(354): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#12 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\ConviteMail))\n#13 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\ConviteMail))\n#14 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\app\\Jobs\\SendConviteEmailJob.php(26): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\ConviteMail))\n#15 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendConviteEmailJob->handle()\n#16 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#17 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#18 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#19 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#20 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(126): Illuminate\\Container\\Container->call(Array)\n#21 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#22 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#23 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(130): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#24 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(126): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendConviteEmailJob), false)\n#25 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(170): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#26 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(127): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendConviteEmailJob))\n#27 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(121): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#28 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(69): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(App\\Jobs\\SendConviteEmailJob))\n#29 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\RedisJob), Array)\n#30 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(442): Illuminate\\Queue\\Jobs\\Job->fire()\n#31 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(392): Illuminate\\Queue\\Worker->process(\'redis\', Object(Illuminate\\Queue\\Jobs\\RedisJob), Object(Illuminate\\Queue\\WorkerOptions))\n#32 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(178): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\RedisJob), \'redis\', Object(Illuminate\\Queue\\WorkerOptions))\n#33 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(149): Illuminate\\Queue\\Worker->daemon(\'redis\', \'convites\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(132): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'redis\', \'convites\')\n#35 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#36 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#37 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#38 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#39 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#40 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#41 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#42 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#44 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(198): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1235): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 D:\\Users\\Raphael\\Desktop\\desafio_senai\\projects\\technology-solutions-api\\api\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#49 {main}', '2025-03-01 08:06:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_alteracoes_perfil`
--

CREATE TABLE `historico_alteracoes_perfil` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_type_old_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_type_new_id` bigint(20) UNSIGNED DEFAULT NULL,
  `alterado_por` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_00_000000_create_user_types_table', 1),
(2, '0001_01_00_000001_create_table_status_convites', 1),
(3, '0001_01_01_000000_create_users_table', 1),
(4, '0001_01_01_000001_create_cache_table', 1),
(5, '0001_01_01_000002_create_jobs_table', 1),
(6, '2025_02_27_120844_create_telefones', 1),
(7, '2025_02_27_120852_create_endereco', 1),
(8, '2025_02_27_121036_create_convites', 1),
(9, '2025_02_27_121211_create_historico_alteracoes_perfil', 1),
(10, '2025_02_27_222124_create_oauth_auth_codes_table', 1),
(11, '2025_02_27_222125_create_oauth_access_tokens_table', 1),
(12, '2025_02_27_222126_create_oauth_refresh_tokens_table', 1),
(13, '2025_02_27_222127_create_oauth_clients_table', 1),
(14, '2025_02_27_222128_create_oauth_personal_access_clients_table', 1),
(15, '2025_02_28_170353_create_personal_access_tokens_table', 1),
(16, '2025_02_28_191010_create_oauth_auth_codes_table', 2),
(17, '2025_02_28_191011_create_oauth_access_tokens_table', 2),
(18, '2025_02_28_191012_create_oauth_refresh_tokens_table', 2),
(19, '2025_02_28_191013_create_oauth_clients_table', 2),
(20, '2025_02_28_191014_create_oauth_personal_access_clients_table', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('065a9efcd7fabc6c17f21d8ba69ab8c378d7991d5b7e54877f64fad6f511c9a08237b42c4bab5b94', 32, 1, 'auth_token', '[\"*\"]', 0, '2025-03-02 18:36:28', '2025-03-02 18:36:28', '2026-03-02 15:36:28'),
('9ebbb8af7a30c193d84180d04587293854f5329e297aaddabe5fc5369e3568eedfd3413c2f11dd92', 3, 1, 'auth_token', '[\"*\"]', 0, '2025-03-01 18:05:35', '2025-03-01 18:05:35', '2026-03-01 15:05:35'),
('b10e13e5ea01467f996a5090186434db1c7e05e4ddf519a2c520f947228cee97c7adebaaae6181fe', 27, 1, 'auth_token', '[\"*\"]', 0, '2025-03-01 18:21:48', '2025-03-01 18:21:48', '2026-03-01 15:21:48'),
('e2c55eb32c3849345133ba225f1fb601a2a787cb621d728901f561f880297678a65bff3c3a041b56', 24, 1, 'auth_token', '[\"*\"]', 0, '2025-03-01 17:50:26', '2025-03-01 17:50:26', '2026-03-01 14:50:26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', '6CS8Sghs63GzPRx5hjM9lNUdAWVQ2pZVh7nTCOII', NULL, 'http://localhost', 1, 0, 0, '2025-02-28 22:10:15', '2025-02-28 22:10:15'),
(2, NULL, 'Laravel Password Grant Client', 'KKfFObFexcxwG7BCl1KkVr9iDbqPmQNmbRJ1jLRL', 'users', 'http://localhost', 0, 1, 0, '2025-02-28 22:10:15', '2025-02-28 22:10:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-02-28 22:10:15', '2025-02-28 22:10:15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('06NAQsVXGbyp6wz4ZwtiuQoDewCXHVWqQbJTjad8', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTmFNQUZveUlBSFBpN21URHdsNmdnWDgyWkVBUzV3blFMdGt4d3lnbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939859),
('3n0I1dssYBMVuUdt9kuhPpTrPZDC1MONLsVsBRqq', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiYVhzMVVZdTgya0ZydWtPSzU1NThoenp6d1I4MEV4RlhON2FGa25HMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939861),
('4RQNVddZhwDlQ7qoCHROlu9zdqGlKoENBeejBYm9', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNXhBV1BZQU11dVdmNnZnTnNrQ3NGbkVxaUp0TXdVdHhWeFhER3JmWSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939244),
('4ZgOPfctq2zJ4KcfiXzKWUnOW6XdYtOrP3nXqRo9', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVER0c1pvcndwUnhobjJTWlhEdGhtQk1WeENlWWt6YUx1Q1BOWVg0YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936680),
('5CwfvsugMrzMsca3jNerk9Uyx1hKinjLShoTnFIi', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHFxZWVoeFhZbERtWlZxbTU5NUtGWmdlZ3VNMTZHWmdCOGoxdkFJRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934376),
('5PwuVLkwS1sX9NaAssKXqtxjiDTWkIUdMx0Td7CR', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDVYa2czQUJDS1h2TjNGN3h6dHNJUnlFNURXd2ZqREFYNmh3eWttTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936878),
('5ws0gqpJwQmTEUmQZ5ffoFsmYjz4vkexrkPRkssI', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXhYMEZJbmxDcTBGMWJPWFZQTG9XSUZDQklMeVpRTTlFVk9md2RWTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740933436),
('6DiKomWyhjlM1WLmMWYRDewrwcRQpLnljtWdkmje', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUlySGRFVk1obkhpS3EyV0s4WjhVckVRM1Mya053N1NVcXdvR2lNMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935618),
('6NpTrBpRfBmLKvITsXi9FW0rut9wbt5wJdWhASZ2', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTlTcUpvUGxDV29GUWhJUnpJRzNtQkJvdFJpbWx4MzRRV2NQQ1NwYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934171),
('6YbdC2mQRJZZIicJhrZCoSeGMLOuJj5pOgdjwxLZ', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM256OGdsUUhGT2s1aGE2dzdlbnNEVzIybGUxVjg0Q2thNm9TYWJaNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938416),
('6YIAYGY03mpQDDTQ17pCuVtChKNhdSm5ZQXXCcj3', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiejRoY3ZjYUdPbzlYdjJCdjFKaEdEYWN3R1kwbnRYbzF0ZVFDMjZHMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740940249),
('7Ok3gS9kyBj5TxalgdOkcfvWF483Ot4tkPuvtGh2', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidndXZEY4Q2NPZ2lGc0VJQnJQVUd0RElOSWxtZXpsTGU2Ym9pUEx1TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740937010),
('7RkCkZ4oyqCbSCCS3xN17JgtdvgNA0QYMNH3naBy', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGgzV3YzVHBKV21wUVNYTm1sRGljZDV3WEFsZU9MaFNRaVEwZDVQYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934250),
('7wbAdVv4cKhtW9OYjbk3Jtp8toimtrphmc7R4pL3', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDVtOXFQQkllM1FOTGtNNUlSUTlRcDRtU3lOMnJJeWJ2OEs5N1JUeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940053),
('7YeXaftDoeWp8uSygza185QlP0h3NxbZG9ek6ulr', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRkQ2bFNSbW5uVHFtaGJTcW82b2xNZUFmdWF3MUJPNzBOc0hNejB1aiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939626),
('81elG8oHnsOba2WRCvWpJaaqxQKvwljC4RAc8gZS', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWpBb2g2REE1ZHBCT0hQMGN3cmY0bFlkQm5oN1JtblVCWEpOWmlWRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934535),
('8FHIPQlgREYlwHr6rPAFZOhhHUT6UeKYcm5jBIDw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ08zTVRPNTc4YTEySG1qaGVxZWM3bUhMb2lrWGRhMXNGazRMVEMzNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934505),
('99Dk4HI8MBh4afjiWBf3v0C1I05928r4WbKti1om', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0FDUkhGSk55Q0dRQU92c28xRFRDMFJxUHBXSnBUT3dkN1Y5V25HdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740937416),
('A9cjiCFt4CTpcoHHkUUmpqCNCUtAZdPTeRQPxrAf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVo2RVhkY0FTTFJjQUpISkhkWTlWU3NuZEJ4QXhFUDd0UGtyV0phayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740933967),
('a9I5Ps4AohGWgLdHET8TqOb80mNO48chxQbeFJ6m', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUW1HcDV5YzFxZUtZbTREU01hSGVaVXdxSzNRNVByeTVuNm45aExWTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936858),
('AEoy0hYl4stD550qKNdUlMpQX2v4qFjjqwBo37Cm', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0VKM1NrRkwyM0xDaE14aWZQOHpmUXFYU3U5YXVDSW53akJBWmFEZiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740937656),
('ajCfqQx5rl27POBru0lyQVFakJ9PgMtzfxJNIY2M', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzlmb3NwT29ITWN2d0FBVkJLeng4TVVVS25id1hZZ0ZHOFNjUUhVeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940547),
('Be2dIWdVoQf64DDloGW6uz5u3RaJ7tdlM0XoByp9', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1kxTVg3MTZVQk04TjNtMnJnV2dwTlNySjNUbUF5Mzk2MXB5WHNHMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934194),
('BeYAFaN2bwEPbi3RBhIkIG2J0qhhSZjGYoz6SYWA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZERrOFQ2WXlETFhKcFFzZFpRZlkzc1RiZ3kzNHhrajlJejFFdlB6NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740937367),
('bUuBxlm80eINkHQfPDdmOplfedMkNdWvsx3jUTCv', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaUJnN2JwMzJzYmYzUGpGbDk2dnh5MGdneG9BZlNwRW85RTVTWjBIZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939860),
('c02XvNOZXbaHACuhCSSxUoK4xmdllYUNgs91Ta5a', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUwzczRjcHVMY0g5VGdzU2Vvc2JRckFNekVVQXFMancyMWNNaXdCVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940201),
('c1cvu7XphErpbTSytPBUNPlUIwuIwijBex41CS9M', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGRuc0tjaktYTnFOUlZncHZjaHU4RFh5N01kTk5SNnNLZXZhc0NoUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940575),
('cFo6XvC06WkNXJpsqFS84lPlstO8HYuQCBo83GCL', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUVRaVlDeTE4bGFodHFCYTJzTjhUUWU3Q2FLU2Zud1NrN1JIOUxSSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940548),
('cKJgcDvvncjrwSWT63ZW8R7OPEZVE26RdXf0tb6u', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRmwxZEc5bXlzTXltb3hJM0xZeXB5c2tFOVBoSlNpTGNyVXNKV3NsciI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939626),
('cnhN3pgwDcQu37drexdR1tMokg0BaRvOitZzMJ6b', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicE5UTFZOa1djU1NFNFUyTzBYZk1RbXhZNk9Cb3FpZHluTmlCdldaaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934269),
('d6nqf51UiBqCVpQKXIZAq93cTkv51xQnhlQFsLPT', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmhYR082bnRYV3VyOW44UHpQSk5NQVRKaUNIMGxDU1ZLcGRPNWQ5ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939846),
('dOwH2gQrYBrOHEUwhu3z2zpeUCCEXtb5Wj0NJIG6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjBCUjd0eWZrMklEbnJUamROa1VPQlFLUjc2QnU3OXZONmxHQXl2RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940223),
('DPZE7Sp6NQh6WpWQyBk3hzwG6qwECTkbKKvZPAxv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianU0NDVSbHlOY3I4Ynp0OThROHdTSFZ5SXNPdjNkZ050TFdnMjZOTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740933964),
('DsdILCov9BpZIeQ6K5RQPDtxH2IkMiHm6gB4QYuf', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDk1V1lrbWRlZ2x4N3Y1RHdCczdyNzRhTkZHamYzY1RweTVlT1JqVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740940573),
('dStcdr5WuVIkw3WWlpQ2Kx0pErN4vyBW6rvYYoSa', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVmhGaHMyUVpuMzFUSVJNUmM3Y3JHbGtRVllOMGppMEZUbkhWQ0ZzMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938654),
('dtUOCwow0I0u8lbOf4ICrbf7VS9ULrtiUGbtyID1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3B6bDl4S2lETEppeTdhcnAwY0poWDJoUWhDYTBVcEJldENuTXNaWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740933987),
('EbB8ZYyW7nt22Kjld4Uv0w8SVBAS7RvIfpt5sIft', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUdPcGJHbFg4SHo3NEc2VllNQXhjdmhSaG5DU2NNNk0zR0ZFM3BUciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740933436),
('EhvXToS7qXDmbBSyrBo54qMPXKtMMaI9Atok5eLv', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3ROV00xV0lIWlFscWVsZUFhYTIzUHJLcVdqQ095ektKN0VWRWJKSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935315),
('eKIVXFy93QSLhRBISI5eq0JpKT20m03Q19rGuaXE', 29, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFRqRXdFWFZTWVNRVndMWHVxTVRQa0t6ZWRhbEJXMGdpTnd0b3F3QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940466),
('eQGgEZZjjrMeru6vtAazxzLIQ6ZpwI8EhESEhaFz', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSHBBS3U1ODdpQ2VsZHlCbkpLRTJiRVhzUmZxZWZqbDF0WGxYRnRORiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938879),
('f4MWeAyDF1fygVFdZNvJOd5GZwxXJ82q1rt4XcPJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSVdrOUhnZTRiUnJkRkN1OGN5eWFOeWd4UmVsdVdhcXJNWU5KTXdLNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740942129),
('FcPi3ont7Tyh5d29yMYr4RMNINOQg6ayp4Xl16OM', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmZOR0tFUFRSeUVFTFBWYWxVcGFad2U5ZnZxNlJoWkZGUlJTR0V1cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935341),
('fESmasEmEe17a6U5VlrJPvzN6aCaW89csmBXDthU', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHE1NWpuYW5GUVNLQ0h6RTQ5djNHdnk1OFF5VmlodHRzTXVUUWlEdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936834),
('fPaxWmWTWPg2rpstDiB5Jtd8kiZRS8HxflPeqC3m', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmNsbVVRUU1BdnJTRmNmVjdPeE1oeXhYZUdxTGtwb0QzN3puTkhEaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939381),
('FuFQReWnWIyzFzvSno3ngh7bVCa2zmKjlHYTW37x', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicktDdWRzRlFobFk4bmozSDc1cVR0bHo1V29tU08xcHBwdVR4TkVnOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935295),
('g0FfeidWZnUejYQiFZ9HurKKBJ7aJbbFyjW1Nk9y', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFhzQ25IZGFhckRWRXBrelNsaFhSQ0dtcHUzblI2d1VPNWY1azVqOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940589),
('G8djCKGF6gpKl5co9G6R5kOIqIl9ebK2SoTxMTxS', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlB2aHpGcFdXR004akI2aEd2bXMzRVlIOVo2c2dzY0tlR1paQWNDZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940287),
('gTYpq0qRNXHkOWbwBcCkqr9FcqkGNZ175cqEMASv', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianBEUkJyRFB5QWVTSUd4ZEJ0WjVOQTFRTXkwMFIxYnl6UjVPa1dkVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935378),
('h2dwzCzYLJ94Ut1VZZBgP2FZKQIyIOav35NAEskL', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTFpjRkVrUHdHZDg3bjJWT0tIZDBheEVrOGJrNzBDRUZVTm9EYVZHZyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938531),
('h2iau6MLPgQjTyD6kGtDpaE1CefLAtwXUGZRQoXi', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1VQanF2S0loNVl4bGxhaXdISk84NVVOb3FtYWlSYXp1cDVYNWl2RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936819),
('h8Cnu8Sddzi4kKTZTjnGMRiXT4Yui17Ct5LxQLOv', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmZ0UnNNTk1ES2RCVFZKNE1TdTFOSmg2S2cxZUNxTklsOWVHMFprMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936981),
('HaHbCvXZKfG9ZIGvCZMnRY0t9NKm61TLsuY6Qodn', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXBRcXE0MmVUUHJ4ME5FOVk5QkZkMmhYMkJNY2JQdTE1bk01WFR3SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940242),
('hJAHFSm0RwHYeofH7lKIZhIB8RXJRwDjG8EKmJRv', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUZaS1AzVXlJaXE2alA3d3lkWWM3eWlRSEZlbTF2eTRUOWpJaEhENiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940165),
('hqtjeyhNFSzvDjGWgXYbJjgaO9agJpbRoojAqhfR', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWNQSUZ6V1Z2NzFCeTVGNjJ6MU5jZ2kxbm5TQVZlQm9rTmpubEZBTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940549),
('Hwcw52UpybEvmpEFjK5IhEuGunvwDYE422EJ2dat', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiclJIRktWeUhxUWVjM290d1BKR0w1eFRTd2RLRDRvVHdzb0tLR0lPWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940212),
('IBKHEGqMjDYKyw8Jcl88yYT7dJwKRxdPy84atRuq', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM05ZdnhQeks1U0JNSndrekxXdzEwbHljVERkZ1NMZVk5Z09Kb2k3ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935203),
('Ie4Iicnz8wb55IGGVp1B1JRQZUR7ZWZEyrzIOMWn', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0tCMG9GOWZzSG01aGlsTFRRNng3TTFvQ3R2czVWU2pGZXRIVlF2WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935419),
('ixSbKJtBKuOJHYX0j3y2UaDc1irnHybSA0tvJ4ex', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTZkeXluTFpaMFBaZGNoZE9DV2dhVEZmYVFSekpaWXlsT0JYRjROdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939141),
('J6TIC2V2w3Z5JhvcEfXsms5p5oJDQrdBcVYbJWf2', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidUNNMzVWVEpPbEJ6UWhNdk1IWDF3RlNkWlJyRDQ3cHRCUVFEWVQ1NiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939625),
('jDY3Ptsr2OW84wvCLxLo7UBYuulWTBi1RgnYyGd1', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1VwY1Q2cHlWbHVYdHFweHB4c0IxeWhETGc3MXpHNHN6SzlzV3dPRyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fX0=', 1740942095),
('jhA7KyfKCZeAMWlFUFrNPmLt2sKk8EkAMyWjc35n', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZmUxRW5EMFNCUnAwdGhmd1hRVFg5dERMNkZweUtUTnhvcE9ubFhGOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740933433),
('jjvGjpUQoUFNAnGWJVFl1HkJr43XiN9EGKkqAh64', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTdKRHJ0U2RVb2JEb3V3c2ZLNEVmVDVkOHVHMWZUNnpnT1RwaEZoUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938794),
('jMIBd73yhg8lHGEfuiKjrdsL5usa59dpUmXtTZ5D', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZkUzTDZnM2dUejlobUx1WWhlSVh2Q3RWVk5vUnpBSHd6NXc0dVc2dyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939472),
('jwnDhTZoUf5mMPUPgNQuC7qDbdkp5BiSooQY5Id6', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemx5d2lBbVpwbVM4WmkwcEpsb0QzNHVnS0xaalViZFc2dzZRc2djWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938862),
('KjP5R0958F0U40CZWoWCPfnlWgQkbNTCcT7YyJR1', 29, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3ZmbDVDSnhtNnRLeEU2aUdTTFpyME1GaGdaUFpoS3lrclBLMnlDTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940465),
('kNlbnBZu1YZBZ5zJ5Np85jEiosHBzHTUiDmgt6u8', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3N0MW5nRUtHM2pHaVZ6Wll3a0NsQTVibWttc091amdnbmZvdm8zWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740940287),
('ksQiL3SjzxXq8fIdTAV3lqgpeB6aopMABZ3CxUyb', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUklLc1BobUM1RUc3aW1sVU1qVTBVQU4yVFY2NGlCamI2MzhmaHZ2ZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940212),
('lIzGF43QXv9OEk0CkVEsldRWUWUcrx9j1VSsGaqY', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDBickFrRmFIMkZuNVBVV2E1T1phT1BKNHA1b0NZblRhRlpsWDZvdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934548),
('lqYycGpPN1yjol3TNHFADgaIVlh9DLp42qdt5Xyn', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnduWW1pclFacEMzZm9WcXo1NjUwS0NDQ3ZTU2o2WGR4RW5TSkhndiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcy83NiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940566),
('lrc7kScpNtvOnoRzwlPHbLuGa59ljI4tsRAtddML', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiTmlSbnFvZEUzWlFYUzhsazYzWmR0S25JdWpSbFV6QWZxM2ZLdTZMOSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938880),
('lUBJFdpd6cPox1BWRcGnQfHzLyT1UECfEVRjQ0ny', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3JSQzFKTE1laXR3SzA0NWxLQlJDOGhFcWY4MkhudllMRXZGNEFQUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740940242),
('MKpPtaygTwg1LMknxEXdIKHcRG8ns8l7Kp5sYQPN', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1dIcmFSMjRod2ZMR1VyT29tTnh6NG5TRDBGM1ZBZzFLSVRLNXAzMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940572),
('MWmGd5v7OA7FFFYzDBAYrdt9f1dww3F8jH6eQsSZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmlQTHhLdG5YdzV6ZGhSWG5Gd2duR20ya2plZUlUMjZGNFc0ZTBLSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935709),
('mzjTAf7VsGetvXl77vuimMzfE4ruK3Dv6gJLbSkW', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUFMZWZQQTZnY0V6MEh5MG5HNmRXb25DOUxNZzZCeGM5WWhTa1lBQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934344),
('nGLRTPKumM08ivakmzWB3CJSHGRICoglxzUA6z0c', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZGJWckxqYzZFdk5FTnRyUXJuYzVremYxWVFDd2ZxWDY0ZEFqcE93SyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939303),
('nN8TLRSsLetB1z5rtWOZ2ScmHlbyITNoBKWS9LOP', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiaktMNVR6YkM5bFFwOXhHSVRYWXRXTWhwaGFQanl5UDNveEZxbDJDeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940213),
('nW0P04BocYKSSb405JGfMjge8WAbhnA1w9TOrdLe', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkk1R0ZhY0VpN3NRcnFGMkJ5WHNPaTRjT2ZIc2VtdndLUTRHd29adCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938518),
('O2yk8NtBDVTt6OEHFUUIu4840QmjZkoSMxSC0d5F', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2txU2pZYXF2b2ltTkpDOUN5MHlnZjZRMHJxVHgxU21yMzF1TUN1WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940248),
('ohZbpX7tAlF3pMaYjWBENJ14sKdFMbaKK6TjVPur', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkVkREdWcm56NzJIQ05sVEZhb3pVQmFTeFlUeU9NMkFyazNWbWdZZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934359),
('on3Au3FtyDyUbonCl11FHADzy7Y0Ub81PGySDx6f', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzA2MzZKdXVYZ0dYMGZPdFdzclkxdWVxbkdwT1I4U1l3a3JPR2MxUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940249),
('p2EQJEBvphJ4gkRLUl6nWUyySFQkYWwQSKuANJ8V', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWw5aEh5Njh4cVJZNEc4c3BkQnpPMGRFV2YxN0RXVW5pMk9rTXpWVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936545),
('peny7DAXC2rrO7jtpwyU4aVD1gouWWI6U3jM2uXP', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGxsbFphVm5mSTMyQVBKdXdQNlBVTnJ1ajRRWXVQOFo0dnRPWkdUYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934292),
('PfiheLtDAoG68DfpEmXU7lHKqtEpLrUuPg9EyXUD', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXZaTVgzZHEydVVHa2pXdHlMbG0yeUtLdnpOVklSYmo5aWt5MFFVYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936794),
('PPLlJmfZNYAlgq1fNNOGmhvyoRCYZZQVm1nVEiPt', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMnpUR0dMS1ZyR3VxeFNFY0JvQVlGVVQ0WUtxUWdGYldFUnBKTnVtTCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938878),
('PpZbBjePlW8lhp1EbvHibZjbDu8TQDwmD7w58PLH', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjhjajFLSVNSVFhndXRlR1VQQkU3SUtFTlB3WXJaUm14Y283TXpGaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940286),
('q7qiLcv0l9PBxj6O5zUmxMULsEUZltx4f29haGAK', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWd2SUNoV3ZQdm9GYmVMWlR2UWpoQ3FENTdBZmluNGQwVjFDNFVCRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934444),
('qClgNKaIee4LQR1PVGwXeTxMrg1SzqnpkG0R57Rq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGZaVUVQWmJEQVEzYTFyc2NUd2RKbEJTbGRxRFdUZGo4ZHRuNUp0UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740937571),
('qeVWHTBZTsUTkxpc8YfxtYPZE7ZhQN09qNe8F3OA', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoienkyOElDN1hhZ1ozWTlFYlZjaG0xUDFrU3J0ZmhONEx2ejNPRnQ1bSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939472),
('QogzGlvt9SzMdrIUCjnPzzJHdWh6gd679ccZ0Z5L', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTI5UVNtVmNCNENYSUNTMkxTdjdpSjliTUFMck9nZlVTZXpXVVZDTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939787),
('qoYUvrMOKKfodRpNFkjFZyLNzZ6iNmwt9ecbjC6M', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmJNcWQwaU1lR1AyQWJjanJhSWJ1c3JYWW42cVRpZkZTRUVrb1daTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939230),
('Qrtd1qWwuCCklAeJJDHZJuiD7d3G330UrpXqGFmO', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHZGbmdyMVFPdzNGQXBaeklMWTBBM2NiOVhCVldDWUZIVVRCMjI3ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934075),
('R1oOiLhGHVC9ltUaJvyDEPrwBqxgFzXuItYlgvYw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVJGaTRIVU1ySDdsckJZa0RlVGNQSzlveXlYbFRYSUV6eldncnU0eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935775),
('RAUjw5pMAZVSZnPSfSIvQ9OF7kdLvx0JXnqsfIDy', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmhtSmJCbDRFQnpvc2ZnTW56dWVSeVNuc0lFWGtBTmZUSkNmNXc0RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939558),
('rAWWmKegy2gyu7T4azb7ibg9ODZ4kDLAR9C2kIKA', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3BwN0Vpc0NiNTRnOWlEZllsdU5hTDVSZ25tOTlDYjhvOEJORjhCdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938330),
('rLYlQ89E9C5VfXCcpzFsucwUk1609pWOHMMn1c9E', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1JPOEg1VGp6RmVBQWxmbWRmZm5FVm5INGJsa0xKZTdTcHRobmxQYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936955),
('RpPm9qllkKf1eNF7yp1neMVfe868g4GojbSQRIP5', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnpKOThYazV0ZGFCUDZQVFVxelQ3STg0bTVZVjlZdm1KQ05qS2RnYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939953),
('sGiAucYvQhdmIq6K6gpTi41KEj2EQ0MTNlUJX8Dn', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHlDYlFYZTFwU2VnUkJRN3VLQTdEY1JIMWE2aXpGb0xBNUdScTN3SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936527),
('SkcTwfDqBeJIHmrSnER5N1RrW7X9WS17d3sBv9RU', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmNXQmpMbFExbk9yRTY4UFlIRnJUOWVwckNhVjlvbGp0R1d5Z1VrYyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938429),
('SobYb3JV4EeZ7BXZqekXvlcot3ajPi4uej83BLfu', 29, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDhHR0NEQWFBTnpaWWZSMVhzN0RCUktJWFRMTEhaMWlVYUdzS0hDciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740940466),
('TLEq5jHkfPerGQ41MdyPVjkEHG96uspl38skk7vF', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWRFTzg5aTNjcEpxQU1VSmdwVDV6Uk9YR1I0V3ZINm5FZjhHYmNIRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939253),
('tNbngiS7aEaiVdLNr8siOZEgJiZfrt9DWLTBsN5F', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTVwdW1QZG5kOHBteElyTDk4V09FZVQxbHVZc0hvMjJ6TVdGSEd1VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939156),
('tuAfdvKCHlovOTA7RtuAY1KPLHcN6NEaeTbV5iWv', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoidno3dWxPSTJIWmhSa0czYkl2endMelFCc0JWMmx3bVloNG1OOUtKMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939302),
('TWIu7kKJkNLLpByWHDy2TWWtGvoSSakkJPtPyGYV', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFI3N3lTSmJBVGlUUmtBS0N4ak82cWRWeHBGRjZtNDVwUUlLTmpjTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740937645),
('U0HgZpnl4jVEZlhue7CXRRdxJkiUR1uZdiOtMMrx', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZm5XMkcwNm9PUHpLS1NocWlabDc0eG82M1RkMmozcFRzNHBzQVlDUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940241);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ubsNXZnyoiaoUCtp8lH8zUoWm7tJPoXo8VkWIytp', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmQxcU52NmhuUW56NlhyR1plVTkxblpMMDJvbUppeW03NUt3dWhnRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940146),
('uEsSSSQC88orYekUrIuk9nrpPVuu5qzTqU0IhM4x', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVZ1dFVreGkyZmhYeHFKUkRmempSYU1rNVRUUHZzS2pkUVpzV1hCViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740933911),
('vV8gzJh7DfGbkH73gcwkQIFvIJQn25vVCei3KKl3', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzRqOGpvTktnd0lkcmc4RzhRekhiRHdqaFl5eWdpTjBjbkN4V1RSRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvdXNlci10eXBlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740933435),
('vwbIuMJp2tKgY4P6n6mP1RLXaVzMJRFnxpMKrMjj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOUxjR2p1Sk82OUNtMzFheVJqWFAxMlExMG5FbUhhbVRzWFQ1NXR4TiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740940239),
('VwUxeJjqBY4TswAYYe1mxbTxP7wLH11FaVEEWIih', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnAzVHgzVGdhSWg4cUtXcU5oaHlVeFRoNUxzUndlTDdiVWIxemRTdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939444),
('wAJVywytK6nI2EQqno7h8KXra0IKm1WBUmQHHgtl', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielpSVXo0N1ppeElEN0JLTFpjb1BzNVFkMElFMlFLcVhIU3hXSmN2MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740937008),
('WBO7igR1VrHNVKOEaW0CCBBAsGGrTfmgibZNsqDC', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUmJ2QVBwU0U4RnRVOUNFOHF2OTNMcnJSR0l3SFFUcU1JdFE5NVZoSyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938653),
('wcMLWmjYkDLWVyqf8uhQ6ICnmKVSY7pCfO0N5LQb', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlBHQkh5WGtsVGFHOHNPa2YzNjlFQTlyZDBZWTJIQTZ2cWdzUVR5cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934186),
('We380LXvSNKk3ZDdvT4kyZVpQHuwpXdRjPVVZCt7', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZ1RLbG5yWVRWbWk3RU1qa2puMlhaTFVwOG5jSVRSa3N4dVByb1hTViI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938806),
('wIM4l9WVpcxh8fVyOwF7sfEOM7gSYzP61lmVwEq3', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazBTcWhlcnJ6ZHh5ekZDVEdJVGxGeDZEUHBjT1NQaFM1RUV0c0hwVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939609),
('wtbdV6qM4yjWptlpG05XjDQEwnbPgbAJ0QlM1NsQ', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHUweXlsUThQTmRpSklQRElIZXRTcHVwQlp1S1FhNFdwdUNnYXBheiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934320),
('Wwm0rWHoHUjbNi0NtkTfkUM1EYI3hHOUjMQp7dMf', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZEJQTm1SNDlQdVZFMDB2Q0RCbE5SUEhNSFJGeWNsMUZBMVRveXFIeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740942286),
('wWVESglQFp4m6y9yTiPxnB1iqds0Qd94j7ZyQInq', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGtBWHNvWUQ5ZmhjaEowYnRKTGV5WHZSVzlYSDl6MWNlbUhaTXd0YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L3lRUGdhY1UzV2gzUWgzRjRjOXZQM2RCWTZuMG9RTGxsIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934132),
('XhCU9NgS3fps6ehLcy1PMhvwWKnIenVLQMbsLAwl', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUg3a2oyTkd3NjR4dkZ3d1ZaV05XSU5kUFB5Y0k3Z25DRUpoMEdiSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939796),
('XwiB2a916O3ZPWZ1RLubhLwk9pqpOxoWyEIRFPXM', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUw1RmZNSk9uaUY3V3NEcThTdkNFdHpEczZybnlTTVpLNlkwRXNVbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934525),
('xYf9bp4ITFCNKXpdCgplRFo8hVRuhpONP93ubNXI', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNzg5bWo2SVNGWlp4dTd4ODQ3V3d2TFBORVBraHVwUU9nNmFncjNTeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3JlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1740940573),
('y4YMOkYDasMDDOlXhdcBdTB84VAGQlwqgEDKj1kZ', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWlFyRThMNGhzNHdVSEpZaEFPNTh4SldheU1yNEI5bnZtMHJZQkNOVCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938352),
('yewZZcWyJBYT86R0fJTYq3mOhnIcRdCTkhe6G7XB', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGtZQkJRZ3BYYzE3OW56c2dER3NveDJRYTlHWlpUaWtHOHVQZFh1WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740935427),
('YKWIFqPqtUn3Owii5x26RJj6GozSis0qyrnxwGQI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHdjVE5yUlROUnZzcWVZblNiQTFHbk5EMDFaNEtsbmNpVXFCTVhkRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936643),
('z1Qgo5RGPx5KJxDyFbecF6oAKMKO8fW9DvKX65Zb', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWYxOHBFSkpsZk8yRE9YSFE0RjF5SzJzbTBORmllTkV1R21JMVA4USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740936748),
('z5VsUDnufzunog7NFI2K80tdqLEKfsvysZ8cv2py', 29, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0VXWHNZaU9vOWtLUDZXbkVJUU9rZXpHaDFDZU9lMERkeUlTbXRxcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29sYWJvcmFkb3Jlcz9wYWdlPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1740940550),
('zbptynMI5JTG0x4AV9WVY3V0ECmAEYmh0LoQ9OKX', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWWhwSERYZnlha0pvZ3lmQTZqblhudkd3TExpVzlVNTIxdno0alpzTiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939302),
('zn38BF9FIpo2Vhak6yh71MdusrMKDqyfARfLGN5q', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiek9ZVVduSGkyOU1vVkhzY29abzdsNkNHbTZoRk5FUXlldVJvaFdFaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740934429),
('ZngVCo37u16rdYlz3kqKYxA0iHbHEjcvpHKgnCVt', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGxkQ1FDd2htSXFvR3NTeGZ6WHV3UlVTbGVwcGl1QlIyR2hzN3loWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740938641),
('ZQTfCDuocWRJOvlicraWMnYUAuTTj7Ewizotgq02', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXlGeGNRd0FmUWw1THZHcEtTWnA5T2czVW5LRUh6cWt2aTNETDdNViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9hcGkvY29udml0ZXMtZ2V0L25JVlo3NjVjRXhRbUw1c0h4MXVYZDlKRU94S0JqMFpLIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939936),
('zVU3puPLnswmK9cabjQCHsO29s9nS4YQhPa0m7wG', NULL, '127.0.0.1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.6 Mobile/15E148 Safari/604.1', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRFh4SHMweE14V2p6UEU4NTFxOEpVUmwyQUFvWHd1eDhCRmFqeXlTaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1740939471);

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_convites`
--

CREATE TABLE `status_convites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `status_convites`
--

INSERT INTO `status_convites` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Finalizado', NULL, NULL),
(2, 'Em Aberto', NULL, NULL),
(3, 'Vencido', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefones`
--

CREATE TABLE `telefones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ddd` varchar(2) NOT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `telefones`
--

INSERT INTO `telefones` (`id`, `user_id`, `ddd`, `celular`, `created_at`, `updated_at`) VALUES
(1, 29, '82', '98765-4321', '2025-03-02 15:24:53', '2025-03-02 15:24:53'),
(4, 76, '82', '99903-8044', '2025-03-02 21:30:13', '2025-03-02 21:30:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cpf` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_type_id`, `cpf`, `remember_token`, `created_at`, `updated_at`) VALUES
(29, 'Raphael Jucá', 'raphael.oliveirajuca@gmail.com', NULL, '$2y$12$.3FtSJ14td8rDY24wPO3BOd2gsONzVjW4AQXTdriFFBha5FKHiKli', 2, '099.646.244-92', NULL, '2025-03-02 02:22:58', '2025-03-02 18:31:57'),
(30, 'Ana Silva', 'ana.silva@email.com', NULL, 'senha123', 2, '111.222.333-44', NULL, NULL, NULL),
(31, 'Bruno Oliveira', 'bruno.oliveira@email.com', NULL, 'senha456', 3, '555.666.777-88', NULL, NULL, NULL),
(32, 'Carla Souza', 'carla.souza@email.com', NULL, '$2y$12$.3FtSJ14td8rDY24wPO3BOd2gsONzVjW4AQXTdriFFBha5FKHiKli', 30, '11223-59', NULL, NULL, '2025-03-02 18:24:23'),
(33, 'Daniel Pereira', 'daniel.pereira@email.com', NULL, 'senha101', 1, '333.444.555-66', NULL, NULL, NULL),
(34, 'Elisa Santos', 'elisa.santos@email.com', NULL, 'senha112', 1, '777.888.999-00', NULL, NULL, NULL),
(35, 'Felipe Rodrigues', 'felipe.rodrigues@email.com', NULL, 'senha131', 1, '112.223.334-45', NULL, NULL, NULL),
(36, 'Gabriela Almeida', 'gabriela.almeida@email.com', NULL, 'senha141', 1, '556.667.778-89', NULL, NULL, NULL),
(37, 'Henrique Costa', 'henrique.costa@email.com', NULL, 'senha151', 1, '990.001.112-23', NULL, NULL, NULL),
(38, 'Isabela Fernandes', 'isabela.fernandes@email.com', NULL, 'senha161', 1, '334.445.556-67', NULL, NULL, NULL),
(39, 'João Gonçalves', 'joao.goncalves@email.com', NULL, 'senha171', 1, '778.889.990-01', NULL, NULL, NULL),
(40, 'Karina Ribeiro', 'karina.ribeiro@email.com', NULL, 'senha181', 1, '113.224.335-46', NULL, NULL, NULL),
(41, 'Lucas Martins', 'lucas.martins@email.com', NULL, 'senha191', 1, '557.668.779-90', NULL, NULL, NULL),
(42, 'Mariana Rocha', 'mariana.rocha@email.com', NULL, 'senha201', 1, '991.002.113-24', NULL, NULL, NULL),
(43, 'Nathan Souza', 'nathan.souza@email.com', NULL, 'senha211', 1, '335.446.557-68', NULL, NULL, NULL),
(44, 'Olivia Castro', 'olivia.castro@email.com', NULL, 'senha221', 1, '779.890.991-02', NULL, NULL, NULL),
(45, 'Pedro Gomes', 'pedro.gomes@email.com', NULL, 'senha231', 1, '114.225.336-47', NULL, NULL, NULL),
(46, 'Queren Silva', 'queren.silva@email.com', NULL, 'senha241', 1, '558.669.780-91', NULL, NULL, NULL),
(47, 'Rafael Oliveira', 'rafael.oliveira@email.com', NULL, 'senha251', 1, '992.003.114-25', NULL, NULL, NULL),
(48, 'Sofia Souza', 'sofia.souza@email.com', NULL, 'senha261', 1, '336.447.558-69', NULL, NULL, NULL),
(49, 'Thiago Pereira', 'thiago.pereira@email.com', NULL, 'senha271', 1, '780.891.992-03', NULL, NULL, NULL),
(50, 'Ursula Santos', 'ursula.santos@email.com', NULL, 'senha281', 1, '115.226.337-48', NULL, NULL, NULL),
(51, 'Victor Rodrigues', 'victor.rodrigues@email.com', NULL, 'senha291', 1, '559.670.781-92', NULL, NULL, NULL),
(52, 'Wagner Almeida', 'wagner.almeida@email.com', NULL, 'senha301', 1, '993.004.115-26', NULL, NULL, NULL),
(53, 'Xavier Costa', 'xavier.costa@email.com', NULL, 'senha311', 1, '337.448.559-70', NULL, NULL, NULL),
(54, 'Yasmin Fernandes', 'yasmin.fernandes@email.com', NULL, 'senha321', 1, '781.892.993-04', NULL, NULL, NULL),
(55, 'Zeca Gonçalves', 'zeca.goncalves@email.com', NULL, 'senha331', 1, '116.227.338-49', NULL, NULL, NULL),
(56, 'Amanda Ribeiro', 'amanda.ribeiro@email.com', NULL, 'senha341', 3, '560.671.782-93', NULL, NULL, '2025-03-02 17:57:42'),
(57, 'Bernardo Martins', 'bernardo.martins@email.com', NULL, 'senha351', 3, '994.005.116-27', NULL, NULL, '2025-03-02 18:04:43'),
(58, 'Camila Rocha', 'camila.rocha@email.com', NULL, 'senha361', 1, '338.449.560-71', NULL, NULL, NULL),
(59, 'Diogo Souza', 'diogo.souza@email.com', NULL, 'senha371', 1, '782.893.994-05', NULL, NULL, NULL),
(60, 'Eduarda Castro', 'eduarda.castro@email.com', NULL, 'senha381', 1, '117.228.339-50', NULL, NULL, NULL),
(61, 'Fábio Gomes', 'fabio.gomes@email.com', NULL, 'senha391', 1, '561.672.783-94', NULL, NULL, NULL),
(62, 'Giovanna Silva', 'giovanna.silva@email.com', NULL, 'senha401', 1, '995.006.117-28', NULL, NULL, NULL),
(63, 'Hugo Oliveira', 'hugo.oliveira@email.com', NULL, 'senha411', 1, '339.450.561-72', NULL, NULL, NULL),
(64, 'Íris Souza', 'iris.souza@email.com', NULL, 'senha421', 1, '783.894.995-06', NULL, NULL, NULL),
(65, 'Júlio Pereira', 'julio.pereira@email.com', NULL, 'senha431', 1, '118.229.340-51', NULL, NULL, NULL),
(66, 'Kelly Rodrigues', 'kelly.rodrigues@email.com', NULL, 'senha441', 1, '562.673.784-95', NULL, NULL, NULL),
(67, 'Leonardo Almeida', 'leonardo.almeida@email.com', NULL, 'senha451', 1, '996.007.118-29', NULL, NULL, NULL),
(68, 'Manuela Costa', 'manuela.costa@email.com', NULL, 'senha461', 1, '340.451.562-73', NULL, NULL, NULL),
(69, 'Nicolas Fernandes', 'nicolas.fernandes@email.com', NULL, 'senha471', 1, '784.895.996-07', NULL, NULL, NULL),
(76, 'Ministério da Saúde', 'reidopython@gmail.com', NULL, '$2y$12$GDN4MQ2o4SL6r4FD1i6Opea2D.EkMq9y61hYSQ61qPYvkkMf3duXO', 3, '117.775.094-59', NULL, '2025-03-02 21:30:12', '2025-03-02 21:30:12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', NULL, NULL),
(2, 'Gente e Cultura', NULL, NULL),
(3, 'Colaborador Comum', NULL, NULL),
(27, 'Estagiario', '2025-03-02 09:47:20', '2025-03-02 09:47:20'),
(28, 'CEO', '2025-03-02 09:48:19', '2025-03-02 09:48:19'),
(29, 'Perfil', '2025-03-02 09:49:14', '2025-03-02 09:49:14'),
(30, 'RH', '2025-03-02 09:56:40', '2025-03-02 09:56:40');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `convites`
--
ALTER TABLE `convites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `convites_token_unique` (`token`),
  ADD KEY `convites_user_id_foreign` (`user_id`),
  ADD KEY `convites_status_id_foreign` (`status_id`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enderecos_user_id_foreign` (`user_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `historico_alteracoes_perfil`
--
ALTER TABLE `historico_alteracoes_perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historico_alteracoes_perfil_user_id_foreign` (`user_id`),
  ADD KEY `historico_alteracoes_perfil_user_type_old_id_foreign` (`user_type_old_id`),
  ADD KEY `historico_alteracoes_perfil_user_type_new_id_foreign` (`user_type_new_id`),
  ADD KEY `historico_alteracoes_perfil_alterado_por_foreign` (`alterado_por`);

--
-- Índices de tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Índices de tabela `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Índices de tabela `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Índices de tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Índices de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Índices de tabela `status_convites`
--
ALTER TABLE `status_convites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status_convites_name_unique` (`name`);

--
-- Índices de tabela `telefones`
--
ALTER TABLE `telefones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `telefones_user_id_foreign` (`user_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_cpf_unique` (`cpf`),
  ADD KEY `users_user_type_id_foreign` (`user_type_id`);

--
-- Índices de tabela `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_types_name_unique` (`name`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `convites`
--
ALTER TABLE `convites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `historico_alteracoes_perfil`
--
ALTER TABLE `historico_alteracoes_perfil`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `status_convites`
--
ALTER TABLE `status_convites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `telefones`
--
ALTER TABLE `telefones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de tabela `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `convites`
--
ALTER TABLE `convites`
  ADD CONSTRAINT `convites_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status_convites` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `convites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `historico_alteracoes_perfil`
--
ALTER TABLE `historico_alteracoes_perfil`
  ADD CONSTRAINT `historico_alteracoes_perfil_alterado_por_foreign` FOREIGN KEY (`alterado_por`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historico_alteracoes_perfil_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `historico_alteracoes_perfil_user_type_new_id_foreign` FOREIGN KEY (`user_type_new_id`) REFERENCES `user_types` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `historico_alteracoes_perfil_user_type_old_id_foreign` FOREIGN KEY (`user_type_old_id`) REFERENCES `user_types` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `telefones`
--
ALTER TABLE `telefones`
  ADD CONSTRAINT `telefones_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
