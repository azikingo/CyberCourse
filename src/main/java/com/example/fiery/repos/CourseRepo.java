package com.example.fiery.repos;

import com.example.fiery.domain.Course;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CourseRepo extends CrudRepository<Course, Long> {

    @Query(value = "select * from course", nativeQuery = true)
    List<Course> getAllCourses();
}
