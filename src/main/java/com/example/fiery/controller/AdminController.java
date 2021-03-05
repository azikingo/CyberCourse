package com.example.fiery.controller;

import com.example.fiery.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@PreAuthorize("hasAuthority('admin')")
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @GetMapping
    public String adminPage(Model model)
    {
        return "greeting";
    }

    @GetMapping("/course")
    public String getCoursePage(Model model)
    {
        model.addAttribute("url", "/admin/course");
        return "course";
    }
}
