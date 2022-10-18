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

-- Создание деканата

INSERT INTO public.deanery(id, name) VALUES(1, 'Единый деканат');

-- Создание кафедр

INSERT INTO public.department(id, name, deanery) VALUES (1, 'Информатика', 1), (2, 'Физическое воспитание', 1);

-- Создание учебных групп

INSERT INTO public.group(id, name, department) VALUES (1, 'ИТ-1', 1), (2, 'ИТ-2', 1);
INSERT INTO public.group(id, name, department) VALUES (3, 'ФВ-1', 2), (4, 'ФВ-2', 2);

-- Создание студентов

INSERT INTO 
	public.student(id, name, passport, "group")
VALUES
	(1, 'Иван Иванов', '1111111111', 1), (2, 'Иван Иваночек', '1111111112', 1), (3, 'Иван Иванок', '1111111113', 1),
	(4, 'Иван Иванос', '1111111114', 1), (5, 'Иван Иванович', '1111111115', 1)
;

INSERT INTO 
	public.student(id, name, passport, "group")
VALUES
	(6, 'Иван Сидороов', '2111111111', 2), (7, 'Иван Сидорочек', '2111111112', 2), (8, 'Иван Сидорок', '2111111113', 2),
	(9, 'Иван Сидорос', '2111111114', 2), (10, 'Иван Сидорович', '2111111115', 2)
;

INSERT INTO 
	public.student(id, name, passport, "group")
VALUES
	(11, 'Иван Руй', '3111111111', 3), (12, 'Иван Рудович', '3111111112', 3), (13, 'Иван Рут', '3111111113', 3),
	(14, 'Иван Руйчек', '3111111114', 3), (15, 'Иван Рудняк', '3111111115', 3)
;

INSERT INTO 
	public.student(id, name, passport, "group")
VALUES
	(16, 'Иван Туй', '4111111111', 4), (17, 'Иван Тудович', '4111111112', 4), (18, 'Иван Тут', '4111111113', 4),
	(19, 'Иван Туйчек', '4111111114', 4), (20, 'Иван Тудняк', '4111111115', 4)
;
