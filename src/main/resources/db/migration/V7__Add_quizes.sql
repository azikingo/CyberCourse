create table quiz (
  id bigserial not null,
  course_part_id int8,
  title_kz varchar(255),
  title_ru varchar(255),
  title_en varchar(255),
  description_kz varchar(255),
  description_ru varchar(255),
  description_en varchar(255),
  duration int4,
  max_score int4,
  active boolean,
  primary key (id)
);
create table quiz_question (
  id bigserial not null,
  quiz_id int8,
  text_kz varchar(255),
  text_ru varchar(255),
  text_en varchar(255),
  max_score int4,
  primary key (id)
);
create table quiz_answer (
    id bigserial not null,
    quiz_question_id int8,
    text_kz varchar(255),
    text_ru varchar(255),
    text_en varchar(255),
    correct_answer boolean,
    primary key (id)
);
create table quiz_result (
  id bigserial not null,
  timestamp timestamp,
  quiz_id int8,
  student_id int8,
  total_score int4,
  finished boolean,
  primary key (id)
);
create table quiz_question_result (
  id bigserial not null,
  quiz_result_id int8,
  quiz_question_id int8,
  quiz_answer_id int8,
  score int4,
  max_score int4,
  primary key (id)
);

alter table if exists quiz
    add constraint quiz_course_part_fk foreign key (course_part_id) references course_part;
alter table if exists quiz_question
    add constraint quiz_question_quiz_fk foreign key (quiz_id) references quiz;
alter table if exists quiz_answer
    add constraint quiz_answer_question_fk foreign key (quiz_question_id) references quiz_question;
alter table if exists quiz_result
    add constraint quiz_result_course_fk foreign key (quiz_id) references quiz,
    add constraint quiz_result_student_fk foreign key (student_id) references usr;
alter table if exists quiz_question_result
    add constraint question_result_quiz_fk foreign key (quiz_result_id) references quiz_result,
    add constraint question_result_question_fk foreign key (quiz_question_id) references quiz_question,
    add constraint question_result_answer_fk foreign key (quiz_answer_id) references quiz_answer;