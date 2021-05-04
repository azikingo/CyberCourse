alter table if exists course
    add column if not exists teacher_id int8,
    add constraint course_teacher_fk foreign key (teacher_id) references usr;