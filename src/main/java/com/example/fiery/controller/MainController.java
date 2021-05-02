package com.example.fiery.controller;

import com.example.fiery.domain.User;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;

@Controller
public class MainController {

    @Value("${upload.path}")
    private String uploadPath;

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
