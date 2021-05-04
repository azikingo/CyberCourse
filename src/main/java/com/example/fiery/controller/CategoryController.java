package com.example.fiery.controller;

import com.example.fiery.domain.*;
import com.example.fiery.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
@PreAuthorize("hasAuthority('admin')")
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    AdminService adminService;

    @Autowired
    CourseService courseService;

    @Autowired
    CoursePartService coursePartService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    QuizService quizService;


//    """"""""""""""""""""""""""""""""""""""""""""""" Category """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping()
    public String getCategoryPage(Model model)
    {
        model.addAttribute("url", "/course/category");
        model.addAttribute("categories", categoryService.getAllCategories());
        return "course";
    }

    @GetMapping("/addCategory")
    public String addCategoryPage(Model model)
    {
        model.addAttribute("url", "/course/addCategory");
        return "course";
    }

    @PostMapping("/addCategory")
    public String addCategory(
            @Valid Category category, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert
            ){
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/course/addCategory");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "course";
        }

        Map<String, String> serviceResult = categoryService.addCategory(category);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "course";
        }

        return "redirect:/category";
    }
}
