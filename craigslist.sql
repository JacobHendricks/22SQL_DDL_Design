-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Region" (
    "id" serial   NOT NULL,
    "region" text   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "User" (
    "id" serial   NOT NULL,
    "username" text   NOT NULL,
    "password" text   NOT NULL,
    "preferred_region" int   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Categories" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "description" text   NULL,
    "user" int   NOT NULL,
    "location" text   NOT NULL,
    "region" int   NOT NULL,
    "category" int   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Region" ADD CONSTRAINT "fk_Region_id" FOREIGN KEY("id")
REFERENCES "User" ("preferred_region");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user" FOREIGN KEY("user")
REFERENCES "User" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region" FOREIGN KEY("region")
REFERENCES "Region" ("region");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category" FOREIGN KEY("category")
REFERENCES "Categories" ("id");

