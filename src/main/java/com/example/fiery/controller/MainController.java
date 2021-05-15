package com.example.fiery.controller;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.User;
import com.example.fiery.service.CategoryService;
import com.example.fiery.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    CourseService courseService;

    @Autowired
    CategoryService categoryService;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(@AuthenticationPrincipal User user, Model model) {

//        if (user != null && user.isAdmin())
//            return "redirect:/admin";
//        else if (user != null && user.isTeacher())
//            return "redirect:/teacher";
//        else if (user != null && user.isStudent())
//            return "redirect:/student";
//        else
//        if (user != null && user.isTeacher()){
            model.addAttribute("listCourses", courseService.getListAllActiveCourses(null, null));
            return "greeting";
//        }
//        return "redirect:/course";
    }

    @GetMapping("/contacts")
    public String getContactsPage() {
            return "contacts";
    }

    @GetMapping("/about")
    public String getAboutPage() {
            return "about";
    }

    @GetMapping("/course")
    public String getCourse(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false) String filter,
            @RequestParam(required = false) Category selectedCategory,
            @PageableDefault(sort = {"id"}, direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ) {

        if(selectedCategory != null)
            model.addAttribute("selectedCategory", selectedCategory);
        model.addAttribute("url", "/course");
        model.addAttribute("filter", filter);
        model.addAttribute("courses", courseService.getAllActiveCourses(filter, selectedCategory, pageable));
        model.addAttribute("listCourses", courseService.getListAllActiveCourses(filter, selectedCategory));
        model.addAttribute("categories", categoryService.getAllCategories());
        return "mainCourses";
    }

    @GetMapping("/course/{course}")
    public String getCourseDetail(
            @AuthenticationPrincipal User user,
            @PathVariable Course course,
            Model model
    ) {

        model.addAttribute("url", "/course/" + course.getId());
        return "mainCourses";
    }

    @GetMapping("/course/{course}/sub")
    public String subscribeToCourse(
            @AuthenticationPrincipal User user,
            @PathVariable Course course,
            Model model
    ) {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/course/" + course.getId() + "/sub");

        Map<String, String> serviceResult = courseService.subscribeStudent(course, user);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "mainCourses";
        }

        return "redirect:/student/my-courses";
    }

//    Get images
    @GetMapping(value = "/img/{name}", produces = MediaType.IMAGE_JPEG_VALUE)
    public @ResponseBody
    byte[] getImage(@PathVariable String name) {
        File serverFile = new File(uploadPath + "/" + name);
        try {
            return Files.readAllBytes(serverFile.toPath());
        } catch (IOException e) {
            return null;
        }
    }
}
