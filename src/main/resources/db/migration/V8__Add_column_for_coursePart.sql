alter table if exists course_part
    add column if not exists quiz_id int8,
    add column if not exists active boolean,
    add constraint course_part_quiz_fk foreign key (quiz_id) references quiz;