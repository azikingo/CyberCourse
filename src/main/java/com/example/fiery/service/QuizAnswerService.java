package com.example.fiery.service;

import com.example.fiery.domain.QuizQuestion;
import com.example.fiery.repos.QuizAnswerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuizAnswerService {
    @Autowired
    QuizAnswerRepo quizAnswerRepo;

    public Object getQuizAnswersByQuizQuestion(QuizQuestion quizQuestion) {
        return quizAnswerRepo.getQuizAnswersByQuizQuestion(quizQuestion);
    }

//    public Map<String, String> addQuizQuestion(Quiz quiz, QuizQuestion quizQuestion) {
//        quizQuestion.setTextKz(quizQuestion.getTextKz().replaceAll("\"", "&#8220;"));
//        quizQuestion.setTextRu(quizQuestion.getTextRu().replaceAll("\"", "&#8220;"));
//        quizQuestion.setTextEn(quizQuestion.getTextEn().replaceAll("\"", "&#8220;"));
//        quizQuestion.setQuiz(quiz);
//
//        Map<String, String> result = new HashMap<>();
//        try {
//            quizQuestionRepo.save(quizQuestion);
//        } catch (Exception e) {
//            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
//            return result;
//        }
//
//        return result;
//    }
//
//    public Map<String, String> editQuizQuestion(QuizQuestion quizQuestion) {
//
//        Map<String, String> result = new HashMap<>();
//        try {
//            quizQuestionRepo.save(quizQuestion);
//        } catch (Exception e) {
//            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
//            return result;
//        }
//
//        return result;
//    }
//
//    public Map<String, String> deleteQuizQuestion(QuizQuestion quizQuestion) {
//
//        Map<String, String> result = new HashMap<>();
//        try {
//            quizQuestionRepo.delete(quizQuestion);
//        } catch (Exception e) {
//            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
//            return result;
//        }
//
//        return result;
//    }
//
//    public Object getQuestionsByQuiz(Quiz quiz) {
//        if(quiz == null)
//            return null;
//        return quizQuestionRepo.getQuestionsByQuiz(quiz);
//    }
}
