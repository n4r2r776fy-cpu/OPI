# Deployment Guide — Space Missions Database

Цей документ описує процес встановлення, імпорту та запуску проєкту бази даних космічних місій у середовищі MySQL.

---

## 1. Необхідне програмне забезпечення
- MySQL Server 8.x
- MySQL Workbench, phpMyAdmin або DBeaver
- XAMPP (опціонально)
- Права MySQL-користувача:
  - CREATE DATABASE
  - CREATE TABLE
  - INSERT, UPDATE, DELETE, SELECT

---

## 2. Підготовка середовища
1. Встановити MySQL Server або XAMPP.
2. Переконатися, що MySQL-сервер працює.
3. Відкрити MySQL Workbench або інший SQL-клієнт.

---

## 3. Створення бази даних

Виконати у MySQL:

```sql
CREATE DATABASE space_missions_db;
USE space_missions_db;
