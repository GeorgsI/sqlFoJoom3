/*DROP TABLE IF EXISTS `#__news`;
    
CREATE TABLE IF NOT EXISTS `#__news` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(25) NOT NULL,         
    `published` tinyint(4) DEFAULT NULL,
    `text`  text NOT NULL, 
    `images` varchar(1024) NOT NULL DEFAULT '',
    `publish_up` datetime DEFAULT NULL,
    `alias` varchar(45)  DEFAULT NULL,
    PRIMARY KEY (`id`)
)ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=11;*/

DROP TABLE IF EXISTS `#__deputy`;
DROP TABLE IF EXISTS `#__okrug`;
DROP TABLE IF EXISTS `#__area`;
DROP TABLE IF EXISTS `#__houses`;
DROP TABLE IF EXISTS `#__streetname`;
DROP TABLE IF EXISTS `#__typestreet`;


CREATE TABLE `#__area` (
  `id_area` int NOT NULL,
  `lang_RU` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_BY` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_EN` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `deputy`
--

CREATE TABLE `#__deputy` (
  `id_deputy` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `schedule` text COLLATE utf8mb4_general_ci NOT NULL,
  `work` text COLLATE utf8mb4_general_ci NOT NULL,
  `job_mgik` text COLLATE utf8mb4_general_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `published_up` datetime NOT NULL,
  `published` tinyint DEFAULT NULL,
  `other` text COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `year` int NOT NULL,
  `okrug_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `houses`
--

CREATE TABLE `#__houses` (
  `id_house` int NOT NULL,
  `num` int NOT NULL,
  `corp` int NOT NULL,
  `letter` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `stritName_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `okrug`
--

CREATE TABLE `#__okrug` (
  `id_okryg` int NOT NULL,
  `lang_RU` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_BY` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_EN` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `area_id` int NOT NULL,
  `house_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `streetname`
--

CREATE TABLE `#__streetname` (
  `id_streetname` int NOT NULL,
  `lang_RU` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_BY` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_EN` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `typeStreet_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `typestreet`
--

CREATE TABLE `#__typestreet` (
  `id_typestreet` int NOT NULL,
  `lang_RU` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_BY` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `lang_EN` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `area`
--
ALTER TABLE `#__area`
  ADD PRIMARY KEY (`id_area`);

--
-- Индексы таблицы `deputy`
--
ALTER TABLE `#__deputy`
  ADD PRIMARY KEY (`id_deputy`),
  ADD KEY `okrug_id` (`okrug_id`);

--
-- Индексы таблицы `houses`
--
ALTER TABLE `#__houses`
  ADD PRIMARY KEY (`id_house`),
  ADD KEY `stritName_id` (`stritName_id`);

--
-- Индексы таблицы `okrug`
--
ALTER TABLE `#__okrug`
  ADD PRIMARY KEY (`id_okryg`),
  ADD KEY `area_id` (`area_id`),
  ADD KEY `house_id` (`house_id`);

--
-- Индексы таблицы `streetname`
--
ALTER TABLE `#__streetname`
  ADD PRIMARY KEY (`id_streetname`),
  ADD KEY `tupeStrit_id` (`typeStreet_id`);

--
-- Индексы таблицы `typestreet`
--
ALTER TABLE `#__typestreet`
  ADD PRIMARY KEY (`id_typestreet`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `area`
--
ALTER TABLE `#__area`
  MODIFY `id_area` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `deputy`
--
ALTER TABLE `#__deputy`
  MODIFY `id_deputy` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `houses`
--
ALTER TABLE `#__houses`
  MODIFY `id_house` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `okrug`
--
ALTER TABLE `#__okrug`
  MODIFY `id_okryg` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `streetname`
--
ALTER TABLE `#__streetname`
  MODIFY `id_streetname` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `typestreet`
--
ALTER TABLE `#__typestreet`
  MODIFY `id_typestreet` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `deputy`
--
ALTER TABLE `#__deputy`
  ADD CONSTRAINT `deputy_ibfk_1` FOREIGN KEY (`okrug_id`) REFERENCES `okrug` (`id_okryg`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `houses`
--
ALTER TABLE `#__houses`
  ADD CONSTRAINT `houses_ibfk_1` FOREIGN KEY (`stritName_id`) REFERENCES `streetname` (`id_streetname`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `okrug`
--
ALTER TABLE `#__okrug`
  ADD CONSTRAINT `okrug_ibfk_1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id_area`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `okrug_ibfk_2` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id_house`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `streetname`
--
ALTER TABLE `#__streetname`
  ADD CONSTRAINT `streetname_ibfk_1` FOREIGN KEY (`typeStreet_id`) REFERENCES `typestreet` (`id_typestreet`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;


