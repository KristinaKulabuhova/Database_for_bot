create schema db_project;

create table db_project.CLASSROOM (
	classroom_id serial primary key,
	classroom_nm varchar(255),
	building_nm  varchar(255)
);

create table db_project.DEPARTMENT (
	department_id serial primary key,
	department_nm varchar(255)
);

create table db_project.GROUP (
	group_id 	serial primary key,
	group_nm 	varchar(255),
	headmen_id 	varchar(255)
);

alter table db_project.group add constraint PK_Group primary key (group_id);

create table db_project.STUDENT (
	student_id 		 varchar(255),
	valid_from_dt	 date default now()::date,
	group_id 		 integer references db_project.group (group_id),
	student_nm		 varchar(255) not null,
	headmen_flg		 boolean not null,
	valid_to_dt		 date
);

alter table db_project.STUDENT add constraint PK_Student primary key (student_id, valid_from_dt);

create table db_project.TEACHER (
	teacher_id 			serial primary key,
	teacher_nm 			varchar(255) not null
);

create table db_project.DEPARTMENT_X_TECHER (
	department_id 	integer,
	teacher_id 		integer
);

alter table db_project.DEPARTMENT_X_TECHER add constraint PK_Department_x_Teacher primary key (department_id, teacher_id);
alter table db_project.DEPARTMENT_X_TECHER add constraint FK_Department_x_Teacher foreign key (department_id) references db_project.department (department_id);
alter table db_project.DEPARTMENT_X_TECHER add constraint FK_Teacher_x_Department foreign key (teacher_id) references db_project.teacher (teacher_id);

create table db_project.LESSON (
	lesson_id 		serial primary key,
	classroom_id 	integer references db_project.classroom (classroom_id),
	teacher_id 		integer references db_project.teacher (teacher_id),
	group_id 		integer references db_project.group (group_id),
	lesson_nm 		varchar(255) not null,
	weekday_nm		varchar(255) not null,
	class_start_tm	time not null,
	class_end_tm	time not null
);

--DEPARTMENT_X_TECHER
insert into db_project.DEPARTMENT_X_TECHER
values (7, 1);
insert into db_project.DEPARTMENT_X_TECHER
values (13, 2);
insert into db_project.DEPARTMENT_X_TECHER
values (13, 3);
insert into db_project.DEPARTMENT_X_TECHER
values (13, 4);
insert into db_project.DEPARTMENT_X_TECHER
values (7, 5);
insert into db_project.DEPARTMENT_X_TECHER
values (7, 12);
insert into db_project.DEPARTMENT_X_TECHER
values (7, 7);
insert into db_project.DEPARTMENT_X_TECHER
values (17, 8);
insert into db_project.DEPARTMENT_X_TECHER
values (17, 9);
insert into db_project.DEPARTMENT_X_TECHER
values (17, 10);
insert into db_project.DEPARTMENT_X_TECHER
values (17, 11);

select * from db_project.DEPARTMENT_X_TECHER

--LESSON
insert into db_project.LESSON
values (default, 1, 2, 1, 'Практика по С++', 'Вторник', '9:00:00', '12:10:00');
insert into db_project.LESSON
values (default, 2, 1, 1, 'Гармонический анализ', 'Вторник', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, 17, NULL, 1, 'Иностранный язык', 'Вторник', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, NULL, NULL, 1, 'Физкультура', 'Вторник', '17:05:00', '18:30:00');
insert into db_project.LESSON
values (default, 3, 5, 1, 'Дифференциальные уравнения', 'Среда', '9:00:00', '10:25:00');
insert into db_project.LESSON
values (default, NULL, NULL, 1, 'Физкультура', 'Среда', '10:45:00', '12:10:00');
insert into db_project.LESSON
values (default, 4, 3, 1, 'ТиПМС', 'Среда', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, 5, 4, 1, 'Базы данных', 'Среда', '17:05:00', '18:30:00');
insert into db_project.LESSON
values (default, 18, 7, 1, 'Гармонический анализ', 'Четверг', '9:00:00', '10:25:00');
insert into db_project.LESSON
values (default, 19, 8, 1, 'Дискретный структуры', 'Четверг', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, 1, 2, 1, 'Практика по С++', 'Пятница', '9:00:00', '12:10:00');
insert into db_project.LESSON
values (default, 6, 9, 1, 'Теория вероятностей', 'Пятница', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, 17, NULL, 1, 'Иностранный язык', 'Пятница', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, 7, 8, 1, 'Дискретные структуры', 'Пятница', '17:05:00', '18:30:00');
insert into db_project.LESSON
values (default, NULL, 12, 1, 'Дифференциальные уравнения', 'Суббота', '9:00:00', '10:25:00');
insert into db_project.LESSON
values (default, NULL, 10, 1, 'Теория вероятностей', 'Суббота', '10:45:00', '12:10:00');
insert into db_project.LESSON
values (default, NULL, 3, 1, 'ТиПМС', 'Суббота', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, NULL, 4, 1, 'Базы данных', 'Суббота', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, NULL, 11, 1, 'Введение в анализ данных', 'Суббота', '16:30:00', '17:55:00');

select * from db_project.LESSON;

--TEACHER
insert into db_project.TEACHER
values (default, 'Орёл Ольга Евгеньевна');
insert into db_project.TEACHER
values (default, 'Дединский Илья Рудольфович');
insert into db_project.TEACHER
values (default, 'Липовский Роман Германович');
insert into db_project.TEACHER
values (default, 'Меркурьева Надежда Андреевна');
insert into db_project.TEACHER
values (default, 'Лизунов Антон Юрьевич');
insert into db_project.TEACHER
values (default, 'Меркурьева Надежда Андреевна');
insert into db_project.TEACHER
values (default, 'Лукашов Алексей Леонидович');
insert into db_project.TEACHER
values (default, 'Курносов Артём Дмитриевич');
insert into db_project.TEACHER
values (default, 'Киселёв Сергей Григорьевич');
insert into db_project.TEACHER
values (default, 'Жуковский Максим Евгеньевич');
insert into db_project.TEACHER
values (default, 'Волков Никита Алексеевич');
insert into db_project.TEACHER
values (default, 'Дубинская Вера Юрьевна');

select * from db_project.TEACHER;

--DEPARTMENT
insert into db_project.DEPARTMENT
values (default, 'Кафедра высшей математики');
insert into db_project.DEPARTMENT
values (default, 'Кафедра общей физики');
insert into db_project.DEPARTMENT
values (default, 'Департамент иностранных языков');
insert into db_project.DEPARTMENT
values (default, 'Кафедра теоретической физики');
insert into db_project.DEPARTMENT
values (default, 'Кафедра теоретической механики');
insert into db_project.DEPARTMENT
values (default, 'Департамент физической культуры и спорта');
insert into db_project.DEPARTMENT
values (default, 'Кафедра информатики и вычислительной математики');
insert into db_project.DEPARTMENT
values (default, 'Военная кафедра');
insert into db_project.DEPARTMENT
values (default, 'Кафедра анализа данных');
insert into db_project.DEPARTMENT
values (default, 'Кафедра корпоративных информационных систем');
insert into db_project.DEPARTMENT
values (default, 'Кафедра дискретной математики');
insert into db_project.DEPARTMENT
values (default, 'Кафедра когнитивных технологий');
insert into db_project.DEPARTMENT
values (default, 'Кафедра распознавания изображений и обработки текста');
insert into db_project.DEPARTMENT
values (default, 'Кафедра концептуального анализа и проектирования');
insert into db_project.DEPARTMENT
values (default, 'Кафедра компьютерной лингвистики');
insert into db_project.DEPARTMENT
values (default, 'Кафедра банковских информационных технологий');

select * from db_project.DEPARTMENT;

--CLASSROOM
insert into db_project.classroom
values (default, '2.36','УЛК 1');
insert into db_project.classroom
values (default, '413', 'ГК');
insert into db_project.classroom
values (default, '422', 'ГК');
insert into db_project.classroom
values (default, '424', 'УЛК 2');
insert into db_project.classroom
values (default, '418', 'УЛК 2');
insert into db_project.classroom
values (default, '512', 'ГК');
insert into db_project.classroom
values (default, '518', 'ГК');
insert into db_project.classroom
values (default, '419', 'ГК');
insert into db_project.classroom
values (default, '521', 'ГК');
insert into db_project.classroom
values (default, '412', 'ГК');
insert into db_project.classroom
values (default, '515', 'ГК');
insert into db_project.classroom
values (default, '418', 'ГК');
insert into db_project.classroom
values (default, '321', 'ЛК');
insert into db_project.classroom
values (default, '324a', 'ЛК');
insert into db_project.classroom
values (default, '321', 'ЛК');
insert into db_project.classroom
values (default, '705', 'КПМ');
insert into db_project.classroom
values (default, '330', 'НК');
insert into db_project.classroom
values (default, '202', 'НК');
insert into db_project.classroom
values (default, '113', 'ГК');

select * from db_project.classroom;

--GROUP
insert into db_project.group
values (default, 'Б05-932', '81973081');
insert into db_project.group
values (default, 'Б05-912', '433525900');
insert into db_project.group
values (default, 'Б05-931', '172883203');

select * from db_project.group;

--STUDENT
insert into db_project.STUDENT
values ('280655896', default, 1, 'Кокряшкин Максим', false, '1/12/2024');
insert into db_project.STUDENT
values ('81973081', default, 1, 'Ильдаров Адам', true, '1/12/2024');
insert into db_project.STUDENT
values ('151033742', default, 1, 'Кудринский Алексей', false, '1/12/2024');
insert into db_project.STUDENT
values ('126366187', default, 1, 'Шишацкий Михаил', false, '1/12/2024');
insert into db_project.STUDENT
values ('219753941', default, 1, 'Беляев Анастас', false, '1/12/2024');
insert into db_project.STUDENT
values ('115582558', default, 1, 'Табачников Борис', false, '1/12/2024');
insert into db_project.STUDENT
values ('79768387', default, 1, 'Волков Алексей', false, '1/12/2024');
insert into db_project.STUDENT
values ('177209125', default, 1, 'Тетерин Дмитрий', false, '1/12/2024');
insert into db_project.STUDENT
values ('135521012', default, 1, 'Шляхин Михаил', false, '1/12/2024');
insert into db_project.STUDENT
values ('487850128', default, 1, 'Емельянова Эвелина', false, '1/12/2024');
insert into db_project.STUDENT
values ('203947003', default, 1, 'Борисов Данила', false, '1/12/2024');
insert into db_project.STUDENT
values ('200414526', default, 1, 'Драгун Константин', false, '1/12/2024');
insert into db_project.STUDENT
values ('323246830', default, 1, 'Мальцев Максим', false, '1/12/2024');
insert into db_project.STUDENT
values ('270682085', default, 1, 'Ельчинов Егор', false, '1/12/2024');
insert into db_project.STUDENT
values ('242279380', default, 1, 'Киселёв Егор', false, '1/12/2024');
insert into db_project.STUDENT
values ('212656912', default, 1, 'Коробко Максим', false, '1/12/2024');
insert into db_project.STUDENT
values ('282586014', default, 1, 'Русин Александр', false, '1/12/2024');
insert into db_project.STUDENT
values ('153378901', default, 1, 'Кулабухова Кристина', false, '1/12/2024');

select * from db_project.student;