-- Удаление предыдущих объектов
DROP TABLE leonova_gradebook;
DROP TABLE leonova_student;
DROP TABLE leonova_discipline;
DROP PACKAGE leonova_student_actions;

-- Создание таблицы "Предмет"
CREATE TABLE leonova_discipline (
    name_dis   VARCHAR2(120 BYTE) NOT NULL,
    date_d     DATE,
    control    VARCHAR2(15 BYTE) CHECK (control IN ('Зачёт', 'Экзамен')),
    group_name VARCHAR2(15 BYTE) NOT NULL,
    name_tutor VARCHAR2(100 BYTE) NOT NULL
);

-- Создание таблицы "Зачётка"
CREATE TABLE leonova_gradebook (
    student_id  NUMBER(8) CHECK (student_id > 0),
    group_name  VARCHAR2(15 BYTE) NOT NULL,
    dis_name    VARCHAR2(120 BYTE) NOT NULL,
    dis_control VARCHAR2(15 BYTE) CHECK (dis_control IN ('Зачёт', 'Экзамен')),
    dis_mark    VARCHAR2(40 BYTE) CHECK (dis_mark IS NULL OR dis_mark IN 
										('5', '4', '3', '2', 
										 'Зачёт', 'Незачёт'))
);

-- Создание таблицы "Студент"
CREATE TABLE leonova_student (
    id         NUMBER(8) CHECK (id > 0),
    name       VARCHAR2(100 BYTE) NOT NULL,
    agrant     NUMBER(8) CHECK (agrant IS NULL OR agrant >= 0),
    group_name VARCHAR2(15 BYTE)
);

-- Задание первичного ключа для таблицы "Студент"
ALTER TABLE leonova_student
    ADD CONSTRAINT leonova_st_pk PRIMARY KEY (id);

-- Задание первичного ключа для таблицы "Зачетка"
ALTER TABLE leonova_gradebook
    ADD CONSTRAINT leonova_grade_pk PRIMARY KEY (student_id, dis_name, dis_control, group_name);
    
 -- Задание первичного ключа для таблицы "Предмет"   
ALTER TABLE leonova_discipline
    ADD CONSTRAINT leonova_dis_pk PRIMARY KEY (name_dis, control, group_name);
 
-- Уникальность id и названия групп в таблице "Студент"    
ALTER TABLE leonova_student
    ADD CONSTRAINT leonova_st_un UNIQUE (id, group_name);
    
---- Задание составного внешнего ключа для связи (зачетка - предмет)
ALTER TABLE leonova_gradebook
    ADD CONSTRAINT grade_dis_fk FOREIGN KEY ( dis_name, dis_control, group_name )
        REFERENCES leonova_discipline ( name_dis, control, group_name ) ON DELETE CASCADE;  

---- Задание внешнего ключа для связи 1:1 (зачетка - студент)
ALTER TABLE leonova_gradebook
    ADD CONSTRAINT grade_st_fk FOREIGN KEY ( student_id, group_name )
        REFERENCES leonova_student ( id, group_name ) ON DELETE CASCADE;
        
-- Заполнение таблицы "студент"		
SET DEFINE OFF;
Insert into leonova_student (id,name,agrant,group_name) values ('111101','Яковлева А. Т.','1871','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111102','Данилов А. Н.','2021','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111103','Миронова С. М.','3291','ИТ-12БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111104','Шарова М. Р.','0','ИТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111105','Малышева К. Р.','1791','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111106','Сорокина Е. М.','2708','ПМИ-41БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111107','Кириллова О. М.', '0','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111108','Николаев Н. М.','1553','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111109','Иванова К. К.','1255','МКН-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111110','Блинова Е. Ф.', NULL, 'МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111111','Фомин И. С.','2968','МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111112','Шилова М. Н.','0','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111113','Жданов М. К.','2200','ИТ-12БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111114','Болдырева К. Н.','3000','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111115','Голованов Н. Н.',null,'МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111116','Богданова М. Ф.','0','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111117','Кузнецова А. В.','0','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111118','Москвин Ф. Б.','1450','ИТ-12БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111119','Дементьев А. Д.','2250','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111120','Волкова В. А.','2500','ИВТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111121','Ершова Т. С.', NULL,'МКН-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111122','Савельева Т. И.','0','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111123','Макарова М. И.','0','ПМИ-41БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111124','Добрынин Э. И.','3200','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111125','Леонова А. Д.','2250','ИТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111126','Королева М. К.','1450','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111127','Семенов Д. С.','0','ПМИ-41БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111128','Григорьева В. С.','1500','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111129','Кравцова М. И.','0','МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111130','Лобанов В. И.','3000',null);
Insert into leonova_student (id,name,agrant,group_name) values ('111131','Овчинникова П. А.','0','ИТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111132','Петрова Н. В.','2000','МКН-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111133','Щербакова П. Г.','0','ИВТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111134','Никулина В. Л.','1500','ИТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111135','Вдовина Т. Г.','2000','МКН-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111136','Акимов И. Я.','5000','ИВТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111137','Майоров Г. М.','1200','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111138','Маркина В. В.','0','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111139','Щербаков М. Л.','0','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111140','Степанова М. И.','0','ПМИ-11МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111141','Калмыкова Н. Д.','1520','ПМИ-41БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111142','Кукушкин И. А.','3000','ПМИ-41БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111143','Сидорова В.И.','2200','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111144','Третьяков А. К.','1500','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111145','Иванов Л. М.','0','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111146','Любимов М. И.','3451','ИВТ-31БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111147','Мальцева О. Д.','0','МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111148','Федосеева А. Д.','2500','МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111149','Васильев Д. М.','1250','МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111150','Озеров Л. А.','1850','МКН-22БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111151','Миронов С. М.','3200','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111152','Кузьмин К. М.','0','ИТ-12БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111153','Новиков И. С.','0','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111154','Зорина М. Н.','3276','ИТ-12БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111155','Королев Н. А.','0','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111156','Чернышев Н. Э.','2500','ИТ-12БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111157','Гаврилов Г. Л.','0','ИТ-11БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111158','Чернов Е. Л.','0','ИТ-12БО');
Insert into leonova_student (id,name,agrant,group_name) values ('111159','Борисов Г. С.','0','ИТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111160','Захарова М. М.','1700','ИВТ-21МО');
Insert into leonova_student (id,name,agrant,group_name) values ('111161','Третьякова С. В.','3284', NULL);

-- Заполнение таблицы "Предмет"
SET DEFINE OFF;
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('История отечества',to_date('04.03.21','DD.MM.RR'),'Зачёт','ИВТ-21МО','А.А. Игнатьев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Философия',to_date('15.03.21','DD.MM.RR'),'Экзамен','ИВТ-21МО','М.А. Угрюмова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('История зарубежной философии',to_date('16.03.21','DD.MM.RR'),'Экзамен','ИВТ-21МО','М.А. Угрюмова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('История русской философии',to_date('17.03.21','DD.MM.RR'),'Экзамен','ИВТ-21МО','М.А. Угрюмова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Логика',to_date('18.03.21','DD.MM.RR'),'Экзамен','ИВТ-31БО','Т.К. Ивашковская');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Этика',to_date('19.03.21','DD.MM.RR'),'Зачёт','ИВТ-31БО','А.Р. Ильинская');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('История и теория религии',to_date('26.03.21','DD.MM.RR'),'Экзамен','ИВТ-31БО','А.П. Наумова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Культурная антропология',to_date('31.03.21','DD.MM.RR'),'Экзамен','ИВТ-31БО','И.Р. Дорофеев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Социология',to_date('01.04.21','DD.MM.RR'),'Зачёт','ИВТ-31БО','А.А. Игнатьев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Экономика',to_date('02.04.21','DD.MM.RR'),'Зачёт','ИВТ-31БО','Л.С. Золотарев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Политология',to_date('21.04.21','DD.MM.RR'),'Экзамен','ИВТ-31БО','А.М. Ильина');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Основы Российского права',to_date('28.04.21','DD.MM.RR'),'Экзамен','ИТ-11БО','Е.М. Николаева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Педагогика',to_date('29.04.21','DD.MM.RR'),'Зачёт','ИТ-11БО','З.Д. Волкова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Анатомия и морфология центральной нервной системы',to_date('30.04.21','DD.MM.RR'),'Экзамен','ИТ-11БО','А.И. Дмитриев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Физиология центральной нервной системы',to_date('04.05.21','DD.MM.RR'),'Зачёт','ИТ-11БО','А.И. Дмитриев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Физиология сенсорных систем',to_date('07.05.21','DD.MM.RR'),'Зачёт','ИТ-11БО','А.И. Дмитриев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Физиология высшей нервной деятельности',to_date('10.05.21','DD.MM.RR'),'Экзамен','ИТ-11БО','В.М. Быкова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Антропология',to_date('21.05.21','DD.MM.RR'),'Зачёт','ИТ-11БО','Ф.Д. Пирогов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Экология',to_date('24.05.21','DD.MM.RR'),'Экзамен','ИТ-11БО','Д.В. Кузнецова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Высшая математика',to_date('31.05.21','DD.MM.RR'),'Экзамен','ИТ-12БО','А.М. Беляев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Математические методы в психологии',to_date('04.06.21','DD.MM.RR'),'Экзамен','ИТ-12БО','Н.И. Михайлов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Информатика и ЭВМ в психологии',to_date('16.06.21','DD.MM.RR'),'Экзамен','ИТ-12БО','А.А. Павлов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Физическое воспитание',to_date('18.06.21','DD.MM.RR'),'Экзамен','ИТ-12БО','А.Е. Крылов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Действия населения в чрезвычайных ситуациях',to_date('29.06.21','DD.MM.RR'),'Зачёт','ИТ-12БО','А.Е. Крылов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Математический анализ',to_date('01.07.21','DD.MM.RR'),'Экзамен','ИТ-12БО','А.Д. Васильев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Алгебра и геометрия',to_date('02.07.21','DD.MM.RR'),'Экзамен','ИТ-21МО','К.М. Ермакова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Дискретная математика',to_date('06.07.21','DD.MM.RR'),'Зачёт','ИТ-21МО','В.Г. Новикова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Алгоритмы и алгоритмические языки',to_date('12.07.21','DD.MM.RR'),'Экзамен','ИТ-21МО','Л.Д. Панкратова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Архитектура ЭВМ и язык Ассемблера',to_date('21.07.21','DD.MM.RR'),'Экзамен','ИТ-21МО','М.Т. Латышева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Классическая механика',to_date('22.07.21','DD.MM.RR'),'Экзамен','МКН-21МО','В.К. Бычков');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Электродинамика',to_date('29.07.21','DD.MM.RR'),'Зачёт','МКН-21МО','Р.Д. Капустин');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Обыкновенные дифференциальные уравнения',to_date('30.07.21','DD.MM.RR'),'Экзамен','МКН-21МО','М.Л. Воробьев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Теория вероятностей и математическая статистика',to_date('06.08.21','DD.MM.RR'),'Экзамен','МКН-21МО','Н.К. Николаева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Операционные системы',to_date('11.08.21','DD.MM.RR'),'Экзамен','МКН-21МО','П.М. Орлова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Практикум на ЭВМ',to_date('17.08.21','DD.MM.RR'),'Экзамен','МКН-21МО','Л.Д. Панкратова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Уравнения математической физики',to_date('03.09.21','DD.MM.RR'),'Зачёт','МКН-21МО','П.Д. Столярова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Компьютерная графика',to_date('07.09.21','DD.MM.RR'),'Экзамен','МКН-21МО','А.И. Петрова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Основы кибернетики',to_date('13.09.21','DD.MM.RR'),'Экзамен','МКН-21МО','Е.К. Соловьева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Базы данных',to_date('15.09.21','DD.MM.RR'),'Экзамен','МКН-22БО','М.Т. Латышева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Суперкомпьютеры и параллельная обработка данных',to_date('01.10.21','DD.MM.RR'),'Зачёт','МКН-22БО','Е.К. Соловьева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Физика волновых процессов',to_date('06.10.21','DD.MM.RR'),'Экзамен','МКН-22БО','Е.К. Соловьева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Функциональный анализ',to_date('12.10.21','DD.MM.RR'),'Экзамен','МКН-22БО','Н.К. Николаева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Методы оптимизации',to_date('21.10.21','DD.MM.RR'),'Зачёт','МКН-22БО','А.И. Петрова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Теория игр и исследование операций',to_date('22.10.21','DD.MM.RR'),'Зачёт','МКН-22БО','Н.К. Николаева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Методы математической физики',to_date('25.10.21','DD.MM.RR'),'Зачёт','МКН-22БО','П.Д. Столярова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Численные методы математической физики',to_date('26.10.21','DD.MM.RR'),'Экзамен','МКН-22БО','М.Л. Воробьев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Обратные задачи',to_date('28.10.21','DD.MM.RR'),'Экзамен','ПМИ-11МО','Е.К. Соловьева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Дополнительные главы уравнений в частных производных',to_date('29.10.21','DD.MM.RR'),'Экзамен','ПМИ-11МО','М.Л. Воробьев');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Искусственный интеллект',to_date('01.11.21','DD.MM.RR'),'Экзамен','ПМИ-11МО','М.Т. Латышева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Офисные технологии',to_date('11.11.21','DD.MM.RR'),'Зачёт','ПМИ-11МО','А.И. Петрова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Администрирование локальных сетей',to_date('16.11.21','DD.MM.RR'),'Зачёт','ПМИ-11МО','П.М. Орлова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Защита информации',to_date('16.11.21','DD.MM.RR'),'Экзамен','ПМИ-11МО','К.К. Андреева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Объектно-ориентированный анализ и проектирование',to_date('23.11.21','DD.MM.RR'),'Зачёт','ПМИ-11МО','М.Д. Ильин');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Системы управления проектами',to_date('24.11.21','DD.MM.RR'),'Экзамен','ПМИ-41БО','М.М. Наумова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Введение в математическую экономику',to_date('24.11.21','DD.MM.RR'),'Экзамен','ПМИ-41БО','Ф.И. Попов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Языки управления приложениями',to_date('14.12.21','DD.MM.RR'),'Зачёт','ПМИ-41БО','М.М. Наумова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Информационные технологии в страховании',to_date('12.10.21','DD.MM.RR'),'Экзамен','ПМИ-41БО','Е.Ф. Ефимова');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Основы финансовой математики',to_date('07.09.21','DD.MM.RR'),'Экзамен','ПМИ-41БО','Ф.И. Попов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Теория риска',to_date('22.10.21','DD.MM.RR'),'Экзамен','ПМИ-41БО','К.К. Андреева');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Объектно-ориентированное программирование: технологии .NET',to_date('28.12.21','DD.MM.RR'),'Зачёт','ПМИ-41БО','М.Д. Ильин');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Основы финансовой математики',to_date('07.09.21','DD.MM.RR'),'Зачёт','ЭМ-21','Ф.И. Попов');
Insert into leonova_discipline (name_dis, date_d, control, group_name, name_tutor) values ('Экология',to_date('24.05.21','DD.MM.RR'),'Экзамен','МКН-21МО','Д.В. Кузнецова');

-- Заполнение таблицы "Зачетка"
SET DEFINE OFF;
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-21МО', '111160', 'История отечества', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-21МО', '111136', 'Философия', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-21МО', '111133', 'Философия', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-21МО', '111120', 'История зарубежной философии', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-21МО', '111160', 'История русской философии', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111102', 'Логика', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111146', 'Этика', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111145', 'История и теория религии', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111144', 'Культурная антропология', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111128', 'Социология', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111122', 'Логика', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111122', 'Социология', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111107', 'Логика', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111128', 'Экономика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111128', 'Политология', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111114', 'Основы Российского права', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111114', 'Педагогика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111157', 'Анатомия и морфология центральной нервной системы', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111112', 'Физиология центральной нервной системы', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111108', 'Логика', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111119', 'Физиология сенсорных систем', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111119', 'Физиология высшей нервной деятельности', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111117', 'Антропология', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111117', 'Физиология высшей нервной деятельности', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111153', 'Анатомия и морфология центральной нервной системы', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111144', 'Экономика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111155', 'Экология', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111118', 'Высшая математика', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111146', 'Экономика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111145', 'Логика', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111118', 'Математические методы в психологии', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111103', 'Информатика и ЭВМ в психологии', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111158', 'Физическое воспитание', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111117', 'Основы Российского права', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111154', 'Действия населения в чрезвычайных ситуациях', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111153', 'Физиология сенсорных систем', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111152', 'Физическое воспитание', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111156', 'Действия населения в чрезвычайных ситуациях', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111113', 'Математический анализ', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111154', 'Математический анализ', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111131', 'Алгебра и геометрия', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111125', 'Дискретная математика', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111104', 'Алгоритмы и алгоритмические языки', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111134', 'Архитектура ЭВМ и язык Ассемблера', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111159', 'Алгоритмы и алгоритмические языки', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111159', 'Дискретная математика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111132', 'Классическая механика', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111131', 'Дискретная математика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111109', 'Электродинамика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-31БО', '111143', 'Логика', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111135', 'Обыкновенные дифференциальные уравнения', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111121', 'Теория вероятностей и математическая статистика', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111109', 'Операционные системы', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111121', 'Практикум на ЭВМ', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111135', 'Уравнения математической физики', 'Зачёт', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111135', 'Электродинамика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-21МО', '111104', 'Дискретная математика', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111121', 'Компьютерная графика', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111109', 'Основы кибернетики', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111147', 'Базы данных', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111148', 'Суперкомпьютеры и параллельная обработка данных', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111149', 'Физика волновых процессов', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111150', 'Функциональный анализ', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111115', 'Методы оптимизации', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111111', 'Теория игр и исследование операций', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111129', 'Методы математической физики', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111103', 'Математический анализ', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО','111110', 'Численные методы математической физики', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-22БО', '111129', 'Численные методы математической физики', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111140', 'Обратные задачи', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111139', 'Дополнительные главы уравнений в частных производных', 'Экзамен', '2');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111138', 'Искусственный интеллект', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111137', 'Офисные технологии', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111116', 'Искусственный интеллект', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111126', 'Администрирование локальных сетей', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111124', 'Защита информации', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-11МО', '111105', 'Объектно-ориентированный анализ и проектирование', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111141', 'Системы управления проектами', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111121', 'Электродинамика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111127', 'Введение в математическую экономику', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111123', 'Языки управления приложениями', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111106', 'Языки управления приложениями', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111142', 'Языки управления приложениями', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111127', 'Информационные технологии в страховании', 'Экзамен', '2');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111123', 'Информационные технологии в страховании', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111106', 'Основы финансовой математики', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111127', 'Основы финансовой математики', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111142', 'Основы финансовой математики', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111141', 'Теория риска', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111127', 'Теория риска', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111123', 'Теория риска', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111106', 'Теория риска', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111142', 'Объектно-ориентированное программирование: технологии .NET', 'Зачёт', 'Незачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ПМИ-41БО', '111127', 'Объектно-ориентированное программирование: технологии .NET', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111113', 'Информатика и ЭВМ в психологии', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111154', 'Физическое воспитание', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111118', 'Физическое воспитание', 'Экзамен', '5');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-12БО', '111156', 'Физическое воспитание', 'Экзамен', '4');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-21МО', '111160', 'Философия', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИВТ-21МО', '111120', 'Философия', 'Экзамен', '3');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111112', 'Педагогика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111119', 'Педагогика', 'Зачёт', 'Зачёт');
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111151', 'Анатомия и морфология центральной нервной системы', 'Экзамен', NULL);
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111151', 'Физиология центральной нервной системы', 'Зачёт', NULL);
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111101', 'Анатомия и морфология центральной нервной системы', 'Экзамен', NULL);
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('ИТ-11БО', '111101', 'Физиология центральной нервной системы', 'Зачёт', NULL);
Insert into leonova_gradebook (group_name, student_id, dis_name, dis_control, dis_mark) values ('МКН-21МО', '111121', 'Экология', 'Экзамен', '5');

-- Описание спецификации пакета
CREATE PACKAGE leonova_student_actions AS 
-- Добавить предмет
    PROCEDURE add_discipline(
        new_name_dis VARCHAR2, 
        new_date_d DATE, 
        new_control VARCHAR2, 
        new_group_name VARCHAR2, 
        new_name_tutor VARCHAR2
    );
    
-- Добавить студента
    PROCEDURE add_student(
       new_id         NUMBER,
       new_name       VARCHAR2,
       new_agrant     NUMBER,
       new_group_name VARCHAR2
    );
    
-- Отчислить студента
    PROCEDURE remove_student(
       del_id NUMBER
    );
    
-- Удалить пустые группы
    PROCEDURE delete_null_group;  
    
-- Список студентов, отсортированный по названию группы
    PROCEDURE print_student_order;
    
-- Список всех студентов
    PROCEDURE print_student;
    
-- Список предметов
    PROCEDURE print_discipline;
    
-- Успеваемость конкретного студента
    PROCEDURE student_marks (
        stud_id NUMBER
    );    
    
-- Успеваемость всех студентов группы или всех студентов университета
    PROCEDURE print_all_marks (new_group_name VARCHAR);
    
-- Сдать экзамен
    PROCEDURE pass_exam (new_mark VARCHAR, new_id NUMBER, new_dis_name VARCHAR);
    
-- Назначить стипендию
    PROCEDURE set_agrant (h_agrant NUMBER, u_agrant NUMBER);
    
-- Средний балл
    PROCEDURE avg_marks;
    
-- Количество оценок каждого типа по каждому преподавателю
    PROCEDURE count_marks;
      
-- Длительность сессии в днях для каждой группы
    PROCEDURE  session_length;
    
-- Перевести студента в другую группу
    PROCEDURE move_student (stud_id NUMBER, new_group VARCHAR);
    
-- Средняя стипендия по каждой группе и университету в целом
    PROCEDURE avg_all;
      
-- Исключение: вставка NULL в поле NOT NULL      
    insert_null_into_notnull EXCEPTION;
    PRAGMA EXCEPTION_INIT(insert_null_into_notnull, -1400);

-- Нарушено ограничение CHECK
    check_constraint EXCEPTION;
    PRAGMA EXCEPTION_INIT(check_constraint, -02290);

-- Строка состоит из цифр, а не из символов
    alph_ex EXCEPTION;
    
-- Нулевой id студента
    null_id EXCEPTION;
    
-- Пустой курсор
    empty_cursor EXCEPTION;
    
-- Несколько предметов в один день
    date_exc EXCEPTION;
    
-- Некорректное значение стипендии
    agrant_exc EXCEPTION;
    
-- Несколько предметов в один день
    date_control_exc EXCEPTION; 
    
-- Слишком много зачетов/экзаменов у данной группы
    many_control_exc EXCEPTION;

-- Пустой список
    empty_list EXCEPTION;
    
END;
/

-- Описание тела пакета
CREATE PACKAGE BODY leonova_student_actions AS

-- Добавить предмет
    PROCEDURE add_discipline(new_name_dis VARCHAR2, new_date_d DATE, new_control VARCHAR2, new_group_name VARCHAR2, new_name_tutor VARCHAR2) IS
    
        count_date NUMBER;
        
        max_date DATE;
        min_date DATE;
        
        max_ex NUMBER;
        max_z NUMBER;
        
        BEGIN
            -- Максимальное количество зачетов у студента данной группы
            SELECT MAX(count_d) INTO max_z FROM (SELECT COUNT(dis_name) AS count_d FROM leonova_gradebook WHERE group_name = new_group_name AND dis_control = 'Зачёт' GROUP BY student_id);
            -- Максимальное количество экзаменов у студента данной группы
            SELECT MAX(count_d) INTO max_ex FROM (SELECT COUNT(dis_name) AS count_d FROM leonova_gradebook WHERE group_name = new_group_name AND dis_control = 'Экзамен' GROUP BY student_id);
            -- Если у кого-то из студентов уже достаточно зачетов/экзаменов, то выбрасываем исключение
            IF (new_control = 'Зачёт' AND max_z >= 6) OR (new_control = 'Экзамен' AND max_ex >= 5) THEN
                RAISE many_control_exc;
            END IF;
            
            --Дата последнего зачета
            SELECT MAX(date_d) INTO max_date FROM leonova_discipline WHERE group_name = new_group_name AND control = 'Зачёт';
            --Дата первого экзамена
            SELECT MIN(date_d) INTO min_date FROM leonova_discipline WHERE group_name = new_group_name AND control = 'Экзамен';
            -- Если добавляем зачет, то его дата должна быть меньше чем дата первого экзамена
            -- Если добавляем экзамен, то его дата должна быть больше, чем дата последнего зачета
            IF (new_date_d > min_date AND new_control = 'Зачёт') OR (new_control = 'Экзамен' AND new_date_d <= max_date) THEN
                RAISE date_control_exc;
            END IF;

            -- Получаем количество предметов для данной группы в выбраный день
            SELECT COUNT(name_dis) INTO count_date FROM leonova_discipline 
                    WHERE group_name = new_group_name AND date_d = new_date_d;
            -- Если количество предметов в этот день больше 1, то новый предмет не добавляем
            IF (count_date > 0) THEN
                RAISE date_exc; 
            END IF;
            
           -- Имя преподавателя должно быть записано символами, а не цифрами
            IF regexp_like(new_name_tutor, '[[:digit:]]') THEN
                RAISE alph_ex;
            END IF;
                        
            -- Вставить новую запись в таблицу "Предмет"
            INSERT INTO leonova_discipline (name_dis, date_d, control, group_name, name_tutor) 
                values (new_name_dis, new_date_d, new_control, new_group_name, new_name_tutor);
    
            -- Добавить новые записи в таблицу "Зачетка" для соотв. студентов
            INSERT INTO leonova_gradebook (student_id, group_name, dis_name, dis_control, dis_mark) 
                    SELECT id, new_group_name, new_name_dis, new_control, NULL 
                        FROM leonova_student WHERE group_name = new_group_name;
                    
            COMMIT;
            
            EXCEPTION
                WHEN DUP_VAL_ON_INDEX THEN
                    dbms_output.put_line('Попытка вставить дубликат');
                    
                WHEN INVALID_NUMBER THEN
                    dbms_output.put_line('Попытка вставить некорректные данные');
                    
                WHEN insert_null_into_notnull THEN
                    dbms_output.put_line('Не все обязательные поля заполнены');
                    
                WHEN check_constraint THEN
                    dbms_output.put_line('Нарушено ограничение check в поле control');
                
                WHEN alph_ex THEN
                    dbms_output.put_line('Имя преподавателя не должно содержать цифры');
                    
                WHEN date_exc THEN
                    dbms_output.put_line('Для данной группы не может быть 2 предметов в один день');
                
                WHEN date_control_exc THEN
                    dbms_output.put_line('Зачёты должны идти до экзаменов');
                    
                WHEN many_control_exc THEN
                    dbms_output.put_line('У кого-то из студентов уже есть 5 экзаменов/6 зачетов');
                    
    END;
        
-- Добавить студента    
    PROCEDURE add_student(new_id NUMBER, new_name VARCHAR2, new_agrant NUMBER, new_group_name VARCHAR2) IS
    BEGIN
    
        -- Имя студента не должно содержать цифры
        IF regexp_like(new_name, '[[:digit:]]') THEN
               RAISE alph_ex;
           END IF;
        
        -- Вставить новую запись в таблицу "Студент"
        INSERT INTO leonova_student (id, name, agrant, group_name) values (new_id, new_name, new_agrant, new_group_name);
        
        -- Добавить для нового студента записи в таблицу "Зачётка"
        INSERT INTO leonova_gradebook (student_id, group_name, dis_name, dis_control, dis_mark) 
            SELECT new_id, group_name, name_dis, control, NULL 
                FROM leonova_discipline WHERE leonova_discipline.group_name = new_group_name;
        COMMIT;
        
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                dbms_output.put_line('Попытка вставить дубликат');
                    
            WHEN INVALID_NUMBER THEN
                dbms_output.put_line('Попытка вставить некорректные данные');
                    
            WHEN insert_null_into_notnull THEN
                dbms_output.put_line('Не все обязательные поля заполнены');
                
            WHEN alph_ex THEN
                dbms_output.put_line('Имя студента не должно содержать цифры');
                
            WHEN check_constraint THEN
                dbms_output.put_line('Нарушено ограничение check в поле agrant');
    END;
    
-- Отчислить студента
    PROCEDURE remove_student (del_id NUMBER) IS
    
        del_student NUMBER;
        
    BEGIN
        -- Проверям количество долгов у студента
        SELECT COUNT(student_id) INTO del_student FROM leonova_gradebook WHERE dis_mark IS NULL OR dis_mark IN ('Незачёт', '2') AND student_id = del_id;
      
        -- Если долгов нет, то удаление не выполняется
        IF (del_id IS NULL OR del_id = 0) THEN
            RAISE null_id;
        END IF;
        
        DELETE FROM leonova_student WHERE id = del_id AND id IN (SELECT student_id FROM leonova_gradebook WHERE dis_mark IS NULL OR dis_mark IN ('Незачёт', '2'));
        COMMIT;
        
        EXCEPTION
        
            WHEN null_id THEN
                dbms_output.put_line('Id студента не задан');
    END;
    
-- Удалить пустые группы
     PROCEDURE delete_null_group IS
     null_group NUMBER;
     
     BEGIN
        SELECT COUNT(group_name) INTO null_group FROM leonova_discipline WHERE NOT EXISTS (SELECT * FROM leonova_student s WHERE s.group_name = leonova_discipline.group_name);
        
        IF (null_group = 0) THEN
            RAISE empty_list;
        END IF;
        
        DELETE FROM leonova_discipline WHERE NOT EXISTS (SELECT * FROM leonova_student s WHERE s.group_name = leonova_discipline.group_name);
        COMMIT;
        
        EXCEPTION 
            WHEN empty_list THEN 
                dbms_output.put_line('Нет ни одной пустой группы');
     END;
     
-- Список студентов, отсортированный по названию группы
    PROCEDURE print_student_order IS
		--Создание курсора с нужными записями
        CURSOR stud IS SELECT * FROM  leonova_student ORDER BY group_name;
        stud_rec stud%rowtype;
    BEGIN
        OPEN stud;
        
        FETCH stud INTO stud_rec;
            
            -- Если курсор пустой
            IF stud%notfound THEN
                CLOSE stud;
                RAISE empty_cursor;
            END IF;
        
        LOOP
        
            EXIT WHEN stud%notfound;
            dbms_output.put_line('Студент - '
                                 || stud_rec.id
                                 || ', '
                                 || stud_rec.name
                                 || ', группа '
                                 || stud_rec.group_name
                                 || ', стипендия '
                                 || NVL(stud_rec.agrant, 0));
            
            FETCH stud INTO stud_rec;
            
        END LOOP;
        CLOSE stud;
        
        EXCEPTION
            WHEN CURSOR_ALREADY_OPEN THEN
                dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                
            WHEN INVALID_CURSOR THEN
                dbms_output.put_line('Некорректная операция с курсором');
                
            WHEN empty_cursor THEN
                dbms_output.put_line('Список пустой');
    END;
    
-- Список всех студентов 
    PROCEDURE print_student IS
        CURSOR stud IS SELECT * FROM leonova_student;
        stud_rec stud%rowtype;
        BEGIN
            OPEN stud;
            
            FETCH stud INTO stud_rec;
            -- Если список пустой, то выбрасываем исключение
            IF stud%notfound THEN
               CLOSE stud;
               RAISE empty_cursor;
            END IF;
            
            LOOP
                EXIT WHEN stud%notfound;
                dbms_output.put_line('Студент - '
                                     || stud_rec.id
                                     || ' ,'
                                     || stud_rec.name
                                     || ', группа '
                                     || stud_rec.group_name
                                     || ', стипендия '
                                     || NVL(stud_rec.agrant, 0));
                FETCH stud INTO stud_rec;
            END LOOP;
        CLOSE stud;
        
        EXCEPTION
            WHEN CURSOR_ALREADY_OPEN THEN
                dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                
            WHEN INVALID_CURSOR THEN
                dbms_output.put_line('Некорректная операция с курсором');
                
            WHEN empty_cursor THEN
                dbms_output.put_line('Список пустой');
    END;
     
-- Список предметов
    PROCEDURE print_discipline IS
        CURSOR dis IS SELECT * FROM leonova_discipline;
        dis_rec dis%rowtype;
        BEGIN
            OPEN dis;
            
            FETCH dis INTO dis_rec;
            -- Если список пустой, то выбрасываем исключение    
            IF dis%notfound THEN
                CLOSE dis;
                RAISE empty_cursor;
            END IF;
            
            LOOP
                
                EXIT WHEN dis%notfound;
                dbms_output.put_line('Название дисциплины - ' || dis_rec.name_dis 
                                        || ', форма контроля - ' || dis_rec.control 
                                        || ', дата проведения - ' || dis_rec.date_d
                                        || ', для группы - ' || dis_rec.group_name
                                        || ', преподаватель - ' || dis_rec.name_tutor);
                                        
                FETCH dis INTO dis_rec;
                
            END LOOP;
    
            CLOSE dis;
            
            EXCEPTION
            WHEN CURSOR_ALREADY_OPEN THEN
                dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                
            WHEN INVALID_CURSOR THEN
                dbms_output.put_line('Некорректная операция с курсором');
                
            WHEN empty_cursor THEN
                dbms_output.put_line('Список пустой');
            
    END;
    
-- Успеваемость конкретного студента
    PROCEDURE student_marks (stud_id NUMBER) IS
    
        s_name VARCHAR2(100 BYTE);
        s_agrant NUMBER(8, 0);
        s_group VARCHAR(15 BYTE);
        
        CURSOR stud IS SELECT * FROM leonova_gradebook WHERE student_id = stud_id;	
        stud_rec stud%rowtype;
        
        BEGIN             
            -- id студента должно быть заполнено положительным числом
            IF (stud_id IS NULL OR stud_id < 0) THEN
                RAISE null_id;
            END IF;
            
            SELECT name, NVL(agrant, '0'), group_name INTO s_name, s_agrant, s_group FROM leonova_student WHERE id = stud_id;
            
            OPEN stud;
            
            FETCH stud INTO stud_rec;
            -- если список пустой, то выбрасываем исключение  
            IF stud%notfound THEN
                CLOSE stud;
                RAISE empty_cursor;
            END IF;
            dbms_output.put_line('студент ' || s_name || ', стипендия ' || s_agrant || ', группа ' || s_group);
            LOOP
                
                EXIT WHEN stud%notfound;
                dbms_output.put_line(stud_rec.dis_name
                                     || ', '
                                     || stud_rec.dis_control
                                     || ', оценка - '
                                     || NVL(stud_rec.dis_mark, 'оценки нет'));
                FETCH stud INTO stud_rec;
              
    
            END LOOP;
            CLOSE stud;
            
            EXCEPTION
                WHEN CURSOR_ALREADY_OPEN THEN
                    dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                    
                WHEN INVALID_CURSOR THEN
                    dbms_output.put_line('Некорректная операция с курсором');
                    
                WHEN null_id THEN
                    dbms_output.put_line('Поле id должно быть заполнено');
                    
                WHEN empty_cursor THEN
                    dbms_output.put_line('Для данного студента нет ни одного предмета в зачетке');
        END;  
     
-- Успеваемость всех студентов группы или всех студентов университета
    PROCEDURE print_all_marks (new_group_name VARCHAR) IS

    CURSOR stud IS
			SELECT DISTINCT student_id FROM leonova_gradebook;
                
    CURSOR stud_gr IS
			SELECT DISTINCT student_id FROM leonova_gradebook WHERE leonova_gradebook.group_name = new_group_name;
			
        stud_rec stud%rowtype;
        stud_gr_rec stud%rowtype;
        
        BEGIN   
                IF (new_group_name IS NULL) THEN
                       OPEN stud;
                       --Если список пустой, выбрасываем исключение
                       FETCH stud INTO stud_rec;
                            IF stud%notfound THEN
                                CLOSE stud;
                                RAISE empty_cursor;
                            END IF;
                       
                        LOOP
                            EXIT WHEN stud%notfound;
                             student_marks(stud_rec.student_id);
                             FETCH stud INTO stud_rec;
                        END LOOP;
                        CLOSE stud;
                END IF;
                
                IF (new_group_name IS NOT NULL) THEN
                      OPEN stud_gr;
                      --Если список пустой, выбрасываем исключение
                      FETCH stud_gr INTO stud_gr_rec;
                           IF stud_gr%notfound THEN
                               CLOSE stud_gr;
                               RAISE empty_cursor;
                           END IF;
                       
                       LOOP
                           EXIT WHEN stud_gr%notfound;
                            student_marks(stud_gr_rec.student_id);
                            FETCH stud_gr INTO stud_gr_rec;
                       END LOOP;
                       CLOSE stud_gr;
                END IF;
        EXCEPTION
            WHEN CURSOR_ALREADY_OPEN THEN
                dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                
            WHEN INVALID_CURSOR THEN
                dbms_output.put_line('Некорректная операция с курсором');
                
            WHEN empty_cursor THEN
                dbms_output.put_line('Для данного студента нет ни одного предмета в зачетке');
    END;

-- Сдать экзамен
    PROCEDURE pass_exam (new_mark VARCHAR, new_id NUMBER, new_dis_name VARCHAR) IS
       BEGIN
         -- id должно быть положительным числом, название предмета заполнено
         IF (new_id IS NULL OR new_id < 0 OR new_dis_name IS NULL) THEN
            RAISE null_id;
         END IF;
            
         UPDATE leonova_gradebook SET dis_mark = new_mark 
            WHERE student_id = new_id AND dis_name = new_dis_name 
                        AND (dis_mark IS NULL OR dis_mark IN ('Незачёт', '2'));
         COMMIT;
         
        EXCEPTION
            WHEN DUP_VAL_ON_INDEX THEN
                dbms_output.put_line('Попытка вставить дубликат');
                    
            WHEN INVALID_NUMBER THEN
                dbms_output.put_line('Попытка вставить некорректные данные');
                    
            WHEN insert_null_into_notnull THEN
                dbms_output.put_line('Не все обязательные поля заполнены');
                
            WHEN null_id THEN
                dbms_output.put_line('Некорректное значение id или не заполнено название предмета');
            
            WHEN check_constraint THEN
                dbms_output.put_line('Нарушено ограничение check для оценки');
       END;
       
-- Назначить стипендию
    PROCEDURE set_agrant (h_agrant NUMBER, u_agrant NUMBER) IS
    BEGIN
    
        IF (h_agrant = 0 OR u_agrant = 0 OR h_agrant <= u_agrant OR h_agrant IS NULL OR u_agrant IS NULL) THEN
            RAISE agrant_exc;
        END IF;
        
        --Студенты с повышенной стипендией (выбираем все зачеты и экзамены студента, выбираем хорошо сданные и далее выбираем их пересечения)
        UPDATE leonova_student SET agrant = h_agrant WHERE id IN 
        (SELECT student_id FROM (
            (SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id)
            INTERSECT (SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_mark in ('Зачёт', '5') AND dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id)));
 
        --Студенты с обычной стипендией 
        UPDATE leonova_student SET agrant = u_agrant WHERE id IN
        (SELECT student_id FROM(
        ((SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id) 
            INTERSECT (SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_mark in ('Зачёт', '5', '4') AND dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id))
                MINUS ((SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id)
            INTERSECT (SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_mark in ('Зачёт', '5') AND dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id))));
    
        -- Студенты без стипендии
        UPDATE leonova_student SET agrant = 0 WHERE id IN
        (SELECT student_id FROM(
        (SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id) 
            MINUS (SELECT COUNT(dis_name), student_id FROM leonova_gradebook WHERE dis_mark in ('Зачёт', '5', '4') AND dis_control in ('Зачёт', 'Экзамен') GROUP BY student_id)));
            
        COMMIT;
        
        EXCEPTION
        
            WHEN DUP_VAL_ON_INDEX THEN
                dbms_output.put_line('Попытка вставить дубликат');
                    
            WHEN INVALID_NUMBER THEN
                dbms_output.put_line('Попытка вставить некорректные данные');
                
            WHEN agrant_exc THEN
                dbms_output.put_line('Некорректное значение стипендии');
        
    END;
 
-- Средний балл
    PROCEDURE avg_marks IS
    CURSOR marks IS SELECT student_id, name, ROUND(AVG(NVL(dis_mark, '2')), 1) AS a_mark FROM leonova_gradebook 
                                JOIN leonova_student ON leonova_student.id = leonova_gradebook.student_id 
                                WHERE leonova_gradebook.dis_control = 'Экзамен' GROUP BY student_id, name; 
    marks_rec marks%rowtype;
    BEGIN
        OPEN marks;
        
        FETCH marks INTO marks_rec;
            -- Если список пустой, выбрасываем исключения    
            IF marks%notfound THEN
                CLOSE marks;
                RAISE empty_cursor;
            END IF;
            
            LOOP
                EXIT WHEN marks%notfound;
                dbms_output.put_line(marks_rec.student_id || ' - ' || marks_rec.name || ' - ' || marks_rec.a_mark);
                FETCH marks INTO marks_rec;
            END LOOP;
            
            EXCEPTION
            WHEN CURSOR_ALREADY_OPEN THEN
                dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                
            WHEN INVALID_CURSOR THEN
                dbms_output.put_line('Некорректная операция с курсором');
                
            WHEN empty_cursor THEN
                dbms_output.put_line('Список пуст');
    END;
      
-- Количество оценок каждого типа по каждому преподавателю  
    PROCEDURE count_marks IS
    
    CURSOR count_m IS SELECT DISTINCT(name_tutor) FROM leonova_discipline;
        count_rec count_m%rowtype;
        
        count_5 NUMBER;
        count_4 NUMBER;
        count_3 NUMBER;
        count_2 NUMBER;
        count_z NUMBER;
        count_nz NUMBER;
        count_nl NUMBER;
        
        BEGIN
            OPEN count_m;
            
            FETCH count_m INTO count_rec;
            -- Если список пустой, выбрасываем исключения    
            IF count_m%notfound THEN
                CLOSE count_m;
                RAISE empty_cursor;
            END IF;
            
            dbms_output.put_line('Преподаватель | Неявка | Зачёт | Незачёт | 5 | 4 | 3 | 2');
            LOOP
                EXIT WHEN count_m%notfound;
                    SELECT COUNT(dis_mark) INTO count_z FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
                                                                         WHERE leonova_discipline.name_tutor = count_rec.name_tutor AND dis_mark = 'Зачёт';
                                                                         
                    SELECT COUNT(dis_mark) INTO count_nz FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
                                                                         WHERE leonova_discipline.name_tutor = count_rec.name_tutor AND dis_mark = 'Незачёт';  
                                                                         
                    SELECT COUNT(dis_mark) INTO count_5 FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
                                                                         WHERE leonova_discipline.name_tutor = count_rec.name_tutor AND dis_mark = '5';
                                                                         
                    SELECT COUNT(dis_mark) INTO count_4 FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
                                                                         WHERE leonova_discipline.name_tutor = count_rec.name_tutor AND dis_mark = '4';
                                                                         
                    SELECT COUNT(dis_mark) INTO count_3 FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
                                                                         WHERE leonova_discipline.name_tutor = count_rec.name_tutor AND dis_mark = '3';  
                                                                         
                    SELECT COUNT(dis_mark) INTO count_2 FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
                                                                         WHERE leonova_discipline.name_tutor = count_rec.name_tutor AND dis_mark = '2'; 
                                                                         
                    SELECT COUNT(NVL(dis_mark, 'Неявка')) INTO count_nl FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
                                                                         WHERE leonova_discipline.name_tutor = count_rec.name_tutor AND dis_mark is null;                                                                          
                                                                         
            dbms_output.put_line(count_rec.name_tutor || ' | ' || count_nl || ' | ' || count_z || ' | ' || count_nz || ' | ' || count_5 || ' | ' || count_4 || ' | ' || count_3 || ' | ' || count_2);
                FETCH count_m INTO count_rec;
            END LOOP;
            
            EXCEPTION
            WHEN CURSOR_ALREADY_OPEN THEN
                dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                
            WHEN INVALID_CURSOR THEN
                dbms_output.put_line('Некорректная операция с курсором');
                
            WHEN empty_cursor THEN
                dbms_output.put_line('Список пуст');
        END;
    
-- Длительность сессии в днях для каждой группы
    PROCEDURE  session_length IS
     CURSOR stud IS SELECT group_name, (MAX(date_d)- MIN(date_d)) AS date_len FROM leonova_discipline GROUP BY group_name;
        stud_rec stud%rowtype;
        BEGIN
            OPEN stud;
            
              FETCH stud INTO stud_rec;
                    -- Если список пуст, выбрасываем исключение
                    IF stud%notfound THEN
                        CLOSE stud;
                        RAISE empty_cursor;
                    END IF;
            
                LOOP
                    
                    EXIT WHEN stud%notfound;
                    dbms_output.put_line('Группа - ' || stud_rec.group_name || ', длительность сессии - ' || stud_rec.date_len);
                    FETCH stud INTO stud_rec;
                    
                END LOOP;
                CLOSE stud;
                
            EXCEPTION
                WHEN CURSOR_ALREADY_OPEN THEN
                    dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                    
                WHEN INVALID_CURSOR THEN
                    dbms_output.put_line('Некорректная операция с курсором');
                    
                WHEN empty_cursor THEN
                    dbms_output.put_line('Список пуст');
      END;
      
-- Перевести студента в другую группу
    PROCEDURE move_student (stud_id NUMBER, new_group VARCHAR) IS
    
        stud_name VARCHAR2(100 BYTE);
        old_group VARCHAR2(15 BYTE);
        count_gr NUMBER;
        
        BEGIN
        
            IF ((stud_id IS NULL) OR (new_group IS NULL) OR (stud_id <= 0)) THEN
                RAISE null_id;
            END IF;
                
            -- Получаем имя и старую группу студента
            SELECT name, group_name INTO stud_name, old_group FROM leonova_student WHERE id = stud_id;
                   
             -- Создаем временный объект
            INSERT INTO leonova_student (id ,name, agrant, group_name) values ('999999', stud_name, NULL, new_group);
            
            -- Удалить все не совпадающие предметы для оригинального объекта.
            DELETE FROM leonova_gradebook WHERE student_id = stud_id AND NOT EXISTS (SELECT * FROM leonova_discipline WHERE group_name = new_group 
                AND dis_name = leonova_discipline.name_dis);
            
            SELECT COUNT(dis_name) INTO count_gr FROM leonova_gradebook WHERE student_id = stud_id;
            
            IF (count_gr > 0) THEN
                  -- Сохранить совпадающие предметы в отдельную запись    
                    INSERT INTO leonova_gradebook (student_id, group_name, dis_name, dis_control, dis_mark) 
                                SELECT '999999', new_group, dis_name, dis_control, dis_mark 
                                    FROM (SELECT dis_name, dis_control, dis_mark FROM leonova_gradebook WHERE student_id = stud_id);
                    
                    -- Полностью удалить все для оригинального объекта                
                    DELETE FROM leonova_gradebook WHERE student_id = stud_id;
                    
                    -- Поменять группу у оригинального объекта в таблице студент
                    UPDATE leonova_student SET group_name = new_group WHERE id = stud_id;
                    
                    -- Добавить в зачетку уже сданные предметы оригинальному объекту
                    INSERT INTO leonova_gradebook (student_id, group_name, dis_name, dis_control, dis_mark) 
                                SELECT stud_id, new_group, dis_name, dis_control, dis_mark 
                                    FROM (SELECT dis_name, dis_control, dis_mark FROM leonova_gradebook WHERE student_id = '999999');
                                    
                    -- Добавить в зачетку новые предметы оригинальному объекту
                    INSERT INTO leonova_gradebook (student_id, group_name, dis_name, dis_control, dis_mark) 
                                 SELECT stud_id, group_name, name_dis, control, NULL 
                                    FROM (SELECT group_name, name_dis, control FROM leonova_discipline WHERE leonova_discipline.group_name = new_group AND 
                                        NOT EXISTS (SELECT * FROM leonova_gradebook gr WHERE student_id = stud_id AND group_name = gr.group_name AND name_dis = gr.dis_name AND control = gr.dis_control));
                                                
                    DELETE FROM leonova_gradebook WHERE  student_id = '999999'; 
            END IF;
            
            IF (count_gr = 0) THEN
                    -- Полностью удалить все для оригинального объекта                
                    DELETE FROM leonova_gradebook WHERE student_id = stud_id;
                    
                    -- Поменять группу у оригинального объекта в таблице студент
                    UPDATE leonova_student SET group_name = new_group WHERE id = stud_id;
                    
                    INSERT INTO leonova_gradebook (student_id, group_name, dis_name, dis_control, dis_mark) 
                                     SELECT stud_id, group_name, name_dis, control, NULL 
                                        FROM (SELECT group_name, name_dis, control FROM leonova_discipline WHERE leonova_discipline.group_name = new_group AND 
                                            NOT EXISTS (SELECT * FROM leonova_gradebook gr WHERE student_id = stud_id AND group_name = gr.group_name AND name_dis = gr.dis_name AND control = gr.dis_control));
            
            END IF;
            
            DELETE FROM leonova_student WHERE id = '999999';
            
            COMMIT;
            
            EXCEPTION
                WHEN null_id THEN
                    dbms_output.put_line('Id и/или новая группа студента не заданы');
                    
                WHEN DUP_VAL_ON_INDEX THEN
                    dbms_output.put_line('Попытка вставить дубликат');
                    
                WHEN INVALID_NUMBER THEN
                    dbms_output.put_line('Попытка вставить некорректные данные');
            
        END;
        
-- Средняя стипендия по каждой группе и университету в целом
      PROCEDURE avg_all IS
        -- По каждой группе
        CURSOR stud IS 
         SELECT c1, c2, a1, a2, g1 
            FROM (SELECT COUNT(s1.id) c1, ROUND(AVG(s1.agrant), 1) a1, NVL(s1.group_name, 'Без группы') g1 FROM leonova_student s1 WHERE s1.agrant > 0 GROUP BY s1.group_name) 
            JOIN (SELECT COUNT(s2.id) c2, ROUND(AVG(NVL(s2.agrant, '0')), 1) a2, NVL(s2.group_name, 'Без группы') g2 FROM leonova_student s2  GROUP BY s2.group_name) 
                ON g1 = g2;
        -- По университету
        count_all NUMBER;
        count_agr NUMBER;
        avg_all NUMBER;
        avg_agr NUMBER;
                
       stud_rec stud%rowtype;
       
       BEGIN
       
           SELECT COUNT(s1.id) c1, ROUND(AVG(s1.agrant), 1) a1 INTO count_agr, avg_agr FROM leonova_student s1 WHERE s1.agrant > 0;
           SELECT COUNT(s2.id) c2, ROUND(AVG(NVL(s2.agrant, '0')), 1) a2 INTO count_all, avg_all FROM leonova_student s2;
            
           OPEN stud;
           
             FETCH stud INTO stud_rec;
                   -- Если список пуст, выбрасываем исключение
                   IF stud%notfound THEN
                       CLOSE stud;
                       RAISE empty_cursor;
                   END IF;
           
               LOOP
                    
                   EXIT WHEN stud%notfound;
                   dbms_output.put_line('Группа - ' || stud_rec.g1 || ', кол-во студентов  - ' || stud_rec.c2
                                        || ', кол-во получающих стипендию студентов  - ' || stud_rec.c1 ||
                                        ', средн. стипендия по всем  - ' || stud_rec.a2
                                        || ', средн. стипендия по всем, кто ее получает  - ' || stud_rec.a1
                                        );
                   FETCH stud INTO stud_rec;
                    
               END LOOP;
               CLOSE stud;
               
               dbms_output.put_line('Кол-во студентов университета - ' || count_all || 
                                    ', их средняя стипендия - ' || avg_all);
               dbms_output.put_line('Кол-во студентов университета , получающих стипендию - ' || count_agr || 
                                    ', их средняя стипендия - ' || avg_agr);
           EXCEPTION
               WHEN CURSOR_ALREADY_OPEN THEN
                   dbms_output.put_line('Попытка открыть уже ранее открытый курсор');
                   
               WHEN INVALID_CURSOR THEN
                   dbms_output.put_line('Некорректная операция с курсором');
                   
               WHEN empty_cursor THEN
                   dbms_output.put_line('Список пуст');
      END;
  
END;

--                    SELECT COUNT(CASE WHEN dis_mark IS NOT NULL) FROM leonova_gradebook JOIN leonova_discipline ON leonova_gradebook.dis_name = leonova_discipline.name_dis AND 
--                                                                         leonova_gradebook.dis_control = leonova_discipline.control AND 
--                                                                         leonova_gradebook.group_name = leonova_discipline.group_name
--                                                                         WHERE leonova_discipline.name_tutor = 'А.И. Дмитриев' AND dis_mark is null;    