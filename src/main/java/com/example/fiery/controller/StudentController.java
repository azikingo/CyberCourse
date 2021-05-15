package com.example.fiery.controller;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.CoursePart;
import com.example.fiery.domain.User;
import com.example.fiery.service.AdminService;
import com.example.fiery.service.CategoryService;
import com.example.fiery.service.CourseService;
import com.example.fiery.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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

    @Autowired
    QuizService quizService;

    @GetMapping
    public String studentPage(Model model)
    {
        return "greeting";
    }

//    Course
    @GetMapping("/my-courses")
    public String getCoursePage(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false) String filter,
            @RequestParam(required = false) Category selectedCategory,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ) {
        if (user == null)
            return "redirect:/";

        if(selectedCategory != null)
            model.addAttribute("selectedCategory", selectedCategory);
        model.addAttribute("filter", filter);
        model.addAttribute("url", "/student/my-courses");
        model.addAttribute("courses", courseService.getAllActiveCoursesForStudent(filter, selectedCategory, user, pageable));
        model.addAttribute("categories", categoryService.getAllCategories());
        return "student/courseStudent";
    }

    @GetMapping("/my-courses/{course}")
    public String getCourseDetail(
            @AuthenticationPrincipal User user,
            @PathVariable Course course,
            Model model
    ) {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/student/my-courses/" + course.getId());
        return "student/courseStudent";
    }

    @GetMapping("/my-courses/{course}/part/{coursePart}")
    public String getCoursePartPage(
            @AuthenticationPrincipal User user,
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ) {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/student/my-courses/" + course.getId() + "/part/" + coursePart.getId());
        return "student/courseStudent";
    }

    @GetMapping("/my-courses/{course}/part/{coursePart}/quiz")
    public String getPartQuizPage(
            @AuthenticationPrincipal User user,
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ) {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/student/my-courses/" + course.getId() + "/part/" + coursePart.getId() + "/quiz");
        model.addAttribute("quiz", quizService.getQuizByCoursePart(coursePart));
        return "student/courseStudent";
    }


//    @PostMapping("/add")
//    public String addCourse(
//            @Valid Course course, BindingResult bindingResult,
//            @AuthenticationPrincipal User user, Model model,
//            @RequestParam(defaultValue = "none") String alert,
//            @RequestParam("file") MultipartFile file
//    ) throws IOException {
//        if (user == null)
//            return "redirect:/";
//
//        model.addAttribute("url", "/my-courses/add");
//        model.addAttribute("alert", alert);
//
//        if (bindingResult.hasErrors()) {
//            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
//            model.mergeAttributes(bindErrors);
//            return "course";
//        }
//
//        Map<String, String> serviceResult = courseService.addCourse(course, file);
//
//        if (!serviceResult.isEmpty()) {
//            model.mergeAttributes(serviceResult);
//            return "course";
//        }
//
//        return "redirect:/my-courses";
//    }
}
