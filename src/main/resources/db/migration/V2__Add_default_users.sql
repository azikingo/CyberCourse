insert into usr (id, username, password, active)
  values (1001, 'admin', 'admin', true);

insert into user_role (user_id, roles)
  values (1001, 'admin');

insert into usr (id, username, password, active)
  values (1002, 'teacher', 'teacher', true);

insert into user_role (user_id, roles)
  values (1002, 'teacher');

insert into usr (id, username, password, active)
  values (1003, 'student', 'student', true);

insert into user_role (user_id, roles)
  values (1003, 'student');

