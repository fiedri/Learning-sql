CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


CREATE TABLE "teams" (
  "team_id" SERIAL PRIMARY KEY NOT NULL,
  "name" VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE "games" (
  "game_id" SERIAL PRIMARY KEY NOT NULL,
  "year" int NOT NULL,
  "round" VARCHAR(100) NOT NULL,
  "winner_id" int NOT NULL,
  "opponent_id" int NOT NULL,
  "winner_goals" int NOT NULL,
  "opponent_goals" int NOT NULL
);

ALTER TABLE "games" ADD FOREIGN KEY ("winner_id") REFERENCES "teams" ("team_id");

ALTER TABLE "games" ADD FOREIGN KEY ("opponent_id") REFERENCES "teams" ("team_id");
