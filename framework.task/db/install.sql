CREATE TABLE IF NOT EXISTS `fw_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(512) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `library` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `run_last` bigint(10) DEFAULT NULL,
  `run_next` bigint(10) DEFAULT NULL,
  `run_interval` int(11) DEFAULT NULL,
  `log_level` int(11) DEFAULT NULL,
  `result_code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_message` mediumtext CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `elapsed_time` double DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Extraindo dados da tabela `fw_task`
--

INSERT INTO `fw_task` (`id`, `description`, `library`, `params`, `run_last`, `run_next`, `run_interval`, `log_level`, `result_code`, `result_message`, `elapsed_time`, `active`) VALUES
(1, 'Test :: demo scheduled task', 'framework.demo,scheduledTasks,taskCleanFiles', '<Params><type>3</type></Params>', 1351967940, 1352120480, 60, 2, 'OK', 'Level 0.1 Message::Level 1.1 Message::Level 2.1 Message::Level 0.2 Message::Level 1.2 Message::Level 2.2 Message::', 0.059274196624756, 1),
(5, 'Records Book ::\r\nGenerate lessons (date yyyy-mm-dd)', 'pt.cscm-lx.PR09,scheduledTasks,taskGenerateLessons', '<Params><date>2012-11-06</date></Params>', 1352121328, 1352205928, 84600, 0, 'OK', 'Day of week = 2\n::Date = 2012-11-06\n::Inserted 674 lessons into lesson table\n::', 77.258869171143, 0),
(7, 'Reprography ::\r\nClean old files from filesystem', 'pt.cscm-lx.servicos.reprografia,scheduledTasks,taskUnlinkOldFiles', '<Params>\r\n <secondsLifeTime>84600</secondsLifeTime>\r\n</Params>', 1351967580, 1351967977, 60, 1, 'OK', '0 Files deleted.::', 0.0061380863189697, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fw_task_cron_status`
--

CREATE TABLE IF NOT EXISTS `fw_task_cron_status` (
  `id` int(11) NOT NULL,
  `_modification` bigint(10) NOT NULL,
  `num_tasks_executed` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

--
-- Extraindo dados da tabela `fw_task_cron_status`
--

INSERT INTO `fw_task_cron_status` (`id`, `_modification`, `num_tasks_executed`) VALUES
(1, 1351967921, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fw_task_history`
--

CREATE TABLE IF NOT EXISTS `fw_task_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_task` int(11) NOT NULL,
  `result_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `result_message` mediumtext COLLATE utf8_unicode_ci,
  `elapsed_time` double DEFAULT NULL,
  `_creation` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_task` (`id_task`)
);
