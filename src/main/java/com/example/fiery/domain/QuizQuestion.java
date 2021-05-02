package com.example.fiery.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Min;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class QuizQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Length(max = 225)
    private String textKz;
    @Length(max = 225)
    private String textRu;
    @Length(max = 225)
    private String textEn;

    private Integer maxScore;

    @ManyToOne(fetch = FetchType.EAGER)
    private Quiz quiz;

    @OneToMany(mappedBy = "quizQuestion", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @OrderBy("id")
    private List<QuizAnswer> quizAnswers = new ArrayList<>();

    public QuizQuestion() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTextKz() {
        return textKz;
    }

    public void setTextKz(String textKz) {
        this.textKz = textKz;
    }

    public String getTextRu() {
        return textRu;
    }

    public void setTextRu(String textRu) {
        this.textRu = textRu;
    }

    public String getTextEn() {
        return textEn;
    }

    public void setTextEn(String textEn) {
        this.textEn = textEn;
    }

    public Integer getMaxScore() {
        return maxScore;
    }

    public void setMaxScore(Integer maxScore) {
        this.maxScore = maxScore;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    public List<QuizAnswer> getQuizAnswers() {
        return quizAnswers;
    }

    public void setQuizAnswers(List<QuizAnswer> quizAnswers) {
        this.quizAnswers = quizAnswers;
    }
}
