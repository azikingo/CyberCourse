package com.example.fiery.controller;

import com.example.fiery.domain.User;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String greeting(@AuthenticationPrincipal User user, Model model) {

        if (user != null && user.isAdmin())
            return "redirect:/admin";
        else if (user != null && user.isTeacher())
            return "redirect:/teacher";
        else if (user != null && user.isStudent())
            return "redirect:/student";
        else
            return "greeting";
    }

    @GetMapping("/course")
    public String getCourse(@AuthenticationPrincipal User user, Model model) {

        if (user != null && user.isAdmin())
            return "redirect:/admin/course";
        else if (user != null && user.isTeacher())
            return "redirect:/teacher/course";
        else if (user != null && user.isStudent())
            return "redirect:/student/course";
        else
            return "redirect:/";
    }
}
