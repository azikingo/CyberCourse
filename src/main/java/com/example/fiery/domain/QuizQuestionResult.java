package com.example.fiery.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class QuizQuestionResult {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer score;

    private Integer maxScore;

    @ManyToOne(fetch = FetchType.EAGER)
    private QuizResult quizResult;

    @ManyToOne(fetch = FetchType.EAGER)
    private QuizQuestion quizQuestion;

    @ManyToOne(fetch = FetchType.EAGER)
    private QuizAnswer quizAnswer;

    public QuizQuestionResult() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(Integer maxScore) {
        this.maxScore = maxScore;
    }

    public QuizResult getQuizResult() {
        return quizResult;
    }

    public void setQuizResult(QuizResult quizResult) {
        this.quizResult = quizResult;
    }

    public QuizQuestion getQuizQuestion() {
        return quizQuestion;
    }

    public void setQuizQuestion(QuizQuestion quizQuestion) {
        this.quizQuestion = quizQuestion;
    }

    public QuizAnswer getQuizAnswer() {
        return quizAnswer;
    }

    public void setQuizAnswer(QuizAnswer quizAnswer) {
        this.quizAnswer = quizAnswer;
    }
}
