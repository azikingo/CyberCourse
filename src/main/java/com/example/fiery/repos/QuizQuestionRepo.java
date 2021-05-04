package com.example.fiery.repos;

import com.example.fiery.domain.CoursePart;
import com.example.fiery.domain.Quiz;
import com.example.fiery.domain.QuizQuestion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuizQuestionRepo extends CrudRepository<QuizQuestion, Long> {

    @Query(value = "select * from quiz_question where quiz_id = ?1", nativeQuery = true)
    List<QuizQuestion> getQuestionsByQuiz(Quiz quiz);
}
