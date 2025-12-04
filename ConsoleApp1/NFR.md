# Non-Functional Requirements (NFR)
## Project: Space Missions DB

## 1. Performance Requirements
- SELECT-запити виконуються < 1 секунди.
- Підтримка індексів у критичних таблицях (missions, telemetry).

## 2. Reliability
- Дані повинні відповідати референційній цілісності.
- Підтримка резервного копіювання через mysqldump.

## 3. Scalability
- Можливість розширення БД новими сутностями.
- Структура не повинна вимагати повного редизайну під час змін.

## 4. Maintainability
- Короткі, зрозумілі назви колонок.
- Чітко описана структура у документації.

## 5. Security
- Обмеження доступу до БД на рівні користувача.
- PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL.

## 6. Usability
- Таблиці мають логічні назви (snake_case).
- Інтуїтивно зрозумілі зв’язки між сутностями.
