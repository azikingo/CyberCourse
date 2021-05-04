package com.example.fiery.repos;

import com.example.fiery.domain.QuizAnswer;
import com.example.fiery.domain.QuizQuestion;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface QuizAnswerRepo extends CrudRepository<QuizAnswer, Long> {

    @Query(value = "select * from quiz_answer where quiz_question_id = ?1", nativeQuery = true)
    List<QuizAnswer> getQuizAnswersByQuizQuestion(QuizQuestion quizQuestion);
}
