CREATE DATABASE IF NOT EXISTS space_missions_db;
USE space_missions_db;

-- 1. Таблиця місій
CREATE TABLE missions (
    mission_id      INT AUTO_INCREMENT PRIMARY KEY,
    mission_name    VARCHAR(100) NOT NULL,
    mission_code    VARCHAR(50)  NOT NULL UNIQUE,
    target_body     VARCHAR(100) NOT NULL,      -- Mars, Moon, ISS, etc.
    mission_type    VARCHAR(50)  NOT NULL,      -- Orbital, Landing, Flyby
    launch_date     DATE         NOT NULL,
    status          VARCHAR(50)  NOT NULL,      -- Planned, Active, Completed, Failed
    description     TEXT
);

-- 2. Космічні апарати
CREATE TABLE spacecraft (
    spacecraft_id   INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    type            VARCHAR(50)  NOT NULL,      -- Orbiter, Lander, Rover, Cargo
    agency          VARCHAR(100) NOT NULL,      -- NASA, ESA, SpaceX, etc.
    manufacturer    VARCHAR(100),
    launch_mass_kg  DECIMAL(10,2),
    status          VARCHAR(50)  NOT NULL       -- Active, Retired, Lost
);

-- 3. Зв’язок місія–апарат
CREATE TABLE mission_spacecraft (
    mission_id      INT NOT NULL,
    spacecraft_id   INT NOT NULL,
    role            VARCHAR(50),                -- Primary, Backup, Support
    PRIMARY KEY (mission_id, spacecraft_id),
    FOREIGN KEY (mission_id) REFERENCES missions(mission_id),
    FOREIGN KEY (spacecraft_id) REFERENCES spacecraft(spacecraft_id)
);

-- 4. Члени екіпажу
CREATE TABLE crew_members (
    crew_id         INT AUTO_INCREMENT PRIMARY KEY,
    first_name      VARCHAR(50)  NOT NULL,
    last_name       VARCHAR(50)  NOT NULL,
    role            VARCHAR(100) NOT NULL,      -- Commander, Pilot, Engineer
    nationality     VARCHAR(50),
    birth_date      DATE,
    status          VARCHAR(50)  NOT NULL       -- Active, Reserve, Retired
);

-- 5. Зв’язок місія–екіпаж
CREATE TABLE mission_crew (
    mission_id      INT NOT NULL,
    crew_id         INT NOT NULL,
    role_on_mission VARCHAR(100),
    PRIMARY KEY (mission_id, crew_id),
    FOREIGN KEY (mission_id) REFERENCES missions(mission_id),
    FOREIGN KEY (crew_id)    REFERENCES crew_members(crew_id)
);

-- 6. Наземні станції
CREATE TABLE ground_stations (
    station_id      INT AUTO_INCREMENT PRIMARY KEY,
    name            VARCHAR(100) NOT NULL,
    location        VARCHAR(200) NOT NULL,
    country         VARCHAR(50),
    time_zone       VARCHAR(50)
);

-- 7. Телеметрія
CREATE TABLE telemetry (
    telemetry_id    BIGINT AUTO_INCREMENT PRIMARY KEY,
    mission_id      INT NOT NULL,
    spacecraft_id   INT,
    station_id      INT,
    timestamp_utc   DATETIME     NOT NULL,
    parameter       VARCHAR(100) NOT NULL,      -- e.g. "FuelLevel", "Temperature"
    value           VARCHAR(100) NOT NULL,
    unit            VARCHAR(20),
    FOREIGN KEY (mission_id)    REFERENCES missions(mission_id),
    FOREIGN KEY (spacecraft_id) REFERENCES spacecraft(spacecraft_id),
    FOREIGN KEY (station_id)    REFERENCES ground_stations(station_id)
);

-- 8. Аномалії
CREATE TABLE anomalies (
    anomaly_id      INT AUTO_INCREMENT PRIMARY KEY,
    mission_id      INT NOT NULL,
    spacecraft_id   INT,
    detected_at     DATETIME     NOT NULL,
    severity        VARCHAR(20)  NOT NULL,      -- Low, Medium, High, Critical
    subsystem       VARCHAR(100) NOT NULL,      -- Power, Comms, Navigation, etc.
    description     TEXT         NOT NULL,
    status          VARCHAR(50)  NOT NULL,      -- Open, In Progress, Resolved
    FOREIGN KEY (mission_id)    REFERENCES missions(mission_id),
    FOREIGN KEY (spacecraft_id) REFERENCES spacecraft(spacecraft_id)
);

-- 9. Корисний вантаж
CREATE TABLE cargo (
    cargo_id        INT AUTO_INCREMENT PRIMARY KEY,
    mission_id      INT NOT NULL,
    name            VARCHAR(100) NOT NULL,
    cargo_type      VARCHAR(50)  NOT NULL,      -- Science, Supply, Equipment
    mass_kg         DECIMAL(10,2),
    destination     VARCHAR(100),
    FOREIGN KEY (mission_id) REFERENCES missions(mission_id)
);
