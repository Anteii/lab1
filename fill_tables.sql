DROP TABLE IF EXISTS agent;
DROP TABLE IF EXISTS weapon;
DROP TABLE IF EXISTS utility;
DROP TABLE IF EXISTS agent_has_utility;

CREATE TABLE weapon(
                       id SERIAL NOT NULL,
                       name VARCHAR(255) NOT NULL,
                       damage INTEGER NOT NULL,
                       magazine_capacity VARCHAR(255) NOT NULL,
                       rounds INTEGER NOT NULL,
                       reload_time INTEGER NOT NULL,
                       PRIMARY KEY (id)
);
CREATE TABLE utility(
                        id SERIAL NOT NULL,
                        name VARCHAR(255) NOT NULL,
                        damage VARCHAR(255) NOT NULL,
                        PRIMARY KEY (id)
);

CREATE TABLE agent(
                      id SERIAL NOT NULL,
                      name VARCHAR(255) NOT NULL,
                      health INTEGER NOT NULL,
                      armor INTEGER NOT NULL,
                      main_weapon INTEGER NOT NULL REFERENCES weapon(id),
                      secondary_weapon INTEGER NOT NULL  REFERENCES weapon(id),
                      PRIMARY KEY (id)

);

CREATE TABLE agent_has_utility(
                                  agent_id SERIAL NOT NULL,
                                  utility_id INTEGER NOT NULL,
                                  count INTEGER NOT NULL,
                                  PRIMARY KEY(agent_id, utility_id)
);

INSERT INTO weapon (name, damage, magazine_capacity, rounds, reload_time) VALUES ('AK-47', 90, 90, 90, 2);
INSERT INTO weapon (name, damage, magazine_capacity, rounds, reload_time) VALUES ('M4A4', 90, 90, 90, 2);
INSERT INTO weapon (name, damage, magazine_capacity, rounds, reload_time) VALUES ('M4A1-S', 90, 90, 90, 2);
INSERT INTO weapon (name, damage, magazine_capacity, rounds, reload_time) VALUES ('AUG', 90, 90, 90, 2);

INSERT INTO weapon (name, damage, magazine_capacity, rounds, reload_time) VALUES ('USP-S', 90, 90, 90, 2);
INSERT INTO weapon (name, damage, magazine_capacity, rounds, reload_time) VALUES ('Desert Eagle', 90, 90, 90, 2);
INSERT INTO weapon (name, damage, magazine_capacity, rounds, reload_time) VALUES ('Glock', 90, 90, 90, 2);

INSERT INTO utility (name, damage) VALUES ('small grenade', 30);
INSERT INTO utility (name, damage) VALUES ('medium grenade', 60);
INSERT INTO utility (name, damage) VALUES ('big grenade', 90);

INSERT INTO agent (name, health, armor, main_weapon, secondary_weapon) VALUES ('Agent1', 100, 100, 1, 5);
INSERT INTO agent (name, health, armor, main_weapon, secondary_weapon) VALUES ('Agent2', 100, 100, 1, 5);
INSERT INTO agent (name, health, armor, main_weapon, secondary_weapon) VALUES ('Agent3', 100, 100, 1, 5);


INSERT INTO agent_has_utility (agent_id, utility_id, count) VALUES (0, 0, 2);
INSERT INTO agent_has_utility (agent_id, utility_id, count) VALUES (0, 1, 1);
INSERT INTO agent_has_utility (agent_id, utility_id, count) VALUES (3, 1, 1);


