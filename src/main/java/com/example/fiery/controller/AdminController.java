package com.example.fiery.controller;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.CoursePart;
import com.example.fiery.domain.User;
import com.example.fiery.service.AdminService;
import com.example.fiery.service.CategoryService;
import com.example.fiery.service.CoursePartService;
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
@PreAuthorize("hasAuthority('admin')")
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @Autowired
    CourseService courseService;

    @Autowired
    CoursePartService coursePartService;

    @Autowired
    CategoryService categoryService;

    @GetMapping
    public String adminPage(Model model)
    {
        return "greeting";
    }



//    """"""""""""""""""""""""""""""""""""""""""""""" Courses """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping("/course")
    public String getCoursePage(Model model)
    {
        model.addAttribute("url", "/admin/course");
        model.addAttribute("courses", courseService.getAllCourses());
        return "course";
    }

    @GetMapping("/addCourse")
    public String addCoursePage(Model model)
    {
        model.addAttribute("url", "/admin/addCourse");
        model.addAttribute("categories", categoryService.getAllCategories());
        return "course";
    }

    @PostMapping("/addCourse")
    public String addCourse(
            @Valid Course course, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/admin/addCourse");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "course";
        }

        Map<String, String> serviceResult = courseService.addCourse(course, file);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "course";
        }

        return "redirect:/admin/course";
    }

    @GetMapping("/editCourse")
    public String editCoursePage(Model model)
    {
        model.addAttribute("url", "/admin/editCourse");
        model.addAttribute("categories", categoryService.getAllCategories());
        return "course";
    }

    @PostMapping("/editCourse")
    public String editCourse(
            @Valid Course course, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/admin/editCourse");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "course";
        }

        Map<String, String> serviceResult = courseService.editCourse(course, file);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "course";
        }

        return "redirect:/admin/course";
    }

    @GetMapping("/course/{course}")
    public String getCourseDetail(
            @PathVariable Course course, Model model
    ){
        model.addAttribute("url", "/admin/course/" + course.getId());
        return "courseDetailed";
    }


//    """"""""""""""""""""""""""""""""""""""""""""""" Course Parts """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping("/course/{course}/parts")
    public String getCoursePartPage(
            @PathVariable Course course, Model model
    ){
        model.addAttribute("url", "/admin/course/" + course.getId() + "/parts");
        model.addAttribute("courseParts", coursePartService.getCoursePartsByCourse(course));
        return "courseDetailed";
    }

    @GetMapping("/course/{course}/addPart")
    public String addCoursePartPage(
            @PathVariable Course course, Model model
    ){
        model.addAttribute("url", "/admin/course/" + course.getId() + "/addPart");
        return "courseDetailed";
    }

    @PostMapping("/course/{course}/addPart")
    public String addCoursePart(
            @Valid CoursePart coursePart,
            @PathVariable Course course, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/admin/course/" + course.getId() + "/addPart");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "courseDetailed";
        }

        Map<String, String> serviceResult = coursePartService.addCoursePart(course, coursePart);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "courseDetailed";
        }

        return "redirect:/admin/course/" + course.getId() + "/parts";
    }

    @GetMapping("/course/{course}/parts/{coursePart}")
    public String getCoursePartDetail(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("url", "/admin/course/" + course.getId() + "/parts/" + coursePart.getId());
        return "coursePartDetailed";
    }



//    """"""""""""""""""""""""""""""""""""""""""""""" Course Part quiz """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping("/course/{course}/parts/{coursePart}/quiz")
    public String getQuizPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("url", "/admin/course/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz");
        return "coursePartDetailed";
    }

    @GetMapping("/course/{course}/parts/{coursePart}/addQuiz")
    public String addQuizPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("url", "/admin/course/" + course.getId() + "/addPart/" + coursePart.getId() + "/addQuiz");
        return "coursePartDetailed";
    }

//    @PostMapping("/course/{course}/addPart")
//    public String addCoursePart(
//            @Valid CoursePart coursePart,
//            @PathVariable Course course, BindingResult bindingResult,
//            @AuthenticationPrincipal User user, Model model,
//            @RequestParam(defaultValue = "none") String alert
//    ) throws IOException {
//        if (user == null)
//            return "redirect:/";
//
//        model.addAttribute("url", "/admin/course/" + course.getId() + "/addPart");
//        model.addAttribute("alert", alert);
//
//        if (bindingResult.hasErrors()) {
//            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
//            model.mergeAttributes(bindErrors);
//            return "courseDetailed";
//        }
//
//        Map<String, String> serviceResult = coursePartService.addCoursePart(course, coursePart);
//
//        if (!serviceResult.isEmpty()) {
//            model.mergeAttributes(serviceResult);
//            return "courseDetailed";
//        }
//
//        return "redirect:/admin/course/" + course.getId() + "/parts";
//    }
//
//    @GetMapping("/course/{course}/parts/{coursePart}")
//    public String getCoursePartDetail(
//            @PathVariable Course course,
//            @PathVariable CoursePart coursePart,
//            Model model
//    ){
//        model.addAttribute("url", "/admin/course/" + course.getId() + "/parts/" + coursePart.getId());
//        return "coursePartDetailed";
//    }




//    """"""""""""""""""""""""""""""""""""""""""""""" Category """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping("/category")
    public String getCategoryPage(Model model)
    {
        model.addAttribute("url", "/admin/category");
        model.addAttribute("categories", categoryService.getAllCategories());
        return "course";
    }

    @GetMapping("/addCategory")
    public String addCategoryPage(Model model)
    {
        model.addAttribute("url", "/admin/addCategory");
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

        model.addAttribute("url", "/admin/addCategory");
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

        return "redirect:/admin/category";
    }
}
