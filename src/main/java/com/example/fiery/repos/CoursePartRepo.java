package com.example.fiery.repos;

import com.example.fiery.domain.Course;
import com.example.fiery.domain.CoursePart;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CoursePartRepo extends CrudRepository<CoursePart, Long> {

    @Query(value = "select * from course_part", nativeQuery = true)
    List<CoursePart> getAllCourseParts();

    @Query(value = "select * from course_part\n" +
            "where course_id = ?1", nativeQuery = true)
    List<CoursePart> getCoursePartsByCourse(Course course);
}
