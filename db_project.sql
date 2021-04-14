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

--TEACHER
insert into db_project.TEACHER
values (default, 'Орёл Ольга Евгеньевна');
insert into db_project.TEACHER
values (default, 'Дединский Илья Рудольфович');
insert into db_project.TEACHER
values (default, 'Липовский Роман Германович');
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
insert into db_project.department 
values (default, 'Кафедра алгоритмов и технологий программировани');

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
insert into db_project.STUDENT
values ('172883203', default, 3, 'Дробченко Екатерина', true, '1/12/2024');
insert into db_project.STUDENT
values ('239201206', default, 3, 'Саранчин Андрей', false, '1/12/2024');
insert into db_project.STUDENT
values ('201562785', default, 3, 'Дёмина Елизавета', false, '1/12/2024');
insert into db_project.STUDENT
values ('122314452', default, 3, 'Бартенев Павел', false, '1/12/2024');
insert into db_project.STUDENT
values ('208049032', default, 3, 'Воробьёв Михаил', false, '1/12/2024');
insert into db_project.STUDENT
values ('63677634', default, 3, 'Чуркин Алексей', false, '1/12/2024');
insert into db_project.STUDENT
values ('118762545', default, 3, 'Мусихин Марк', false, '1/12/2024');
insert into db_project.STUDENT
values ('223295015', default, 3, 'Кязимов Кирилл', false, '1/12/2024');
insert into db_project.STUDENT
values ('242082791', default, 3, 'Вдовин Максим', false, '1/12/2024');
insert into db_project.STUDENT
values ('241026057', default, 3, 'Новиков Сергей', false, '1/12/2024');
insert into db_project.STUDENT
values ('8538316', default, 3, 'Ванурин Сергей', false, '1/12/2024');
insert into db_project.STUDENT
values ('156955827', default, 3, 'Баринов Денис', false, '1/12/2024');
insert into db_project.STUDENT
values ('135883655', default, 3, 'Коновалова Марина', false, '1/12/2024');

select * from db_project.student;

--DEPARTMENT_X_TECHER
insert into db_project.DEPARTMENT_X_TECHER
values (1, 1);
insert into db_project.DEPARTMENT_X_TECHER
values (17, 2);
insert into db_project.DEPARTMENT_X_TECHER
values (17, 3);
insert into db_project.DEPARTMENT_X_TECHER
values (1, 4);
insert into db_project.DEPARTMENT_X_TECHER
values (17, 5);
insert into db_project.DEPARTMENT_X_TECHER
values (1, 6);
insert into db_project.DEPARTMENT_X_TECHER
values (11, 7);
insert into db_project.DEPARTMENT_X_TECHER
values (11, 8);
insert into db_project.DEPARTMENT_X_TECHER
values (11, 9);
insert into db_project.DEPARTMENT_X_TECHER
values (11, 10);
insert into db_project.DEPARTMENT_X_TECHER
values (1, 11);

select * from db_project.DEPARTMENT_X_TECHER

--LESSON
insert into db_project.LESSON
values (default, 17, 2, 1, 'Практика по С++', 'Вторник', '9:00:00', '12:10:00');
insert into db_project.LESSON
values (default, 1, 1, 1, 'Гармонический анализ', 'Вторник', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, 3, NULL, 1, 'Иностранный язык', 'Вторник', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, 6, NULL, 1, 'Физкультура', 'Вторник', '17:05:00', '18:30:00');
insert into db_project.LESSON
values (default, 1, 4, 1, 'Дифференциальные уравнения', 'Среда', '9:00:00', '10:25:00');
insert into db_project.LESSON
values (default, 6, NULL, 1, 'Физкультура', 'Среда', '10:45:00', '12:10:00');
insert into db_project.LESSON
values (default, 17, 3, 1, 'ТиПМС', 'Среда', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, 17, 5, 1, 'Базы данных', 'Среда', '17:05:00', '18:30:00');
insert into db_project.LESSON
values (default, 1, 6, 1, 'Лекция. Гармонический анализ', 'Четверг', '9:00:00', '10:25:00');
insert into db_project.LESSON
values (default, 11, 7, 1, 'Лекция. Дискретный структуры', 'Четверг', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, 17, 2, 1, 'Практика по С++', 'Пятница', '9:00:00', '12:10:00');
insert into db_project.LESSON
values (default, 11, 8, 1, 'Теория вероятностей', 'Пятница', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, 3, NULL, 1, 'Иностранный язык', 'Пятница', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, 11, 7, 1, 'Дискретные структуры', 'Пятница', '17:05:00', '18:30:00');
insert into db_project.LESSON
values (default, 1, 11, 1, 'Лекция. Дифференциальные уравнения', 'Суббота', '9:00:00', '10:25:00');
insert into db_project.LESSON
values (default, 11, 9, 1, 'Лекция. Теория вероятностей', 'Суббота', '10:45:00', '12:10:00');
insert into db_project.LESSON
values (default, 17, 3, 1, 'Лекция. ТиПМС', 'Суббота', '12:20:00', '13:45:00');
insert into db_project.LESSON
values (default, 17, 5, 1, 'Лекция. Базы данных', 'Суббота', '13:55:00', '15:20:00');
insert into db_project.LESSON
values (default, 11, 10, 1, 'Лекция. Введение в анализ данных', 'Суббота', '16:30:00', '17:55:00');

select * from db_project.LESSON;

--
INSERT INTO db_project.STUDENT
VALUES ('173627205', default, 2, 'Неледова Елизавета', FALSE, '1/12/2024');

INSERT INTO db_project.STUDENT
VALUES ('433525900', default, 1, 'Павлюченков Дмитрий', FALSE, '1/12/2024'); 

INSERT INTO db_project.STUDENT
VALUES ('224049573', default, 2, 'Возняк Юлия', FALSE, '1/12/2024'); 

INSERT INTO db_project.STUDENT
VALUES ('253288930', default, 2, 'Иван Бердашкевич', FALSE, '1/12/2024'); 

select * from db_project.student;

UPDATE db_project.student
SET headmen_flg = true, group_id = 2
WHERE student_id like '433525900';

DELETE FROM db_project.student 
WHERE student_id = '253288930' AND group_id = 2;

UPDATE db_project.student
SET student_nm = 'Вознюк Юлия'
WHERE student_id = '224049573';

select * from db_project.student;

--выводит студентов в алфавитном порядке по группам
select ROW_NUMBER() OVER(PARTITION BY group_nm ORDER BY student_nm), student_nm, group_nm
from db_project.student s full join db_project.group g on g.group_id = s.group_id;

--выводит количество пар по дням неделям для 932 группы
select distinct count(lesson_id) over (partition by weekday_nm) count_of_lessons, weekday_nm
from db_project.lesson l full join db_project.classroom c on l.classroom_id = c.classroom_id
where group_id = 1
group by weekday_nm, lesson_id;

--выводит количество пар от каждой кафедры в расписании группы 932
select count(lesson_id), department_nm
from db_project.department d inner join db_project.department_x_techer dxt on d.department_id = dxt.department_id 
inner join db_project.lesson l on l.teacher_id = dxt.teacher_id 
group by department_nm
having count(lesson_id) > 2;

--выводит для каждой пары ее предыдущую и следующую
select lesson_id, lesson_nm, weekday_nm, 
lag(lesson_id , 1, 0) over(order by weekday_nm, class_start_tm) as previos_lesson, 
lead(lesson_id, 1, 0) over(order by weekday_nm, class_start_tm) as next_lesson
from db_project.lesson l;

--выводит всю ифнормацию о парах для 932 группы на субботу
select weekday_nm, lesson_nm, class_start_tm, class_end_tm, classroom_nm, building_nm, teacher_nm
from db_project.lesson l full join db_project.classroom c on c.classroom_id = l.classroom_id full join db_project.teacher t on t.teacher_id = l.teacher_id
where weekday_nm = 'Суббота';
