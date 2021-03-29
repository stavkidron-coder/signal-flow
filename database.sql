
-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
CREATE TABLE "user" (
	"id" serial NOT NULL,
	"username" varchar(255) NOT NULL,
	"password" varchar(255) NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


-- Sessions Table
CREATE TABLE "sessions" (
	"id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"date" DATE NOT NULL,
	"artist" varchar(255) NOT NULL,
	"studio" varchar(255),
	"notes" varchar NOT NULL,
	"description" varchar,
	CONSTRAINT "sessions_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


-- Paths Table
CREATE TABLE "paths" (
	"id" serial NOT NULL,
	"session_id" integer NOT NULL,
	"instrument" varchar(255),
	"microphone" varchar(255),
	"di" varchar(255),
	"tie_line" varchar(255),
	"processors" varchar(255),
	"preamp" varchar(255),
	"daw_input" varchar(255),
	"daw_output" varchar(255),
	"notes" varchar,
	CONSTRAINT "paths_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "sessions" ADD CONSTRAINT "sessions_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "paths" ADD CONSTRAINT "paths_fk0" FOREIGN KEY ("session_id") REFERENCES "sessions"("id");


-- Dummy Data
INSERT INTO "sessions" ("user_id", "name", "date", "artist", "studio", "notes", "description")
VALUES(1, 'Sounds From a Box Drum Session', '01/23/2020', 'Clear Company', 'Flyte Tyme', 'Yamaha drum kit was used with Zildjian cymbals', 'Drum session recorded at Flyte Tyme studio B');

INSERT INTO "paths" ("session_id", "instrument", "microphone", "di", "tie_line", "processors", "preamp", "daw_input", "daw_output", "notes")
VALUES(1, 'Kick', 'EV ND68', '', '1', 'LA-2A', 'Great River', '1', '', 'Yamaha 22 inch open kick'),
(1, 'Snare', 'SM57', '', '2', 'LA-3A', 'Great River', '2', '', 'Tama 16 inch piccolo snare tight'),
(1, 'Rack Tom', '414', '', '3', '', 'UA-710', '3', '', 'Yamaha Jazz 14 inch'),
(1, 'Floor Tom', '414', '', '4', '', 'UA-710', '4', '', 'Yamaha Jazz 18 inch'),
(1, 'Overhead L', 'SM81', '', '5', '', 'DW Fern', '5', '', ''),
(1, 'Overhead R', 'SM81', '', '6', '', 'DW Fern', '6', '', '');