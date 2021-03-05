create table course (
  id int8 not null,
  timestamp timestamp,
  photo_path varchar(255),
  title_kz varchar(255),
  title_ru varchar(255),
  title_en varchar(255),
  description_kz varchar(255),
  description_ru varchar(255),
  description_en varchar(255),
  price int8,
  duration int4,
  limit_time int4,
  active boolean,
  primary key (id)
);
create table course_part (
  id int8 not null,
  course_id int8,
  timestamp timestamp,
  title_kz varchar(255),
  title_ru varchar(255),
  title_en varchar(255),
  description_kz varchar(255),
  description_ru varchar(255),
  description_en varchar(255),
  duration int4,
  limit_time int4,
  video_link varchar(255),
  primary key (id)
);
create table category (
    id int8 not null,
    title_kz varchar(255),
    title_ru varchar(255),
    title_en varchar(255),
    primary key (id)
);

create table course_category (
  course_id int8 not null,
  category_id int8 not null,
  primary key (course_id, category_id)
);
create table course_result (
  id int8 not null,
  timestamp timestamp,
  course_id int8,
  student_id int8,
  finished boolean,
  duration int4,
  primary key (id)
);
create table course_part_result (
  id int8 not null,
  timestamp timestamp,
  course_id int8,
  student_id int8,
  finished boolean,
  duration int4,
  primary key (id)
);

alter table if exists course_category
    add constraint course_courses_fk foreign key (course_id) references course,
    add constraint course_categories_fk foreign key (category_id) references category;
alter table if exists course_part
    add constraint course_part_course_fk foreign key (course_id) references course;
alter table if exists course_result
    add constraint course_result_course_fk foreign key (course_id) references course,
    add constraint course_result_student_fk foreign key (student_id) references usr;
alter table if exists course_part_result
    add constraint course_part_result_course_fk foreign key (course_id) references course,
    add constraint course_part_result_student_fk foreign key (student_id) references usr;