## Laravel-store
Laravel-store - это интернет магазин.

## Локальная установка
### php.ini
Включите дополнительные пакеты:
```
extension=intl
extension=gd
extension=zip
```

### Composer@NodeJs
Установим необходимые модуля
```shell
composer install
npm install
```

## XAMPP
### Настройка хостинга
Вставьте этот код в конец:
`C:/Windows/System32/drivers/etc/hosts`
```
127.0.0.1	localhost
127.0.0.1	laravel.store
```
`C:/xampp/apache/conf/extra/httpd-vhosts.conf`
```
<VirtualHost *:80>
    DocumentRoot "C:/xampp/htdocs"
    ServerName localhost
</VirtualHost>

<VirtualHost *:80>
    DocumentRoot "C:/xampp/htdocs/laravel.store/public"
    ServerName laravel.store
 </VirtualHost>
```

### Настройка PhpMyAdmin
Зайдите на http://localhost/phpmyadmin/

### Настройка БД
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=store_test
DB_USERNAME=root
DB_PASSWORD=
DB_PREFIX=store_
```

## Laravel artisan
### Настройка хостинга
1. Сервер
```shell
php artisan serve
```
2. Установка иначе не запустится дев режим
```shell
npm install
```
3. Дев режим
```shell
npm run dev
```

### Настройка SQlite
Отредактировать `php.ini`
```ini
extension=pdo_sqlite
extension=sqlite3
```

### Настройка БД
Отредактируем `.env`, чтобы включить `sqlite`
```
DB_CONNECTION=sqlite
# DB_HOST=127.0.0.1
# DB_PORT=3306
# DB_DATABASE=laravel
# DB_USERNAME=root
# DB_PASSWORD=
```


## OpenServer
### Настройка хостинга
1. Зайти в `./OSPanel/home/(NAME)`, где `(NAME)` - локальное название домена.
2. Создать в `./OSPanel/home/(NAME)` папку `.osp`, а в ней файл `project.ini`.
3. Прописать зависимости, например: 
```ini
[(NAME)]

php_engine   = PHP-8.3
public_dir   = {base_dir}\public
```

### Настройка PhpMyAdmin
1. Зайти в `./OSPanel/home/pma.loc`
2. Создать в `./OSPanel/home/pma.loc` папку `.osp`, а в ней файл `project.ini`.
3. Прописать зависимости, например: 
```ini
[pma.loc]

php_engine   = PHP-8.3-FCGI
nginx_engine = Nginx-1.26
```
4. Скачать с https://www.phpmyadmin.net/ панель администрации. 
5. Установить ее в корень проекта `./OSPanel/home/pma.loc`
6. Скопировать из `./OSPanel/home/pma.loc` файл `config.sample.inc.php` и переименовать в `config.inc.php`.
7. Прописать доступ к различным включенным модулям, например: 
```php
$i++;                                          //Обязательный счетчик для настройки БД 
$cfg['Servers'][$i]['auth_type'] = 'cookie';   //Тип аутификации
$cfg['Servers'][$i]['host'] = 'MariaDB-11.2';  //Название нашего модуля
$cfg['Servers'][$i]['compress'] = false;       //
$cfg['Servers'][$i]['AllowNoPassword'] = true; //Разрешаем пользователей без пароля

$i++;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = 'MySQL-8.2';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
```

### Настройка БД
Отредактируем `.env`
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=store_test
DB_USERNAME=root
DB_PASSWORD=
DB_PREFIX=store_
```

## Админ-панель
Зайдите в админ панель: `[https://example.com]/admin/`.  И введите:
```
Email: admin@example.com
Password: admin123
```

## Пользователь
Зайдите в пользовательскую панель: `[https://example.com]/`.  И введите:
```
Email: test@test.com
Password: test@test.com
```
