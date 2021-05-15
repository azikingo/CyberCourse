package com.example.fiery.repos;

import com.example.fiery.domain.Category;
import com.example.fiery.domain.Course;
import com.example.fiery.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CourseRepo extends CrudRepository<Course, Long> {

    @Query(value = "select * from course where active = true",
            countQuery = "select count(*) from course where active = true", nativeQuery = true)
    Page<Course> getAllActiveCourses(Pageable pageable);

    @Query(value = "select * from course " +
            "           where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))",
            countQuery = "select count(*) from course \" +\n" +
                    "            \"           where active = true\" +\n" +
                    "            \"       and (lower(title_kz) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(title_ru) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(title_en) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(description_kz) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(description_ru) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(description_en) like lower(concat('%', ?1, '%')))", nativeQuery = true)
    Page<Course> getAllActiveCoursesByFilter(String filter, Pageable pageable);

    @Query(value = "select * from course c" +
            "          join course_category cc on (c.id = cc.course_id and cc.category_id = ?2)" +
            "          where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))",
            countQuery = "select count(*) from course c\" +\n" +
                    "            \"          join course_category cc on (c.id = cc.course_id and cc.category_id = ?2)\" +\n" +
                    "            \"          where active = true\" +\n" +
                    "            \"       and (lower(title_kz) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(title_ru) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(title_en) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(description_kz) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(description_ru) like lower(concat('%', ?1, '%'))\" +\n" +
                    "            \"               or lower(description_en) like lower(concat('%', ?1, '%')))", nativeQuery = true)
    Page<Course> getAllActiveCoursesByFilterAndCategory(String filter, Category category, Pageable pageable);

    @Query(value = "select * from course where active = true", nativeQuery = true)
    List<Course> getListAllActiveCourses();

    @Query(value = "select * from course " +
            "           where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))", nativeQuery = true)
    List<Course> getListAllActiveCoursesByFilter(String filter);

    @Query(value = "select * from course c" +
            "          join course_category cc on (c.id = cc.course_id and cc.category_id = ?2)" +
            "          where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))", nativeQuery = true)
    List<Course> getListAllActiveCoursesByFilterAndCategory(String filter, Category category);

    @Query(value = "select * from course c" +
            "          join course_result cr on (c.id = cr.course_id and cr.student_id = ?2)" +
            "          where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))",
            countQuery = "select count(*) from course c" +
            "          join course_result cr on (c.id = cr.course_id and cr.student_id = ?2)" +
            "          where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))", nativeQuery = true)
    Page<Course> getAllActiveCoursesForStudent(String filter, User user, Pageable pageable);

    @Query(value = "select * from course c" +
            "          join course_category cc on (c.id = cc.course_id and cc.category_id = ?2)" +
            "          join course_result cr on (c.id = cr.course_id and cr.student_id = ?3)" +
            "          where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))",
            countQuery = "select * from course c" +
            "          join course_category cc on (c.id = cc.course_id and cc.category_id = ?2)" +
            "          join course_result cr on (c.id = cr.course_id and cr.student_id = ?3)" +
            "          where active = true" +
            "       and (lower(title_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?1, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?1, '%')))", nativeQuery = true)
    Page<Course> getAllActiveCoursesForStudentByFilterAndCategory(String filter, Category category, User user, Pageable pageable);

    @Query(value = "select * from course where active = true and teacher_id = ?1" +
            "       and (lower(title_kz) like lower(concat('%', ?2, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?2, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?2, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?2, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?2, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?2, '%')))",
            countQuery = "select count(*) from course where active = true and teacher_id = ?1" +
                    "       and (lower(title_kz) like lower(concat('%', ?2, '%'))" +
                    "               or lower(title_ru) like lower(concat('%', ?2, '%'))" +
                    "               or lower(title_en) like lower(concat('%', ?2, '%'))" +
                    "               or lower(description_kz) like lower(concat('%', ?2, '%'))" +
                    "               or lower(description_ru) like lower(concat('%', ?2, '%'))" +
                    "               or lower(description_en) like lower(concat('%', ?2, '%')))", nativeQuery = true)
    Page<Course> getAllActiveCoursesForTeacher(User user, String filter, Pageable pageable);

    @Query(value = "select * from course c " +
            "           join course_category cc on (c.id = cc.course_id and cc.category_id = ?3)" +
            "       where active = true and teacher_id = ?1" +
            "       and (lower(title_kz) like lower(concat('%', ?2, '%'))" +
            "               or lower(title_ru) like lower(concat('%', ?2, '%'))" +
            "               or lower(title_en) like lower(concat('%', ?2, '%'))" +
            "               or lower(description_kz) like lower(concat('%', ?2, '%'))" +
            "               or lower(description_ru) like lower(concat('%', ?2, '%'))" +
            "               or lower(description_en) like lower(concat('%', ?2, '%')))",
            countQuery = "select count(*) from course c" +
                    "           join course_category cc on (c.id = cc.course_id and cc.category_id = ?3)" +
                    "       where active = true and teacher_id = ?1" +
                    "       and (lower(title_kz) like lower(concat('%', ?2, '%'))" +
                    "               or lower(title_ru) like lower(concat('%', ?2, '%'))" +
                    "               or lower(title_en) like lower(concat('%', ?2, '%'))" +
                    "               or lower(description_kz) like lower(concat('%', ?2, '%'))" +
                    "               or lower(description_ru) like lower(concat('%', ?2, '%'))" +
                    "               or lower(description_en) like lower(concat('%', ?2, '%')))", nativeQuery = true)
    Page<Course> getAllActiveCoursesForTeacherByFilterAndCategory(User user, String filter, Category category, Pageable pageable);
}
