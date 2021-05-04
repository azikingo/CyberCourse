package com.example.fiery.controller;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.User;
import com.example.fiery.service.CategoryService;
import com.example.fiery.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import java.util.Optional;

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
            model.addAttribute("courses", courseService.getAllActiveCourses(null, null));
            return "greeting";
//        }
//        return "redirect:/course";
    }

    @GetMapping("/course")
    public String getCourse(
            @AuthenticationPrincipal User user,
            @RequestParam(required = false) String filter,
            @RequestParam(required = false) Category selectedCategory,
            Model model
    ) {

        if(selectedCategory != null)
            model.addAttribute("selectedCategory", selectedCategory);
        model.addAttribute("url", "/course");
        model.addAttribute("filter", filter);
        model.addAttribute("courses", courseService.getAllActiveCourses(filter, selectedCategory));
        model.addAttribute("categories", categoryService.getAllCategories());
        return "main";
    }

    @GetMapping("/course/{course}")
    public String getCourseDetail(
            @AuthenticationPrincipal User user,
            @PathVariable Course course,
            Model model
    ) {

        model.addAttribute("url", "/course/" + course.getId());
        return "main";
    }

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
