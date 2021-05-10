//package com.example.fiery.service;
//
//import com.example.fiery.domain.Role;
//import com.example.fiery.domain.User;
//import com.example.fiery.repos.UserRepo;
//import org.hamcrest.CoreMatchers;
//import org.junit.jupiter.api.Assertions;
//import org.junit.jupiter.api.Test;
//import org.mockito.ArgumentMatchers;
//import org.mockito.Mockito;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.boot.test.mock.mockito.MockBean;
//import org.springframework.security.crypto.password.PasswordEncoder;
//
//import java.util.Collections;
//
////@SpringBootTest
//class UserServiceTest {
//    @Autowired
//    private UserService userService;
//
//    @MockBean
//    private UserRepo userRepo;
//
//    @MockBean
//    private MailSender mailSender;
//
//    @MockBean
//    private PasswordEncoder passwordEncoder;
//
//    @Test
//    void addUser() {
//        User user = new User();
//        user.setEmail("some@mail.ru");
//
//        boolean isUserCreated = userService.addUser(user);
//        Assertions.assertTrue(isUserCreated);
//        Assertions.assertNotNull(user.getActivationCode());
//        Assertions.assertTrue(CoreMatchers.is(user.getRoles()).matches(Collections.singleton(Role.student)));
//        Assertions.assertFalse(user.isActive());
//
//        Mockito.verify(userRepo, Mockito.times(1)).save(user);
//        Mockito.verify(mailSender, Mockito.times(1))
//                .send(
//                        ArgumentMatchers.eq(user.getEmail()),
//                        ArgumentMatchers.eq("Activation code!"),
//                        ArgumentMatchers.contains("Welcome to fiery")
//                );
//    }
//
//    @Test
//    public void addUserFailedTest(){
//        User user = new User();
//        user.setUsername("John");
//
//        Mockito.doReturn(new User())
//                .when(userRepo)
//                .findByUsername("John");
//
//        boolean isUserCreated = userService.addUser(user);
//        Assertions.assertFalse(isUserCreated);
//
//        Mockito.verify(userRepo, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
//        Mockito.verify(mailSender, Mockito.times(0))
//                .send(
//                        ArgumentMatchers.anyString(),
//                        ArgumentMatchers.anyString(),
//                        ArgumentMatchers.anyString()
//                );
//    }
//
//    @Test
//    public void activteUser(){
//        User user = new User();
//        user.setActivationCode("bingo!");
//
//        Mockito.doReturn(user)
//                .when(userRepo)
//                .findByActivationCode("activate");
//        boolean isUserActivated = userService.activateUser("activate");
//        Assertions.assertTrue(isUserActivated);
//        Assertions.assertNull(user.getActivationCode());
//
//        Mockito.verify(userRepo, Mockito.times(1)).save(user);
//    }
//
//    @Test
//    public void activateUserFailedTest(){
//        boolean isUserActivated = userService.activateUser("activate me");
//
//        Assertions.assertFalse(isUserActivated);
//
//        Mockito.verify(userRepo, Mockito.times(0)).save(ArgumentMatchers.any(User.class));
//    }
//}