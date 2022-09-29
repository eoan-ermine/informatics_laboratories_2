-- Я счел целесообразным создать таблицу «деканат», так как
-- один деканат может контролировать несколько кафедр
-- А дубликация текстовых данных в поле «кафедра» нецелесообразна

CREATE TABLE "public.deanery" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	CONSTRAINT "deanery_pk" PRIMARY KEY ("id")
);


CREATE TABLE "public.department" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"deanery" serial NOT NULL,
	CONSTRAINT "department_pk" PRIMARY KEY ("id")
);


CREATE TABLE "public.group" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"department" serial NOT NULL,
	CONSTRAINT "group_pk" PRIMARY KEY ("id")
);


CREATE TABLE "public.student" (
	"id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"passport" varchar(10) NOT NULL UNIQUE,
	"group" serial NOT NULL,
	CONSTRAINT "student_pk" PRIMARY KEY ("id")
);

-- Создание foreign key отношений

ALTER TABLE "public.department" ADD CONSTRAINT "department_fk0" FOREIGN KEY ("deanery") REFERENCES "public.deanery"("id");
ALTER TABLE "public.group" ADD CONSTRAINT "group_fk0" FOREIGN KEY ("department") REFERENCES "public.department"("id");
ALTER TABLE "public.student" ADD CONSTRAINT "student_fk0" FOREIGN KEY ("group") REFERENCES "public.group"("id");

