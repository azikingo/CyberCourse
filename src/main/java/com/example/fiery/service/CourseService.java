package com.example.fiery.service;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.User;
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
public class CourseService {
    @Autowired
    CourseRepo courseRepo;

    @Value("${upload.path}")
    private String uploadPath;

    public List<Course> getAllActiveCoursesForTeacher(User user) {
        return courseRepo.getAllActiveCoursesForTeacher(user);
    }

    public List<Course> getAllActiveCourses(String filter, Category category) {
        if(filter == null && category == null)
            return courseRepo.getAllActiveCourses();
        else if(category == null)
            return courseRepo.getAllActiveCoursesByFilter(filter);
        else
            return courseRepo.getAllActiveCoursesByFilterAndCategory(filter, category);
    }

    public Map<String, String> addCourse(Course course, MultipartFile file) throws IOException {
        course.setTimestamp(LocalDateTime.now());
        course.setTitleKz(course.getTitleKz().replaceAll("\"", "&#8220;"));
        course.setTitleRu(course.getTitleRu().replaceAll("\"", "&#8220;"));
        course.setTitleEn(course.getTitleEn().replaceAll("\"", "&#8220;"));
        course.setDescriptionKz(course.getDescriptionKz().replaceAll("\"", "&#8220;"));
        course.setDescriptionRu(course.getDescriptionRu().replaceAll("\"", "&#8220;"));
        course.setDescriptionEn(course.getDescriptionEn().replaceAll("\"", "&#8220;"));
        saveFile(course, file);

        Map<String, String> result = new HashMap<>();
        try {
            courseRepo.save(course);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    public Map<String, String> editCourse(Course course, MultipartFile file) throws IOException {
        saveFile(course, file);

        Map<String, String> result = new HashMap<>();
        try {
            courseRepo.save(course);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    public Map<String, String> deleteCourse(Long courseId) {
        Course courseFromDb = courseRepo.findById(courseId).get();
        courseFromDb.setActive(false);

        Map<String, String> result = new HashMap<>();
        try {
            courseRepo.save(courseFromDb);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    //Method to save files(photo)
    private void saveFile(Course course, MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();
            file.transferTo(new File(uploadPath + "/" + resultFilename));
            course.setPhotoPath(resultFilename);
        }
    }
}
