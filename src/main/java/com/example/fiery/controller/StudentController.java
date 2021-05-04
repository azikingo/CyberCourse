package com.example.fiery.controller;

import com.example.fiery.domain.Course;
import com.example.fiery.service.AdminService;
import com.example.fiery.service.CategoryService;
import com.example.fiery.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        model.addAttribute("courses", courseService.getAllActiveCourses(null, null));
        return "student/courseStudent";
    }

    @GetMapping("/course/{course}")
    public String getCourseDetail(@PathVariable Course course, Model model)
    {
        model.addAttribute("url", "/student/course/" + course.getId());
        return "student/courseStudent";
    }
}
