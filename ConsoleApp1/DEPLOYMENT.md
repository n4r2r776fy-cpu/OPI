# Deployment Guide — Space Missions Database

Цей документ описує повний процес встановлення, імпорту та запуску проєкту бази даних космічних місій у середовищі MySQL.

---

## 1. Необхідне програмне забезпечення
- **MySQL Server 8.x**
- **MySQL Workbench**, phpMyAdmin або DBeaver
- **XAMPP** (опціонально)
- Права MySQL-користувача:
  - CREATE DATABASE
  - CREATE TABLE
  - INSERT, UPDATE, DELETE, SELECT

---

## 2. Підготовка середовища
1. Встановити MySQL Server / XAMPP.
2. Переконатися, що MySQL-сервер активний.
3. Відкрити MySQL Workbench або інший SQL-клієнт.

---

## 3. Створення Бази Даних

Виконати в MySQL:

---

sql
CREATE DATABASE space_missions_db;
USE space_missions_db;
