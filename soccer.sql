-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Teams" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "city" text   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "birthday" date   NOT NULL,
    "height" text   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Referees" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "id" serial   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Matches" (
    "id" serial   NOT NULL,
    "team1" int   NOT NULL,
    "team2" int   NOT NULL,
    "location" text   NOT NULL,
    "date" date   NOT NULL,
    "referee" int   NOT NULL,
    "season_id" int   NOT NULL,
    CONSTRAINT "pk_Matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" serial   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Lineups" (
    "id" serial   NOT NULL,
    "player_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "team_id" int   NOT NULL,
    CONSTRAINT "pk_Lineups" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Results" (
    "team_id" int   NOT NULL,
    "match_id" int   NOT NULL,
    "result" text   NOT NULL
);

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_team1" FOREIGN KEY("team1")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_team2" FOREIGN KEY("team2")
REFERENCES "Teams" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_referee" FOREIGN KEY("referee")
REFERENCES "Referees" ("id");

ALTER TABLE "Matches" ADD CONSTRAINT "fk_Matches_season_id" FOREIGN KEY("season_id")
REFERENCES "Season" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Goals" ADD CONSTRAINT "fk_Goals_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_player_id" FOREIGN KEY("player_id")
REFERENCES "Players" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

ALTER TABLE "Lineups" ADD CONSTRAINT "fk_Lineups_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_match_id" FOREIGN KEY("match_id")
REFERENCES "Matches" ("id");

