package com.example.fiery.controller;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.User;
import com.example.fiery.service.AdminService;
import com.example.fiery.service.CategoryService;
import com.example.fiery.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('student')")
@RequestMapping("/student")
public class StudentController {
    @Autowired
    AdminService adminService;

    @Autowired
    CourseService courseService;

    @Autowired
    CategoryService categoryService;

    @GetMapping
    public String studentPage(Model model)
    {
        return "greeting";
    }

//    Course
    @GetMapping("/course")
    public String getCoursePage(Model model)
    {
        model.addAttribute("url", "/student/course");
        model.addAttribute("courses", courseService.getAllCourses());
        return "student/courseStudent";
    }

    @GetMapping("/course/{course}")
    public String getCourseDetail(@PathVariable Course course, Model model)
    {
        model.addAttribute("url", "/student/course/" + course.getId());
        return "student/courseStudent";
    }
}
