package com.example.fiery.repos;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CourseRepo extends CrudRepository<Course, Long> {

    @Query(value = "select * from course where active = true", nativeQuery = true)
    List<Course> getAllActiveCourses();

    @Query(value = "select * from course " +
            "           where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))", nativeQuery = true)
    List<Course> getAllActiveCoursesByFilter(String filter);

    @Query(value = "select * from course c" +
            "          join course_category cc on (c.id = cc.course_id and cc.category_id = ?2)" +
            "          where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))" +
            "       ", nativeQuery = true)
    List<Course> getAllActiveCoursesByFilterAndCategory(String filter, Category category);

    @Query(value = "select * from course where active = true and teacher_id = ?1", nativeQuery = true)
    List<Course> getAllActiveCoursesForTeacher(User user);
}
