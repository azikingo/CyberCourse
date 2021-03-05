insert into usr (id, username, password, active)
  values (1, 'admin', 'admin', true);

insert into user_role (user_id, roles)
  values (1, 'admin');

insert into usr (id, username, password, active)
  values (2, 'teacher', 'teacher', true);

insert into user_role (user_id, roles)
  values (2, 'teacher');

insert into usr (id, username, password, active)
  values (3, 'student', 'student', true);

insert into user_role (user_id, roles)
  values (3, 'student');

