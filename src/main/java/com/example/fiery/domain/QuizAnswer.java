package com.example.fiery.domain;

import org.hibernate.validator.constraints.Length;

import javax.persistence.*;

@Entity
public class QuizAnswer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Length(max = 225)
    private String textKz;
    @Length(max = 225)
    private String textRu;
    @Length(max = 225)
    private String textEn;

    private boolean correctAnswer;

    @ManyToOne(fetch = FetchType.EAGER)
    private QuizQuestion quizQuestion;

    public QuizAnswer() {
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

    public boolean isCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(boolean correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public QuizQuestion getQuizQuestion() {
        return quizQuestion;
    }

    public void setQuizQuestion(QuizQuestion quizQuestion) {
        this.quizQuestion = quizQuestion;
    }
}
