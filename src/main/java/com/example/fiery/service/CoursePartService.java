package com.example.fiery.service;

import com.example.fiery.domain.Course;
import com.example.fiery.domain.CoursePart;
import com.example.fiery.repos.CoursePartRepo;
import com.example.fiery.repos.CourseRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class CoursePartService {
    @Autowired
    CoursePartRepo coursePartRepo;

    public Map<String, String> addCoursePart(Course course, CoursePart coursePart) throws IOException {
        coursePart.setTimestamp(LocalDateTime.now());
        coursePart.setTitleKz(coursePart.getTitleKz().replaceAll("\"", "&#8220;"));
        coursePart.setTitleRu(coursePart.getTitleRu().replaceAll("\"", "&#8220;"));
        coursePart.setTitleEn(coursePart.getTitleEn().replaceAll("\"", "&#8220;"));
        coursePart.setDescriptionKz(coursePart.getDescriptionKz().replaceAll("\"", "&#8220;"));
        coursePart.setDescriptionRu(coursePart.getDescriptionRu().replaceAll("\"", "&#8220;"));
        coursePart.setDescriptionEn(coursePart.getDescriptionEn().replaceAll("\"", "&#8220;"));
        coursePart.setCourse(course);

        Map<String, String> result = new HashMap<>();
        try {
            coursePartRepo.save(coursePart);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    public List<CoursePart> getAllCourseParts() {
        return coursePartRepo.getAllCourseParts();
    }

    public List<CoursePart> getCoursePartsByCourse(Course course) {
        return coursePartRepo.getCoursePartsByCourse(course);
    }
}
