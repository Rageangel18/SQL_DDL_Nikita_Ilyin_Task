CREATE TABLE Countries (
  country_id SERIAL PRIMARY KEY,
  country_name VARCHAR
);

CREATE TABLE Mountains (
  mountain_id SERIAL PRIMARY KEY,
  name VARCHAR,
  height FLOAT,
  country_id INTEGER REFERENCES Countries(country_id)
);

CREATE TABLE Climbers (
  climber_id SERIAL PRIMARY KEY,
  name VARCHAR,
  address VARCHAR
);

CREATE TABLE Climbs (
  climb_id SERIAL PRIMARY KEY,
  climber_id INTEGER REFERENCES Climbers(climber_id),
  mountain_id INTEGER REFERENCES Mountains(mountain_id),
  start_date DATE,
  end_date DATE
);

CREATE TABLE ClimbEquipment (
  climb_id INTEGER REFERENCES Climbs(climb_id),
  equipment_id INTEGER,
  PRIMARY KEY (climb_id, equipment_id)
);

CREATE TABLE Equipment (
  equipment_id SERIAL PRIMARY KEY,
  equipment_name VARCHAR,
  description VARCHAR
);

CREATE TABLE ClimbWeather (
  climb_id INTEGER REFERENCES Climbs(climb_id),
  weather_id INTEGER,
  PRIMARY KEY (climb_id, weather_id)
);

CREATE TABLE WeatherConditions (
  weather_id SERIAL PRIMARY KEY,
  condition_name VARCHAR,
  temperature FLOAT,
  precipitation FLOAT
);

CREATE TABLE ClimbParticipants (
  climb_id INTEGER REFERENCES Climbs(climb_id),
  participant_id INTEGER,
  PRIMARY KEY (climb_id, participant_id)
);

CREATE TABLE ClimbRoutes (
  route_id SERIAL PRIMARY KEY,
  climb_id INTEGER REFERENCES Climbs(climb_id),
  route_name VARCHAR,
  difficulty_rating VARCHAR,
  length FLOAT
);

CREATE TABLE ClimbStatistics (
  statistic_id SERIAL PRIMARY KEY,
  climb_id INTEGER REFERENCES Climbs(climb_id),
  total_distance FLOAT,
  average_speed FLOAT,
  duration_hours FLOAT,
  notes TEXT
);


INSERT INTO Countries (country_name) VALUES ('Nepal'), ('Switzerland');

INSERT INTO Mountains (name, height, country_id) VALUES 
  ('Mount Everest', 8848, 1),
  ('Matterhorn', 4478, 2);

INSERT INTO Climbers (name, address) VALUES ('John Doe', '123 Main St'), ('Jane Smith', '456 Oak Ave');

INSERT INTO Climbs (climber_id, mountain_id, start_date, end_date) VALUES 
  (1, 1, '2023-01-01', '2023-01-10'),
  (2, 2, '2023-02-01', '2023-02-05');

INSERT INTO ClimbEquipment (climb_id, equipment_id) VALUES 
  (1, 1),
  (2, 2);


INSERT INTO Equipment (equipment_name, description) VALUES 
  ('Climbing Boots', 'High-quality climbing boots'),
  ('Ice Axe', 'Durable ice axe for mountaineering');

INSERT INTO ClimbWeather (climb_id, weather_id) VALUES 
  (1, 1),
  (2, 2);


INSERT INTO WeatherConditions (condition_name, temperature, precipitation) VALUES 
  ('Clear Sky', -10, 0),
  ('Snowstorm', -5, 10);

INSERT INTO ClimbParticipants (climb_id, participant_id) VALUES 
  (1, 1),
  (2, 2);

INSERT INTO ClimbRoutes (climb_id, route_name, difficulty_rating, length) VALUES 
  (1, 'South Col Route', 'Difficult', 10),
  (2, 'Hornli Ridge', 'Medium', 5);

INSERT INTO ClimbStatistics (climb_id, total_distance, average_speed, duration_hours, notes) VALUES 
  (1, 20, 2, 8, 'Cool climb'),
  (2, 15, 3, 5, 'Enjoyable climb with some snowfall');
  
  ALTER TABLE WeatherConditions
  ALTER COLUMN condition_name SET NOT NULL,
  ALTER COLUMN temperature SET NOT NULL,
  ALTER COLUMN precipitation SET NOT NULL;
  
 ALTER TABLE ClimbRoutes
  ALTER COLUMN climb_id SET NOT NULL
  
  ALTER TABLE ClimbStatistics
  ALTER COLUMN climb_id SET NOT NULL,
  ALTER COLUMN total_distance SET NOT NULL,
  ALTER COLUMN average_speed SET NOT NULL,
  ALTER COLUMN duration_hours SET NOT NULL;
  
  ALTER TABLE Climbs
  ALTER COLUMN start_date SET DEFAULT CURRENT_DATE;
  
ALTER TABLE ClimbRoutes
  ALTER COLUMN distance SET NOT NULL;
  
  
  
  ALTER TABLE ClimbStatistics
ADD COLUMN record_ts DATE DEFAULT current_date;
UPDATE ClimbStatistics SET record_ts = current_date WHERE record_ts IS NULL;


ALTER TABLE Countries
ADD COLUMN record_ts DATE DEFAULT current_date;


ALTER TABLE Mountains
ADD COLUMN record_ts DATE DEFAULT current_date;


ALTER TABLE Climbers
ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE Climbs
ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE ClimbEquipment
ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE Equipment
ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE ClimbWeather
ADD COLUMN record_ts DATE DEFAULT current_date;
ALTER TABLE WeatherConditions
ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE ClimbParticipants
ADD COLUMN record_ts DATE DEFAULT current_date;

ALTER TABLE ClimbRoutes
ADD COLUMN record_ts DATE DEFAULT current_date;


UPDATE Countries SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE Mountains SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE Climbers SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE Climbs SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE ClimbEquipment SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE Equipment SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE ClimbWeather SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE WeatherConditions SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE ClimbParticipants SET record_ts = current_date WHERE record_ts IS NULL;
UPDATE ClimbRoutes SET record_ts = current_date WHERE record_ts IS NULL;