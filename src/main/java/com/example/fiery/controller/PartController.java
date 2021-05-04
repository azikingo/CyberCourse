package com.example.fiery.controller;

import com.example.fiery.domain.Course;
import com.example.fiery.domain.CoursePart;
import com.example.fiery.domain.User;
import com.example.fiery.repos.CourseRepo;
import com.example.fiery.service.CoursePartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('teacher')")
@RequestMapping("/my-courses/{course}/parts")
public class PartController {
    @Autowired
    CoursePartService coursePartService;

//    """"""""""""""""""""""""""""""""""""""""""""""" Course Parts """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping()
    public String getCoursePartPage(
            @PathVariable Course course, Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts");
        model.addAttribute("courseParts", coursePartService.getActiveCoursePartsByCourse(course.getId()));
        return "part";
    }

    @GetMapping("/add")
    public String addCoursePartPage(
            @PathVariable Course course, Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/add");
        return "part";
    }

    @PostMapping("/add")
    public String addCoursePart(
            @Valid CoursePart coursePart,
            @PathVariable Course course,
            @AuthenticationPrincipal User user, Model model, BindingResult bindingResult,
            @RequestParam(defaultValue = "none") String alert
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/add");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "part";
        }

        Map<String, String> serviceResult = coursePartService.addCoursePart(course, coursePart);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "part";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts";
    }

    @GetMapping("/{coursePart}")
    public String getCoursePartDetail(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId());
        return "part";
    }

    @GetMapping("{coursePart}/edit")
    public String editCoursePartPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/edit");
        return "part";
    }

    @PostMapping("{coursePart}/edit")
    public String editCoursePart(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @Valid CoursePart editCoursePart, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/edit");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "part";
        }

        editCoursePart.setId(coursePart.getId());
        Map<String, String> serviceResult = coursePartService.editCoursePart(editCoursePart);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "part";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId();
    }

    @PostMapping("{coursePart}/del")
    public String deleteCoursePart(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/del");
        model.addAttribute("alert", alert);

        Map<String, String> serviceResult = coursePartService.deleteCoursePart(coursePart);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "part";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts";
    }

}
