package com.example.fiery.repos;

import com.example.fiery.domain.CoursePart;
import com.example.fiery.domain.Quiz;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface QuizRepo extends CrudRepository<Quiz, Long> {

    @Query(value = "select * from quiz where course_part_id = ?1 and active = true", nativeQuery = true)
    Quiz getQuizByCoursePart(CoursePart coursePart);
}
