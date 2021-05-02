package com.example.fiery.service;

import com.example.fiery.domain.CoursePart;
import com.example.fiery.domain.Quiz;
import com.example.fiery.repos.QuizRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class QuizService {
    @Autowired
    QuizRepo quizRepo;

    public Map<String, String> addQuiz(CoursePart coursePart, Quiz quiz) {
        quiz.setTitleKz(quiz.getTitleKz().replaceAll("\"", "&#8220;"));
        quiz.setTitleRu(quiz.getTitleRu().replaceAll("\"", "&#8220;"));
        quiz.setTitleEn(quiz.getTitleEn().replaceAll("\"", "&#8220;"));
        quiz.setDescriptionKz(quiz.getDescriptionKz().replaceAll("\"", "&#8220;"));
        quiz.setDescriptionRu(quiz.getDescriptionRu().replaceAll("\"", "&#8220;"));
        quiz.setDescriptionEn(quiz.getDescriptionEn().replaceAll("\"", "&#8220;"));
        quiz.setCoursePart(coursePart);

        Map<String, String> result = new HashMap<>();
        try {
            quizRepo.save(quiz);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    public Map<String, String> editQuiz(Quiz quiz) {
        Quiz quizFromDb = quizRepo.findById(quiz.getId()).get();
        quizFromDb.setTitleKz(quiz.getTitleKz().replaceAll("\"", "&#8220;"));
        quizFromDb.setTitleRu(quiz.getTitleRu().replaceAll("\"", "&#8220;"));
        quizFromDb.setTitleEn(quiz.getTitleEn().replaceAll("\"", "&#8220;"));
        quizFromDb.setDescriptionKz(quiz.getDescriptionKz().replaceAll("\"", "&#8220;"));
        quizFromDb.setDescriptionRu(quiz.getDescriptionRu().replaceAll("\"", "&#8220;"));
        quizFromDb.setDescriptionEn(quiz.getDescriptionEn().replaceAll("\"", "&#8220;"));

        Map<String, String> result = new HashMap<>();
        try {
            quizRepo.save(quizFromDb);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    public Map<String, String> deleteQuiz(Long quizId) {
        Quiz quiz = quizRepo.findById(quizId).get();
        quiz.setActive(false);

        Map<String, String> result = new HashMap<>();
        try {
            quizRepo.save(quiz);
        } catch (Exception e) {
            result.put("message", "Сақталмады! Жүйеде қателік шықты.");
            return result;
        }

        return result;
    }

    public Quiz getQuizByCoursePart(CoursePart coursePart) {
        return quizRepo.getQuizByCoursePart(coursePart);
    }
}
