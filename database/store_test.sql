-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MariaDB-11.2
-- Время создания: Сен 01 2024 г., 14:53
-- Версия сервера: 11.2.2-MariaDB
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `store_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `store_addresses`
--

CREATE TABLE `store_addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `address_type` varchar(191) NOT NULL,
  `parent_address_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(191) DEFAULT NULL,
  `company_name` varchar(191) DEFAULT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `postcode` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `vat_id` varchar(191) DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_admins`
--

CREATE TABLE `store_admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_admins`
--

INSERT INTO `store_admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Пример', 'admin@example.com', '$2y$10$5CfbIe7/08ricc6E1Lba9uOz8a5BWus0UV/WUoHvHZJU99zX/BHGO', 'lYJq8C9tWNuu2aAOuZkDXhUhYa7imRmzYobBcPkz8uy9oNsc4SyZu53QNbrTuDQUTwvEYe5s1D56gAiK', 1, 1, NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43');

-- --------------------------------------------------------

--
-- Структура таблицы `store_admin_password_resets`
--

CREATE TABLE `store_admin_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_attributes`
--

CREATE TABLE `store_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `admin_name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `swatch_type` varchar(191) DEFAULT NULL,
  `validation` varchar(191) DEFAULT NULL,
  `regex` varchar(191) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_comparable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_locale` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_channel` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` int(11) DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_attributes`
--

INSERT INTO `store_attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
(1, 'sku', 'Артикул товара (SKU)', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(2, 'name', 'Название', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(3, 'url_key', 'Ключ URL', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(4, 'tax_category_id', 'Категория налога', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(5, 'new', 'Новый', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(6, 'featured', 'Популярный', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(7, 'visible_individually', 'Видимость по отдельности', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(8, 'status', 'Статус', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(9, 'short_description', 'Краткое описание', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(10, 'description', 'Описание', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(11, 'price', 'Цена', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(12, 'cost', 'Стоимость', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(13, 'special_price', 'Специальная цена', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(14, 'special_price_from', 'Специальная цена от', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(15, 'special_price_to', 'Специальная цена до', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(16, 'meta_title', 'Мета-заголовок', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(17, 'meta_keywords', 'Мета-ключевые слова', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(18, 'meta_description', 'Мета-описание', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(22, 'weight', 'Вес', 'text', NULL, 'decimal', '0', 25, 1, 0, 0, 0, 0, 0, 1, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-31 15:24:03'),
(25, 'brand', 'Бренд', 'select', NULL, NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(26, 'guest_checkout', 'Гостевой заказ', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(27, 'product_number', 'Артикул', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42'),
(28, 'manage_stock', 'Управление запасами', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2024-08-29 17:51:42', '2024-08-29 17:51:42');

-- --------------------------------------------------------

--
-- Структура таблицы `store_attribute_families`
--

CREATE TABLE `store_attribute_families` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_attribute_families`
--

INSERT INTO `store_attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
(1, 'default', 'По умолчанию', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_attribute_groups`
--

CREATE TABLE `store_attribute_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `column` int(11) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_attribute_groups`
--

INSERT INTO `store_attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
(1, 'general', 1, 'Общее', 1, 1, 0),
(2, 'description', 1, 'Описание', 1, 2, 0),
(3, 'meta_description', 1, 'Мета-описание', 1, 3, 0),
(4, 'price', 1, 'Цена', 2, 1, 0),
(5, 'shipping', 1, 'Доставка', 2, 2, 0),
(6, 'settings', 1, 'Настройки', 2, 3, 0),
(7, 'inventories', 1, 'Инвентарь', 2, 4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `store_attribute_group_mappings`
--

CREATE TABLE `store_attribute_group_mappings` (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_group_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_attribute_group_mappings`
--

INSERT INTO `store_attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 6, 1),
(6, 6, 2),
(7, 6, 3),
(8, 6, 4),
(9, 2, 1),
(10, 2, 2),
(11, 4, 1),
(12, 4, 2),
(13, 4, 3),
(14, 4, 4),
(15, 4, 5),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(22, 5, 4),
(25, 1, 8),
(26, 6, 5),
(27, 1, 2),
(28, 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_attribute_options`
--

CREATE TABLE `store_attribute_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `swatch_value` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_attribute_option_translations`
--

CREATE TABLE `store_attribute_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_option_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_attribute_translations`
--

CREATE TABLE `store_attribute_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_attribute_translations`
--

INSERT INTO `store_attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
(1, 1, 'ru', 'Артикул товара (SKU)'),
(2, 2, 'ru', 'Название'),
(3, 3, 'ru', 'Ключ URL'),
(4, 4, 'ru', 'Категория налога'),
(5, 5, 'ru', 'Новый'),
(6, 6, 'ru', 'Популярный'),
(7, 7, 'ru', 'Видимость по отдельности'),
(8, 8, 'ru', 'Статус'),
(9, 9, 'ru', 'Краткое описание'),
(10, 10, 'ru', 'Описание'),
(11, 11, 'ru', 'Цена'),
(12, 12, 'ru', 'Стоимость'),
(13, 13, 'ru', 'Специальная цена'),
(14, 14, 'ru', 'Специальная цена от'),
(15, 15, 'ru', 'Специальная цена до'),
(16, 16, 'ru', 'Мета-заголовок'),
(17, 17, 'ru', 'Мета-ключевые слова'),
(18, 18, 'ru', 'Мета-описание'),
(22, 22, 'ru', 'Вес'),
(25, 25, 'ru', 'Бренд'),
(26, 26, 'ru', 'Гостевой заказ'),
(27, 27, 'ru', 'Артикул'),
(28, 28, 'ru', 'Управление запасами');

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart`
--

CREATE TABLE `store_cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(191) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `cart_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `tax_total` decimal(12,4) DEFAULT 0.0000,
  `base_tax_total` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `checkout_method` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_cart`
--

INSERT INTO `store_cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL, NULL, NULL, NULL, 0, 1, 4.0000, NULL, 'RUB', 'RUB', 'RUB', 'RUB', 396.0000, 396.0000, 396.0000, 396.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 396.0000, 396.0000, NULL, 1, 1, NULL, NULL, 1, '2024-08-31 15:32:21', '2024-08-31 16:35:42');

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_items`
--

CREATE TABLE `store_cart_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(191) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_cart_items`
--

INSERT INTO `store_cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES
(2, 4, '56544305', 'simple', 'Молочный коктейль', NULL, 250.0000, 1000.0000, 1000.0000, 99.0000, 99.0000, NULL, 396.0000, 396.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 99.0000, 99.0000, 396.0000, 396.0000, NULL, NULL, 10, 2, NULL, NULL, '{\"product_id\":\"10\",\"is_buy_now\":\"0\",\"quantity\":4}', '2024-08-31 15:32:21', '2024-08-31 15:32:21');

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_item_inventories`
--

CREATE TABLE `store_cart_item_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_item_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_payment`
--

CREATE TABLE `store_cart_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_rules`
--

CREATE TABLE `store_cart_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_type` int(11) NOT NULL DEFAULT 1,
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT 0,
  `usage_per_customer` int(11) NOT NULL DEFAULT 0,
  `uses_per_coupon` int(11) NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_quantity` int(11) NOT NULL DEFAULT 1,
  `discount_step` varchar(191) NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_rule_channels`
--

CREATE TABLE `store_cart_rule_channels` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_rule_coupons`
--

CREATE TABLE `store_cart_rule_coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) DEFAULT NULL,
  `usage_limit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usage_per_customer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_rule_coupon_usage`
--

CREATE TABLE `store_cart_rule_coupon_usage` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` int(11) NOT NULL DEFAULT 0,
  `cart_rule_coupon_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_rule_customers`
--

CREATE TABLE `store_cart_rule_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_rule_customer_groups`
--

CREATE TABLE `store_cart_rule_customer_groups` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_rule_translations`
--

CREATE TABLE `store_cart_rule_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` text DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cart_shipping_rates`
--

CREATE TABLE `store_cart_shipping_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `carrier` varchar(191) NOT NULL,
  `carrier_title` varchar(191) NOT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) NOT NULL,
  `method_description` varchar(191) DEFAULT NULL,
  `price` double DEFAULT 0,
  `base_price` double DEFAULT 0,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(191) DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cart_address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_catalog_rules`
--

CREATE TABLE `store_catalog_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_catalog_rule_channels`
--

CREATE TABLE `store_catalog_rule_channels` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_catalog_rule_customer_groups`
--

CREATE TABLE `store_catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_catalog_rule_products`
--

CREATE TABLE `store_catalog_rule_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(191) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_catalog_rule_product_prices`
--

CREATE TABLE `store_catalog_rule_product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_categories`
--

CREATE TABLE `store_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `display_mode` varchar(191) DEFAULT 'products_and_description',
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `banner_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_categories`
--

INSERT INTO `store_categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'products_and_description', 1, 18, NULL, NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(2, 1, NULL, 1, 'products_and_description', 14, 15, 1, NULL, NULL, '2024-08-29 15:33:40', '2024-08-29 15:52:14'),
(3, 2, NULL, 1, 'products_and_description', 16, 17, 1, NULL, NULL, '2024-08-29 15:35:27', '2024-08-29 15:53:38');

-- --------------------------------------------------------

--
-- Структура таблицы `store_category_filterable_attributes`
--

CREATE TABLE `store_category_filterable_attributes` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_category_filterable_attributes`
--

INSERT INTO `store_category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
(2, 11),
(3, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `store_category_translations`
--

CREATE TABLE `store_category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(191) NOT NULL,
  `url_path` varchar(2048) NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_category_translations`
--

INSERT INTO `store_category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES
(1, 1, 'Корень', 'root', '', 'Описание корневой категории', '', '', '', NULL, 'ru'),
(2, 2, 'Салаты', 'salads', '', '<p>Салаты</p>', '', '', '', 1, 'ru'),
(3, 3, 'Напитки', 'напитки', '', '<p>Напитки</p>', '', '', '', 1, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `store_channels`
--

CREATE TABLE `store_channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `theme` varchar(191) DEFAULT NULL,
  `hostname` varchar(191) DEFAULT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT 0,
  `allowed_ips` text DEFAULT NULL,
  `root_category_id` int(10) UNSIGNED DEFAULT NULL,
  `default_locale_id` int(10) UNSIGNED NOT NULL,
  `base_currency_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_channels`
--

INSERT INTO `store_channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
(1, 'default', NULL, 'default', 'http://localhost', NULL, NULL, NULL, 0, NULL, 1, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43');

-- --------------------------------------------------------

--
-- Структура таблицы `store_channel_currencies`
--

CREATE TABLE `store_channel_currencies` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_channel_currencies`
--

INSERT INTO `store_channel_currencies` (`channel_id`, `currency_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_channel_inventory_sources`
--

CREATE TABLE `store_channel_inventory_sources` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_channel_inventory_sources`
--

INSERT INTO `store_channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_channel_locales`
--

CREATE TABLE `store_channel_locales` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_channel_locales`
--

INSERT INTO `store_channel_locales` (`channel_id`, `locale_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_channel_translations`
--

CREATE TABLE `store_channel_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_mode_text` text DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_channel_translations`
--

INSERT INTO `store_channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
(1, 1, 'ru', 'По умолчанию', NULL, NULL, '{\"meta_title\":\"\\u0414\\u0435\\u043c\\u043e\\u043d\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u044b\\u0439 \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\",\"meta_description\":\"\\u041c\\u0435\\u0442\\u0430-\\u043e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435 \\u0434\\u0435\\u043c\\u043e\\u043d\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\\u0430\",\"meta_keywords\":\"\\u041c\\u0435\\u0442\\u0430-\\u043a\\u043b\\u044e\\u0447\\u0435\\u0432\\u044b\\u0435 \\u0441\\u043b\\u043e\\u0432\\u0430 \\u0434\\u0435\\u043c\\u043e\\u043d\\u0441\\u0442\\u0440\\u0430\\u0446\\u0438\\u043e\\u043d\\u043d\\u043e\\u0433\\u043e \\u043c\\u0430\\u0433\\u0430\\u0437\\u0438\\u043d\\u0430\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_cms_pages`
--

CREATE TABLE `store_cms_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `layout` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_cms_pages`
--

INSERT INTO `store_cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(2, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(3, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(4, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(5, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(6, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(7, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(8, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(9, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(10, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(11, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43');

-- --------------------------------------------------------

--
-- Структура таблицы `store_cms_page_channels`
--

CREATE TABLE `store_cms_page_channels` (
  `cms_page_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_cms_page_translations`
--

CREATE TABLE `store_cms_page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_title` varchar(191) NOT NULL,
  `url_key` varchar(191) NOT NULL,
  `html_content` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  `cms_page_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_cms_page_translations`
--

INSERT INTO `store_cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
(1, 'О нас', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\"><h4>Добро пожаловать!</h4>\n<p>Добро пожаловать в наш магазин салатов и напитков! Мы созданы для тех, кто ценит вкусную, свежую и полезную еду. Наша миссия — приносить вам радость от еды каждый день, заботясь о вашем здоровье и благополучии.</p>\n\n<h4>Что мы предлагаем?</h4>\n<p>Мы гордимся тем, что создаем блюда только из натуральных ингредиентов. У нас вы найдете:</p>\n<ul>\n	<li>Свежие салаты: Каждый день мы готовим разнообразные салаты из свежих овощей, зелени и качественных добавок. От классических рецептов до авторских комбинаций — у нас найдется блюдо на любой вкус.</li>\n	<li>Смузи и напитки: Освежающие и питательные, наши смузи и напитки — это идеальный способ зарядиться энергией. Мы используем только свежие фрукты, овощи и суперфуды, чтобы каждый глоток приносил удовольствие и пользу.</li>\n</ul>\n\n<h4>Почему выбирают нас?</h4>\n<ul>\n	<li>Качество: Мы тщательно выбираем ингредиенты, работая только с проверенными поставщиками. Вся продукция проходит строгий контроль качества.</li>\n	<li>Свежесть: Все блюда готовятся на месте и только после вашего заказа, чтобы вы могли насладиться максимальной свежестью и вкусом.</li>\n	<li>Забота о клиентах: Мы стремимся создать для вас лучший сервис. Вежливый персонал, оперативная доставка и удобный заказ — все для вашего комфорта.</li>\n	<li>Экологичность: Мы заботимся не только о вас, но и о природе. В нашем магазине используются эко-упаковка и биоразлагаемые материалы, чтобы уменьшить наше воздействие на окружающую среду.</li>\n</ul>\n\n<h4>Наша история</h4>\n<p>Идея создания магазина родилась из стремления сделать здоровое питание доступным и вкусным. Мы начали с небольшого уголка, где предлагали простые салаты и напитки, и со временем превратились в любимое место для тех, кто заботится о своем здоровье. Сегодня мы продолжаем развиваться и радовать вас новыми вкусами каждый день.</p>\n\n<h4>Присоединяйтесь к нам!</h4>\n<p>Будь то быстрый перекус, обед в офисе или здоровый ужин дома — наш магазин всегда готов предложить вам лучшее. Приходите к нам или заказывайте онлайн, и позвольте нам стать частью вашего дня!</p></div></div>', 'about us', '', 'aboutus', 'ru', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_compare_items`
--

CREATE TABLE `store_compare_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_core_config`
--

CREATE TABLE `store_core_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `value` text NOT NULL,
  `channel_code` varchar(191) DEFAULT NULL,
  `locale_code` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_core_config`
--

INSERT INTO `store_core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
(1, 'sales.checkout.shopping_cart.allow_guest_checkout', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(4, 'emails.general.notifications.emails.general.notifications.customer', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(5, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(6, 'emails.general.notifications.emails.general.notifications.new_admin', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(7, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(8, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(9, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(10, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(11, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(12, 'customer.settings.social_login.enable_facebook', '0', 'default', NULL, '2024-08-29 17:51:43', '2024-08-31 19:32:04'),
(13, 'customer.settings.social_login.enable_twitter', '0', 'default', NULL, '2024-08-29 17:51:43', '2024-08-31 19:32:04'),
(14, 'customer.settings.social_login.enable_google', '0', 'default', NULL, '2024-08-29 17:51:43', '2024-08-31 19:32:04'),
(15, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(16, 'customer.settings.social_login.enable_github', '0', 'default', NULL, '2024-08-29 17:51:43', '2024-08-31 19:32:04'),
(17, 'customer.settings.wishlist.wishlist_option', '1', NULL, NULL, '2024-08-31 19:32:03', '2024-08-31 19:32:03'),
(18, 'customer.settings.login_options.redirected_to_page', 'home', NULL, NULL, '2024-08-31 19:32:03', '2024-08-31 19:32:03'),
(19, 'customer.settings.create_new_account_options.default_group', 'guest', NULL, NULL, '2024-08-31 19:32:03', '2024-08-31 19:32:03'),
(20, 'customer.settings.create_new_account_options.news_letter', '1', NULL, NULL, '2024-08-31 19:32:03', '2024-08-31 19:32:03'),
(21, 'customer.settings.newsletter.subscription', '1', NULL, NULL, '2024-08-31 19:32:03', '2024-08-31 19:32:03'),
(22, 'customer.settings.email.verification', '0', NULL, NULL, '2024-08-31 19:32:04', '2024-08-31 19:32:04'),
(23, 'customer.settings.social_login.enable_linkedin-openid', '0', 'default', NULL, '2024-08-31 19:32:04', '2024-08-31 19:32:04'),
(24, 'catalog.products.settings.compare_option', '0', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:34:50'),
(25, 'catalog.products.settings.image_search', '0', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:34:34'),
(26, 'catalog.products.search.engine', 'database', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:33:32'),
(27, 'catalog.products.search.admin_mode', 'database', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:33:32'),
(28, 'catalog.products.search.storefront_mode', 'database', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:33:32'),
(29, 'catalog.products.search.min_query_length', '0', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:33:32'),
(30, 'catalog.products.search.max_query_length', '1000', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:33:32'),
(31, 'catalog.products.product_view_page.no_of_related_products', '', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:33:32'),
(32, 'catalog.products.product_view_page.no_of_up_sells_products', '', NULL, NULL, '2024-08-31 19:33:32', '2024-08-31 19:33:32'),
(33, 'catalog.products.cart_view_page.no_of_cross_sells_products', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(34, 'catalog.products.storefront.products_per_page', '', 'default', NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(35, 'catalog.products.storefront.buy_now_button_display', '0', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(36, 'catalog.products.cache_small_image.width', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(37, 'catalog.products.cache_small_image.height', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(38, 'catalog.products.cache_medium_image.width', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(39, 'catalog.products.cache_medium_image.height', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(40, 'catalog.products.cache_large_image.width', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(41, 'catalog.products.cache_large_image.height', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(42, 'catalog.products.review.guest_review', '0', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(43, 'catalog.products.review.customer_review', '1', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:34:27'),
(44, 'catalog.products.review.summary', 'review_counts', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(45, 'catalog.products.attribute.image_attribute_upload_size', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(46, 'catalog.products.attribute.file_attribute_upload_size', '', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(47, 'catalog.products.social_share.enabled', '0', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(48, 'catalog.products.social_share.facebook', '0', NULL, NULL, '2024-08-31 19:33:33', '2024-08-31 19:33:33'),
(49, 'catalog.products.social_share.twitter', '0', NULL, NULL, '2024-08-31 19:33:34', '2024-08-31 19:33:34'),
(50, 'catalog.products.social_share.pinterest', '0', NULL, NULL, '2024-08-31 19:33:34', '2024-08-31 19:33:34'),
(51, 'catalog.products.social_share.whatsapp', '0', NULL, NULL, '2024-08-31 19:33:34', '2024-08-31 19:33:34'),
(52, 'catalog.products.social_share.linkedin', '0', NULL, NULL, '2024-08-31 19:33:34', '2024-08-31 19:33:34'),
(53, 'catalog.products.social_share.email', '0', NULL, NULL, '2024-08-31 19:33:34', '2024-08-31 19:33:34'),
(54, 'catalog.products.social_share.share_message', '', NULL, NULL, '2024-08-31 19:33:34', '2024-08-31 19:33:34'),
(55, 'catalog.rich_snippets.products.enable', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:37:30'),
(56, 'catalog.rich_snippets.products.show_sku', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:35:49'),
(57, 'catalog.rich_snippets.products.show_weight', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:37:30'),
(58, 'catalog.rich_snippets.products.show_categories', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:35:49'),
(59, 'catalog.rich_snippets.products.show_images', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:35:49'),
(60, 'catalog.rich_snippets.products.show_reviews', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:35:49'),
(61, 'catalog.rich_snippets.products.show_ratings', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:35:49'),
(62, 'catalog.rich_snippets.products.show_offers', '0', NULL, NULL, '2024-08-31 19:35:49', '2024-08-31 19:35:49'),
(63, 'catalog.rich_snippets.categories.enable', '0', NULL, NULL, '2024-08-31 19:35:50', '2024-08-31 19:35:50'),
(64, 'catalog.rich_snippets.categories.show_search_input_field', '0', NULL, NULL, '2024-08-31 19:35:50', '2024-08-31 19:35:50'),
(65, 'general.content.header_offer.title', '', NULL, NULL, '2024-08-31 19:45:27', '2024-08-31 19:45:27'),
(66, 'general.content.header_offer.redirection_title', '', NULL, NULL, '2024-08-31 19:45:27', '2024-08-31 19:45:27'),
(67, 'general.content.header_offer.redirection_link', '', NULL, NULL, '2024-08-31 19:45:27', '2024-08-31 19:45:27'),
(68, 'general.content.custom_scripts.custom_css', '', 'default', NULL, '2024-08-31 19:45:27', '2024-08-31 19:45:27'),
(69, 'general.content.custom_scripts.custom_javascript', '', 'default', NULL, '2024-08-31 19:45:27', '2024-08-31 19:45:27');

-- --------------------------------------------------------

--
-- Структура таблицы `store_countries`
--

CREATE TABLE `store_countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_countries`
--

INSERT INTO `store_countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(243, 'UN', 'United Nations'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Структура таблицы `store_country_states`
--

CREATE TABLE `store_country_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `country_code` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `default_name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_country_states`
--

INSERT INTO `store_country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
(1, 244, 'US', 'AL', 'Alabama'),
(2, 244, 'US', 'AK', 'Alaska'),
(3, 244, 'US', 'AS', 'American Samoa'),
(4, 244, 'US', 'AZ', 'Arizona'),
(5, 244, 'US', 'AR', 'Arkansas'),
(6, 244, 'US', 'AE', 'Armed Forces Africa'),
(7, 244, 'US', 'AA', 'Armed Forces Americas'),
(8, 244, 'US', 'AE', 'Armed Forces Canada'),
(9, 244, 'US', 'AE', 'Armed Forces Europe'),
(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
(12, 244, 'US', 'CA', 'California'),
(13, 244, 'US', 'CO', 'Colorado'),
(14, 244, 'US', 'CT', 'Connecticut'),
(15, 244, 'US', 'DE', 'Delaware'),
(16, 244, 'US', 'DC', 'District of Columbia'),
(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 244, 'US', 'FL', 'Florida'),
(19, 244, 'US', 'GA', 'Georgia'),
(20, 244, 'US', 'GU', 'Guam'),
(21, 244, 'US', 'HI', 'Hawaii'),
(22, 244, 'US', 'ID', 'Idaho'),
(23, 244, 'US', 'IL', 'Illinois'),
(24, 244, 'US', 'IN', 'Indiana'),
(25, 244, 'US', 'IA', 'Iowa'),
(26, 244, 'US', 'KS', 'Kansas'),
(27, 244, 'US', 'KY', 'Kentucky'),
(28, 244, 'US', 'LA', 'Louisiana'),
(29, 244, 'US', 'ME', 'Maine'),
(30, 244, 'US', 'MH', 'Marshall Islands'),
(31, 244, 'US', 'MD', 'Maryland'),
(32, 244, 'US', 'MA', 'Massachusetts'),
(33, 244, 'US', 'MI', 'Michigan'),
(34, 244, 'US', 'MN', 'Minnesota'),
(35, 244, 'US', 'MS', 'Mississippi'),
(36, 244, 'US', 'MO', 'Missouri'),
(37, 244, 'US', 'MT', 'Montana'),
(38, 244, 'US', 'NE', 'Nebraska'),
(39, 244, 'US', 'NV', 'Nevada'),
(40, 244, 'US', 'NH', 'New Hampshire'),
(41, 244, 'US', 'NJ', 'New Jersey'),
(42, 244, 'US', 'NM', 'New Mexico'),
(43, 244, 'US', 'NY', 'New York'),
(44, 244, 'US', 'NC', 'North Carolina'),
(45, 244, 'US', 'ND', 'North Dakota'),
(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
(47, 244, 'US', 'OH', 'Ohio'),
(48, 244, 'US', 'OK', 'Oklahoma'),
(49, 244, 'US', 'OR', 'Oregon'),
(50, 244, 'US', 'PW', 'Palau'),
(51, 244, 'US', 'PA', 'Pennsylvania'),
(52, 244, 'US', 'PR', 'Puerto Rico'),
(53, 244, 'US', 'RI', 'Rhode Island'),
(54, 244, 'US', 'SC', 'South Carolina'),
(55, 244, 'US', 'SD', 'South Dakota'),
(56, 244, 'US', 'TN', 'Tennessee'),
(57, 244, 'US', 'TX', 'Texas'),
(58, 244, 'US', 'UT', 'Utah'),
(59, 244, 'US', 'VT', 'Vermont'),
(60, 244, 'US', 'VI', 'Virgin Islands'),
(61, 244, 'US', 'VA', 'Virginia'),
(62, 244, 'US', 'WA', 'Washington'),
(63, 244, 'US', 'WV', 'West Virginia'),
(64, 244, 'US', 'WI', 'Wisconsin'),
(65, 244, 'US', 'WY', 'Wyoming'),
(66, 40, 'CA', 'AB', 'Alberta'),
(67, 40, 'CA', 'BC', 'British Columbia'),
(68, 40, 'CA', 'MB', 'Manitoba'),
(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 40, 'CA', 'NB', 'New Brunswick'),
(71, 40, 'CA', 'NS', 'Nova Scotia'),
(72, 40, 'CA', 'NT', 'Northwest Territories'),
(73, 40, 'CA', 'NU', 'Nunavut'),
(74, 40, 'CA', 'ON', 'Ontario'),
(75, 40, 'CA', 'PE', 'Prince Edward Island'),
(76, 40, 'CA', 'QC', 'Quebec'),
(77, 40, 'CA', 'SK', 'Saskatchewan'),
(78, 40, 'CA', 'YT', 'Yukon Territory'),
(79, 88, 'DE', 'NDS', 'Niedersachsen'),
(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 88, 'DE', 'BAY', 'Bayern'),
(82, 88, 'DE', 'BER', 'Berlin'),
(83, 88, 'DE', 'BRG', 'Brandenburg'),
(84, 88, 'DE', 'BRE', 'Bremen'),
(85, 88, 'DE', 'HAM', 'Hamburg'),
(86, 88, 'DE', 'HES', 'Hessen'),
(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 88, 'DE', 'SAR', 'Saarland'),
(91, 88, 'DE', 'SAS', 'Sachsen'),
(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 88, 'DE', 'THE', 'Thüringen'),
(95, 16, 'AT', 'WI', 'Wien'),
(96, 16, 'AT', 'NO', 'Niederösterreich'),
(97, 16, 'AT', 'OO', 'Oberösterreich'),
(98, 16, 'AT', 'SB', 'Salzburg'),
(99, 16, 'AT', 'KN', 'Kärnten'),
(100, 16, 'AT', 'ST', 'Steiermark'),
(101, 16, 'AT', 'TI', 'Tirol'),
(102, 16, 'AT', 'BL', 'Burgenland'),
(103, 16, 'AT', 'VB', 'Vorarlberg'),
(104, 220, 'CH', 'AG', 'Aargau'),
(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 220, 'CH', 'BE', 'Bern'),
(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
(109, 220, 'CH', 'BS', 'Basel-Stadt'),
(110, 220, 'CH', 'FR', 'Freiburg'),
(111, 220, 'CH', 'GE', 'Genf'),
(112, 220, 'CH', 'GL', 'Glarus'),
(113, 220, 'CH', 'GR', 'Graubünden'),
(114, 220, 'CH', 'JU', 'Jura'),
(115, 220, 'CH', 'LU', 'Luzern'),
(116, 220, 'CH', 'NE', 'Neuenburg'),
(117, 220, 'CH', 'NW', 'Nidwalden'),
(118, 220, 'CH', 'OW', 'Obwalden'),
(119, 220, 'CH', 'SG', 'St. Gallen'),
(120, 220, 'CH', 'SH', 'Schaffhausen'),
(121, 220, 'CH', 'SO', 'Solothurn'),
(122, 220, 'CH', 'SZ', 'Schwyz'),
(123, 220, 'CH', 'TG', 'Thurgau'),
(124, 220, 'CH', 'TI', 'Tessin'),
(125, 220, 'CH', 'UR', 'Uri'),
(126, 220, 'CH', 'VD', 'Waadt'),
(127, 220, 'CH', 'VS', 'Wallis'),
(128, 220, 'CH', 'ZG', 'Zug'),
(129, 220, 'CH', 'ZH', 'Zürich'),
(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
(131, 206, 'ES', 'Alava', 'Alava'),
(132, 206, 'ES', 'Albacete', 'Albacete'),
(133, 206, 'ES', 'Alicante', 'Alicante'),
(134, 206, 'ES', 'Almeria', 'Almeria'),
(135, 206, 'ES', 'Asturias', 'Asturias'),
(136, 206, 'ES', 'Avila', 'Avila'),
(137, 206, 'ES', 'Badajoz', 'Badajoz'),
(138, 206, 'ES', 'Baleares', 'Baleares'),
(139, 206, 'ES', 'Barcelona', 'Barcelona'),
(140, 206, 'ES', 'Burgos', 'Burgos'),
(141, 206, 'ES', 'Caceres', 'Caceres'),
(142, 206, 'ES', 'Cadiz', 'Cadiz'),
(143, 206, 'ES', 'Cantabria', 'Cantabria'),
(144, 206, 'ES', 'Castellon', 'Castellon'),
(145, 206, 'ES', 'Ceuta', 'Ceuta'),
(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 206, 'ES', 'Cordoba', 'Cordoba'),
(148, 206, 'ES', 'Cuenca', 'Cuenca'),
(149, 206, 'ES', 'Girona', 'Girona'),
(150, 206, 'ES', 'Granada', 'Granada'),
(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 206, 'ES', 'Huelva', 'Huelva'),
(154, 206, 'ES', 'Huesca', 'Huesca'),
(155, 206, 'ES', 'Jaen', 'Jaen'),
(156, 206, 'ES', 'La Rioja', 'La Rioja'),
(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 206, 'ES', 'Leon', 'Leon'),
(159, 206, 'ES', 'Lleida', 'Lleida'),
(160, 206, 'ES', 'Lugo', 'Lugo'),
(161, 206, 'ES', 'Madrid', 'Madrid'),
(162, 206, 'ES', 'Malaga', 'Malaga'),
(163, 206, 'ES', 'Melilla', 'Melilla'),
(164, 206, 'ES', 'Murcia', 'Murcia'),
(165, 206, 'ES', 'Navarra', 'Navarra'),
(166, 206, 'ES', 'Ourense', 'Ourense'),
(167, 206, 'ES', 'Palencia', 'Palencia'),
(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 206, 'ES', 'Salamanca', 'Salamanca'),
(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 206, 'ES', 'Segovia', 'Segovia'),
(172, 206, 'ES', 'Sevilla', 'Sevilla'),
(173, 206, 'ES', 'Soria', 'Soria'),
(174, 206, 'ES', 'Tarragona', 'Tarragona'),
(175, 206, 'ES', 'Teruel', 'Teruel'),
(176, 206, 'ES', 'Toledo', 'Toledo'),
(177, 206, 'ES', 'Valencia', 'Valencia'),
(178, 206, 'ES', 'Valladolid', 'Valladolid'),
(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 206, 'ES', 'Zamora', 'Zamora'),
(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 81, 'FR', '1', 'Ain'),
(183, 81, 'FR', '2', 'Aisne'),
(184, 81, 'FR', '3', 'Allier'),
(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 81, 'FR', '5', 'Hautes-Alpes'),
(187, 81, 'FR', '6', 'Alpes-Maritimes'),
(188, 81, 'FR', '7', 'Ardèche'),
(189, 81, 'FR', '8', 'Ardennes'),
(190, 81, 'FR', '9', 'Ariège'),
(191, 81, 'FR', '10', 'Aube'),
(192, 81, 'FR', '11', 'Aude'),
(193, 81, 'FR', '12', 'Aveyron'),
(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
(195, 81, 'FR', '14', 'Calvados'),
(196, 81, 'FR', '15', 'Cantal'),
(197, 81, 'FR', '16', 'Charente'),
(198, 81, 'FR', '17', 'Charente-Maritime'),
(199, 81, 'FR', '18', 'Cher'),
(200, 81, 'FR', '19', 'Corrèze'),
(201, 81, 'FR', '2A', 'Corse-du-Sud'),
(202, 81, 'FR', '2B', 'Haute-Corse'),
(203, 81, 'FR', '21', 'Côte-d\'Or'),
(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
(205, 81, 'FR', '23', 'Creuse'),
(206, 81, 'FR', '24', 'Dordogne'),
(207, 81, 'FR', '25', 'Doubs'),
(208, 81, 'FR', '26', 'Drôme'),
(209, 81, 'FR', '27', 'Eure'),
(210, 81, 'FR', '28', 'Eure-et-Loir'),
(211, 81, 'FR', '29', 'Finistère'),
(212, 81, 'FR', '30', 'Gard'),
(213, 81, 'FR', '31', 'Haute-Garonne'),
(214, 81, 'FR', '32', 'Gers'),
(215, 81, 'FR', '33', 'Gironde'),
(216, 81, 'FR', '34', 'Hérault'),
(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
(218, 81, 'FR', '36', 'Indre'),
(219, 81, 'FR', '37', 'Indre-et-Loire'),
(220, 81, 'FR', '38', 'Isère'),
(221, 81, 'FR', '39', 'Jura'),
(222, 81, 'FR', '40', 'Landes'),
(223, 81, 'FR', '41', 'Loir-et-Cher'),
(224, 81, 'FR', '42', 'Loire'),
(225, 81, 'FR', '43', 'Haute-Loire'),
(226, 81, 'FR', '44', 'Loire-Atlantique'),
(227, 81, 'FR', '45', 'Loiret'),
(228, 81, 'FR', '46', 'Lot'),
(229, 81, 'FR', '47', 'Lot-et-Garonne'),
(230, 81, 'FR', '48', 'Lozère'),
(231, 81, 'FR', '49', 'Maine-et-Loire'),
(232, 81, 'FR', '50', 'Manche'),
(233, 81, 'FR', '51', 'Marne'),
(234, 81, 'FR', '52', 'Haute-Marne'),
(235, 81, 'FR', '53', 'Mayenne'),
(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 81, 'FR', '55', 'Meuse'),
(238, 81, 'FR', '56', 'Morbihan'),
(239, 81, 'FR', '57', 'Moselle'),
(240, 81, 'FR', '58', 'Nièvre'),
(241, 81, 'FR', '59', 'Nord'),
(242, 81, 'FR', '60', 'Oise'),
(243, 81, 'FR', '61', 'Orne'),
(244, 81, 'FR', '62', 'Pas-de-Calais'),
(245, 81, 'FR', '63', 'Puy-de-Dôme'),
(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
(249, 81, 'FR', '67', 'Bas-Rhin'),
(250, 81, 'FR', '68', 'Haut-Rhin'),
(251, 81, 'FR', '69', 'Rhône'),
(252, 81, 'FR', '70', 'Haute-Saône'),
(253, 81, 'FR', '71', 'Saône-et-Loire'),
(254, 81, 'FR', '72', 'Sarthe'),
(255, 81, 'FR', '73', 'Savoie'),
(256, 81, 'FR', '74', 'Haute-Savoie'),
(257, 81, 'FR', '75', 'Paris'),
(258, 81, 'FR', '76', 'Seine-Maritime'),
(259, 81, 'FR', '77', 'Seine-et-Marne'),
(260, 81, 'FR', '78', 'Yvelines'),
(261, 81, 'FR', '79', 'Deux-Sèvres'),
(262, 81, 'FR', '80', 'Somme'),
(263, 81, 'FR', '81', 'Tarn'),
(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
(265, 81, 'FR', '83', 'Var'),
(266, 81, 'FR', '84', 'Vaucluse'),
(267, 81, 'FR', '85', 'Vendée'),
(268, 81, 'FR', '86', 'Vienne'),
(269, 81, 'FR', '87', 'Haute-Vienne'),
(270, 81, 'FR', '88', 'Vosges'),
(271, 81, 'FR', '89', 'Yonne'),
(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
(273, 81, 'FR', '91', 'Essonne'),
(274, 81, 'FR', '92', 'Hauts-de-Seine'),
(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
(276, 81, 'FR', '94', 'Val-de-Marne'),
(277, 81, 'FR', '95', 'Val-d\'Oise'),
(278, 185, 'RO', 'AB', 'Alba'),
(279, 185, 'RO', 'AR', 'Arad'),
(280, 185, 'RO', 'AG', 'Argeş'),
(281, 185, 'RO', 'BC', 'Bacău'),
(282, 185, 'RO', 'BH', 'Bihor'),
(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 185, 'RO', 'BT', 'Botoşani'),
(285, 185, 'RO', 'BV', 'Braşov'),
(286, 185, 'RO', 'BR', 'Brăila'),
(287, 185, 'RO', 'B', 'Bucureşti'),
(288, 185, 'RO', 'BZ', 'Buzău'),
(289, 185, 'RO', 'CS', 'Caraş-Severin'),
(290, 185, 'RO', 'CL', 'Călăraşi'),
(291, 185, 'RO', 'CJ', 'Cluj'),
(292, 185, 'RO', 'CT', 'Constanţa'),
(293, 185, 'RO', 'CV', 'Covasna'),
(294, 185, 'RO', 'DB', 'Dâmboviţa'),
(295, 185, 'RO', 'DJ', 'Dolj'),
(296, 185, 'RO', 'GL', 'Galaţi'),
(297, 185, 'RO', 'GR', 'Giurgiu'),
(298, 185, 'RO', 'GJ', 'Gorj'),
(299, 185, 'RO', 'HR', 'Harghita'),
(300, 185, 'RO', 'HD', 'Hunedoara'),
(301, 185, 'RO', 'IL', 'Ialomiţa'),
(302, 185, 'RO', 'IS', 'Iaşi'),
(303, 185, 'RO', 'IF', 'Ilfov'),
(304, 185, 'RO', 'MM', 'Maramureş'),
(305, 185, 'RO', 'MH', 'Mehedinţi'),
(306, 185, 'RO', 'MS', 'Mureş'),
(307, 185, 'RO', 'NT', 'Neamţ'),
(308, 185, 'RO', 'OT', 'Olt'),
(309, 185, 'RO', 'PH', 'Prahova'),
(310, 185, 'RO', 'SM', 'Satu-Mare'),
(311, 185, 'RO', 'SJ', 'Sălaj'),
(312, 185, 'RO', 'SB', 'Sibiu'),
(313, 185, 'RO', 'SV', 'Suceava'),
(314, 185, 'RO', 'TR', 'Teleorman'),
(315, 185, 'RO', 'TM', 'Timiş'),
(316, 185, 'RO', 'TL', 'Tulcea'),
(317, 185, 'RO', 'VS', 'Vaslui'),
(318, 185, 'RO', 'VL', 'Vâlcea'),
(319, 185, 'RO', 'VN', 'Vrancea'),
(320, 80, 'FI', 'Lappi', 'Lappi'),
(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 80, 'FI', 'Kainuu', 'Kainuu'),
(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 80, 'FI', 'Satakunta', 'Satakunta'),
(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 74, 'EE', 'EE-37', 'Harjumaa'),
(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 74, 'EE', 'EE-51', 'Järvamaa'),
(345, 74, 'EE', 'EE-57', 'Läänemaa'),
(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
(349, 74, 'EE', 'EE-70', 'Raplamaa'),
(350, 74, 'EE', 'EE-74', 'Saaremaa'),
(351, 74, 'EE', 'EE-78', 'Tartumaa'),
(352, 74, 'EE', 'EE-82', 'Valgamaa'),
(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
(354, 74, 'EE', 'EE-86', 'Võrumaa'),
(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 125, 'LV', 'LV-RIX', 'Rīga'),
(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 125, 'LV', 'Valmiera', 'Valmiera'),
(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 125, 'LV', 'Apes novads', 'Apes novads'),
(375, 125, 'LV', 'Auces novads', 'Auces novads'),
(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 125, 'LV', 'Engures novads', 'Engures novads'),
(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 125, 'LV', 'Salas novads', 'Salas novads'),
(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 31, 'BR', 'AC', 'Acre'),
(486, 31, 'BR', 'AL', 'Alagoas'),
(487, 31, 'BR', 'AP', 'Amapá'),
(488, 31, 'BR', 'AM', 'Amazonas'),
(489, 31, 'BR', 'BA', 'Bahia'),
(490, 31, 'BR', 'CE', 'Ceará'),
(491, 31, 'BR', 'ES', 'Espírito Santo'),
(492, 31, 'BR', 'GO', 'Goiás'),
(493, 31, 'BR', 'MA', 'Maranhão'),
(494, 31, 'BR', 'MT', 'Mato Grosso'),
(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 31, 'BR', 'MG', 'Minas Gerais'),
(497, 31, 'BR', 'PA', 'Pará'),
(498, 31, 'BR', 'PB', 'Paraíba'),
(499, 31, 'BR', 'PR', 'Paraná'),
(500, 31, 'BR', 'PE', 'Pernambuco'),
(501, 31, 'BR', 'PI', 'Piauí'),
(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 31, 'BR', 'RO', 'Rondônia'),
(506, 31, 'BR', 'RR', 'Roraima'),
(507, 31, 'BR', 'SC', 'Santa Catarina'),
(508, 31, 'BR', 'SP', 'São Paulo'),
(509, 31, 'BR', 'SE', 'Sergipe'),
(510, 31, 'BR', 'TO', 'Tocantins'),
(511, 31, 'BR', 'DF', 'Distrito Federal'),
(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 59, 'HR', 'HR-18', 'Istarska županija'),
(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 106, 'IN', 'AS', 'Assam'),
(537, 106, 'IN', 'BR', 'Bihar'),
(538, 106, 'IN', 'CH', 'Chandigarh'),
(539, 106, 'IN', 'CT', 'Chhattisgarh'),
(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 106, 'IN', 'DD', 'Daman and Diu'),
(542, 106, 'IN', 'DL', 'Delhi'),
(543, 106, 'IN', 'GA', 'Goa'),
(544, 106, 'IN', 'GJ', 'Gujarat'),
(545, 106, 'IN', 'HR', 'Haryana'),
(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 106, 'IN', 'JH', 'Jharkhand'),
(549, 106, 'IN', 'KA', 'Karnataka'),
(550, 106, 'IN', 'KL', 'Kerala'),
(551, 106, 'IN', 'LD', 'Lakshadweep'),
(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
(553, 106, 'IN', 'MH', 'Maharashtra'),
(554, 106, 'IN', 'MN', 'Manipur'),
(555, 106, 'IN', 'ML', 'Meghalaya'),
(556, 106, 'IN', 'MZ', 'Mizoram'),
(557, 106, 'IN', 'NL', 'Nagaland'),
(558, 106, 'IN', 'OR', 'Odisha'),
(559, 106, 'IN', 'PY', 'Puducherry'),
(560, 106, 'IN', 'PB', 'Punjab'),
(561, 106, 'IN', 'RJ', 'Rajasthan'),
(562, 106, 'IN', 'SK', 'Sikkim'),
(563, 106, 'IN', 'TN', 'Tamil Nadu'),
(564, 106, 'IN', 'TG', 'Telangana'),
(565, 106, 'IN', 'TR', 'Tripura'),
(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
(567, 106, 'IN', 'UT', 'Uttarakhand'),
(568, 106, 'IN', 'WB', 'West Bengal'),
(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
(571, 176, 'PY', 'PY-13', 'Amambay'),
(572, 176, 'PY', 'PY-ASU', 'Asunción'),
(573, 176, 'PY', 'PY-19', 'Boquerón'),
(574, 176, 'PY', 'PY-5', 'Caaguazú'),
(575, 176, 'PY', 'PY-6', 'Caazapá'),
(576, 176, 'PY', 'PY-14', 'Canindeyú'),
(577, 176, 'PY', 'PY-11', 'Central'),
(578, 176, 'PY', 'PY-1', 'Concepción'),
(579, 176, 'PY', 'PY-3', 'Cordillera'),
(580, 176, 'PY', 'PY-4', 'Guairá'),
(581, 176, 'PY', 'PY-7', 'Itapúa'),
(582, 176, 'PY', 'PY-8', 'Misiones'),
(583, 176, 'PY', 'PY-9', 'Paraguarí'),
(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
(585, 176, 'PY', 'PY-2', 'San Pedro'),
(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- --------------------------------------------------------

--
-- Структура таблицы `store_country_state_translations`
--

CREATE TABLE `store_country_state_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_state_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `default_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_country_translations`
--

CREATE TABLE `store_country_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_currencies`
--

CREATE TABLE `store_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) DEFAULT NULL,
  `decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `group_separator` varchar(191) NOT NULL DEFAULT ',',
  `decimal_separator` varchar(191) NOT NULL DEFAULT '.',
  `currency_position` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_currencies`
--

INSERT INTO `store_currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `group_separator`, `decimal_separator`, `currency_position`, `created_at`, `updated_at`) VALUES
(1, 'RUB', 'Российский рубль', '₽', 2, ',', '.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_currency_exchange_rates`
--

CREATE TABLE `store_currency_exchange_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_customers`
--

CREATE TABLE `store_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(191) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_customers`
--

INSERT INTO `store_customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `channel_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'Test', NULL, NULL, 'test@test.com', NULL, NULL, 1, '$2y$10$pH0EBWLW.dYI9OYKZQq3weT/5uiJRS8Cqcq/RWbGa5M/eddOf372G', 'yb6eIFCJFmPDGSAYyqo2c1LHY0clwA2CdiiTNBPppClfCCcVTiByKbsB8I68ZFlIG5lFO9sL1jVK895D', 1, 1, 1, 1, 0, '823e799570405e1f7085b847b1a2ca6f', NULL, '2024-08-29 15:47:04', '2024-08-29 18:33:03');

-- --------------------------------------------------------

--
-- Структура таблицы `store_customer_groups`
--

CREATE TABLE `store_customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_customer_groups`
--

INSERT INTO `store_customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'Гость', 0, NULL, NULL),
(2, 'general', 'Общий', 0, NULL, NULL),
(3, 'wholesale', 'Оптовый', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_customer_notes`
--

CREATE TABLE `store_customer_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `note` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_customer_password_resets`
--

CREATE TABLE `store_customer_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_customer_social_accounts`
--

CREATE TABLE `store_customer_social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_datagrid_saved_filters`
--

CREATE TABLE `store_datagrid_saved_filters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `src` varchar(191) NOT NULL,
  `applied` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`applied`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_downloadable_link_purchased`
--

CREATE TABLE `store_downloadable_link_purchased` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT 0,
  `download_used` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_item_id` int(10) UNSIGNED NOT NULL,
  `download_canceled` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_failed_jobs`
--

CREATE TABLE `store_failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_imports`
--

CREATE TABLE `store_imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(191) NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(191) NOT NULL,
  `action` varchar(191) NOT NULL,
  `validation_strategy` varchar(191) NOT NULL,
  `allowed_errors` int(11) NOT NULL DEFAULT 0,
  `processed_rows_count` int(11) NOT NULL DEFAULT 0,
  `invalid_rows_count` int(11) NOT NULL DEFAULT 0,
  `errors_count` int(11) NOT NULL DEFAULT 0,
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`errors`)),
  `field_separator` varchar(191) NOT NULL,
  `file_path` varchar(191) NOT NULL,
  `images_directory_path` varchar(191) DEFAULT NULL,
  `error_file_path` varchar(191) DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_import_batches`
--

CREATE TABLE `store_import_batches` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(191) NOT NULL DEFAULT 'pending',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `import_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_inventory_sources`
--

CREATE TABLE `store_inventory_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(191) NOT NULL,
  `contact_email` varchar(191) NOT NULL,
  `contact_number` varchar(191) NOT NULL,
  `contact_fax` varchar(191) DEFAULT NULL,
  `country` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `street` varchar(191) NOT NULL,
  `postcode` varchar(191) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_inventory_sources`
--

INSERT INTO `store_inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', 'По умолчанию', NULL, 'По умолчанию', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_invoices`
--

CREATE TABLE `store_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `reminders` int(11) NOT NULL DEFAULT 0,
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_invoice_items`
--

CREATE TABLE `store_invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_jobs`
--

CREATE TABLE `store_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_job_batches`
--

CREATE TABLE `store_job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_locales`
--

CREATE TABLE `store_locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `direction` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_locales`
--

INSERT INTO `store_locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
(1, 'ru', 'Русский', 'ltr', 'locales/m2YPUmdKciQ95R0QYKgfpIbsjvoJPioLhW8AtuUp.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_marketing_campaigns`
--

CREATE TABLE `store_marketing_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL,
  `mail_to` varchar(191) NOT NULL,
  `spooling` varchar(191) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_template_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_event_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_marketing_events`
--

CREATE TABLE `store_marketing_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_marketing_events`
--

INSERT INTO `store_marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_marketing_templates`
--

CREATE TABLE `store_marketing_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_migrations`
--

CREATE TABLE `store_migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_migrations`
--

INSERT INTO `store_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_12_111907_create_admins_table', 1),
(5, '2018_06_13_055341_create_roles_table', 1),
(6, '2018_07_05_130148_create_attributes_table', 1),
(7, '2018_07_05_132854_create_attribute_translations_table', 1),
(8, '2018_07_05_135150_create_attribute_families_table', 1),
(9, '2018_07_05_135152_create_attribute_groups_table', 1),
(10, '2018_07_05_140832_create_attribute_options_table', 1),
(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
(12, '2018_07_05_142820_create_categories_table', 1),
(13, '2018_07_10_055143_create_locales_table', 1),
(14, '2018_07_20_054426_create_countries_table', 1),
(15, '2018_07_20_054502_create_currencies_table', 1),
(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
(17, '2018_07_20_064849_create_channels_table', 1),
(18, '2018_07_21_142836_create_category_translations_table', 1),
(19, '2018_07_23_110040_create_inventory_sources_table', 1),
(20, '2018_07_24_082635_create_customer_groups_table', 1),
(21, '2018_07_24_082930_create_customers_table', 1),
(22, '2018_07_27_065727_create_products_table', 1),
(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
(24, '2018_07_27_092623_create_product_reviews_table', 1),
(25, '2018_07_27_113941_create_product_images_table', 1),
(26, '2018_07_27_113956_create_product_inventories_table', 1),
(27, '2018_08_30_064755_create_tax_categories_table', 1),
(28, '2018_08_30_065042_create_tax_rates_table', 1),
(29, '2018_08_30_065840_create_tax_mappings_table', 1),
(30, '2018_09_05_150444_create_cart_table', 1),
(31, '2018_09_05_150915_create_cart_items_table', 1),
(32, '2018_09_11_064045_customer_password_resets', 1),
(33, '2018_09_19_093453_create_cart_payment', 1),
(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
(35, '2018_09_20_060658_create_core_config_table', 1),
(36, '2018_09_27_113154_create_orders_table', 1),
(37, '2018_09_27_113207_create_order_items_table', 1),
(38, '2018_09_27_115022_create_shipments_table', 1),
(39, '2018_09_27_115029_create_shipment_items_table', 1),
(40, '2018_09_27_115135_create_invoices_table', 1),
(41, '2018_09_27_115144_create_invoice_items_table', 1),
(42, '2018_10_01_095504_create_order_payment_table', 1),
(43, '2018_10_03_025230_create_wishlist_table', 1),
(44, '2018_10_12_101803_create_country_translations_table', 1),
(45, '2018_10_12_101913_create_country_states_table', 1),
(46, '2018_10_12_101923_create_country_state_translations_table', 1),
(47, '2018_11_16_173504_create_subscribers_list_table', 1),
(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
(49, '2018_12_06_185202_create_product_flat_table', 1),
(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
(52, '2019_05_13_024321_create_cart_rules_table', 1),
(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
(64, '2019_07_30_153530_create_cms_pages_table', 1),
(65, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
(66, '2019_08_02_105320_create_product_grouped_products_table', 1),
(67, '2019_08_20_170510_create_product_bundle_options_table', 1),
(68, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
(69, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
(70, '2019_09_11_184511_create_refunds_table', 1),
(71, '2019_09_11_184519_create_refund_items_table', 1),
(72, '2019_12_03_184613_create_catalog_rules_table', 1),
(73, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
(74, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
(75, '2019_12_06_101110_create_catalog_rule_products_table', 1),
(76, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
(77, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(78, '2020_01_14_191854_create_cms_page_translations_table', 1),
(79, '2020_01_15_130209_create_cms_page_channels_table', 1),
(80, '2020_04_16_185147_add_table_addresses', 1),
(81, '2020_05_06_171638_create_order_comments_table', 1),
(82, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
(83, '2020_06_25_162154_create_customer_social_accounts_table', 1),
(84, '2020_11_19_112228_create_product_videos_table', 1),
(85, '2020_11_26_141455_create_marketing_templates_table', 1),
(86, '2020_11_26_150534_create_marketing_events_table', 1),
(87, '2020_11_26_150644_create_marketing_campaigns_table', 1),
(88, '2020_12_21_000200_create_channel_translations_table', 1),
(89, '2020_12_27_121950_create_jobs_table', 1),
(90, '2021_03_11_212124_create_order_transactions_table', 1),
(91, '2021_04_07_132010_create_product_review_images_table', 1),
(92, '2021_12_15_104544_notifications', 1),
(93, '2022_03_15_160510_create_failed_jobs_table', 1),
(94, '2022_04_01_094622_create_sitemaps_table', 1),
(95, '2022_10_03_144232_create_product_price_indices_table', 1),
(96, '2022_10_04_144444_create_job_batches_table', 1),
(97, '2022_10_08_134150_create_product_inventory_indices_table', 1),
(98, '2023_05_26_213105_create_wishlist_items_table', 1),
(99, '2023_05_26_213120_create_compare_items_table', 1),
(100, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
(101, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
(102, '2023_07_10_184256_create_theme_customizations_table', 1),
(103, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
(104, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
(105, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
(106, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
(107, '2023_07_25_171058_create_customer_notes_table', 1),
(108, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
(109, '2023_09_15_170053_create_theme_customization_translations_table', 1),
(110, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
(111, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
(112, '2023_09_26_155709_add_columns_to_currencies', 1),
(113, '2023_10_05_163612_create_visits_table', 1),
(114, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
(115, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1),
(116, '2023_11_08_140116_create_search_terms_table', 1),
(117, '2023_11_09_162805_create_url_rewrites_table', 1),
(118, '2023_11_17_150401_create_search_synonyms_table', 1),
(119, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1),
(120, '2024_01_11_154640_create_imports_table', 1),
(121, '2024_01_11_154741_create_import_batches_table', 1),
(122, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1),
(123, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1),
(124, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1),
(125, '2024_02_26_153000_add_columns_to_addresses_table', 1),
(126, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1),
(127, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1),
(128, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1),
(129, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1),
(130, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1),
(131, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1),
(132, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1),
(133, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1),
(134, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1),
(135, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1),
(136, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1),
(137, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1),
(138, '2024_05_10_152848_create_saved_filters_table', 1),
(139, '2024_06_03_174128_create_product_channels_table', 1),
(140, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1),
(141, '2024_06_04_134403_add_channel_id_column_in_visits_table', 1),
(142, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_notifications`
--

CREATE TABLE `store_notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_orders`
--

CREATE TABLE `store_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `channel_name` varchar(191) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(191) DEFAULT NULL,
  `customer_first_name` varchar(191) DEFAULT NULL,
  `customer_last_name` varchar(191) DEFAULT NULL,
  `shipping_method` varchar(191) DEFAULT NULL,
  `shipping_title` varchar(191) DEFAULT NULL,
  `shipping_description` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_type` varchar(191) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_order_comments`
--

CREATE TABLE `store_order_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_order_items`
--

CREATE TABLE `store_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `coupon_code` varchar(191) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT 0.0000,
  `total_weight` decimal(12,4) DEFAULT 0.0000,
  `qty_ordered` int(11) DEFAULT 0,
  `qty_shipped` int(11) DEFAULT 0,
  `qty_invoiced` int(11) DEFAULT 0,
  `qty_canceled` int(11) DEFAULT 0,
  `qty_refunded` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_order_payment`
--

CREATE TABLE `store_order_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `method` varchar(191) NOT NULL,
  `method_title` varchar(191) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_order_transactions`
--

CREATE TABLE `store_order_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `type` varchar(191) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT 0.0000,
  `payment_method` varchar(191) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_password_resets`
--

CREATE TABLE `store_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_personal_access_tokens`
--

CREATE TABLE `store_personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_products`
--

CREATE TABLE `store_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_products`
--

INSERT INTO `store_products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, '56544313', 'simple', NULL, 1, NULL, '2024-08-29 15:41:08', '2024-08-29 15:41:08'),
(3, '56544312', 'simple', NULL, 1, NULL, '2024-08-29 16:50:38', '2024-08-29 16:52:08'),
(4, '56544311', 'simple', NULL, 1, NULL, '2024-08-29 16:55:30', '2024-08-29 16:57:30'),
(5, '56544310', 'simple', NULL, 1, NULL, '2024-08-29 17:00:00', '2024-08-29 17:00:56'),
(6, '56544309', 'simple', NULL, 1, NULL, '2024-08-29 17:03:05', '2024-08-29 17:04:30'),
(7, '56544308', 'simple', NULL, 1, NULL, '2024-08-29 17:07:44', '2024-08-29 17:09:51'),
(8, '56544307', 'simple', NULL, 1, NULL, '2024-08-29 17:12:04', '2024-08-29 17:13:16'),
(9, '56544306', 'simple', NULL, 1, NULL, '2024-08-29 17:14:00', '2024-08-29 17:14:59'),
(10, '56544305', 'simple', NULL, 1, NULL, '2024-08-29 17:16:39', '2024-08-29 17:17:53'),
(11, '56544304', 'simple', NULL, 1, NULL, '2024-08-29 17:18:43', '2024-08-29 17:19:44');

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_attribute_values`
--

CREATE TABLE `store_product_attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `unique_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_attribute_values`
--

INSERT INTO `store_product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES
(4, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22, '1|22'),
(5, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 28, 'default|1|28'),
(6, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16, 'ru|1|16'),
(7, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17, 'ru|1|17'),
(8, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18, 'ru|1|18'),
(9, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 5, '1|5'),
(10, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 6, '1|6'),
(11, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 7, '1|7'),
(12, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 8, 'default|1|8'),
(13, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 26, '1|26'),
(14, NULL, NULL, '56544313', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '1|1'),
(15, 'ru', NULL, 'Винегрет', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 'ru|1|2'),
(16, 'ru', NULL, 'винегрет', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 'ru|1|3'),
(17, NULL, NULL, '56544313', NULL, NULL, NULL, NULL, NULL, NULL, 1, 27, '1|27'),
(18, 'ru', NULL, '<p>Винегре́т &mdash; холодное блюдо русской кухни, закуска, разновидность салата, обязательным ингредиентом которого в современной кулинарии является отварная или печёная свёкла.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, 'ru|1|9'),
(19, 'ru', NULL, '<p>Винегрет &mdash; холодное блюдо русской кухни, закуска, разновидность салата, обязательным ингредиентом которого в современной кулинарии является отварная или печёная свёкла.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 'ru|1|10'),
(20, NULL, NULL, NULL, NULL, NULL, 121.0000, NULL, NULL, NULL, 1, 11, '1|11'),
(21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 12, '1|12'),
(22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 13, '1|13'),
(23, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, 'default|1|14'),
(24, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 'default|1|15'),
(52, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 3, 22, '3|22'),
(53, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 28, 'default|3|28'),
(54, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 16, 'ru|3|16'),
(55, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 17, 'ru|3|17'),
(56, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 18, 'ru|3|18'),
(57, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 5, '3|5'),
(58, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 6, '3|6'),
(59, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 7, '3|7'),
(60, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 8, 'default|3|8'),
(61, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 3, 26, '3|26'),
(62, NULL, NULL, '56544312', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '3|1'),
(63, 'ru', NULL, 'Мясной салат', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 'ru|3|2'),
(64, 'ru', NULL, 'мяснои-салат', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 'ru|3|3'),
(65, NULL, NULL, '56544312', NULL, NULL, NULL, NULL, NULL, NULL, 3, 27, '3|27'),
(66, 'ru', NULL, '<p><em>Мясной салат</em> представляет собой потрясающее сочетание свежих помидоров и обжаренной говядины с овощами.&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 'ru|3|9'),
(67, 'ru', NULL, '<p><em>Мясной салат</em> представляет собой потрясающее сочетание свежих помидоров и обжаренной говядины с овощами.&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, 'ru|3|10'),
(68, NULL, NULL, NULL, NULL, NULL, 169.0000, NULL, NULL, NULL, 3, 11, '3|11'),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 12, '3|12'),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 13, '3|13'),
(71, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 14, 'default|3|14'),
(72, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 15, 'default|3|15'),
(76, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 4, 22, '4|22'),
(77, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 28, 'default|4|28'),
(78, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16, 'ru|4|16'),
(79, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17, 'ru|4|17'),
(80, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18, 'ru|4|18'),
(81, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 5, '4|5'),
(82, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 6, '4|6'),
(83, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 7, '4|7'),
(84, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 8, 'default|4|8'),
(85, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 26, '4|26'),
(86, NULL, NULL, '56544311', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, '4|1'),
(87, 'ru', NULL, 'Ежик', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 'ru|4|2'),
(88, 'ru', NULL, 'ежик', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, 'ru|4|3'),
(89, NULL, NULL, '56544311', NULL, NULL, NULL, NULL, NULL, NULL, 4, 27, '4|27'),
(90, 'ru', NULL, '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9, 'ru|4|9'),
(91, 'ru', NULL, '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10, 'ru|4|10'),
(92, NULL, NULL, NULL, NULL, NULL, 89.0000, NULL, NULL, NULL, 4, 11, '4|11'),
(93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 12, '4|12'),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 13, '4|13'),
(95, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 14, 'default|4|14'),
(96, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 15, 'default|4|15'),
(100, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 5, 22, '5|22'),
(101, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 28, 'default|5|28'),
(102, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 16, 'ru|5|16'),
(103, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 17, 'ru|5|17'),
(104, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 5, 18, 'ru|5|18'),
(105, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 5, '5|5'),
(106, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 6, '5|6'),
(107, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 7, '5|7'),
(108, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 8, 'default|5|8'),
(109, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 26, '5|26'),
(110, NULL, NULL, '56544310', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, '5|1'),
(111, 'ru', NULL, 'Крабовый салат', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 'ru|5|2'),
(112, 'ru', NULL, 'крабовыи-салат', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, 'ru|5|3'),
(113, NULL, NULL, '56544310', NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, '5|27'),
(114, 'ru', NULL, '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, 'ru|5|9'),
(115, 'ru', NULL, '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, 'ru|5|10'),
(116, NULL, NULL, NULL, NULL, NULL, 99.0000, NULL, NULL, NULL, 5, 11, '5|11'),
(117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 12, '5|12'),
(118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 13, '5|13'),
(119, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 14, 'default|5|14'),
(120, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 15, 'default|5|15'),
(124, NULL, NULL, '100', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22, '6|22'),
(125, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 28, 'default|6|28'),
(126, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16, 'ru|6|16'),
(127, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17, 'ru|6|17'),
(128, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18, 'ru|6|18'),
(129, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 5, '6|5'),
(130, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 6, '6|6'),
(131, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7, '6|7'),
(132, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8, 'default|6|8'),
(133, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 26, '6|26'),
(134, NULL, NULL, '56544309', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, '6|1'),
(135, 'ru', NULL, 'Мимоза', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 'ru|6|2'),
(136, 'ru', NULL, 'мимоза', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3, 'ru|6|3'),
(137, NULL, NULL, '56544309', NULL, NULL, NULL, NULL, NULL, NULL, 6, 27, '6|27'),
(138, 'ru', NULL, '<p>&laquo;Мимоза&raquo; &mdash; праздничный слоёный салат или салат-коктейль, появившийся в СССР в начале 1970-х годов.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9, 'ru|6|9'),
(139, 'ru', NULL, '<p>&laquo;Мимоза&raquo; &mdash; праздничный слоёный салат или салат-коктейль, появившийся в СССР в начале 1970-х годов.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10, 'ru|6|10'),
(140, NULL, NULL, NULL, NULL, NULL, 149.0000, NULL, NULL, NULL, 6, 11, '6|11'),
(141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 12, '6|12'),
(142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 13, '6|13'),
(143, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'default|6|14'),
(144, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 15, 'default|6|15'),
(148, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, NULL, 7, 22, '7|22'),
(149, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 28, 'default|7|28'),
(150, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16, 'ru|7|16'),
(151, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17, 'ru|7|17'),
(152, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18, 'ru|7|18'),
(153, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 5, '7|5'),
(154, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 6, '7|6'),
(155, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 7, '7|7'),
(156, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 7, 8, 'default|7|8'),
(157, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 7, 26, '7|26'),
(158, NULL, NULL, '56544308', NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, '7|1'),
(159, 'ru', NULL, 'Кола', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2, 'ru|7|2'),
(160, 'ru', NULL, 'кола', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'ru|7|3'),
(161, NULL, NULL, '56544308', NULL, NULL, NULL, NULL, NULL, NULL, 7, 27, '7|27'),
(162, 'ru', NULL, '<p>Кола - самый лучший газированный напиток!</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'ru|7|9'),
(163, 'ru', NULL, '<p>Кола - самый лучший газированный напиток!</p>', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10, 'ru|7|10'),
(164, NULL, NULL, NULL, NULL, NULL, 149.0000, NULL, NULL, NULL, 7, 11, '7|11'),
(165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 12, '7|12'),
(166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 13, '7|13'),
(167, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 14, 'default|7|14'),
(168, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 15, 'default|7|15'),
(172, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, NULL, 8, 22, '8|22'),
(173, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 28, 'default|8|28'),
(174, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 16, 'ru|8|16'),
(175, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 17, 'ru|8|17'),
(176, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 8, 18, 'ru|8|18'),
(177, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 5, '8|5'),
(178, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 6, '8|6'),
(179, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 7, '8|7'),
(180, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 8, 8, 'default|8|8'),
(181, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 8, 26, '8|26'),
(182, NULL, NULL, '56544307', NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, '8|1'),
(183, 'ru', NULL, 'Зеленый чай', NULL, NULL, NULL, NULL, NULL, NULL, 8, 2, 'ru|8|2'),
(184, 'ru', NULL, 'зеленыи-чаи', NULL, NULL, NULL, NULL, NULL, NULL, 8, 3, 'ru|8|3'),
(185, NULL, NULL, '56544307', NULL, NULL, NULL, NULL, NULL, NULL, 8, 27, '8|27'),
(186, 'ru', NULL, '<p><em>Зелёный чай</em> &mdash; чай, подвергнутый минимальной ферментации (окислению).</p>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 9, 'ru|8|9'),
(187, 'ru', NULL, '<p><em>Зелёный чай</em> &mdash; чай, подвергнутый минимальной ферментации (окислению).</p>', NULL, NULL, NULL, NULL, NULL, NULL, 8, 10, 'ru|8|10'),
(188, NULL, NULL, NULL, NULL, NULL, 89.0000, NULL, NULL, NULL, 8, 11, '8|11'),
(189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 12, '8|12'),
(190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 13, '8|13'),
(191, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 14, 'default|8|14'),
(192, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 15, 'default|8|15'),
(196, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, NULL, 9, 22, '9|22'),
(197, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 28, 'default|9|28'),
(198, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16, 'ru|9|16'),
(199, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17, 'ru|9|17'),
(200, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18, 'ru|9|18'),
(201, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 5, '9|5'),
(202, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 6, '9|6'),
(203, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7, '9|7'),
(204, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8, 'default|9|8'),
(205, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 9, 26, '9|26'),
(206, NULL, NULL, '56544306', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, '9|1'),
(207, 'ru', NULL, 'Черный чай', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2, 'ru|9|2'),
(208, 'ru', NULL, 'черныи-чаи', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3, 'ru|9|3'),
(209, NULL, NULL, '56544306', NULL, NULL, NULL, NULL, NULL, NULL, 9, 27, '9|27'),
(210, 'ru', NULL, '<p><em>Чёрный чай</em> &mdash; вид чая, подвергающийся полной ферментации (окислению) в течение от двух недель до месяца.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9, 'ru|9|9'),
(211, 'ru', NULL, '<p><em>Чёрный чай</em> &mdash; вид чая, подвергающийся полной ферментации (окислению) в течение от двух недель до месяца.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10, 'ru|9|10'),
(212, NULL, NULL, NULL, NULL, NULL, 89.0000, NULL, NULL, NULL, 9, 11, '9|11'),
(213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 12, '9|12'),
(214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 13, '9|13'),
(215, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 14, 'default|9|14'),
(216, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 15, 'default|9|15'),
(220, NULL, NULL, '250', NULL, NULL, NULL, NULL, NULL, NULL, 10, 22, '10|22'),
(221, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 28, 'default|10|28'),
(222, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 16, 'ru|10|16'),
(223, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 17, 'ru|10|17'),
(224, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 10, 18, 'ru|10|18'),
(225, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 5, '10|5'),
(226, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 6, '10|6'),
(227, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 7, '10|7'),
(228, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 10, 8, 'default|10|8'),
(229, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 10, 26, '10|26'),
(230, NULL, NULL, '56544305', NULL, NULL, NULL, NULL, NULL, NULL, 10, 1, '10|1'),
(231, 'ru', NULL, 'Молочный коктейль', NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 'ru|10|2'),
(232, 'ru', NULL, 'молочныи-коктеиль', NULL, NULL, NULL, NULL, NULL, NULL, 10, 3, 'ru|10|3'),
(233, NULL, NULL, '56544305', NULL, NULL, NULL, NULL, NULL, NULL, 10, 27, '10|27'),
(234, 'ru', NULL, '<p>Молочный коктейль, или Милкшейк &mdash; десертный напиток на основе молока и мороженого, один из символов американской кухни.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 10, 9, 'ru|10|9'),
(235, 'ru', NULL, '<p>Молочный коктейль, или Милкшейк &mdash; десертный напиток на основе молока и мороженого, один из символов американской кухни.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 'ru|10|10'),
(236, NULL, NULL, NULL, NULL, NULL, 99.0000, NULL, NULL, NULL, 10, 11, '10|11'),
(237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 12, '10|12'),
(238, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 13, '10|13'),
(239, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 14, 'default|10|14'),
(240, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 15, 'default|10|15'),
(244, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, NULL, 11, 22, '11|22'),
(245, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 28, 'default|11|28'),
(246, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 16, 'ru|11|16'),
(247, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 17, 'ru|11|17'),
(248, 'ru', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 18, 'ru|11|18'),
(249, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 5, '11|5'),
(250, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 6, '11|6'),
(251, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 7, '11|7'),
(252, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 8, 'default|11|8'),
(253, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 11, 26, '11|26'),
(254, NULL, NULL, '56544304', NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, '11|1'),
(255, 'ru', NULL, 'Морс', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2, 'ru|11|2'),
(256, 'ru', NULL, 'морс', NULL, NULL, NULL, NULL, NULL, NULL, 11, 3, 'ru|11|3'),
(257, NULL, NULL, '56544304', NULL, NULL, NULL, NULL, NULL, NULL, 11, 27, '11|27'),
(258, 'ru', NULL, '<p><em>Морс</em> &mdash; прохладительный напиток, имеющий вкусный эффект, ягодный сок, разбавленный водой и подслащённый.&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9, 'ru|11|9'),
(259, 'ru', NULL, '<p><em>Морс</em> &mdash; прохладительный напиток, имеющий вкусный эффект, ягодный сок, разбавленный водой и подслащённый.&nbsp;</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10, 'ru|11|10'),
(260, NULL, NULL, NULL, NULL, NULL, 169.0000, NULL, NULL, NULL, 11, 11, '11|11'),
(261, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 12, '11|12'),
(262, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 13, '11|13'),
(263, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 14, 'default|11|14'),
(264, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 15, 'default|11|15');

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_bundle_options`
--

CREATE TABLE `store_product_bundle_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_bundle_option_products`
--

CREATE TABLE `store_product_bundle_option_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_bundle_option_translations`
--

CREATE TABLE `store_product_bundle_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `label` varchar(191) DEFAULT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_categories`
--

CREATE TABLE `store_product_categories` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_categories`
--

INSERT INTO `store_product_categories` (`product_id`, `category_id`) VALUES
(1, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_channels`
--

CREATE TABLE `store_product_channels` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_channels`
--

INSERT INTO `store_product_channels` (`product_id`, `channel_id`) VALUES
(1, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_cross_sells`
--

CREATE TABLE `store_product_cross_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_customer_group_prices`
--

CREATE TABLE `store_product_customer_group_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `value_type` varchar(191) NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_downloadable_links`
--

CREATE TABLE `store_product_downloadable_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sample_url` varchar(191) DEFAULT NULL,
  `sample_file` varchar(191) DEFAULT NULL,
  `sample_file_name` varchar(191) DEFAULT NULL,
  `sample_type` varchar(191) DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_downloadable_link_translations`
--

CREATE TABLE `store_product_downloadable_link_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_link_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_downloadable_samples`
--

CREATE TABLE `store_product_downloadable_samples` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(191) DEFAULT NULL,
  `file` varchar(191) DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_downloadable_sample_translations`
--

CREATE TABLE `store_product_downloadable_sample_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_sample_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_flat`
--

CREATE TABLE `store_product_flat` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `product_number` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_key` varchar(191) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(191) DEFAULT NULL,
  `channel` varchar(191) DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_flat`
--

INSERT INTO `store_product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES
(1, '56544313', 'simple', '56544313', 'Винегрет', '<p>Винегре́т &mdash; холодное блюдо русской кухни, закуска, разновидность салата, обязательным ингредиентом которого в современной кулинарии является отварная или печёная свёкла.</p>', '<p>Винегрет &mdash; холодное блюдо русской кухни, закуска, разновидность салата, обязательным ингредиентом которого в современной кулинарии является отварная или печёная свёкла.</p>', 'винегрет', 1, 0, 1, '', '', '', 121.0000, NULL, NULL, NULL, 100.0000, '2024-08-29 18:41:08', 'ru', 'default', 1, 1, '2024-08-29 19:38:22', NULL, 1),
(3, '56544312', 'simple', '56544312', 'Мясной салат', '<p><em>Мясной салат</em> представляет собой потрясающее сочетание свежих помидоров и обжаренной говядины с овощами.&nbsp;</p>', '<p><em>Мясной салат</em> представляет собой потрясающее сочетание свежих помидоров и обжаренной говядины с овощами.&nbsp;</p>', 'мяснои-салат', 0, 0, 1, '', '', '', 169.0000, NULL, NULL, NULL, 100.0000, '2024-08-29 19:50:38', 'ru', 'default', 1, 3, '2024-08-29 19:58:43', NULL, 1),
(4, '56544311', 'simple', '56544311', 'Ежик', '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', 'ежик', 1, 0, 1, '', '', '', 89.0000, NULL, NULL, NULL, 100.0000, '2024-08-29 19:55:30', 'ru', 'default', 1, 4, '2024-08-29 21:55:59', NULL, 1),
(5, '56544310', 'simple', '56544310', 'Крабовый салат', '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', '<p>Этот сытный салат с колбасой, сыром и кукурузой подойдёт к любому празднику.</p>', 'крабовыи-салат', 0, 0, 1, '', '', '', 99.0000, NULL, NULL, NULL, 100.0000, '2024-08-29 20:00:00', 'ru', 'default', 1, 5, '2024-08-29 20:00:56', NULL, 1),
(6, '56544309', 'simple', '56544309', 'Мимоза', '<p>&laquo;Мимоза&raquo; &mdash; праздничный слоёный салат или салат-коктейль, появившийся в СССР в начале 1970-х годов.</p>', '<p>&laquo;Мимоза&raquo; &mdash; праздничный слоёный салат или салат-коктейль, появившийся в СССР в начале 1970-х годов.</p>', 'мимоза', 0, 0, 1, '', '', '', 149.0000, NULL, NULL, NULL, 100.0000, '2024-08-29 20:03:05', 'ru', 'default', 1, 6, '2024-08-29 20:04:30', NULL, 1),
(7, '56544308', 'simple', '56544308', 'Кола', '<p>Кола - самый лучший газированный напиток!</p>', '<p>Кола - самый лучший газированный напиток!</p>', 'кола', 0, 0, 1, '', '', '', 149.0000, NULL, NULL, NULL, 1000.0000, '2024-08-29 20:07:44', 'ru', 'default', 1, 7, '2024-08-29 20:09:51', NULL, 1),
(8, '56544307', 'simple', '56544307', 'Зеленый чай', '<p><em>Зелёный чай</em> &mdash; чай, подвергнутый минимальной ферментации (окислению).</p>', '<p><em>Зелёный чай</em> &mdash; чай, подвергнутый минимальной ферментации (окислению).</p>', 'зеленыи-чаи', 0, 0, 1, '', '', '', 89.0000, NULL, NULL, NULL, 1000.0000, '2024-08-29 20:12:04', 'ru', 'default', 1, 8, '2024-08-29 20:13:17', NULL, 1),
(9, '56544306', 'simple', '56544306', 'Черный чай', '<p><em>Чёрный чай</em> &mdash; вид чая, подвергающийся полной ферментации (окислению) в течение от двух недель до месяца.</p>', '<p><em>Чёрный чай</em> &mdash; вид чая, подвергающийся полной ферментации (окислению) в течение от двух недель до месяца.</p>', 'черныи-чаи', 0, 0, 1, '', '', '', 89.0000, NULL, NULL, NULL, 1000.0000, '2024-08-29 20:14:00', 'ru', 'default', 1, 9, '2024-08-29 20:15:32', NULL, 1),
(10, '56544305', 'simple', '56544305', 'Молочный коктейль', '<p>Молочный коктейль, или Милкшейк &mdash; десертный напиток на основе молока и мороженого, один из символов американской кухни.</p>', '<p>Молочный коктейль, или Милкшейк &mdash; десертный напиток на основе молока и мороженого, один из символов американской кухни.</p>', 'молочныи-коктеиль', 1, 0, 1, '', '', '', 99.0000, NULL, NULL, NULL, 250.0000, '2024-08-29 20:16:39', 'ru', 'default', 1, 10, '2024-08-29 21:55:51', NULL, 1),
(11, '56544304', 'simple', '56544304', 'Морс', '<p><em>Морс</em> &mdash; прохладительный напиток, имеющий вкусный эффект, ягодный сок, разбавленный водой и подслащённый.&nbsp;</p>', '<p><em>Морс</em> &mdash; прохладительный напиток, имеющий вкусный эффект, ягодный сок, разбавленный водой и подслащённый.&nbsp;</p>', 'морс', 1, 1, 1, '', '', '', 169.0000, NULL, NULL, NULL, 1000.0000, '2024-08-29 20:18:43', 'ru', 'default', 1, 11, '2024-08-29 21:55:43', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_grouped_products`
--

CREATE TABLE `store_product_grouped_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `associated_product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_images`
--

CREATE TABLE `store_product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_images`
--

INSERT INTO `store_product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
(1, 'images', 'product/1/OGP6tgRIBl9tGhmgvZ4by3WCjVr1ixS6h8GnG8oQ.webp', 1, 1),
(4, 'images', 'product/4/Q85P0U5phBESmqEGM4HJV0SkKvzV5xOst2gQInlq.webp', 4, 1),
(5, 'images', 'product/3/RN6DSEc0qGE7szoyYM2vtUKmVHqdSJITmr3AzI0J.webp', 3, 1),
(7, 'images', 'product/5/KwkrnUyw2Ll5b5DaHYSWoQwwSsIpn99n5ISgoB4l.webp', 5, 1),
(9, 'images', 'product/6/5JDFD6CI9a5Ewc2LAdNKENhPxKUXxpDrh048bCiP.webp', 6, 1),
(11, 'images', 'product/7/WaI1zlG5xMVF6AgUdWPlQMfaN3CK6zZu9uq0u6cc.webp', 7, 1),
(13, 'images', 'product/8/OGFm4C2D5mDBfqR88QVn0dSzu7LYloNJbLbDPw57.webp', 8, 1),
(15, 'images', 'product/9/mN1X9Jw5WdhavJgsWrUUEnhPe8zuuEohAoRqkRzF.webp', 9, 1),
(17, 'images', 'product/10/80vXBsdKzkVtQUOt7O2tbSIQqgnSOBigbBVAcNYr.webp', 10, 1),
(19, 'images', 'product/11/GrFOSVGLv8gOS9yuJfVO9Lu8pv81QXIKfLEkvpa1.webp', 11, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_inventories`
--

CREATE TABLE `store_product_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_inventories`
--

INSERT INTO `store_product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES
(1, 100, 1, 0, 1),
(3, 100, 3, 0, 1),
(4, 100, 4, 0, 1),
(5, 100, 5, 0, 1),
(6, 100, 6, 0, 1),
(7, 100, 7, 0, 1),
(8, 100, 8, 0, 1),
(9, 100, 9, 0, 1),
(10, 100, 10, 0, 1),
(11, 100, 11, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_inventory_indices`
--

CREATE TABLE `store_product_inventory_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_inventory_indices`
--

INSERT INTO `store_product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 100, 1, 1, NULL, '2024-08-29 16:12:57'),
(2, 100, 3, 1, NULL, NULL),
(3, 100, 4, 1, NULL, NULL),
(4, 100, 5, 1, NULL, NULL),
(5, 100, 6, 1, NULL, NULL),
(6, 100, 7, 1, NULL, NULL),
(7, 100, 8, 1, NULL, NULL),
(8, 100, 9, 1, NULL, NULL),
(9, 100, 10, 1, NULL, NULL),
(10, 100, 11, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_ordered_inventories`
--

CREATE TABLE `store_product_ordered_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_price_indices`
--

CREATE TABLE `store_product_price_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_price_indices`
--

INSERT INTO `store_product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 121.0000, 121.0000, 121.0000, 121.0000, NULL, '2024-08-29 15:58:55'),
(2, 1, 2, 1, 121.0000, 121.0000, 121.0000, 121.0000, NULL, '2024-08-29 15:58:55'),
(3, 1, 3, 1, 121.0000, 121.0000, 121.0000, 121.0000, NULL, '2024-08-29 15:58:55'),
(4, 3, 1, 1, 169.0000, 169.0000, 169.0000, 169.0000, NULL, NULL),
(5, 3, 2, 1, 169.0000, 169.0000, 169.0000, 169.0000, NULL, NULL),
(6, 3, 3, 1, 169.0000, 169.0000, 169.0000, 169.0000, NULL, NULL),
(7, 4, 1, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(8, 4, 2, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(9, 4, 3, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(10, 5, 1, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(11, 5, 2, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(12, 5, 3, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(13, 6, 1, 1, 149.0000, 149.0000, 149.0000, 149.0000, NULL, NULL),
(14, 6, 2, 1, 149.0000, 149.0000, 149.0000, 149.0000, NULL, NULL),
(15, 6, 3, 1, 149.0000, 149.0000, 149.0000, 149.0000, NULL, NULL),
(16, 7, 1, 1, 149.0000, 149.0000, 149.0000, 149.0000, NULL, NULL),
(17, 7, 2, 1, 149.0000, 149.0000, 149.0000, 149.0000, NULL, NULL),
(18, 7, 3, 1, 149.0000, 149.0000, 149.0000, 149.0000, NULL, NULL),
(19, 8, 1, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(20, 8, 2, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(21, 8, 3, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(22, 9, 1, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(23, 9, 2, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(24, 9, 3, 1, 89.0000, 89.0000, 89.0000, 89.0000, NULL, NULL),
(25, 10, 1, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(26, 10, 2, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(27, 10, 3, 1, 99.0000, 99.0000, 99.0000, 99.0000, NULL, NULL),
(28, 11, 1, 1, 169.0000, 169.0000, 169.0000, 169.0000, NULL, NULL),
(29, 11, 2, 1, 169.0000, 169.0000, 169.0000, 169.0000, NULL, NULL),
(30, 11, 3, 1, 169.0000, 169.0000, 169.0000, 169.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_relations`
--

CREATE TABLE `store_product_relations` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_product_relations`
--

INSERT INTO `store_product_relations` (`parent_id`, `child_id`) VALUES
(1, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 11);

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_reviews`
--

CREATE TABLE `store_product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '',
  `title` varchar(191) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_review_attachments`
--

CREATE TABLE `store_product_review_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT 'image',
  `mime_type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_super_attributes`
--

CREATE TABLE `store_product_super_attributes` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_up_sells`
--

CREATE TABLE `store_product_up_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_product_videos`
--

CREATE TABLE `store_product_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_refunds`
--

CREATE TABLE `store_refunds` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(191) DEFAULT NULL,
  `state` varchar(191) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(191) DEFAULT NULL,
  `channel_currency_code` varchar(191) DEFAULT NULL,
  `order_currency_code` varchar(191) DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_refund_items`
--

CREATE TABLE `store_refund_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `refund_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_roles`
--

CREATE TABLE `store_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `permission_type` varchar(191) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_roles`
--

INSERT INTO `store_roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Администратор', 'Эта роль предоставляет пользователям полный доступ', 'all', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `store_search_synonyms`
--

CREATE TABLE `store_search_synonyms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `terms` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_search_terms`
--

CREATE TABLE `store_search_terms` (
  `id` int(10) UNSIGNED NOT NULL,
  `term` varchar(191) NOT NULL,
  `results` int(11) NOT NULL DEFAULT 0,
  `uses` int(11) NOT NULL DEFAULT 0,
  `redirect_url` varchar(191) DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_search_terms`
--

INSERT INTO `store_search_terms` (`id`, `term`, `results`, `uses`, `redirect_url`, `display_in_suggested_terms`, `locale`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'Вине', 0, 3, NULL, 0, 'ru', 1, '2024-08-29 16:16:54', '2024-08-29 16:22:50');

-- --------------------------------------------------------

--
-- Структура таблицы `store_shipments`
--

CREATE TABLE `store_shipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(191) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `carrier_code` varchar(191) DEFAULT NULL,
  `carrier_title` varchar(191) DEFAULT NULL,
  `track_number` text DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(191) DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_address_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_shipment_items`
--

CREATE TABLE `store_shipment_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `sku` varchar(191) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT 0.0000,
  `base_price` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) DEFAULT 0.0000,
  `base_total` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(191) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_sitemaps`
--

CREATE TABLE `store_sitemaps` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(191) NOT NULL,
  `path` varchar(191) NOT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_subscribers_list`
--

CREATE TABLE `store_subscribers_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(191) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_subscribers_list`
--

INSERT INTO `store_subscribers_list` (`id`, `email`, `is_subscribed`, `token`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'tsvira.yaroslav@mail.ru', 1, '66d0bedf64b71', 1, 1, '2024-08-29 18:33:03', '2024-08-29 18:33:03');

-- --------------------------------------------------------

--
-- Структура таблицы `store_tax_categories`
--

CREATE TABLE `store_tax_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_tax_categories_tax_rates`
--

CREATE TABLE `store_tax_categories_tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED NOT NULL,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_tax_rates`
--

CREATE TABLE `store_tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(191) NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT 0,
  `zip_code` varchar(191) DEFAULT NULL,
  `zip_from` varchar(191) DEFAULT NULL,
  `zip_to` varchar(191) DEFAULT NULL,
  `state` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_theme_customizations`
--

CREATE TABLE `store_theme_customizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_code` varchar(191) DEFAULT 'default',
  `type` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_theme_customizations`
--

INSERT INTO `store_theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'default', 'image_carousel', 'Карусель изображений', 1, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(2, 'default', 'static_content', 'Информация о предложениях', 2, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(3, 'default', 'category_carousel', 'Категории и коллекции', 3, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(4, 'default', 'product_carousel', 'Новые товары', 4, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(5, 'default', 'static_content', 'Лучшие коллекции', 5, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(6, 'default', 'static_content', 'Смелые коллекции', 6, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(7, 'default', 'product_carousel', 'Избранные коллекции', 7, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(8, 'default', 'static_content', 'Игровой контейнер', 8, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(9, 'default', 'product_carousel', 'Все товары', 9, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(10, 'default', 'static_content', 'Смелые коллекции', 10, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43'),
(11, 'default', 'footer_links', 'Ссылки внизу страницы', 11, 1, 1, '2024-08-29 17:51:43', '2024-08-31 16:02:10'),
(12, 'default', 'services_content', 'Содержание услуг', 12, 1, 1, '2024-08-29 17:51:43', '2024-08-29 17:51:43');

-- --------------------------------------------------------

--
-- Структура таблицы `store_theme_customization_translations`
--

CREATE TABLE `store_theme_customization_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_customization_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_theme_customization_translations`
--

INSERT INTO `store_theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES
(1, 1, 'ru', '{\"images\":[{\"title\":\"\\u0413\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/no3EikWMLgTLpr8xSDK1dW7FMBHBnBMMu7rB2vc0.webp\"},{\"title\":\"\\u0413\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/G9vnBpUUpRybDoBZPS2yQczGuVHGndiGN7robRvN.webp\"},{\"title\":\"\\u0413\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/0WCB95eAAHWJW8VpLG9a6zFGyH65yIt3NO0bq9iW.webp\"},{\"title\":\"\\u0413\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u043e\\u0432\\u043e\\u0439 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/KpttjcEnUSE8E0f0shSXaAcQLWYIJnLCtCLQmRgQ.webp\"}]}'),
(2, 2, 'ru', '{\"html\":\"<div class=\\\"home-offer\\\"><h1>\\u0421\\u043a\\u0438\\u0434\\u043a\\u0430 \\u0434\\u043e 40% \\u043d\\u0430 \\u0432\\u0430\\u0448 \\u043f\\u0435\\u0440\\u0432\\u044b\\u0439 \\u0437\\u0430\\u043a\\u0430\\u0437! \\u041f\\u041e\\u041a\\u0423\\u041f\\u0410\\u0419\\u0422\\u0415 \\u0421\\u0415\\u0419\\u0427\\u0410\\u0421<\\/h1><\\/div>\",\"css\":\".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\"}'),
(3, 3, 'ru', '{\"filters\":{\"parent_id\":1,\"sort\":\"asc\",\"limit\":10}}'),
(4, 4, 'ru', '{\"title\":\"\\u041d\\u043e\\u0432\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"new\":1,\"sort\":\"asc\",\"limit\":10}}'),
(5, 5, 'ru', '{\"html\":\"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!<\\/h2><\\/div><div class=\\\"top-collection-grid container\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/gK0eDnLf1npNwb35JVaeOwiOXCwwP3K9iT8zKOBQ.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"><h3>\\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/0OOqkv03weaX1hUZKdgTszmLhOKc7CFVsAp7zVk8.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"><h3>\\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/eogSAJJU75FcMPZyuDGic5Yryb4qthFZMhY84BKQ.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"><h3>\\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/JbUxZqUTVeeereP1KdXzt1XVTuFN0R762HjmJRzC.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"><h3>\\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/WPpSR43FwBFSfccIJy3UTEewCmMfOlgahrWVvUfc.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"><h3>\\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/ui9x41RAGnOcRzHgshqU0x1rOGF19OQiy2n4ismF.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"><h3>\\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3><\\/div><\\/div><\\/div>\",\"css\":\".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;transition: transform 300ms ease;transform: scale(1);}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 28px;font-size: 20px;line-height: 1.5;}.top-collection-grid {gap: 10px}}@media not all and (min-width: 768px) {.top-collection-header {margin-top: 30px;font-size: 28px;line-height: 3;}.top-collection-header h2 {line-height:2; margin-bottom:20px;} .top-collection-grid {gap: 14px}} @media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 768px) {.top-collection-grid { row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 0px;} .top-collection-card{width:48%} .top-collection-card img {width:100%;} .top-collection-card h3 {font-size:24px; bottom: 16px;}}@media (max-width:520px) { .top-collection-grid{padding-left: 15px;padding-right: 15px;} .top-collection-card h3 {font-size:18px; bottom: 10px;}}\"}'),
(6, 6, 'ru', '{\"html\":\"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/6\\/nl2cBm1KRToYUWM6yJHDnpuZGtmyuqKl10IkM4u1.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"\\u041f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u043e\\u0432\\u044b\\u043c \\u0441\\u043c\\u0435\\u043b\\u044b\\u043c \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u044f\\u043c!\\\"> <\\/div> <div class=\\\"inline-col-content-wrapper\\\"> <h2 class=\\\"inline-col-title\\\"> \\u041f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u043e\\u0432\\u044b\\u043c \\u0441\\u043c\\u0435\\u043b\\u044b\\u043c \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u044f\\u043c! <\\/h2> <p class=\\\"inline-col-description\\\">\\u041f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c \\u043d\\u0430\\u0448\\u0438 \\u043d\\u043e\\u0432\\u044b\\u0435 \\u0441\\u043c\\u0435\\u043b\\u044b\\u0435 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438! \\u041f\\u043e\\u0434\\u043d\\u0438\\u043c\\u0438\\u0442\\u0435 \\u0441\\u0432\\u043e\\u0439 \\u0441\\u0442\\u0438\\u043b\\u044c \\u0441 \\u0441\\u043c\\u0435\\u043b\\u044b\\u043c\\u0438 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0430\\u043c\\u0438 \\u0438 \\u044f\\u0440\\u043a\\u0438\\u043c\\u0438 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438. \\u0418\\u0441\\u0441\\u043b\\u0435\\u0434\\u0443\\u0439\\u0442\\u0435 \\u0432\\u044b\\u0434\\u0430\\u044e\\u0449\\u0438\\u0435\\u0441\\u044f \\u0443\\u0437\\u043e\\u0440\\u044b \\u0438 \\u044f\\u0440\\u043a\\u0438\\u0435 \\u0446\\u0432\\u0435\\u0442\\u0430, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0435 \\u043f\\u0435\\u0440\\u0435\\u043e\\u043f\\u0440\\u0435\\u0434\\u0435\\u043b\\u044f\\u044e\\u0442 \\u0432\\u0430\\u0448 \\u0433\\u0430\\u0440\\u0434\\u0435\\u0440\\u043e\\u0431. \\u0413\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u0432\\u0441\\u0442\\u0440\\u0435\\u0442\\u0438\\u0442\\u044c \\u043d\\u0435\\u0447\\u0442\\u043e \\u043d\\u0435\\u043e\\u0431\\u044b\\u0447\\u043d\\u043e\\u0435!<\\/p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">\\u041f\\u0440\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/button> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}\"}'),
(7, 7, 'ru', '{\"title\":\"\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"featured\":1,\"sort\":\"desc\",\"limit\":10}}'),
(8, 8, 'ru', '{\"html\":\"<div class=\\\"section-game\\\"><div class=\\\"section-title\\\"> <h2>\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!<\\/h2> <\\/div> <div class=\\\"section-gap container\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/BIWd8nKhULbZhnt4BUyezv59BteOU7J1H1Mhqgti.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"> <h3 class=\\\"overlay-text\\\">\\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/h3> <\\/div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/tCFzcgqXXsKgOefcbwHUlH020bfHlX4mskSHRNdS.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"\\u0418\\u0433\\u0440\\u0430 \\u0441 \\u043d\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043d\\u043e\\u0432\\u044b\\u043c\\u0438 \\u0434\\u043e\\u0431\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438!\\\"> <h3 class=\\\"overlay-text\\\"> \\u041d\\u0430\\u0448\\u0438 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438 <\\/h3> <\\/div> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}\"}'),
(9, 9, 'ru', '{\"title\":\"\\u0412\\u0441\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u044b\",\"filters\":{\"sort\":\"desc\",\"limit\":10}}'),
(10, 10, 'ru', '{\"html\":\"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/10\\/4ZQomRz0P7KeA9nJ4Tze6SjeFvaiWhugyMV4B5Iz.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"\\u041f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u043e\\u0432\\u044b\\u043c \\u0441\\u043c\\u0435\\u043b\\u044b\\u043c \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u044f\\u043c!\\\"> <\\/div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> \\u041f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u043a \\u043d\\u0430\\u0448\\u0438\\u043c \\u043d\\u043e\\u0432\\u044b\\u043c \\u0441\\u043c\\u0435\\u043b\\u044b\\u043c \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u044f\\u043c! <\\/h2> <p class=\\\"inline-col-description\\\">\\u041f\\u0440\\u0435\\u0434\\u0441\\u0442\\u0430\\u0432\\u043b\\u044f\\u0435\\u043c \\u043d\\u0430\\u0448\\u0438 \\u043d\\u043e\\u0432\\u044b\\u0435 \\u0441\\u043c\\u0435\\u043b\\u044b\\u0435 \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438! \\u041f\\u043e\\u0434\\u043d\\u0438\\u043c\\u0438\\u0442\\u0435 \\u0441\\u0432\\u043e\\u0439 \\u0441\\u0442\\u0438\\u043b\\u044c \\u0441 \\u0441\\u043c\\u0435\\u043b\\u044b\\u043c\\u0438 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0430\\u043c\\u0438 \\u0438 \\u044f\\u0440\\u043a\\u0438\\u043c\\u0438 \\u0437\\u0430\\u044f\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f\\u043c\\u0438. \\u0418\\u0441\\u0441\\u043b\\u0435\\u0434\\u0443\\u0439\\u0442\\u0435 \\u0432\\u044b\\u0434\\u0430\\u044e\\u0449\\u0438\\u0435\\u0441\\u044f \\u0443\\u0437\\u043e\\u0440\\u044b \\u0438 \\u044f\\u0440\\u043a\\u0438\\u0435 \\u0446\\u0432\\u0435\\u0442\\u0430, \\u043a\\u043e\\u0442\\u043e\\u0440\\u044b\\u0435 \\u043f\\u0435\\u0440\\u0435\\u043e\\u043f\\u0440\\u0435\\u0434\\u0435\\u043b\\u044f\\u044e\\u0442 \\u0432\\u0430\\u0448 \\u0433\\u0430\\u0440\\u0434\\u0435\\u0440\\u043e\\u0431. \\u0413\\u043e\\u0442\\u043e\\u0432\\u044c\\u0442\\u0435\\u0441\\u044c \\u0432\\u0441\\u0442\\u0440\\u0435\\u0442\\u0438\\u0442\\u044c \\u043d\\u0435\\u0447\\u0442\\u043e \\u043d\\u0435\\u043e\\u0431\\u044b\\u0447\\u043d\\u043e\\u0435!<\\/p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">\\u041f\\u0440\\u043e\\u0441\\u043c\\u043e\\u0442\\u0440\\u0435\\u0442\\u044c \\u043a\\u043e\\u043b\\u043b\\u0435\\u043a\\u0446\\u0438\\u0438<\\/button> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\"}'),
(11, 11, 'ru', '{\"column_1\":[{\"url\":\"http:\\/\\/127.0.0.1:8000\\/page\\/about-us\",\"title\":\"\\u041e \\u043d\\u0430\\u0441\",\"sort_order\":\"1\"},{\"url\":\"http:\\/\\/127.0.0.1:8000\\/contact-us\",\"title\":\"\\u0421\\u0432\\u044f\\u0436\\u0438\\u0442\\u0435\\u0441\\u044c \\u0441 \\u043d\\u0430\\u043c\\u0438\",\"sort_order\":\"2\"}]}'),
(12, 12, 'ru', '{\"services\":[{\"title\":\"\\u0411\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u0430\\u044f \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u0430\",\"description\":\"\\u041d\\u0430\\u0441\\u043b\\u0430\\u0436\\u0434\\u0430\\u0439\\u0442\\u0435\\u0441\\u044c \\u0431\\u0435\\u0441\\u043f\\u043b\\u0430\\u0442\\u043d\\u043e\\u0439 \\u0434\\u043e\\u0441\\u0442\\u0430\\u0432\\u043a\\u043e\\u0439 \\u043d\\u0430 \\u0432\\u0441\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u044b\",\"service_icon\":\"icon-truck\"},{\"title\":\"\\u0417\\u0430\\u043c\\u0435\\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430\",\"description\":\"\\u0414\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u0430 \\u043b\\u0435\\u0433\\u043a\\u0430\\u044f \\u0437\\u0430\\u043c\\u0435\\u043d\\u0430 \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0442\\u0430!\",\"service_icon\":\"icon-product\"},{\"title\":\"EMI \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u043e\",\"description\":\"EMI \\u0431\\u0435\\u0437 \\u0437\\u0430\\u0442\\u0440\\u0430\\u0442 \\u0434\\u043e\\u0441\\u0442\\u0443\\u043f\\u043d\\u043e \\u043d\\u0430 \\u0432\\u0441\\u0435\\u0445 \\u043e\\u0441\\u043d\\u043e\\u0432\\u043d\\u044b\\u0445 \\u043a\\u0440\\u0435\\u0434\\u0438\\u0442\\u043d\\u044b\\u0445 \\u043a\\u0430\\u0440\\u0442\\u0430\\u0445\",\"service_icon\":\"icon-dollar-sign\"},{\"title\":\"\\u041f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u0430 24\\/7\",\"description\":\"\\u041f\\u043e\\u0441\\u0432\\u044f\\u0449\\u0435\\u043d\\u043d\\u0430\\u044f \\u043f\\u043e\\u0434\\u0434\\u0435\\u0440\\u0436\\u043a\\u0430 24\\/7 \\u0447\\u0435\\u0440\\u0435\\u0437 \\u0447\\u0430\\u0442 \\u0438 \\u044d\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d\\u043d\\u0443\\u044e \\u043f\\u043e\\u0447\\u0442\\u0443\",\"service_icon\":\"icon-support\"}]}');

-- --------------------------------------------------------

--
-- Структура таблицы `store_url_rewrites`
--

CREATE TABLE `store_url_rewrites` (
  `id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(191) NOT NULL,
  `request_path` varchar(191) NOT NULL,
  `target_path` varchar(191) NOT NULL,
  `redirect_type` varchar(191) DEFAULT NULL,
  `locale` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_url_rewrites`
--

INSERT INTO `store_url_rewrites` (`id`, `entity_type`, `request_path`, `target_path`, `redirect_type`, `locale`, `created_at`, `updated_at`) VALUES
(1, 'product', 'картошка', 'винегрет', '301', 'ru', '2024-08-29 15:56:10', '2024-08-29 15:56:10'),
(2, 'category', 'салаты', 'salads', '301', 'ru', '2024-08-29 16:27:13', '2024-08-29 16:27:13'),
(3, 'product', 'копия-винегрет', 'мяснои-салат', '301', 'ru', '2024-08-29 16:52:08', '2024-08-29 16:52:08'),
(4, 'product', 'копия-мяснои-салат', 'ежик', '301', 'ru', '2024-08-29 16:57:30', '2024-08-29 16:57:30'),
(5, 'product', 'копия-ежик', 'крабовыи-салат', '301', 'ru', '2024-08-29 17:00:56', '2024-08-29 17:00:56'),
(6, 'product', 'копия-крабовыи-салат', 'мимоза', '301', 'ru', '2024-08-29 17:04:30', '2024-08-29 17:04:30'),
(7, 'product', 'копия-мимоза', 'кола', '301', 'ru', '2024-08-29 17:09:51', '2024-08-29 17:09:51'),
(8, 'product', 'копия-кола', 'зеленыи-чаи', '301', 'ru', '2024-08-29 17:13:16', '2024-08-29 17:13:16'),
(9, 'product', 'копия-зеленыи-чаи', 'черныи-чаи', '301', 'ru', '2024-08-29 17:14:59', '2024-08-29 17:14:59'),
(10, 'product', 'копия-черныи-чаи', 'молочныи-коктеиль', '301', 'ru', '2024-08-29 17:17:53', '2024-08-29 17:17:53'),
(11, 'product', 'копия-молочныи-коктеиль', 'морс', '301', 'ru', '2024-08-29 17:19:44', '2024-08-29 17:19:44');

-- --------------------------------------------------------

--
-- Структура таблицы `store_users`
--

CREATE TABLE `store_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_visits`
--

CREATE TABLE `store_visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(191) DEFAULT NULL,
  `request` mediumtext DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `referer` mediumtext DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `useragent` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `visitable_type` varchar(191) DEFAULT NULL,
  `visitable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visitor_type` varchar(191) DEFAULT NULL,
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `store_visits`
--

INSERT INTO `store_visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-29 15:24:55', '2024-08-29 15:24:55'),
(2, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Ik9xVXA5YmRsT1NaN1pzekgzRS94MFE9PSIsInZhbHVlIjoiVXNUR2YxSFBhQ3NMU29VdjdOWXY5Nit1SlIxdEppU1F5dFcvbUk4K0dQb2lmUkd5UUUzWEtJdmluY2dJWHdZbTBRTUF1L1AwQklLZ00vbU9HVmZVQkhta2hFcS9ITVlUWTAxaC9qOUpDRnFhYmh4MjZSb3cwdkV6RXdjOGVjR2EiLCJtYWMiOiIyNDg3Yzg5ZmJmOTgyYWY2OGFlMTdiZjlhNWZhYTI1Yzk4NWUzZjUyN2ZkZWNmYTE4NTlkZjdmYzNjODlhNWVhIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6Im9WYllNVVY3MXhvZDhjMUhtMDNJNUE9PSIsInZhbHVlIjoiY0lVMXBJRFNJanB5MGhFKzBLcDZYN1BCcytVS09qL2dXak5XUkhhdGVTcmw5QlRCaXZYRVNIVkRKTVJ4SlNmaVpac096dE84L21WMzl2SElqamJtbGthSDk3QU16dUFHZm9WN0dNdXZmVEIvWSsyUzVqMVNTMUhDcmwzbTNhNG0iLCJtYWMiOiJmNzk1ZjhlOTQzNDhlNTNlMGVhOGZhZmM3MGNkNzhlYzU5MmZiMDM5NzFmNDE3ZDE2MDRiMzRjM2M4ZmYyOTI0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 15:47:16', '2024-08-29 15:47:16'),
(3, 'GET', '[]', 'http://127.0.0.1:8000/%D1%81%D0%B0%D0%BB%D0%B0%D1%82%D1%8B', 'http://127.0.0.1:8000/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkJnWFFHaWpPUG00RjZiNkZxOVV4RWc9PSIsInZhbHVlIjoiK2R1RlM2S1dGemhocGNsaFFhbE1SMlFaN1h6WWxYOE1GYWk1VkhpbWMyV2hEMmgzMWxjNTlBTUJEbXpnMDFTaXBYNUJYdTNyMFNZVjVvTmJyY3hMV2h0YnQ5bHZQRllCU3NjcE9CNEJROUdnSDhTdy8wZ1BwZFVHVGdGK1VPTlciLCJtYWMiOiI2ZjM0OTRlMDc2ZWQzZDRhNjFhM2NlY2FkZDFhZThiYTJkYzFiMjU2NTNjYmYyMmM0MWUzMmVjMTFhZGNlY2E4IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IngvYzZTMkpSeTAzbURRbHhWWmhmZ1E9PSIsInZhbHVlIjoiMjFuZGRpYmw2WmZKbFdUMUEvaC93NllqanVGL2piYlE2SWZERkhacUxMZmZ0cStuU2k5T3ljN2V0ek1QTlFlS296ZElzZVRxUjlzN281YVk1dmtQRzltWWpPdVMvbm5IUWFPeEJsNFY2bXl0WFlXTW8zbHR2eUlWbjBidWZ3ckgiLCJtYWMiOiIzYjIzZThkNGJhM2JlNDEyOGU5MjU4MmQ4NGU3MTI5NDM5MDliY2I1ZWJlNzQyZmVlYTY2YzllOGYzOTViYzFkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 15:54:12', '2024-08-29 15:54:12'),
(4, 'GET', '[]', 'http://127.0.0.1:8000/%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8', 'http://127.0.0.1:8000/%D1%81%D0%B0%D0%BB%D0%B0%D1%82%D1%8B', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/%D1%81%D0%B0%D0%BB%D0%B0%D1%82%D1%8B\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlM2VlFJNjBhekVaZ3lDckhDTHF2dlE9PSIsInZhbHVlIjoib3VaOEh6U25NYW9HdzJ3ZjVCdDZ5OXJuN1pBWFRuR285cHNCSk40bjJkSGVtRW9LYVg3VjNvcnh4T0EydGMyaVZxSlVqRmR1K0Z3NVBxcWFRK3kxc1hobmUwR2IxR1N5azd2d1JjRklYMmdwRWcwNkNqcC9HWXlyTVBYOTVnMzAiLCJtYWMiOiI5NTAzYzFlY2Q5OGU1ZThkNTM0NTIwNjdlZmVhY2JkODRjMjI2NGUxZGU4YmNiMWVmMGJkNWI4ZGUyNjEzOGIxIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjdIdlFYR0VieHNCemljUVdzSW8xNXc9PSIsInZhbHVlIjoieHZLaEV5d2RUQUtsbWZGMFlta1Y3N3dkYWlFMFpXNEJqY2x1SXpZZXlrOVROakFCV3luTzJWaTFwMXJoRmtON2pPNCtNUlZDczhzS3prKzcvM3JSWlJzbldwWXZVcnA3bVRsejhYclBVL1I1cnUvaU5zN0Z2QTVkZGE3QTJvNVciLCJtYWMiOiI4OTc5N2Q2ZjU2MjIxNTMzNDA0NTcwNzIxMzc1ODZmM2YxNzU5Njc5YzNkODgwNDM3Yzg0ZTVlMTk3MzY1ZmQzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 16:02:20', '2024-08-29 16:02:20'),
(5, 'GET', '[]', 'http://127.0.0.1:8000/salads', 'http://127.0.0.1:8000/%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Ik9YSSs2RDEvdkFkWjNiajh1SjBCY3c9PSIsInZhbHVlIjoiSGM5ZHE5d3dTdy90NkVBZjBTblFtUG50MHUzTGluRnNTdkRKd1QrdjVoNzBudWZ6TGN6SzdyenlLeis1dTBjOFhndkRmcHAvellRR0s4U0xxclcyc0hHNktya1VZbi9PTkNTem5Yc0Y0eEhidmRIT2hNR1VQaDhPZFNZbW5udFciLCJtYWMiOiIwZDYyOWFiNWRkYTQ4NTU2OTc2ZTU0NWRjOWFlYzlhNGJkM2RhODIwOTFkMWU4OThlYjEzNGY4NjNjOWI2ZDhjIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InlJeS9XMmV6aWIvU0JqdVFrT0lEbFE9PSIsInZhbHVlIjoiVU9MNCt0RjFuc2ZzMGVPNE9Mdm5Nem9MMjlQMVRHUzFkY2l2Um1iM2JDVDArM0E0QXpyZklZTXdVV0UxZmlPU1lldklLRzhMZWFBT09WaWRDdHhmYlpWYkpFaDZYOWg0MFpDMUwwRkxZL2ZFakorNklPd3QrT2g3a0FteEpaOWIiLCJtYWMiOiJlMmQwMGQ5MDVjZWM4ZWYyNWRiYmYzMWRlOTA4MjQxNWM2MzE3MmRjMTg1ZTRlZTIyNTBkNmQ3ZGU1ZTRlMjI3IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 16:28:30', '2024-08-29 16:28:30'),
(6, 'GET', '[]', 'http://127.0.0.1:8000/%D0%BA%D0%BE%D0%BB%D0%B0', 'http://127.0.0.1:8000/%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IjRSYmNGUDBUQTVhOFlvK0h2UzhGbmc9PSIsInZhbHVlIjoiN25HRFNsQzZNZ2RuNWtYeUY0a1JDeFNCcEdMQ2txUS9mMXlKRkViMzFBS2hreXZXNkk5eENlbTFXRjl1a2RSS1NienExQzV0SVhQbDRvdzdySUJUbmNYR283YThGRm82QmFJZGRuSEQ2NVFFVUZlUElSR0J6MFRTam56azBabmMiLCJtYWMiOiIwZDEzZGMwZWQ4NmJmMzVjZmVjMmY0NmVmYjE3OTlkODJhOWJjOGQ2MmNhNjZiOGMxNmNhYmFkZDBhZGUyOTljIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6Ik1nMnZySUYyWXVJM2lxaVNIdCtDWHc9PSIsInZhbHVlIjoiMllmTU1VU3U4QUtXT3YzVmtZOXpaVE5rSHhzRkdrNk9sT2wxd1NybzdpZS9maSt4V1JFbUE4N3ZwSkhndHVVTmhMR0R2aXVCczVSZjk0eXJJMkVjWXZ1YW5iL2dzTERHY3VUUmxaVE83SnJ4bWhYOHRwMWEyYUt1elJFc1dYb2YiLCJtYWMiOiI1ZTFiYzhkZmZmMTNkZTAxNTA5YmM1NzNiMTFhZDllYzU2ZjY5ZjZhYWY2ZTM1ZDcxNGZjYjM3NjVjZGE3Njk1IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 7, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:10:53', '2024-08-29 17:10:53'),
(7, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/11/GrFOSVGLv8gOS9yuJfVO9Lu8pv81QXIKfLEkvpa1.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IjlnbVpBQVNLT2ZZbnZlT2lHcDFFTVE9PSIsInZhbHVlIjoicFVGazZrdjVhdWo3UUw1NGdVMWx3YkZlY3pjTVd4dCtJOEgvcWdvSE1URFdHWTlDM0hReEdkSE1vbmJQaFp1Tzl5c2dnbUhMOVpIU1JRQWF1MFJMUzRQM2FBd2JZZStYclUvRUxrQkllUDJCQ0pWYVExMkMyRmJ0TkY0UUJyL3UiLCJtYWMiOiJlZmM0NmM0MTFjYTQ1NzM1OWRjOGY3OWUzZTkxZGMwMTc4ODliODU0MTEwMjEyY2UwODAxZGUyMjIwYTNkNDA0IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InE2Z0hrUTN5d09aMHZFZDFiTVoyNmc9PSIsInZhbHVlIjoiQW12aXRhYnFhM25KcUhDZ3FFbkk3WXM5NHhEUlVKS3hKYWVtNjkvV1hwaDVyYzZCUmlPMHJqZVlObWs3cGFOVVpROUdGeVB2anh5MWU0SkcyMk1kSjZabXRndDBra0JZYjF6ZXVwRnJLVTZMYUhmU1QraGhJbU9mRTJ1N1dHOUMiLCJtYWMiOiIwOTk3Yzk3MTc3MGZlZmEwYmMxNmY3MmNkMjQ2MTNmMmRmZmM3ZmY5YTNkYTRmZTQ3ZWI2Y2UyNmUyNjEzYTAzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:17', '2024-08-29 17:46:17'),
(8, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/10/80vXBsdKzkVtQUOt7O2tbSIQqgnSOBigbBVAcNYr.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IjlnbVpBQVNLT2ZZbnZlT2lHcDFFTVE9PSIsInZhbHVlIjoicFVGazZrdjVhdWo3UUw1NGdVMWx3YkZlY3pjTVd4dCtJOEgvcWdvSE1URFdHWTlDM0hReEdkSE1vbmJQaFp1Tzl5c2dnbUhMOVpIU1JRQWF1MFJMUzRQM2FBd2JZZStYclUvRUxrQkllUDJCQ0pWYVExMkMyRmJ0TkY0UUJyL3UiLCJtYWMiOiJlZmM0NmM0MTFjYTQ1NzM1OWRjOGY3OWUzZTkxZGMwMTc4ODliODU0MTEwMjEyY2UwODAxZGUyMjIwYTNkNDA0IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InE2Z0hrUTN5d09aMHZFZDFiTVoyNmc9PSIsInZhbHVlIjoiQW12aXRhYnFhM25KcUhDZ3FFbkk3WXM5NHhEUlVKS3hKYWVtNjkvV1hwaDVyYzZCUmlPMHJqZVlObWs3cGFOVVpROUdGeVB2anh5MWU0SkcyMk1kSjZabXRndDBra0JZYjF6ZXVwRnJLVTZMYUhmU1QraGhJbU9mRTJ1N1dHOUMiLCJtYWMiOiIwOTk3Yzk3MTc3MGZlZmEwYmMxNmY3MmNkMjQ2MTNmMmRmZmM3ZmY5YTNkYTRmZTQ3ZWI2Y2UyNmUyNjEzYTAzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:19', '2024-08-29 17:46:19'),
(9, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/9/mN1X9Jw5WdhavJgsWrUUEnhPe8zuuEohAoRqkRzF.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IjlnbVpBQVNLT2ZZbnZlT2lHcDFFTVE9PSIsInZhbHVlIjoicFVGazZrdjVhdWo3UUw1NGdVMWx3YkZlY3pjTVd4dCtJOEgvcWdvSE1URFdHWTlDM0hReEdkSE1vbmJQaFp1Tzl5c2dnbUhMOVpIU1JRQWF1MFJMUzRQM2FBd2JZZStYclUvRUxrQkllUDJCQ0pWYVExMkMyRmJ0TkY0UUJyL3UiLCJtYWMiOiJlZmM0NmM0MTFjYTQ1NzM1OWRjOGY3OWUzZTkxZGMwMTc4ODliODU0MTEwMjEyY2UwODAxZGUyMjIwYTNkNDA0IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InE2Z0hrUTN5d09aMHZFZDFiTVoyNmc9PSIsInZhbHVlIjoiQW12aXRhYnFhM25KcUhDZ3FFbkk3WXM5NHhEUlVKS3hKYWVtNjkvV1hwaDVyYzZCUmlPMHJqZVlObWs3cGFOVVpROUdGeVB2anh5MWU0SkcyMk1kSjZabXRndDBra0JZYjF6ZXVwRnJLVTZMYUhmU1QraGhJbU9mRTJ1N1dHOUMiLCJtYWMiOiIwOTk3Yzk3MTc3MGZlZmEwYmMxNmY3MmNkMjQ2MTNmMmRmZmM3ZmY5YTNkYTRmZTQ3ZWI2Y2UyNmUyNjEzYTAzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:21', '2024-08-29 17:46:21'),
(10, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/8/OGFm4C2D5mDBfqR88QVn0dSzu7LYloNJbLbDPw57.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6ImRtVEtEekpQY0hhNXovd0JncXQ2cHc9PSIsInZhbHVlIjoiQmJZWm14WTk2UEZ5dkxYcHNCUzYvWW0veDU5OUN4MThYbTIzWVg3RGxka2hNY3ZkSlo4bXpGOXZ0eWp6KzFoa2JVaW9pTDVVZFB2RXpkWWpJUkdJa2NxZmwycktXdlVlU083QWZDWVJraDdRdXE0NG5DNHBIcnErNGgrVU0rR0ciLCJtYWMiOiJiYzMxOTNjNGY1MzdmNjg4NzFlN2UzOTE2NWUxMjU1ZjU4OTNiZWY4MTc2ZTBjZGFhMjI0ZDdhYTdmNmJkYjM4IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6ImNkV2p1bjhIdUlYSlRkYTFtUkQ4eXc9PSIsInZhbHVlIjoiMlcrOEtjUXJkM3NvYnpHNFROazJMdDk1TldkQXp6dEZraDFzdFVvMi85NVp0a3FDK1ZCWkhCU004UmZXMEcvVHRpTzRkK1ZoSmZQSzdRQThoWU53MGFjcFUzWFlrZnNvSEx3bGFSQ3hHUEpDNjRMN1FVbUdkZWxuTDl4dmVMQ2giLCJtYWMiOiJiOGNiMGM1NGIyNjE0MjQ5M2YxOGI2NzVmNWZhZWQ1MmVhNWM4OGJlM2Y4OTkzZmQ1ZmViY2Q1MmIwYjUyMTI5IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:25', '2024-08-29 17:46:25'),
(11, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/7/WaI1zlG5xMVF6AgUdWPlQMfaN3CK6zZu9uq0u6cc.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6ImhRWWVDZGdOZ3ZlSC9aVmNVTVNUaWc9PSIsInZhbHVlIjoiWE96R0NxWFAwMWt5MFl1QnNqN3RrVUZXdDRNZEl0b1NVLzBkZkI0UXFrN3FxZ2I2b1NpL1dnWTFxcmNQUFkzTmI4MTBTeTNsejkrSWNMZ21FNnNMbTZoek1pVldQbDAvV3JjSjZMRXpFdWRYa0FYTGcvVzFIVnY2SWNyWFpjSWMiLCJtYWMiOiIzOTQxNTQyYTc3MGVlZmE0MzA1YjUxYTUxODRlZGE4ZDU3YTY1OGMxMWI4MjEyOGNjM2FlZjI1ZDIzYjQ1NGYwIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IkJETTZKQXdlaFg2aFNVWlJWS3NIUnc9PSIsInZhbHVlIjoiUjR1UGlTdGY2MGVaczZja2RsemN0elErSnkwWTNHVEpqc1RHOHNlS0tOM25TNVB1RXFPUzlPSjdwYzROZ0s4WE9POFR6S1lKczk5Tkd2cTMrcCs2RlNWSGhWSG9RVE5iSGNHMXgvejNtRkc4QlZFUHJWR0crekY3RUdyblFyQ2EiLCJtYWMiOiI4OWM3MjBjZTU0ZjQ2YTkzY2Q3ZDhkYjM5Yzk5YWI3NmU3Y2FjMDQ5NWE1MjIyMmY2OWYzNDViY2NiOWVkMWUxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:27', '2024-08-29 17:46:27'),
(12, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/6/5JDFD6CI9a5Ewc2LAdNKENhPxKUXxpDrh048bCiP.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6InM0VC9VYzdzUlRYZ052MUdza1lyeVE9PSIsInZhbHVlIjoiNk9EY1BLR2QxclhGUEZKQkQzaWViUnQ4b3pVcitMbSszUWFlWnN6YytvOWRQNkxhYTdNSG13aEh2QXJoOTF3NTZoV0FKTExUZVVuemZDMFZ6ZlN4NEpiWi9GWkFvVHlvRmFmZ0F2eXpLQjVjL2x3eERQRkJFb0hkd1ZSNG1rZDIiLCJtYWMiOiI0NjI4MDE4Mjc0Njk1N2QwMjFjMDhjNTY2NGM5ODJkZWVmYWJjYzI1MzUyMzIzZTBiYmY5NmQ0OGE5Y2U5M2FiIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InV0aWF6TEQ2SDVNdXI3QVFUR2hSanc9PSIsInZhbHVlIjoidkJuNnJoeFpPcXk1bnVwcjFLaFVIVGV3d2xjcmtFL1BjMUhBdDg0Q1FoMi9rY3VNYkIxTVdLRE5VdkV4TWs5b1E1UEJCZnJBQWVLcWpJTmk5SXJkTUdKTXRvckZoM1h5RUoxZjU5WWNGanJRcUtNSEkzODBid0xLYkRzNEZFd08iLCJtYWMiOiI4ZDFmNWI1MTVlOTRiNzRmZDYxYzAyOTY5MzVhMTdjOGQxNGVmNjg0NGNhMDdkNDVmNzM4MTI0NThmMjExNTUxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:29', '2024-08-29 17:46:29'),
(13, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/5/KwkrnUyw2Ll5b5DaHYSWoQwwSsIpn99n5ISgoB4l.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IlNrbzMwZ0hkTTNHM2pVY2FaVEhQK0E9PSIsInZhbHVlIjoiN2ozS2Y1d29HQThwWG5OeGRpUzRkVnpjdzZFY0hjQ1dvWWYraFA0NDM1ZHFIMVFxUGdaaWRWT0FWaHZkR1UwQ0dkaS9OTHduanJPYkVEQ0xhdEhobHYvMmYvdU02Y0l6a2lOdjRTZHFIZ2VqSWd4b0pDWUFJVTFOc1NaM0xrYUwiLCJtYWMiOiI0ZTAzYzgzYmUyZjE0NzBhNmQ0YTQxOTk1NjIzY2YzMTYxZDYwZjk1MWQwNDA2NzVjZGIwMTAxODA1NDkyMWY0IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InRkUXlpQkY5bU1wYStqOXhjeVVHaUE9PSIsInZhbHVlIjoiRjhkSWEwRHE2WG51UHlrQ1BCMW5PdUE3V0sveEVaODhTNGMvYmQxQ1krcDJCMWdqQ1gyY3Jhc2dsOUVUOERpcjZ3S1RUSDZ0U05XU0hxSkZWYlpEekZRZ3dQREY5Mmc5U3Z6TjN0TlR6RWJTNjF5NFNrdlYrYjlGRVVRVFRTcFMiLCJtYWMiOiIyYzFkOGFiYTUzODhiNjkxZGZlMzljZWYwYjA2MjhjOGYwMjU0NzNhMWVhOGM2YmNkMmQxNjAxNWU0OTk0MzY4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:34', '2024-08-29 17:46:34'),
(14, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/4/Q85P0U5phBESmqEGM4HJV0SkKvzV5xOst2gQInlq.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IlZBb0h2OTd1ZFRKaGxaMlBRYnJvOXc9PSIsInZhbHVlIjoiL0xuUzg1WTdvNHdOTUFQY2JEbHZ3SVdTT1ZURUVnMzlOemNMejVZeG1ocmk1cWg4UFhpbkJnWWRValF0dHM2a3hyNHloYTlBdnF2MHgzeThTNk1nWTdkS3UvV3F0N3ZtaDcyR0VtOGFDVDhPS0w2NkZzNllBcFptMWVyVS9mVW4iLCJtYWMiOiI0YjZmYjg5MzkzM2ZhNzA5MzhkOGNiYTNlNDlkODViOWNhZmNhYTk1ZDM5NmViMjRmNjhkYjA4NmYzNDFjMzA2IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjhJdVBkY0NKM1hmdXFTejRPeTJJZ3c9PSIsInZhbHVlIjoiZmhlK1VSKzRNQzRTK0tReSsxMmZETjVKZ1FJZ0VlblVJcTI1c2VGRDNnVS9VM01uK1dEQVpyWFQ3c2JqMGpEb0ZWQk93WGN6eCt0dW9mSW5YL0lUSmhiVFk0bVhLY0V5UzVSQzhid293SFdCUWtPc0t1L1hnWmM0TC9GQWZKRWMiLCJtYWMiOiJhMjZlZDVhN2QzNjk1NmY2M2NjYWFiNjhmNmM1YzI5MmFiYTMyMWM1MzQzMWQxNmVkOGM2NzA0ODBjZDg3Yjg2IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:36', '2024-08-29 17:46:36'),
(15, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/3/RN6DSEc0qGE7szoyYM2vtUKmVHqdSJITmr3AzI0J.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6Ijg3QVo4TTBPclY1WDRaaUx6Mno5ckE9PSIsInZhbHVlIjoiTXV4eXFyK3dMQ1NNSy9zQndDV3hzcFlwbmFwQ0xiUEdyaE1EOXJEUU5OSlBSNHg2Wk44YncwdU9pcG5CSjh6Wnl0aHdZUDVNRnVHRXNKd0tleUViSTJSK0E3MmlJSGRZdTRkWGczQkVQWjJicWZ2elNqdTl0Y1RqNGNXZVBNdjgiLCJtYWMiOiI4MGMxOWQwMzhlZmRkY2UyZWNmMGRlNGY0NGYzNmQ4YjVhMGFmODFmOGNhNzg5NjRkNmRlZDc2Yzk0NWU1NzIyIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IldOV0JhK3RPL3UzWnhUU0t6RWpRY1E9PSIsInZhbHVlIjoiRHRwZVJxZmg1aDFobkhBeUZXdDJhWHJ5N0xjNnFMS3ZmVG92ak5MTDJSOHhpUE5TSlZMblBIZ3R5SE5EZzdwZm4yRDZpOEFRQnNMdEhZeUlEb0kxMEswcDJXck0yKzB2bm5NREtZekorQVpEVHRFRTZZMmxyQmt2aThjdGROb3giLCJtYWMiOiJkMTU0YTRmYjFjNjA0ZDdmNjhmMzI0NTVhNDExMTUyOTY1NGQ2ZThjMjFjYWQ0YWYyZDI0NzcwY2VmNGIzNDg4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:38', '2024-08-29 17:46:38'),
(16, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/1/OGP6tgRIBl9tGhmgvZ4by3WCjVr1ixS6h8GnG8oQ.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IklCM0h0VTdoclRXd3JKVXNTZFJqYXc9PSIsInZhbHVlIjoiN0p3anduNXI5MVNDcGI5Zk9SMkEyekoyWHFyTm45YmlHdjFRNXVFVjF4T3A3ankwN0wrWjRJNEt0S1pROXoxdnBlQVNZQnQ3TkU0ODJJUlVObjlYd0xYMDBBVHZTbGovSE1Pd0UxSzhmMDJJRDN0aFM4Mi84bXkwU205d2NOV2wiLCJtYWMiOiI3MWI5ZDE1M2FlNTQxNmFiNTU3YWZlYjc1ZDk2ZjhiNTE1YTU1MDlhN2M1ODRmOGMyNzEwZGNhMDc3NzAyYzIxIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InMyaEFWWGpzOEtiTGJZYlJRa0JZUmc9PSIsInZhbHVlIjoiYTJnaXhFMmZsaUJtaHo5VTNVWXRTS2ExNXpwNlJxNURaZm5LWE4zM0hmekVZMThjMnV0d1ZKMDNzMTV6cnZxTUVlQzM5T0tVY2Q0YVFPMm0vRHpBS1JKbkhha0N2MlI2MXMvalpOOTM5aVJmaFR4Yysyb1pXUnNRaEp3TGNPd3YiLCJtYWMiOiJkMGUzOTFkOTE0ZGQ3MzAxZmU4NjIxMDY1ODliMjE3ODlkODE0YWY5YWJhNjY5NTk2Y2EzOWVlYzYzOTUyMTM0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:46:41', '2024-08-29 17:46:41'),
(17, 'GET', '[]', 'http://127.0.0.1:8000//storage/product-search/KyJLtDEByU8j50jj3I0oBKRHNOUl76yRIgKiAxu7.jpg', 'http://127.0.0.1:8000/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IkNzdXZlVkVKbmE0MXU3NDY1NTE1Y0E9PSIsInZhbHVlIjoiV1ZWQXAxQ0dSdHpzeURNUTJNZUJyRjVGSUZzV0Q2WWk5eHF4OVNVQXJIekRnM09rYVRKSm4yZmt3NnRRcHZhRy9xU3VHYjg4c3AzU0hrams0MTlPNUtOczFQMkZQT3E5bE5hWU8yS2hlMFpyQjgybG8wendWNzhWbkNNRW0wcXoiLCJtYWMiOiI1ZDM5YTNlMDY1YmMxNmU0NGRlNmRmNmI4NDMxOTY5OTFlMTVkNDc2NDUyNmMyZGVlNGQ4NzI0ZjEyM2YwYzU0IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InUvMkttVGlXcDN4eGl3TEl5R3Biemc9PSIsInZhbHVlIjoiWlJaS052NnpURm1WY3B2dDFBd2l3ZlBTTWRBemNGQmJKQkRZa29EOTBMNkNjbGNwWUoxenczRzJya2JNZDhMTWpETHVzbzFBazM0LzFCUXhkTGs4OEF6dm5aVFdDd0k5VE5zRlljYWpwOTVZVVlsMjhxYVBnTmVwUE5XbVhaOU4iLCJtYWMiOiIyNTYzMDgwMmRmZDFiYTU4N2I4NmRjNjI4NWJjNGI5NDgxNjEyNWQ0OWExZDg0Yjk0NDgxYmIxMzFiODQ4MmVkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-29 17:59:04', '2024-08-29 17:59:04'),
(18, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; storetest_session=eyJpdiI6IkI3U2czdlcrdm9IQzFSbm1HMVVCL0E9PSIsInZhbHVlIjoiQ3k2WlBZbXEwdDhpc05IOE9sbFdrVzM1NUt4UUV3Z25mQnF0VlFXVmhkc0cyL3Vad20xZWxzU3VDZHo1eEE0a2h6WVA4UWdxMjJrMzlMb1VpYVVtQk5aRHZDQlFJS2UzK2tuMnF5WUk2YUVqM1d5KzRRU3hRTWNnOSsvc3FGN0IiLCJtYWMiOiI1ODVmYTk3N2U5NmYxMDZhY2Y2MTVlYTlkYTk4ODI2OTg0YWI1MWM1NWMxODZhNjE0OTUxMTk0NGJhZjQ5OWYxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 13:31:59', '2024-08-31 13:31:59'),
(19, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/10/80vXBsdKzkVtQUOt7O2tbSIQqgnSOBigbBVAcNYr.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IlFLbE5nckdIbWRwcTB4NUhoZGtsOHc9PSIsInZhbHVlIjoiU1NXanN1d2dmd1gybThNWjEwckZHc1BybTU2TGJhWGJYU3RRZnVRZFBDYURzL3RWVy8xNnVpODh0cXQ0VS9WbTZBRmVUdFZlZ2dHRlBBTGErTnFFUWhuNkhZdm5WNGlmelFFdk5XZlFVMEdVYU1LQ1pudUpIMXpiTTZ4b1E5ajciLCJtYWMiOiJhNDhjZjBhOWJhZTZlZmQyNjU0MmEzYjM4YWI5ZDE3ZjAwMjFiMTEzMDYzM2Y5OGE0YzkyMWI2NmE4OTY3NTg4IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjVBU3ZER0V5MVpTOFdWQ2QySkVjK3c9PSIsInZhbHVlIjoiTC9ka2xBS1NYTURadFVxRktucnllSjJjMlE1TlhyTkFwU3ZEeHJxcklqNFFZSm1mbUFOZWdTcXZsOGloeW5Jb0NtTWhCRW5kODZJQitWdURaWDZpVXZQQVZNRHhhYkh0RnUyTDRweFk0NDdqMkpFWVJaV3gzYVU4a3NXQmZnVXUiLCJtYWMiOiI4ZTg5ZTdkZmJhOGYxOTdmNjQ3OWRiYmY4ODMzMTc2NzUwYjgyZDVjNzJmMzdkMjdlZGIyYWU4NjdkMzI3NDcyIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 13:41:49', '2024-08-31 13:41:49'),
(20, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/4/Q85P0U5phBESmqEGM4HJV0SkKvzV5xOst2gQInlq.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6IlFLbE5nckdIbWRwcTB4NUhoZGtsOHc9PSIsInZhbHVlIjoiU1NXanN1d2dmd1gybThNWjEwckZHc1BybTU2TGJhWGJYU3RRZnVRZFBDYURzL3RWVy8xNnVpODh0cXQ0VS9WbTZBRmVUdFZlZ2dHRlBBTGErTnFFUWhuNkhZdm5WNGlmelFFdk5XZlFVMEdVYU1LQ1pudUpIMXpiTTZ4b1E5ajciLCJtYWMiOiJhNDhjZjBhOWJhZTZlZmQyNjU0MmEzYjM4YWI5ZDE3ZjAwMjFiMTEzMDYzM2Y5OGE0YzkyMWI2NmE4OTY3NTg4IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjVBU3ZER0V5MVpTOFdWQ2QySkVjK3c9PSIsInZhbHVlIjoiTC9ka2xBS1NYTURadFVxRktucnllSjJjMlE1TlhyTkFwU3ZEeHJxcklqNFFZSm1mbUFOZWdTcXZsOGloeW5Jb0NtTWhCRW5kODZJQitWdURaWDZpVXZQQVZNRHhhYkh0RnUyTDRweFk0NDdqMkpFWVJaV3gzYVU4a3NXQmZnVXUiLCJtYWMiOiI4ZTg5ZTdkZmJhOGYxOTdmNjQ3OWRiYmY4ODMzMTc2NzUwYjgyZDVjNzJmMzdkMjdlZGIyYWU4NjdkMzI3NDcyIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 13:41:51', '2024-08-31 13:41:51'),
(21, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/11/GrFOSVGLv8gOS9yuJfVO9Lu8pv81QXIKfLEkvpa1.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6Ikx1azFOaDJ6bmZuL0NneU1lUWlVcUE9PSIsInZhbHVlIjoiUUxJanRPUTRnN1Vpb2xqS1h4KzQ4QkJDRGQxTUR2NzltdHhKbDF3bzlBa25wTzVKQ3NNT3dtRXFsaTdqc1NVa1JtdkNFZzVISmxQMlFBYWdPL09NUE9RZkQ0WXR1bjd5OVBqaXYwVTZ2MnJXdkxiRnFlREhXWXRUU25wVURhMXQiLCJtYWMiOiI0YmUzYTRjOTE4ZjNkZGRkYTgwOGE1NGYzYjViN2NmMDk2ZGZhZmRhNWQ4NWFjODMxZmQwZDVkMjZlYmFiYzMyIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjNoQUVVN3dCcDAzTHJqWmZ3N2NBdXc9PSIsInZhbHVlIjoiOU4ySHR4QXNTS3JNRVBvTlY5SXBaNWROZWc5UjFwWkR3ZkpPbEZ2UGlkbHZvQU82K252Rlk1N2FydDh2RmtVZ2xFTHlra3JnKzI3eHF0YnZqcC9BYkxZbGxmRHNGK0pZVnBjdXhYVldjSGpxV1lpbDU0blJqclJmZVNVVERHb2oiLCJtYWMiOiJiZWNiZWI4ZWI4YTUwMjJlMjFjOTMwZDk1YTUzZTYwZmU4MWZhNGYyOWVmMmE5MDA3ZmNkMDk2ZTMxZmQ4YmVlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 13:41:53', '2024-08-31 13:41:53'),
(22, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/6/5JDFD6CI9a5Ewc2LAdNKENhPxKUXxpDrh048bCiP.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6Ikx1azFOaDJ6bmZuL0NneU1lUWlVcUE9PSIsInZhbHVlIjoiUUxJanRPUTRnN1Vpb2xqS1h4KzQ4QkJDRGQxTUR2NzltdHhKbDF3bzlBa25wTzVKQ3NNT3dtRXFsaTdqc1NVa1JtdkNFZzVISmxQMlFBYWdPL09NUE9RZkQ0WXR1bjd5OVBqaXYwVTZ2MnJXdkxiRnFlREhXWXRUU25wVURhMXQiLCJtYWMiOiI0YmUzYTRjOTE4ZjNkZGRkYTgwOGE1NGYzYjViN2NmMDk2ZGZhZmRhNWQ4NWFjODMxZmQwZDVkMjZlYmFiYzMyIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjNoQUVVN3dCcDAzTHJqWmZ3N2NBdXc9PSIsInZhbHVlIjoiOU4ySHR4QXNTS3JNRVBvTlY5SXBaNWROZWc5UjFwWkR3ZkpPbEZ2UGlkbHZvQU82K252Rlk1N2FydDh2RmtVZ2xFTHlra3JnKzI3eHF0YnZqcC9BYkxZbGxmRHNGK0pZVnBjdXhYVldjSGpxV1lpbDU0blJqclJmZVNVVERHb2oiLCJtYWMiOiJiZWNiZWI4ZWI4YTUwMjJlMjFjOTMwZDk1YTUzZTYwZmU4MWZhNGYyOWVmMmE5MDA3ZmNkMDk2ZTMxZmQ4YmVlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 13:41:55', '2024-08-31 13:41:55'),
(23, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/5/KwkrnUyw2Ll5b5DaHYSWoQwwSsIpn99n5ISgoB4l.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; XSRF-TOKEN=eyJpdiI6Ikx1azFOaDJ6bmZuL0NneU1lUWlVcUE9PSIsInZhbHVlIjoiUUxJanRPUTRnN1Vpb2xqS1h4KzQ4QkJDRGQxTUR2NzltdHhKbDF3bzlBa25wTzVKQ3NNT3dtRXFsaTdqc1NVa1JtdkNFZzVISmxQMlFBYWdPL09NUE9RZkQ0WXR1bjd5OVBqaXYwVTZ2MnJXdkxiRnFlREhXWXRUU25wVURhMXQiLCJtYWMiOiI0YmUzYTRjOTE4ZjNkZGRkYTgwOGE1NGYzYjViN2NmMDk2ZGZhZmRhNWQ4NWFjODMxZmQwZDVkMjZlYmFiYzMyIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjNoQUVVN3dCcDAzTHJqWmZ3N2NBdXc9PSIsInZhbHVlIjoiOU4ySHR4QXNTS3JNRVBvTlY5SXBaNWROZWc5UjFwWkR3ZkpPbEZ2UGlkbHZvQU82K252Rlk1N2FydDh2RmtVZ2xFTHlra3JnKzI3eHF0YnZqcC9BYkxZbGxmRHNGK0pZVnBjdXhYVldjSGpxV1lpbDU0blJqclJmZVNVVERHb2oiLCJtYWMiOiJiZWNiZWI4ZWI4YTUwMjJlMjFjOTMwZDk1YTUzZTYwZmU4MWZhNGYyOWVmMmE5MDA3ZmNkMDk2ZTMxZmQ4YmVlIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 13:41:57', '2024-08-31 13:41:57'),
(24, 'GET', '[]', 'http://127.0.0.1:8000/%D0%B2%D0%B8%D0%BD%D0%B5%D0%B3%D1%80%D0%B5%D1%82', 'http://127.0.0.1:8000/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6InNDbTJuN2wxU0w3NzRnSUVvc3FQZkE9PSIsInZhbHVlIjoiWWNBUzJKR05mZlRSRDV6K1hYWlpjMzk0RkZnODBXTGVFdEo0cHdIQzgzcVdZSDR4bjFNaTkrOTB6aUIzcHMxcFl5YjlsSjl4R0J4R3BZTjA2VW9zMXRmM053YTVuVFBmdnhkdGorYUF0UHYzY1luSXNRWURMYUYrN2RoZmJFd0giLCJtYWMiOiI3ZjMzM2YwMjk0MWYyZTRmOWU2OGFjYzhmMTg1OWNkOWJlNDMwOTNkYjkzNWQxNGEyY2RiMmZmYjMwYWY1Mzk1IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IkNVMGxvQkowT1lwcGE4em9SZHBCTlE9PSIsInZhbHVlIjoiSktRSE9BZytxckxUQmd5K2o5S0tnSHhrUjJiLzFvL3VjdXJKcmZNMU1sZkozdllpcDFQU0ZvdnJyNzI0UnQ4NVlMbm84eklUZFV3amxuckxRQUpMdU8zQ3ptaTYvNWl2TUtVbGkzZ3Z5Yi9IMXlaenpnTjd3OExvSFAzK0VPeEsiLCJtYWMiOiIwZjU3NGI1MGE0ZmYxNzE4ZGUxMDEyMTU4Mjg0YmMwODU4Y2NjMTNiOTM3YjhjZTU1MjQ2ZjAwNjQyNmQ0ZGIyIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2024-08-31 14:51:32', '2024-08-31 14:51:32'),
(25, 'GET', '[]', 'http://127.0.0.1:8000/salads', 'http://127.0.0.1:8000/%D0%B2%D0%B8%D0%BD%D0%B5%D0%B3%D1%80%D0%B5%D1%82', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/%D0%B2%D0%B8%D0%BD%D0%B5%D0%B3%D1%80%D0%B5%D1%82\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6Imk1aS9IejRSRjcrSVRpaW8zNVN6c1E9PSIsInZhbHVlIjoiK3J1THhVYTVzMlkvVEIwWktHMi95ZGttN1FuNlA4VitLMFdaQ3VaYloyUlV3eHIrWjIrZHpjcGtkQ01MUFZCTGhPSmRoYU5Fa1Vwc25GN2J5SWREU0p3K25ZZ2ZVdWkrbjZwL0Y1bnh4cnNWNE1oMlpFaTdBQ1RrVURiTDN6S1kiLCJtYWMiOiIyNGQyMmI1YmY2MzE0MTgzZmEyZmE4OTY5YmVjMmQ0MGVhZTI0ODU4NzVkZWJlNGFlNjUzZDIyNTljMjc4NzcxIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IklMNjNhN28vNmp0Y0prUHBjWW0zc3c9PSIsInZhbHVlIjoiTTl5NDVnaThSeWJvcjhPN0ZjNlRVNUJjSFhUV2sxQ2VkdmtuK2xEcEp0dEJXbjNIclh1S3JKemRXQ1lKdk96QmgxUVhsT01xYnRaL3p4ZHR1ZmsxTnNUOWJkR0c5UEZWRk5CeWdOcFViU2lKM1l6SVB4RFVOOVdyVmk4SVhkRW8iLCJtYWMiOiI0N2E2MTA4ZGE4MjRlOTUwN2Q5MzE5ZTlkZTRjM2FiMThiNWJmY2QxODZhM2FmMmEzNjM4MTJiNjU0YmQ4NDVmIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2024-08-31 14:52:03', '2024-08-31 14:52:03');
INSERT INTO `store_visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(26, 'GET', '[]', 'http://127.0.0.1:8000/%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8', 'http://127.0.0.1:8000/salads', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/salads\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6ImRpR0JCTk1sY0Nhd3lJdCsrY2xXcGc9PSIsInZhbHVlIjoiZVdpdE1tOTRPOGk2T1NxQno2Smk2aXNWamkweTc0NWg3aVF1K0FwUll4TmJFakFKOFFXWU1hekNmYTUxNFBnWjdEeDNyR1U1c3lvQjlONzNKSSszM3I2U1JoeTdJbjlsYUhkV09zV2ZIUTgvUDJ0UXRCZEVQWFhGaGlZeTZsRkkiLCJtYWMiOiJhMGRhMmNkMzRlZTdkM2M3ZWIwNjQ2NTc2YWUwMTZlZTI0NDhhYTI3YTFiNGYwMmNjODMwNWY0NDQ5OTBjYjgyIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InNVUTRjdktPY0huUWZndCtNaXZ0clE9PSIsInZhbHVlIjoiaUxEL2xtT2JnQU50VFllWEI0cUNIKzV0WWdyMEZKemFrcXQ4YTVRTEtxazV6RWRHWGtoVzdiK2xORWh0MSt6Z2V4bVJ5c0w3eDhHbmRDaHpJZytRZi9WS3p4UEtPcUtTSng5Z09yd0lwQ0lzNWovY1RIWldOMFFtcGVKVW9jMDQiLCJtYWMiOiIxMzllYTNhMTIzNjExNmVmYWY4NjRjMzk5ZWY3NTE1NjA5MjVkNDJiODMyYThlOWRiMTUwYmVlMDIyMzM3MjUzIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2024-08-31 14:52:15', '2024-08-31 14:52:15'),
(27, 'GET', '[]', 'http://127.0.0.1:8000/%D0%BC%D1%8F%D1%81%D0%BD%D0%BE%D0%B8-%D1%81%D0%B0%D0%BB%D0%B0%D1%82', 'http://127.0.0.1:8000/search?', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/search?\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6ImVxMHFvT3pKN2dtMW1HOW90K1J1WlE9PSIsInZhbHVlIjoiSEpZTlZNYVBjenVXaldxQTFkQzk0SGNDdVlaWGRpQm1ZY2ZpK1NTa2YzQmswMTU2SlNEdFdTdlNsV1BFYUhqRGxYQTZabXF5ZWhUZW1SUTZhTXdOd3paZFZJLzFySVhVMWd4YUx1U0pxcldvZHNNdlNManZtQ216REl3ZmJhbzciLCJtYWMiOiIyMzFiMzA0MTk3ODViZjNkNmUwMzc1NjY2MTY5MzI3YWJlM2ZjYTNlNTkwZjVjOTVhMDMwYzk2NTlkNTM4NGE2IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjhQWlkzUFJ3a2Vhai9meExOLzUrTWc9PSIsInZhbHVlIjoiemwzWktScHErcEdzWXFzMWdNSjFpcDJONm9GZkF1QkJpUVlxL3VFUjZwalB5WlBxQ1gva0xFTTJMR2hzRFVSU05jN3VmdnF2U3p1ampUbTFmOG51OTJ6T1ExSG01WXg4Ylc5REppNER6RVNNRkJxT1pNc0pxRVhGZjhQNE4wK1IiLCJtYWMiOiI5MWQwMTI2NTFhMGMwNWUyMzEzODc5YzBmNWE5YmFjMDFmY2ZjYmE0M2RmNDM2ZWU3MDk1OTBjMjYwNmFlOTA4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 3, NULL, NULL, 1, '2024-08-31 15:11:17', '2024-08-31 15:11:17'),
(28, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/9/mN1X9Jw5WdhavJgsWrUUEnhPe8zuuEohAoRqkRzF.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6Ii9nUm5EVk9MOU9rNnJiZFNxUTNVdXc9PSIsInZhbHVlIjoiNXY3Rkl5eUdzVmt0cXlsL1JQQ3kwSUNiam5LV25xTkZUUzYvVFU1TGp5MG44akg2ZCtpRHp4WTUvc1p1Y0ZmNFZKczY0WWF6alplc0lTVXJhMndnYVFrS1ZKbUxzTlN6N1FHR0NtVzdhcEZKMGZ1YmF0S1ZuN2liSUY4TXdBRTMiLCJtYWMiOiI5NDkzODQ4OWFmN2E1MjRjNmM2ZDk4M2VlMDZmNmI0ZTljODRmNGEyMjljZDVjN2U5NjcxMjJmZmRjMjUzNWRmIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InNjY3RUaS9WVFoyS3M5WE1Vd1hNRGc9PSIsInZhbHVlIjoialFNemNrUGY3K3FTeXZ4aTY4ME1vZ3h3R1JpS2NCem9kcmFkOWhQQlB4eCtLSGh1L3lVMXZ3UXloOXZXZlVEVnVLaTFSaGZpM3BxUGd2L3JCWmVPU3pLaUFFWWpIdmg1bHRWRGgyOUduZ2RlUnhqL0hCRzJjZklsMSsvK0F2ODQiLCJtYWMiOiIwZDE4ZDMyZmI4YjYyN2NkMWUyODc0ODRkNjQ0NmRjMjlhMjIyMWQyOGNmOGFjYTViMTBkNTI2YmE0Y2I1MzVjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 15:26:10', '2024-08-31 15:26:10'),
(29, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/8/OGFm4C2D5mDBfqR88QVn0dSzu7LYloNJbLbDPw57.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6Ii9nUm5EVk9MOU9rNnJiZFNxUTNVdXc9PSIsInZhbHVlIjoiNXY3Rkl5eUdzVmt0cXlsL1JQQ3kwSUNiam5LV25xTkZUUzYvVFU1TGp5MG44akg2ZCtpRHp4WTUvc1p1Y0ZmNFZKczY0WWF6alplc0lTVXJhMndnYVFrS1ZKbUxzTlN6N1FHR0NtVzdhcEZKMGZ1YmF0S1ZuN2liSUY4TXdBRTMiLCJtYWMiOiI5NDkzODQ4OWFmN2E1MjRjNmM2ZDk4M2VlMDZmNmI0ZTljODRmNGEyMjljZDVjN2U5NjcxMjJmZmRjMjUzNWRmIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InNjY3RUaS9WVFoyS3M5WE1Vd1hNRGc9PSIsInZhbHVlIjoialFNemNrUGY3K3FTeXZ4aTY4ME1vZ3h3R1JpS2NCem9kcmFkOWhQQlB4eCtLSGh1L3lVMXZ3UXloOXZXZlVEVnVLaTFSaGZpM3BxUGd2L3JCWmVPU3pLaUFFWWpIdmg1bHRWRGgyOUduZ2RlUnhqL0hCRzJjZklsMSsvK0F2ODQiLCJtYWMiOiIwZDE4ZDMyZmI4YjYyN2NkMWUyODc0ODRkNjQ0NmRjMjlhMjIyMWQyOGNmOGFjYTViMTBkNTI2YmE0Y2I1MzVjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 15:26:12', '2024-08-31 15:26:12'),
(30, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/7/WaI1zlG5xMVF6AgUdWPlQMfaN3CK6zZu9uq0u6cc.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6Ii9nUm5EVk9MOU9rNnJiZFNxUTNVdXc9PSIsInZhbHVlIjoiNXY3Rkl5eUdzVmt0cXlsL1JQQ3kwSUNiam5LV25xTkZUUzYvVFU1TGp5MG44akg2ZCtpRHp4WTUvc1p1Y0ZmNFZKczY0WWF6alplc0lTVXJhMndnYVFrS1ZKbUxzTlN6N1FHR0NtVzdhcEZKMGZ1YmF0S1ZuN2liSUY4TXdBRTMiLCJtYWMiOiI5NDkzODQ4OWFmN2E1MjRjNmM2ZDk4M2VlMDZmNmI0ZTljODRmNGEyMjljZDVjN2U5NjcxMjJmZmRjMjUzNWRmIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6InNjY3RUaS9WVFoyS3M5WE1Vd1hNRGc9PSIsInZhbHVlIjoialFNemNrUGY3K3FTeXZ4aTY4ME1vZ3h3R1JpS2NCem9kcmFkOWhQQlB4eCtLSGh1L3lVMXZ3UXloOXZXZlVEVnVLaTFSaGZpM3BxUGd2L3JCWmVPU3pLaUFFWWpIdmg1bHRWRGgyOUduZ2RlUnhqL0hCRzJjZklsMSsvK0F2ODQiLCJtYWMiOiIwZDE4ZDMyZmI4YjYyN2NkMWUyODc0ODRkNjQ0NmRjMjlhMjIyMWQyOGNmOGFjYTViMTBkNTI2YmE0Y2I1MzVjIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 15:26:14', '2024-08-31 15:26:14'),
(31, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/3/RN6DSEc0qGE7szoyYM2vtUKmVHqdSJITmr3AzI0J.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6InNJcDVOekpGR3FhVldyckp0bmN2dFE9PSIsInZhbHVlIjoiUC8zUWIwbi8wUUxZVHQ4Ykw0UFpzbmIvb09CZCtsa0pTNjlCeitGdFRuY0EzOUV2RTE4M1c5alI1UmFxQWxCU2MyVXMvenVpWm9nR2c2c1hTSk1LV2x2TFVlVjRQK1RjV2NRQlo4L0psckhnaDZVclZ3RFEzY1dDbENkVWwxdFEiLCJtYWMiOiJlMDNjNzY2MjJiNDA1NzFlZjE3MDZlZDhjODI3NjRmNmNiOWViOGI3ZGYxNGMyMTI4NDA5ZGVmMTI3NmU5Y2QzIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjRQaXpCcmJsSGtlSXArL2Z0ZGpYMkE9PSIsInZhbHVlIjoidVgrOTBhVEdUOFNaVFEwUmcrd0UzUGs5TXArOVBkWGQvMzY0QXlocTF4d0ozaTZFbGY3VXhtekEzZ1BzSGNHNGpDQmNweHg3a20yNFQ0WGNNSlpxazlSNCtBOEJBbVFVYTNKalByOFBTM2VKcU9maUpMNVhNaTh1cGRkay80S3oiLCJtYWMiOiIxMWIwMzY0MjQ3YTUxNDJhNzNjZjAwZjRhNzc0MjEzZTg4MGIxZmViYWE5MTFhN2Y0NmI1YTk3NzljYzA5YzRkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 15:26:23', '2024-08-31 15:26:23'),
(32, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/1/OGP6tgRIBl9tGhmgvZ4by3WCjVr1ixS6h8GnG8oQ.webp', 'http://127.0.0.1:8000/admin/catalog/products', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/catalog\\/products\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6InNJcDVOekpGR3FhVldyckp0bmN2dFE9PSIsInZhbHVlIjoiUC8zUWIwbi8wUUxZVHQ4Ykw0UFpzbmIvb09CZCtsa0pTNjlCeitGdFRuY0EzOUV2RTE4M1c5alI1UmFxQWxCU2MyVXMvenVpWm9nR2c2c1hTSk1LV2x2TFVlVjRQK1RjV2NRQlo4L0psckhnaDZVclZ3RFEzY1dDbENkVWwxdFEiLCJtYWMiOiJlMDNjNzY2MjJiNDA1NzFlZjE3MDZlZDhjODI3NjRmNmNiOWViOGI3ZGYxNGMyMTI4NDA5ZGVmMTI3NmU5Y2QzIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjRQaXpCcmJsSGtlSXArL2Z0ZGpYMkE9PSIsInZhbHVlIjoidVgrOTBhVEdUOFNaVFEwUmcrd0UzUGs5TXArOVBkWGQvMzY0QXlocTF4d0ozaTZFbGY3VXhtekEzZ1BzSGNHNGpDQmNweHg3a20yNFQ0WGNNSlpxazlSNCtBOEJBbVFVYTNKalByOFBTM2VKcU9maUpMNVhNaTh1cGRkay80S3oiLCJtYWMiOiIxMWIwMzY0MjQ3YTUxNDJhNzNjZjAwZjRhNzc0MjEzZTg4MGIxZmViYWE5MTFhN2Y0NmI1YTk3NzljYzA5YzRkIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 15:26:25', '2024-08-31 15:26:25'),
(33, 'GET', '[]', 'http://127.0.0.1:8000/%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B8-%D0%BA%D0%BE%D0%BA%D1%82%D0%B5%D0%B8%D0%BB%D1%8C', 'http://127.0.0.1:8000/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=1; XSRF-TOKEN=eyJpdiI6IjUvZHFyNGMvN0o1bEQ5dFhwa0xWenc9PSIsInZhbHVlIjoidFplc3FMTG9NMFAwWEttT3YyNFlGdFBoZms2dTVwNG5RRGZHTVBMY0JjY2JtcFpIUzJnaGlZb1lKKzZJa1dVZms2NkNjM25NSjFuNTNGeE9ya3JyUTJmNjNjelVmckFucjFYN1o5OWVabzl6dXBqYW1vMFRwZVRlN0djMTBaNVAiLCJtYWMiOiJkOGI4ZmU1Yzk3YmYxMzAyYTI1MDE0NmM4MzE1ZmJjMzg0ODExM2JiMmNiNjBjM2JkNzNiZjQ5M2JjNzQxNzk4IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IkNvQmxtbDdYNllobXhPSjVud2VXR2c9PSIsInZhbHVlIjoiVTRTalFVeGd3UzQza3FCMXYvVnpLS1VONXpUd0pHcU1RcWRwRXU1KzhWQ0h1TzZWa1d4SUJzMWVqMnZpcFVPMDAyWXRUNnV6OTc0akRPVGtiY1doR1lKRnBUUkNSMzJNaU1jOGc3ZGkvWTNUZWtoVnZCaGVRYTdhb2dRZG5weXMiLCJtYWMiOiIwYmJmZjljNTc2NWUxZmQyN2ZhOTkxNDU5ZTA2NDhlMTM4OGI0NTViYzRkMDdkOWJlYmRkYmFjZGIxNTVlNjkxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 10, NULL, NULL, 1, '2024-08-31 15:32:07', '2024-08-31 15:32:07'),
(34, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6IitBdzZ3OWtROWdLN2pHV0ZRTnNOL0E9PSIsInZhbHVlIjoiTmlYWW9lUTk3NmVnUjlYalZpRHlybUR0L1lnTFdWMnlxMlhCYmZrKytxaXRBRkNSV0RkYkYvSlV0SzQrS004QUE4UUdnblM4ZEFjSlZJYzc1cVgyaXVuMjJ3WmllTDBqdWFUZ3RUZ1FNdmFjTFVjYVZOOU85dUw5V0VBMFhPaXEiLCJtYWMiOiJjYTRiNDRhMDc4MGE0OGQ1YmEwNjYwZWY4NWE2N2Q0YjkzNWMxNDczN2FjMzMzYTBiMzE0MjYxZDFhMzIxYzM1IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IlBGM00vWDlLOEp2cndwbjdOK0xvb3c9PSIsInZhbHVlIjoiZzlPcGNtZjh0d3h5SER1SDFLTlE4S0FtSDdwN0lBaFRXYzdNaTBGSkkyVHB0Tmx6aTRKWDVBSU01S0hGWGoxaUdkYkJhTytxUFI4N211eW9ZMTd0SDRtaTZURloyVldhRGtrd2FoZG9hUmJJNFg5ekNNK1U0aXFPcTJlUkJxVXQiLCJtYWMiOiIxODMzZjM1ODQ2NWU0YThkNDZlODEwNjg3YjIwYzA5MjRjMGZiY2NkNzdlZGExNTNiN2Q0ZmMxYjg3Y2Q4Yzc2IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-31 19:18:47', '2024-08-31 19:18:47'),
(35, 'GET', '[]', 'http://127.0.0.1:8000/salads', 'http://127.0.0.1:8000/search?', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/search?\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6IlhZMy9KbkE5N1JLUktEeVJDaU1lQ1E9PSIsInZhbHVlIjoiWDRsN0R2NHVXVEYrN210Y2tBekFVUHNNU1hJQ3ZSanMwV0hJanBjOFFONnV0TTQyQVRwNGFGRWUrOXh3SVc1SUdnaExZbTJuY1EySzEvU3R5Z016K0dlcHhIYkZRRHZ6Z3FPM3lVZFlJUmxwMEtyNE44MzM5VlJmcnhZcHdpazYiLCJtYWMiOiI4MWU1ODIyYmI2YmMzOWU3OTk2ZGE4NWEzMDg1ZjkxNTQxMTQ3ZTczMTZjNjViYmQ1Nzk4NjlkNjI1ZTAyNjY4IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6ImF3SWdVYlFycGpFcks2SHZyazM5NHc9PSIsInZhbHVlIjoiU2VRL05QWHJEdDNQWjFPRVRERU9ZTnNRaUxXeDA5MHRsdWxkaHArOTh0U0tUMFN1S01kLzIrSlI0VVBUc3pRY3pSN3IreXNKSUxCazFUc2lGdDB5VUVXdENwTlhGaUNld1Q3dGlTUTlmaWxtOGlyZ1hHTXprN2lXOW9NYXZmcWIiLCJtYWMiOiI2MjcwYTBjN2UwYTBiNWE1ODhjMzFjNDRiMzUxMzE0ZTZmYTMwZDA3YWI0NmI5MzYwNTMxY2Q1OWZmN2QzNzQ0IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-31 19:24:40', '2024-08-31 19:24:40'),
(36, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/4/Q85P0U5phBESmqEGM4HJV0SkKvzV5xOst2gQInlq.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6InVXZlhFQnVSSXd5eTlaUmttL0VHWmc9PSIsInZhbHVlIjoiNURZRUlkTE9GQUlQOVZsZ3JvOGRRd2VCZ0g5ZEpBclBrVnlWQXh1NnFJeXdGM29xc3pnN3BOZG1QbUdNNWZ6czVCdUs0dW1ScjN5dHVlVEtINHltTnRCUzBVbysraVVLOVBNRWdqK1Z3bDhUTm81VU9EbGZaZjVqdnBrMEZrY08iLCJtYWMiOiJmY2U2MmVmMDQ0ZWQzNDUzMTQ1ZDFjOTBlYTcxM2ZmYWE4N2YzMzBjNzhkNjQ4MzkzNmE1OTZiZDAyZTlmZTU3IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjFuZHMzQXV6eVEyZUZKa2xodW4rN3c9PSIsInZhbHVlIjoibytTNk5uT1haK3Ivd0YwWEFYL2h0S2lmZEtueUI0a3VRbEVxS0h6M0dWZEs1T0RKa08xU2FBS2NVMEtHK2p2WTUyUHo3aDJrK05DTEJTRS91N2JXVFY3cWlsZmxicmtsYStVMDM0aHJiTXN5R00rWGtSeTZNLzgrS1hXRUl5aWMiLCJtYWMiOiIxN2Y1ZjE0ZWQ4ZTllNTk5OWNmNWIwNTU1MjdlMmRlM2U3NWI5Y2QzYjJkZjVhYTQ0YTZmZTc5ZTY2ZmMyNDI3IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-31 19:25:31', '2024-08-31 19:25:31'),
(37, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/10/80vXBsdKzkVtQUOt7O2tbSIQqgnSOBigbBVAcNYr.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6InVXZlhFQnVSSXd5eTlaUmttL0VHWmc9PSIsInZhbHVlIjoiNURZRUlkTE9GQUlQOVZsZ3JvOGRRd2VCZ0g5ZEpBclBrVnlWQXh1NnFJeXdGM29xc3pnN3BOZG1QbUdNNWZ6czVCdUs0dW1ScjN5dHVlVEtINHltTnRCUzBVbysraVVLOVBNRWdqK1Z3bDhUTm81VU9EbGZaZjVqdnBrMEZrY08iLCJtYWMiOiJmY2U2MmVmMDQ0ZWQzNDUzMTQ1ZDFjOTBlYTcxM2ZmYWE4N2YzMzBjNzhkNjQ4MzkzNmE1OTZiZDAyZTlmZTU3IiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IjFuZHMzQXV6eVEyZUZKa2xodW4rN3c9PSIsInZhbHVlIjoibytTNk5uT1haK3Ivd0YwWEFYL2h0S2lmZEtueUI0a3VRbEVxS0h6M0dWZEs1T0RKa08xU2FBS2NVMEtHK2p2WTUyUHo3aDJrK05DTEJTRS91N2JXVFY3cWlsZmxicmtsYStVMDM0aHJiTXN5R00rWGtSeTZNLzgrS1hXRUl5aWMiLCJtYWMiOiIxN2Y1ZjE0ZWQ4ZTllNTk5OWNmNWIwNTU1MjdlMmRlM2U3NWI5Y2QzYjJkZjVhYTQ0YTZmZTc5ZTY2ZmMyNDI3IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-31 19:25:33', '2024-08-31 19:25:33'),
(38, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/5/KwkrnUyw2Ll5b5DaHYSWoQwwSsIpn99n5ISgoB4l.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6Im1ac1RWbjFva21VZkQ1dVIySmRsenc9PSIsInZhbHVlIjoiMUF1bmJlOVR6ZHFvSW5lWGYzaEFvTUE3a0JDdHRxLzNhVnh2K3QxVFcxek53bEJZTXRNUkVHZ2tYU0E3RSs1YUVOWU9rZDY0TUVqbDJHeTVGZWl3dFN5T1RqQnZ5cjJVTzVjZ2FLNGE5c3VaZGtXT1FGem52T1AwVjkxSzg4QlAiLCJtYWMiOiI5MjI1YjY1NjM1MmE0YjQ3MWJjOWIzYzRiMzU2NTI2Njg4N2E3MGQ3YWFhOGZjODJjNDQwNTdlMzdjNzY4YWRjIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IkRWdXlNd3VTWVoveXZkRXA3bmltV1E9PSIsInZhbHVlIjoiZmhta2gzRXdKMFZmbyszdVRRU3MrVHd2bkZYVDh3bzVwWDM0aStXTVRIWkViRjdBSkxueG1jT2dqNTlGL0l3QjRJRHRwV0VjZHVhZ0JaMXlRUlMrSDJnd2oxMXpKZUxzTUdVQjl5UWc1bjFhZXBHdmY3STlJZm5Bd1FUUWJ1NVoiLCJtYWMiOiIwMmFiMzZiOWFiYmFmY2IwMDc2ZDIzOWVlNmMxZGU3MzYxZjQ4NTVhNDYzNWUyM2YxN2ZjYWY3OTUzZjNhOTk4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-31 19:25:35', '2024-08-31 19:25:35'),
(39, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/11/GrFOSVGLv8gOS9yuJfVO9Lu8pv81QXIKfLEkvpa1.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6Im1ac1RWbjFva21VZkQ1dVIySmRsenc9PSIsInZhbHVlIjoiMUF1bmJlOVR6ZHFvSW5lWGYzaEFvTUE3a0JDdHRxLzNhVnh2K3QxVFcxek53bEJZTXRNUkVHZ2tYU0E3RSs1YUVOWU9rZDY0TUVqbDJHeTVGZWl3dFN5T1RqQnZ5cjJVTzVjZ2FLNGE5c3VaZGtXT1FGem52T1AwVjkxSzg4QlAiLCJtYWMiOiI5MjI1YjY1NjM1MmE0YjQ3MWJjOWIzYzRiMzU2NTI2Njg4N2E3MGQ3YWFhOGZjODJjNDQwNTdlMzdjNzY4YWRjIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IkRWdXlNd3VTWVoveXZkRXA3bmltV1E9PSIsInZhbHVlIjoiZmhta2gzRXdKMFZmbyszdVRRU3MrVHd2bkZYVDh3bzVwWDM0aStXTVRIWkViRjdBSkxueG1jT2dqNTlGL0l3QjRJRHRwV0VjZHVhZ0JaMXlRUlMrSDJnd2oxMXpKZUxzTUdVQjl5UWc1bjFhZXBHdmY3STlJZm5Bd1FUUWJ1NVoiLCJtYWMiOiIwMmFiMzZiOWFiYmFmY2IwMDc2ZDIzOWVlNmMxZGU3MzYxZjQ4NTVhNDYzNWUyM2YxN2ZjYWY3OTUzZjNhOTk4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-31 19:25:37', '2024-08-31 19:25:37'),
(40, 'GET', '[]', 'http://127.0.0.1:8000//storage/product/6/5JDFD6CI9a5Ewc2LAdNKENhPxKUXxpDrh048bCiP.webp', 'http://127.0.0.1:8000/admin/dashboard', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/admin\\/dashboard\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; XSRF-TOKEN=eyJpdiI6Im1ac1RWbjFva21VZkQ1dVIySmRsenc9PSIsInZhbHVlIjoiMUF1bmJlOVR6ZHFvSW5lWGYzaEFvTUE3a0JDdHRxLzNhVnh2K3QxVFcxek53bEJZTXRNUkVHZ2tYU0E3RSs1YUVOWU9rZDY0TUVqbDJHeTVGZWl3dFN5T1RqQnZ5cjJVTzVjZ2FLNGE5c3VaZGtXT1FGem52T1AwVjkxSzg4QlAiLCJtYWMiOiI5MjI1YjY1NjM1MmE0YjQ3MWJjOWIzYzRiMzU2NTI2Njg4N2E3MGQ3YWFhOGZjODJjNDQwNTdlMzdjNzY4YWRjIiwidGFnIjoiIn0%3D; storetest_session=eyJpdiI6IkRWdXlNd3VTWVoveXZkRXA3bmltV1E9PSIsInZhbHVlIjoiZmhta2gzRXdKMFZmbyszdVRRU3MrVHd2bkZYVDh3bzVwWDM0aStXTVRIWkViRjdBSkxueG1jT2dqNTlGL0l3QjRJRHRwV0VjZHVhZ0JaMXlRUlMrSDJnd2oxMXpKZUxzTUdVQjl5UWc1bjFhZXBHdmY3STlJZm5Bd1FUUWJ1NVoiLCJtYWMiOiIwMmFiMzZiOWFiYmFmY2IwMDc2ZDIzOWVlNmMxZGU3MzYxZjQ4NTVhNDYzNWUyM2YxN2ZjYWY3OTUzZjNhOTk4IiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2024-08-31 19:25:39', '2024-08-31 19:25:39'),
(41, 'GET', '[]', 'http://127.0.0.1:8000/%D0%BC%D0%BE%D1%80%D1%81', 'http://127.0.0.1:8000/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"dark_mode=1; sidebar_collapsed=0; storetest_session=eyJpdiI6InBjN0NiT25YY0dxdmJCYXJqeE9sM1E9PSIsInZhbHVlIjoiQnpBSEhLbVEyMlJVaFRsTWNrMlo0V1l5TndqeEZBRmxiVExxVjBhWmlnUGtpS3Bid0R5TkJhN0ZoT3IrM1VScWwydDhoalo4K1RyaTZPcVN4RkV3WkNNaXFvMVpramJlTTVjNXlpZzRaM3AzNkpnNkJaSHNlM3pSUlliNFRJK2EiLCJtYWMiOiIzMzI5ZmU3ZTlkOGRjOGNiNTBhZjFmOThhZjlhNDUxZTVlOWFkZmU3YTU3NTg2NmU0ZDk4MTYwMWE5MDVmOGRiIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6InpheE11S2Uvd1o3V0ttVnByNkRPK1E9PSIsInZhbHVlIjoiN1U3NVpIMWlFamhYMXFSNVdSYUUvWDhJTlk1YmxOcUpyMVZ0aFRMc0Q5aTJtRVpsVTdkLzJHdTZiRzdSd2JWYXJRVTR6bHZrVXJLVUlFN3dTeWs2TkI4cFFnTE9mUXgxaHhNemhVdSszVHpIMjhiOFFKZ1VZZXNFZWY5M0cvT2kiLCJtYWMiOiI1MTFlZmM0YmZiYzUxMGQ1ZjJlMDljY2E4NDU5ZGM2ZjFjMTMyODViYTBiNjcxYzY2MGZhNTY4MWIyZmQ2OGRhIiwidGFnIjoiIn0%3D; test_session=eyJpdiI6ImkvbnQyc0J4WGgveG9YQ05DL0FYQmc9PSIsInZhbHVlIjoiMm05ZjloMjI1cnNVVHFibUxCK2t0aWkrdWdVYzFTbW5OVXE0Y1NOdGNlM015MUsxbFhvUnlSdmZUMkNuUjU3ZEhSZVJhZGtmc1lJSFJDQ0lhNDhobUlUWTNqVWdXOEZDaFIzQytSSHVNWWZRUlBvd1YvZE1rMFdGTmo3WUpPazIiLCJtYWMiOiJkYTRkMmQzODU2MTcyMzE4YmQzMzE2NmQ0OGUwZGFjNDBjZWUwNTRhZWVmODUxNDUxMGRmZWQ2OGRiOTM1OWYxIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 11, NULL, NULL, 1, '2024-08-31 19:33:40', '2024-08-31 19:33:40'),
(42, 'GET', '[]', 'https://bagtest/public', 'https://bagtest/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"priority\":[\"u=0, i\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"referer\":[\"https:\\/\\/bagtest\\/\"],\"sec-fetch-dest\":[\"document\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-site\":[\"same-origin\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"upgrade-insecure-requests\":[\"1\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"host\":[\"bagtest\"],\"content-length\":[\"\"],\"content-type\":[\"\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 19:59:02', '2024-08-31 19:59:02'),
(43, 'GET', '[]', 'http://bagtest/public/index.php', 'https://bagtest/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"host\":[\"bagtest\"],\"x-forwarded-proto\":[\"https\"],\"x-real-ip\":[\"127.0.0.1\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/bagtest\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"priority\":[\"u=0, i\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkducUhNa0QxbURPTE9aVjdDbkRiQnc9PSIsInZhbHVlIjoiamJwN0tjM3A1MDFRaFI2RTZBQXhXT3FpVVc2SFFDNmI1SmszeXV6bW5ac1NRdzlaWVRLSXg3cjg2YXB1Z0JaK292MVQ4VGFWUzVOL2xVcURCeGgzZ21rUngyMmpzUXYvYkprbGE2N05QUy9qWnlDbGtKSm1kQWptMTc2VXB4MjMiLCJtYWMiOiJhNDM0NTgzODY2YTY3YmExNmI2Y2I2ODc3YmM2ODc0NTY2ZWVlZmZkNDBkZDQ5MjRlZTQ4YWVmZmVjZjliNGMzIiwidGFnIjoiIn0%3D; test_session=eyJpdiI6ImF4Z3ZCdnBnOE4rME9PREx2T0ZIb2c9PSIsInZhbHVlIjoiZVBxcEY0MnAyVzI3a1A3VTRFVHdVcWR5WVdqbGtWbElyeGY0amR3VHVWeW1KQmJRckxya1RObVhOSEp0RGdhMi9ML3NQRFJFd3BBNnJMYUhEa3pSMmM2eXB4VkVjcEZ4QUg0anc0QVRBOVpJRnhpRElWZVNXT0hGUGdKaVN2UnIiLCJtYWMiOiIwOTdkZDBiNjVjNTA0NWU3ZmFmNWU3MTY1NGFhM2UxYzJhY2JjY2JmMjMwZjljMTY2NWUxZGQzYmVjYTJlZTMwIiwidGFnIjoiIn0%3D\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 20:19:21', '2024-08-31 20:19:21'),
(44, 'GET', '[]', 'https://bagtest', NULL, '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Ik9uUTlEMEtUU0l0V3JNNHhDU09OdlE9PSIsInZhbHVlIjoiSFFXWGhhK0pMREVNUlpaL0JjYWNzbUM3ZTFULzZUYWVjSTdudTh0UXFsMFN0MTErT0IwUnNMNThnS0lsUW9hV0VFWkpWcW16enJTb2ZXeWJ2MENZNHIvSVlnTk9kVDVSOFRtUTI4WWxsSmx0SEJzNkduVHdTL1N5U0doVXpueTkiLCJtYWMiOiJkNDNjMjUzYjA2ODM3MTZjMGIzMThhYjRkNmYyNmI2ZWM1ZmI4NmJmMzdkYjgxMTEwYTdkZGI0ODM4N2UyYTIwIiwidGFnIjoiIn0%3D; test_session=eyJpdiI6ImlLbU04RGJMWnY2TVkyWEVnbGtZWEE9PSIsInZhbHVlIjoiaVdYTXNCanVnZU5oYWJDOFVZeStXMFMwOVU0OUdibmNkd0MzSS9Bd2xmQUY5VFhaSEtDb1dVK0I0eTdkR0NrN2NwM3BqZlZKQ052aDJ3S1crcTlDdXM1d2NyUXBMNXJiRnpDV0FueU91SzhqVnlXSTY1dXJmbjM2UERyd2pza24iLCJtYWMiOiIxNmQ2MjY3ZDY2NmMyYjhhNjQ0ZWQxNDlmMzIzODAzNDg5Mzg2OThkM2JmODRlNTY1NzM4NDUyZjQxNjE1YTlkIiwidGFnIjoiIn0%3D\"],\"priority\":[\"u=0, i\"],\"host\":[\"bagtest\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2024-08-31 20:23:27', '2024-08-31 20:23:27'),
(45, 'GET', '[]', 'https://bagtest/salads', 'https://bagtest/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/bagtest\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InRYOTR5UVR5TjhEUTZWSVFza3ovM3c9PSIsInZhbHVlIjoidkh4eE5rOWdaYTd3eDlJZ29McXZwZlFkRThiVDZpZkZFZlF3Nit1RW5GUTNlckdnS1BoV1BYQmpMMWdHVFRvdDlWUzZ6WXNrVHF3ay9xcVZHRi9CcjMwMnplT3VsblpCOUVaRXRhTkVUVGJMNVEwcnZVNDJ2enRLM1NNRlJFS1oiLCJtYWMiOiJkODhlNDFiMTBlZGE4NDYzNmFjOTdjMDk0YjA0MTk4M2Q3ODJhNzE1NTYyOTlkZWJmMzU1NzI0ODliMGIwYzMzIiwidGFnIjoiIn0%3D; test_session=eyJpdiI6ImJTMjB2b3JDbzhoaGpKS3ZyMm0yY2c9PSIsInZhbHVlIjoiK0pHNmo2ejZxZGl6YnFJSU1EL1VqYndBSFlXZTBPbWp0Y0FZdDhSQlZ5UTh4eVBMVXpJdzlTT3dBazVlcEoyRXQwZnNzRUEzWmQ5UnBTYjVFY2xZVnRBNVlMVnYxWXpnQncxN29JdkR5YVhpWjVpMVRFZ0VmMDZXeGlHa2J3SEgiLCJtYWMiOiJiNjk5NjBiMmFmN2QyZDIwZjUwODhmZGNmMjA4ZDA1MDk5YWZmMzliZTA4YzM2YjAxYjU2NDBhZTgxMTdlNjhkIiwidGFnIjoiIn0%3D\"],\"priority\":[\"u=0, i\"],\"host\":[\"bagtest\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2024-08-31 20:23:38', '2024-08-31 20:23:38'),
(46, 'GET', '[]', 'https://bagtest/%D0%BD%D0%B0%D0%BF%D0%B8%D1%82%D0%BA%D0%B8', 'https://bagtest/', '[\"ru-ru\",\"ru\",\"en-us\",\"en\"]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '{\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"128\\\", \\\"Not;A=Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"128\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/128.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/bagtest\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InVyK3A5QTR5Q09Hc0psWW9nbkNjMGc9PSIsInZhbHVlIjoiVnY1dnNVL0loTExjM3dBaSs1YUdKMkVkSmRGVnU4dFhPUWVhelVuRFdSMUxiRmtEUHJzNFlpc1REczVYc2FmLzE5elpYYWVtS1ZsL1I1dy9QaFJNOU42VWNlNzBvODBFdzV0aUF0Z2M1YXNrS1dIVk9zMDRwR1N2QWlkZkJ5dE4iLCJtYWMiOiI2YTgxZGVkOGRlMmNjY2JhMDI5N2ZiNmY4ODJlNmFlMTJhNzRkZjM3OGJkMWE5ODcyOTJlN2M3MmFjNzRhZDA5IiwidGFnIjoiIn0%3D; test_session=eyJpdiI6IjJISW5oNFdSV2NDNmJyQUVzNlozZmc9PSIsInZhbHVlIjoidVRCWERkNHkwUWJPZTk5c244clhDeHpGd21FeFA2Z1F6QnNGQitMU3VCbHFyUndZdktna0Uwb3o4N2ZKYnE1YnVqTTdFZTR2U2p5R0VzNC9sVVdRZENXVTVvK2svd1hWVEh2NHFhRjQreGN3VDBMSjVUNTVYNVg4VTFndFpYSEkiLCJtYWMiOiI4MTRjZjMxZWFhMmI1YjcxZDE0NWZkYzkyYzk0MTMwYTE4ZjIxZWU2ZTdkODI3M2UxZTM1OTBiZWM0ZGM3MTJkIiwidGFnIjoiIn0%3D\"],\"priority\":[\"u=0, i\"],\"host\":[\"bagtest\"]}', 'WebKit', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2024-08-31 20:24:34', '2024-08-31 20:24:34');

-- --------------------------------------------------------

--
-- Структура таблицы `store_wishlist`
--

CREATE TABLE `store_wishlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `item_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_options`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `store_wishlist_items`
--

CREATE TABLE `store_wishlist_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `store_addresses`
--
ALTER TABLE `store_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `addresses_cart_id_foreign` (`cart_id`),
  ADD KEY `addresses_order_id_foreign` (`order_id`),
  ADD KEY `addresses_parent_address_id_foreign` (`parent_address_id`);

--
-- Индексы таблицы `store_admins`
--
ALTER TABLE `store_admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Индексы таблицы `store_admin_password_resets`
--
ALTER TABLE `store_admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Индексы таблицы `store_attributes`
--
ALTER TABLE `store_attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Индексы таблицы `store_attribute_families`
--
ALTER TABLE `store_attribute_families`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_attribute_groups`
--
ALTER TABLE `store_attribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`);

--
-- Индексы таблицы `store_attribute_group_mappings`
--
ALTER TABLE `store_attribute_group_mappings`
  ADD PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  ADD KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`);

--
-- Индексы таблицы `store_attribute_options`
--
ALTER TABLE `store_attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Индексы таблицы `store_attribute_option_translations`
--
ALTER TABLE `store_attribute_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_option_translations_attribute_option_id_locale_unique` (`attribute_option_id`,`locale`);

--
-- Индексы таблицы `store_attribute_translations`
--
ALTER TABLE `store_attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Индексы таблицы `store_cart`
--
ALTER TABLE `store_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_cart_items`
--
ALTER TABLE `store_cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_parent_id_foreign` (`parent_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Индексы таблицы `store_cart_item_inventories`
--
ALTER TABLE `store_cart_item_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_cart_payment`
--
ALTER TABLE `store_cart_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_payment_cart_id_foreign` (`cart_id`);

--
-- Индексы таблицы `store_cart_rules`
--
ALTER TABLE `store_cart_rules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_cart_rule_channels`
--
ALTER TABLE `store_cart_rule_channels`
  ADD PRIMARY KEY (`cart_rule_id`,`channel_id`),
  ADD KEY `cart_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_cart_rule_coupons`
--
ALTER TABLE `store_cart_rule_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`);

--
-- Индексы таблицы `store_cart_rule_coupon_usage`
--
ALTER TABLE `store_cart_rule_coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  ADD KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`);

--
-- Индексы таблицы `store_cart_rule_customers`
--
ALTER TABLE `store_cart_rule_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  ADD KEY `cart_rule_customers_customer_id_foreign` (`customer_id`);

--
-- Индексы таблицы `store_cart_rule_customer_groups`
--
ALTER TABLE `store_cart_rule_customer_groups`
  ADD PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  ADD KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Индексы таблицы `store_cart_rule_translations`
--
ALTER TABLE `store_cart_rule_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`);

--
-- Индексы таблицы `store_cart_shipping_rates`
--
ALTER TABLE `store_cart_shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`);

--
-- Индексы таблицы `store_catalog_rules`
--
ALTER TABLE `store_catalog_rules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_catalog_rule_channels`
--
ALTER TABLE `store_catalog_rule_channels`
  ADD PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  ADD KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_catalog_rule_customer_groups`
--
ALTER TABLE `store_catalog_rule_customer_groups`
  ADD PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  ADD KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Индексы таблицы `store_catalog_rule_products`
--
ALTER TABLE `store_catalog_rule_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_products_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_catalog_rule_product_prices`
--
ALTER TABLE `store_catalog_rule_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_categories`
--
ALTER TABLE `store_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Индексы таблицы `store_category_filterable_attributes`
--
ALTER TABLE `store_category_filterable_attributes`
  ADD KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  ADD KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Индексы таблицы `store_category_translations`
--
ALTER TABLE `store_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  ADD KEY `category_translations_locale_id_foreign` (`locale_id`);

--
-- Индексы таблицы `store_channels`
--
ALTER TABLE `store_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_root_category_id_foreign` (`root_category_id`),
  ADD KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  ADD KEY `channels_base_currency_id_foreign` (`base_currency_id`);

--
-- Индексы таблицы `store_channel_currencies`
--
ALTER TABLE `store_channel_currencies`
  ADD PRIMARY KEY (`channel_id`,`currency_id`),
  ADD KEY `channel_currencies_currency_id_foreign` (`currency_id`);

--
-- Индексы таблицы `store_channel_inventory_sources`
--
ALTER TABLE `store_channel_inventory_sources`
  ADD UNIQUE KEY `channel_inventory_sources_channel_id_inventory_source_id_unique` (`channel_id`,`inventory_source_id`),
  ADD KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Индексы таблицы `store_channel_locales`
--
ALTER TABLE `store_channel_locales`
  ADD PRIMARY KEY (`channel_id`,`locale_id`),
  ADD KEY `channel_locales_locale_id_foreign` (`locale_id`);

--
-- Индексы таблицы `store_channel_translations`
--
ALTER TABLE `store_channel_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  ADD KEY `channel_translations_locale_index` (`locale`);

--
-- Индексы таблицы `store_cms_pages`
--
ALTER TABLE `store_cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_cms_page_channels`
--
ALTER TABLE `store_cms_page_channels`
  ADD UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  ADD KEY `cms_page_channels_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_cms_page_translations`
--
ALTER TABLE `store_cms_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`);

--
-- Индексы таблицы `store_compare_items`
--
ALTER TABLE `store_compare_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compare_items_product_id_foreign` (`product_id`),
  ADD KEY `compare_items_customer_id_foreign` (`customer_id`);

--
-- Индексы таблицы `store_core_config`
--
ALTER TABLE `store_core_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_countries`
--
ALTER TABLE `store_countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_country_states`
--
ALTER TABLE `store_country_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Индексы таблицы `store_country_state_translations`
--
ALTER TABLE `store_country_state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_translations_country_state_id_foreign` (`country_state_id`);

--
-- Индексы таблицы `store_country_translations`
--
ALTER TABLE `store_country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Индексы таблицы `store_currencies`
--
ALTER TABLE `store_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_currency_exchange_rates`
--
ALTER TABLE `store_currency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`);

--
-- Индексы таблицы `store_customers`
--
ALTER TABLE `store_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `customers_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_customer_groups`
--
ALTER TABLE `store_customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_code_unique` (`code`);

--
-- Индексы таблицы `store_customer_notes`
--
ALTER TABLE `store_customer_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_notes_customer_id_foreign` (`customer_id`);

--
-- Индексы таблицы `store_customer_password_resets`
--
ALTER TABLE `store_customer_password_resets`
  ADD KEY `customer_password_resets_email_index` (`email`);

--
-- Индексы таблицы `store_customer_social_accounts`
--
ALTER TABLE `store_customer_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  ADD KEY `customer_social_accounts_customer_id_foreign` (`customer_id`);

--
-- Индексы таблицы `store_datagrid_saved_filters`
--
ALTER TABLE `store_datagrid_saved_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`);

--
-- Индексы таблицы `store_downloadable_link_purchased`
--
ALTER TABLE `store_downloadable_link_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  ADD KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  ADD KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`);

--
-- Индексы таблицы `store_failed_jobs`
--
ALTER TABLE `store_failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `store_imports`
--
ALTER TABLE `store_imports`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_import_batches`
--
ALTER TABLE `store_import_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_batches_import_id_foreign` (`import_id`);

--
-- Индексы таблицы `store_inventory_sources`
--
ALTER TABLE `store_inventory_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_sources_code_unique` (`code`);

--
-- Индексы таблицы `store_invoices`
--
ALTER TABLE `store_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `store_invoice_items`
--
ALTER TABLE `store_invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `store_jobs`
--
ALTER TABLE `store_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `store_job_batches`
--
ALTER TABLE `store_job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_locales`
--
ALTER TABLE `store_locales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locales_code_unique` (`code`);

--
-- Индексы таблицы `store_marketing_campaigns`
--
ALTER TABLE `store_marketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  ADD KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Индексы таблицы `store_marketing_events`
--
ALTER TABLE `store_marketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_marketing_templates`
--
ALTER TABLE `store_marketing_templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_migrations`
--
ALTER TABLE `store_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_notifications`
--
ALTER TABLE `store_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `store_orders`
--
ALTER TABLE `store_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_order_comments`
--
ALTER TABLE `store_order_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `store_order_items`
--
ALTER TABLE `store_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_parent_id_foreign` (`parent_id`),
  ADD KEY `order_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Индексы таблицы `store_order_payment`
--
ALTER TABLE `store_order_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `store_order_transactions`
--
ALTER TABLE `store_order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `store_password_resets`
--
ALTER TABLE `store_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `store_personal_access_tokens`
--
ALTER TABLE `store_personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `store_products`
--
ALTER TABLE `store_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `store_product_attribute_values`
--
ALTER TABLE `store_product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  ADD UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Индексы таблицы `store_product_bundle_options`
--
ALTER TABLE `store_product_bundle_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_options_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `store_product_bundle_option_products`
--
ALTER TABLE `store_product_bundle_option_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  ADD KEY `product_bundle_option_products_product_bundle_option_id_foreign` (`product_bundle_option_id`);

--
-- Индексы таблицы `store_product_bundle_option_translations`
--
ALTER TABLE `store_product_bundle_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  ADD UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`);

--
-- Индексы таблицы `store_product_categories`
--
ALTER TABLE `store_product_categories`
  ADD UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `store_product_channels`
--
ALTER TABLE `store_product_channels`
  ADD UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_channels_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_product_cross_sells`
--
ALTER TABLE `store_product_cross_sells`
  ADD UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_cross_sells_child_id_foreign` (`child_id`);

--
-- Индексы таблицы `store_product_customer_group_prices`
--
ALTER TABLE `store_product_customer_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  ADD KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Индексы таблицы `store_product_downloadable_links`
--
ALTER TABLE `store_product_downloadable_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_links_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `store_product_downloadable_link_translations`
--
ALTER TABLE `store_product_downloadable_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`);

--
-- Индексы таблицы `store_product_downloadable_samples`
--
ALTER TABLE `store_product_downloadable_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_samples_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `store_product_downloadable_sample_translations`
--
ALTER TABLE `store_product_downloadable_sample_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`);

--
-- Индексы таблицы `store_product_flat`
--
ALTER TABLE `store_product_flat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  ADD KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `product_flat_parent_id_foreign` (`parent_id`);

--
-- Индексы таблицы `store_product_grouped_products`
--
ALTER TABLE `store_product_grouped_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  ADD KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`);

--
-- Индексы таблицы `store_product_images`
--
ALTER TABLE `store_product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `store_product_inventories`
--
ALTER TABLE `store_product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  ADD KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Индексы таблицы `store_product_inventory_indices`
--
ALTER TABLE `store_product_inventory_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_inventory_indices_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_product_ordered_inventories`
--
ALTER TABLE `store_product_ordered_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_product_price_indices`
--
ALTER TABLE `store_product_price_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  ADD KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  ADD KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`);

--
-- Индексы таблицы `store_product_relations`
--
ALTER TABLE `store_product_relations`
  ADD UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_relations_child_id_foreign` (`child_id`);

--
-- Индексы таблицы `store_product_reviews`
--
ALTER TABLE `store_product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `store_product_review_attachments`
--
ALTER TABLE `store_product_review_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_images_review_id_foreign` (`review_id`);

--
-- Индексы таблицы `store_product_super_attributes`
--
ALTER TABLE `store_product_super_attributes`
  ADD UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  ADD KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Индексы таблицы `store_product_up_sells`
--
ALTER TABLE `store_product_up_sells`
  ADD UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_up_sells_child_id_foreign` (`child_id`);

--
-- Индексы таблицы `store_product_videos`
--
ALTER TABLE `store_product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Индексы таблицы `store_refunds`
--
ALTER TABLE `store_refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Индексы таблицы `store_refund_items`
--
ALTER TABLE `store_refund_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_items_parent_id_foreign` (`parent_id`),
  ADD KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `refund_items_refund_id_foreign` (`refund_id`);

--
-- Индексы таблицы `store_roles`
--
ALTER TABLE `store_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_search_synonyms`
--
ALTER TABLE `store_search_synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_search_terms`
--
ALTER TABLE `store_search_terms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_terms_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_shipments`
--
ALTER TABLE `store_shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Индексы таблицы `store_shipment_items`
--
ALTER TABLE `store_shipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Индексы таблицы `store_sitemaps`
--
ALTER TABLE `store_sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_subscribers_list`
--
ALTER TABLE `store_subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  ADD KEY `subscribers_list_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_tax_categories`
--
ALTER TABLE `store_tax_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_categories_code_unique` (`code`);

--
-- Индексы таблицы `store_tax_categories_tax_rates`
--
ALTER TABLE `store_tax_categories_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  ADD KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Индексы таблицы `store_tax_rates`
--
ALTER TABLE `store_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rates_identifier_unique` (`identifier`);

--
-- Индексы таблицы `store_theme_customizations`
--
ALTER TABLE `store_theme_customizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customizations_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_theme_customization_translations`
--
ALTER TABLE `store_theme_customization_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customization_translations_theme_customization_id_foreign` (`theme_customization_id`);

--
-- Индексы таблицы `store_url_rewrites`
--
ALTER TABLE `store_url_rewrites`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `store_users`
--
ALTER TABLE `store_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `store_visits`
--
ALTER TABLE `store_visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  ADD KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  ADD KEY `visits_channel_id_foreign` (`channel_id`);

--
-- Индексы таблицы `store_wishlist`
--
ALTER TABLE `store_wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_customer_id_foreign` (`customer_id`);

--
-- Индексы таблицы `store_wishlist_items`
--
ALTER TABLE `store_wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_items_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `store_addresses`
--
ALTER TABLE `store_addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_admins`
--
ALTER TABLE `store_admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_attributes`
--
ALTER TABLE `store_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `store_attribute_families`
--
ALTER TABLE `store_attribute_families`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_attribute_groups`
--
ALTER TABLE `store_attribute_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `store_attribute_options`
--
ALTER TABLE `store_attribute_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `store_attribute_option_translations`
--
ALTER TABLE `store_attribute_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `store_attribute_translations`
--
ALTER TABLE `store_attribute_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `store_cart`
--
ALTER TABLE `store_cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `store_cart_items`
--
ALTER TABLE `store_cart_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `store_cart_item_inventories`
--
ALTER TABLE `store_cart_item_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_cart_payment`
--
ALTER TABLE `store_cart_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_cart_rules`
--
ALTER TABLE `store_cart_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_cart_rule_coupons`
--
ALTER TABLE `store_cart_rule_coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_cart_rule_coupon_usage`
--
ALTER TABLE `store_cart_rule_coupon_usage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_cart_rule_customers`
--
ALTER TABLE `store_cart_rule_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_cart_rule_translations`
--
ALTER TABLE `store_cart_rule_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_cart_shipping_rates`
--
ALTER TABLE `store_cart_shipping_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_catalog_rules`
--
ALTER TABLE `store_catalog_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_catalog_rule_products`
--
ALTER TABLE `store_catalog_rule_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_catalog_rule_product_prices`
--
ALTER TABLE `store_catalog_rule_product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_categories`
--
ALTER TABLE `store_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `store_category_translations`
--
ALTER TABLE `store_category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `store_channels`
--
ALTER TABLE `store_channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_channel_translations`
--
ALTER TABLE `store_channel_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_cms_pages`
--
ALTER TABLE `store_cms_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `store_cms_page_translations`
--
ALTER TABLE `store_cms_page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `store_compare_items`
--
ALTER TABLE `store_compare_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_core_config`
--
ALTER TABLE `store_core_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT для таблицы `store_countries`
--
ALTER TABLE `store_countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT для таблицы `store_country_states`
--
ALTER TABLE `store_country_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT для таблицы `store_country_state_translations`
--
ALTER TABLE `store_country_state_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_country_translations`
--
ALTER TABLE `store_country_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_currencies`
--
ALTER TABLE `store_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_currency_exchange_rates`
--
ALTER TABLE `store_currency_exchange_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_customers`
--
ALTER TABLE `store_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_customer_groups`
--
ALTER TABLE `store_customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `store_customer_notes`
--
ALTER TABLE `store_customer_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_customer_social_accounts`
--
ALTER TABLE `store_customer_social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_datagrid_saved_filters`
--
ALTER TABLE `store_datagrid_saved_filters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_downloadable_link_purchased`
--
ALTER TABLE `store_downloadable_link_purchased`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_failed_jobs`
--
ALTER TABLE `store_failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_imports`
--
ALTER TABLE `store_imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_import_batches`
--
ALTER TABLE `store_import_batches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_inventory_sources`
--
ALTER TABLE `store_inventory_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_invoices`
--
ALTER TABLE `store_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_invoice_items`
--
ALTER TABLE `store_invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_jobs`
--
ALTER TABLE `store_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_locales`
--
ALTER TABLE `store_locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_marketing_campaigns`
--
ALTER TABLE `store_marketing_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_marketing_events`
--
ALTER TABLE `store_marketing_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_marketing_templates`
--
ALTER TABLE `store_marketing_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_migrations`
--
ALTER TABLE `store_migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT для таблицы `store_notifications`
--
ALTER TABLE `store_notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_orders`
--
ALTER TABLE `store_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_order_comments`
--
ALTER TABLE `store_order_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_order_items`
--
ALTER TABLE `store_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_order_payment`
--
ALTER TABLE `store_order_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_order_transactions`
--
ALTER TABLE `store_order_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_personal_access_tokens`
--
ALTER TABLE `store_personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_products`
--
ALTER TABLE `store_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `store_product_attribute_values`
--
ALTER TABLE `store_product_attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT для таблицы `store_product_bundle_options`
--
ALTER TABLE `store_product_bundle_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_bundle_option_products`
--
ALTER TABLE `store_product_bundle_option_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_bundle_option_translations`
--
ALTER TABLE `store_product_bundle_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_customer_group_prices`
--
ALTER TABLE `store_product_customer_group_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_downloadable_links`
--
ALTER TABLE `store_product_downloadable_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_downloadable_link_translations`
--
ALTER TABLE `store_product_downloadable_link_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_downloadable_samples`
--
ALTER TABLE `store_product_downloadable_samples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_downloadable_sample_translations`
--
ALTER TABLE `store_product_downloadable_sample_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_flat`
--
ALTER TABLE `store_product_flat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `store_product_grouped_products`
--
ALTER TABLE `store_product_grouped_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_images`
--
ALTER TABLE `store_product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `store_product_inventories`
--
ALTER TABLE `store_product_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `store_product_inventory_indices`
--
ALTER TABLE `store_product_inventory_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `store_product_ordered_inventories`
--
ALTER TABLE `store_product_ordered_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_price_indices`
--
ALTER TABLE `store_product_price_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT для таблицы `store_product_reviews`
--
ALTER TABLE `store_product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_review_attachments`
--
ALTER TABLE `store_product_review_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_product_videos`
--
ALTER TABLE `store_product_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_refunds`
--
ALTER TABLE `store_refunds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_refund_items`
--
ALTER TABLE `store_refund_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_roles`
--
ALTER TABLE `store_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_search_synonyms`
--
ALTER TABLE `store_search_synonyms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_search_terms`
--
ALTER TABLE `store_search_terms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_shipments`
--
ALTER TABLE `store_shipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_shipment_items`
--
ALTER TABLE `store_shipment_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_sitemaps`
--
ALTER TABLE `store_sitemaps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_subscribers_list`
--
ALTER TABLE `store_subscribers_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `store_tax_categories`
--
ALTER TABLE `store_tax_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_tax_categories_tax_rates`
--
ALTER TABLE `store_tax_categories_tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_tax_rates`
--
ALTER TABLE `store_tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_theme_customizations`
--
ALTER TABLE `store_theme_customizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `store_theme_customization_translations`
--
ALTER TABLE `store_theme_customization_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `store_url_rewrites`
--
ALTER TABLE `store_url_rewrites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `store_users`
--
ALTER TABLE `store_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_visits`
--
ALTER TABLE `store_visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `store_wishlist`
--
ALTER TABLE `store_wishlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `store_wishlist_items`
--
ALTER TABLE `store_wishlist_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `store_addresses`
--
ALTER TABLE `store_addresses`
  ADD CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `store_addresses` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `store_attribute_groups`
--
ALTER TABLE `store_attribute_groups`
  ADD CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `store_attribute_families` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_attribute_group_mappings`
--
ALTER TABLE `store_attribute_group_mappings`
  ADD CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `store_attribute_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `store_attributes` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_attribute_options`
--
ALTER TABLE `store_attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `store_attributes` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_attribute_option_translations`
--
ALTER TABLE `store_attribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `store_attribute_options` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_attribute_translations`
--
ALTER TABLE `store_attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `store_attributes` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart`
--
ALTER TABLE `store_cart`
  ADD CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_items`
--
ALTER TABLE `store_cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_cart_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `store_tax_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `store_cart_payment`
--
ALTER TABLE `store_cart_payment`
  ADD CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_rule_channels`
--
ALTER TABLE `store_cart_rule_channels`
  ADD CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `store_cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_rule_coupons`
--
ALTER TABLE `store_cart_rule_coupons`
  ADD CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `store_cart_rules` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_rule_coupon_usage`
--
ALTER TABLE `store_cart_rule_coupon_usage`
  ADD CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `store_cart_rule_coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_rule_customers`
--
ALTER TABLE `store_cart_rule_customers`
  ADD CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `store_cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_rule_customer_groups`
--
ALTER TABLE `store_cart_rule_customer_groups`
  ADD CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `store_cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_rule_translations`
--
ALTER TABLE `store_cart_rule_translations`
  ADD CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `store_cart_rules` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cart_shipping_rates`
--
ALTER TABLE `store_cart_shipping_rates`
  ADD CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `store_cart` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_catalog_rule_channels`
--
ALTER TABLE `store_catalog_rule_channels`
  ADD CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `store_catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_catalog_rule_customer_groups`
--
ALTER TABLE `store_catalog_rule_customer_groups`
  ADD CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `store_catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_catalog_rule_products`
--
ALTER TABLE `store_catalog_rule_products`
  ADD CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `store_catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_catalog_rule_product_prices`
--
ALTER TABLE `store_catalog_rule_product_prices`
  ADD CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `store_catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_category_filterable_attributes`
--
ALTER TABLE `store_category_filterable_attributes`
  ADD CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `store_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `store_categories` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_category_translations`
--
ALTER TABLE `store_category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `store_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `store_locales` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_channels`
--
ALTER TABLE `store_channels`
  ADD CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `store_currencies` (`id`),
  ADD CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `store_locales` (`id`),
  ADD CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `store_categories` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `store_channel_currencies`
--
ALTER TABLE `store_channel_currencies`
  ADD CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `store_currencies` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_channel_inventory_sources`
--
ALTER TABLE `store_channel_inventory_sources`
  ADD CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `store_inventory_sources` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_channel_locales`
--
ALTER TABLE `store_channel_locales`
  ADD CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `store_locales` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_channel_translations`
--
ALTER TABLE `store_channel_translations`
  ADD CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cms_page_channels`
--
ALTER TABLE `store_cms_page_channels`
  ADD CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `store_cms_pages` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_cms_page_translations`
--
ALTER TABLE `store_cms_page_translations`
  ADD CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `store_cms_pages` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_compare_items`
--
ALTER TABLE `store_compare_items`
  ADD CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_country_states`
--
ALTER TABLE `store_country_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `store_countries` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_country_state_translations`
--
ALTER TABLE `store_country_state_translations`
  ADD CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `store_country_states` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_country_translations`
--
ALTER TABLE `store_country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `store_countries` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_currency_exchange_rates`
--
ALTER TABLE `store_currency_exchange_rates`
  ADD CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `store_currencies` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_customers`
--
ALTER TABLE `store_customers`
  ADD CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `store_customer_notes`
--
ALTER TABLE `store_customer_notes`
  ADD CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_customer_social_accounts`
--
ALTER TABLE `store_customer_social_accounts`
  ADD CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_downloadable_link_purchased`
--
ALTER TABLE `store_downloadable_link_purchased`
  ADD CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `store_order_items` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_import_batches`
--
ALTER TABLE `store_import_batches`
  ADD CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `store_imports` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_invoices`
--
ALTER TABLE `store_invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_invoice_items`
--
ALTER TABLE `store_invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `store_invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_invoice_items` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_marketing_campaigns`
--
ALTER TABLE `store_marketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `store_marketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `store_marketing_templates` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `store_notifications`
--
ALTER TABLE `store_notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_orders`
--
ALTER TABLE `store_orders`
  ADD CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `store_order_comments`
--
ALTER TABLE `store_order_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_order_items`
--
ALTER TABLE `store_order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `store_tax_categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `store_order_payment`
--
ALTER TABLE `store_order_payment`
  ADD CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_order_transactions`
--
ALTER TABLE `store_order_transactions`
  ADD CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_products`
--
ALTER TABLE `store_products`
  ADD CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `store_attribute_families` (`id`),
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_attribute_values`
--
ALTER TABLE `store_product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `store_attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_bundle_options`
--
ALTER TABLE `store_product_bundle_options`
  ADD CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_bundle_option_products`
--
ALTER TABLE `store_product_bundle_option_products`
  ADD CONSTRAINT `product_bundle_option_products_product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `store_product_bundle_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_bundle_option_translations`
--
ALTER TABLE `store_product_bundle_option_translations`
  ADD CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `store_product_bundle_options` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_categories`
--
ALTER TABLE `store_product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `store_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_channels`
--
ALTER TABLE `store_product_channels`
  ADD CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_cross_sells`
--
ALTER TABLE `store_product_cross_sells`
  ADD CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_customer_group_prices`
--
ALTER TABLE `store_product_customer_group_prices`
  ADD CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_downloadable_links`
--
ALTER TABLE `store_product_downloadable_links`
  ADD CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_downloadable_link_translations`
--
ALTER TABLE `store_product_downloadable_link_translations`
  ADD CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `store_product_downloadable_links` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_downloadable_samples`
--
ALTER TABLE `store_product_downloadable_samples`
  ADD CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_downloadable_sample_translations`
--
ALTER TABLE `store_product_downloadable_sample_translations`
  ADD CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `store_product_downloadable_samples` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_flat`
--
ALTER TABLE `store_product_flat`
  ADD CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `store_attribute_families` (`id`),
  ADD CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_product_flat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_grouped_products`
--
ALTER TABLE `store_product_grouped_products`
  ADD CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_images`
--
ALTER TABLE `store_product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_inventories`
--
ALTER TABLE `store_product_inventories`
  ADD CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `store_inventory_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_inventory_indices`
--
ALTER TABLE `store_product_inventory_indices`
  ADD CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_ordered_inventories`
--
ALTER TABLE `store_product_ordered_inventories`
  ADD CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_price_indices`
--
ALTER TABLE `store_product_price_indices`
  ADD CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `store_customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_relations`
--
ALTER TABLE `store_product_relations`
  ADD CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_reviews`
--
ALTER TABLE `store_product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_review_attachments`
--
ALTER TABLE `store_product_review_attachments`
  ADD CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `store_product_reviews` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_super_attributes`
--
ALTER TABLE `store_product_super_attributes`
  ADD CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `store_attributes` (`id`),
  ADD CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_up_sells`
--
ALTER TABLE `store_product_up_sells`
  ADD CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_product_videos`
--
ALTER TABLE `store_product_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_refunds`
--
ALTER TABLE `store_refunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_refund_items`
--
ALTER TABLE `store_refund_items`
  ADD CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `store_order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `store_refund_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `store_refunds` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_search_terms`
--
ALTER TABLE `store_search_terms`
  ADD CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_shipments`
--
ALTER TABLE `store_shipments`
  ADD CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `store_inventory_sources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `store_orders` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_shipment_items`
--
ALTER TABLE `store_shipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `store_shipments` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_subscribers_list`
--
ALTER TABLE `store_subscribers_list`
  ADD CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `store_tax_categories_tax_rates`
--
ALTER TABLE `store_tax_categories_tax_rates`
  ADD CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `store_tax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `store_tax_rates` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_theme_customizations`
--
ALTER TABLE `store_theme_customizations`
  ADD CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_theme_customization_translations`
--
ALTER TABLE `store_theme_customization_translations`
  ADD CONSTRAINT `theme_customization_translations_theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `store_theme_customizations` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_visits`
--
ALTER TABLE `store_visits`
  ADD CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_wishlist`
--
ALTER TABLE `store_wishlist`
  ADD CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `store_wishlist_items`
--
ALTER TABLE `store_wishlist_items`
  ADD CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `store_channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `store_customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `store_products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
