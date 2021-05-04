package com.example.fiery.controller;

import com.example.fiery.domain.*;
import com.example.fiery.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('teacher')")
@RequestMapping("/my-courses")
public class CourseController {
    @Autowired
    AdminService adminService;

    @Autowired
    CourseService courseService;

    @Autowired
    CoursePartService coursePartService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    QuizService quizService;

    @Autowired
    QuizQuestionService quizQuestionService;

    @Autowired
    QuizAnswerService quizAnswerService;

    @Value("${upload.path}")
    private String uploadPath;


//    """"""""""""""""""""""""""""""""""""""""""""""" Courses """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping()
    public String getCoursePage(@AuthenticationPrincipal User user, Model model)
    {
        model.addAttribute("url", "/my-courses");
        model.addAttribute("uploadPath", uploadPath);
        model.addAttribute("courses", courseService.getAllActiveCoursesForTeacher(user));
        return "course";
    }

    @GetMapping("/add")
    public String addCoursePage(Model model)
    {
        model.addAttribute("url", "/my-courses/add");
        model.addAttribute("categories", categoryService.getAllCategories());
        return "course";
    }

    @PostMapping("/add")
    public String addCourse(
            @Valid Course course, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/add");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "course";
        }

        Map<String, String> serviceResult = courseService.addCourse(course, file);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "course";
        }

        return "redirect:/my-courses";
    }

    @GetMapping("/{course}")
    public String getCourseDetail(
            @PathVariable Course course, Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId());
        return "course";
    }

    @GetMapping("/{course}/edit")
    public String editCoursePage(@PathVariable Course course, Model model)
    {
        model.addAttribute("url", "/my-courses/" + course.getId() + "/edit");
        model.addAttribute("course", course);
        model.addAttribute("categories", categoryService.getAllCategories());
        return "course";
    }

    @PostMapping("/{course}/edit")
    public String editCourse(
            @Valid Course course, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/edit");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "course";
        }

        Map<String, String> serviceResult = courseService.editCourse(course, file);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "course";
        }

        return "redirect:/my-courses/" + course.getId();
    }

    @PostMapping("/{course}/del")
    public String deleteCourse(
            @RequestParam Long courseId,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + courseId + "/del");
        model.addAttribute("alert", alert);

        Map<String, String> serviceResult = courseService.deleteCourse(courseId);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "course";
        }

        return "redirect:/my-courses";
    }





//    """"""""""""""""""""""""""""""""""""""""""""""" Course Part quiz """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping("/{course}/parts/{coursePart}/quiz")
    public String getQuizPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("quiz", quizService.getQuizByCoursePart(coursePart));
        model.addAttribute("quizQuestions", quizQuestionService.getQuestionsByQuiz(quizService.getQuizByCoursePart(coursePart)));
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz");
        return "coursePartDetailed";
    }

    @GetMapping("/{course}/parts/{coursePart}/quiz/add")
    public String addQuizPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/addQuiz");
        return "coursePartDetailed";
    }

    @PostMapping("/{course}/parts/{coursePart}/quiz/add")
    public String addQuiz(
            @Valid Quiz quiz,
            @PathVariable Course course,
            @PathVariable CoursePart coursePart, BindingResult bindingResult,
            @AuthenticationPrincipal User user, Model model,
            @RequestParam(defaultValue = "none") String alert
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/add");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "coursePartDetailed";
        }

        Map<String, String> serviceResult = quizService.addQuiz(coursePart, quiz);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "coursePartDetailed";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
    }

    @GetMapping("/{course}/parts/{coursePart}/quiz/edit")
    public String editQuizPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            Model model
    ){
        model.addAttribute("quiz", quizService.getQuizByCoursePart(coursePart));
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/edit");
        return "coursePartDetailed";
    }

    @PostMapping("/{course}/parts/{coursePart}/quiz/edit")
    public String editQuiz(
            @Valid Quiz quiz,
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @AuthenticationPrincipal User user,
            @RequestParam(defaultValue = "none") String alert, Model model, BindingResult bindingResult
    ) throws IOException{
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/edit");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "coursePartDetailed";
        }

        Map<String, String> serviceResult = quizService.editQuiz(quiz);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "coursePartDetailed";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
    }

    @PostMapping("/{course}/parts/{coursePart}/quiz/del")
    public String deleteQuiz(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @RequestParam Long quizId,
            @AuthenticationPrincipal User user,
            @RequestParam(defaultValue = "none") String alert, Model model
    ) throws IOException{
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/del");
        model.addAttribute("alert", alert);

        Map<String, String> serviceResult = quizService.deleteQuiz(quizId);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "coursePartDetailed";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
    }



//    """"""""""""""""""""""""""""""""""""""""""""""" Quiz questions """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping("/{course}/parts/{coursePart}/quiz/{quiz}/addQuestion")
    public String addQuizQuestionPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @PathVariable Quiz quiz,
            Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quiz.getId() + "/addQuestion");
        return "question";
    }

    @PostMapping("/{course}/parts/{coursePart}/quiz/{quiz}/addQuestion")
    public String addQuizQuestion(
            @Valid QuizQuestion quizQuestion,
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @PathVariable Quiz quiz,
            @AuthenticationPrincipal User user, Model model, BindingResult bindingResult,
            @RequestParam(defaultValue = "none") String alert
    ) throws IOException {
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quiz.getId() + "/addQuestion");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "question";
        }

        Map<String, String> serviceResult = quizQuestionService.addQuizQuestion(quiz, quizQuestion);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "question";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
    }

    @GetMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}/edit")
    public String editQuizQuestionPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @PathVariable QuizQuestion quizQuestion,
            Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId() + "/edit");
        return "question";
    }

    @PostMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}/edit")
    public String editQuizQuestion(
            @Valid QuizQuestion quizQuestion,
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @AuthenticationPrincipal User user,
            @RequestParam(defaultValue = "none") String alert, Model model, BindingResult bindingResult
    ) throws IOException{
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId() + "/edit");
        model.addAttribute("alert", alert);

        if (bindingResult.hasErrors()) {
            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(bindErrors);
            return "question";
        }

        Map<String, String> serviceResult = quizQuestionService.editQuizQuestion(quizQuestion);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "question";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
    }

    @PostMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}/del")
    public String deleteQuizQuestion(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @PathVariable QuizQuestion quizQuestion,
            @AuthenticationPrincipal User user,
            @RequestParam(defaultValue = "none") String alert, Model model
    ) throws IOException{
        if (user == null)
            return "redirect:/";

        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId() + "/del");
        model.addAttribute("alert", alert);

        Map<String, String> serviceResult = quizQuestionService.deleteQuizQuestion(quizQuestion);

        if (!serviceResult.isEmpty()) {
            model.mergeAttributes(serviceResult);
            return "question";
        }

        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
    }



//    """"""""""""""""""""""""""""""""""""""""""""""" Question answers """""""""""""""""""""""""""""""""""""""""""""""
    @GetMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}")
    public String getQuizAnswerPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @PathVariable QuizQuestion quizQuestion,
            Model model
    ){
        model.addAttribute("quizAnswers", quizAnswerService.getQuizAnswersByQuizQuestion(quizQuestion));
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId());
        return "question";
    }

    @GetMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}/addAnswer")
    public String addQuizAnswerPage(
            @PathVariable Course course,
            @PathVariable CoursePart coursePart,
            @PathVariable QuizQuestion quizQuestion,
            Model model
    ){
        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId() + "/add");
        return "question";
    }

//    @PostMapping("/{course}/parts/{coursePart}/quiz/{quiz}/addQuestion")
//    public String addQuizQuestion(
//            @Valid QuizQuestion quizQuestion,
//            @PathVariable Course course,
//            @PathVariable CoursePart coursePart,
//            @PathVariable Quiz quiz,
//            @AuthenticationPrincipal User user, Model model, BindingResult bindingResult,
//            @RequestParam(defaultValue = "none") String alert
//    ) throws IOException {
//        if (user == null)
//            return "redirect:/";
//
//        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quiz.getId() + "/addQuestion");
//        model.addAttribute("alert", alert);
//
//        if (bindingResult.hasErrors()) {
//            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
//            model.mergeAttributes(bindErrors);
//            return "question";
//        }
//
//        Map<String, String> serviceResult = quizQuestionService.addQuizQuestion(quiz, quizQuestion);
//
//        if (!serviceResult.isEmpty()) {
//            model.mergeAttributes(serviceResult);
//            return "question";
//        }
//
//        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
//    }
//
//    @GetMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}/edit")
//    public String editQuizQuestionPage(
//            @PathVariable Course course,
//            @PathVariable CoursePart coursePart,
//            @PathVariable QuizQuestion quizQuestion,
//            Model model
//    ){
//        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId() + "/edit");
//        return "question";
//    }
//
//    @PostMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}/edit")
//    public String editQuizQuestion(
//            @Valid QuizQuestion quizQuestion,
//            @PathVariable Course course,
//            @PathVariable CoursePart coursePart,
//            @AuthenticationPrincipal User user,
//            @RequestParam(defaultValue = "none") String alert, Model model, BindingResult bindingResult
//    ) throws IOException{
//        if (user == null)
//            return "redirect:/";
//
//        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId() + "/edit");
//        model.addAttribute("alert", alert);
//
//        if (bindingResult.hasErrors()) {
//            Map<String, String> bindErrors = ControllerUtils.getErrors(bindingResult);
//            model.mergeAttributes(bindErrors);
//            return "question";
//        }
//
//        Map<String, String> serviceResult = quizQuestionService.editQuizQuestion(quizQuestion);
//
//        if (!serviceResult.isEmpty()) {
//            model.mergeAttributes(serviceResult);
//            return "question";
//        }
//
//        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
//    }
//
//    @PostMapping("/{course}/parts/{coursePart}/quiz/{quizQuestion}/del")
//    public String deleteQuizQuestion(
//            @PathVariable Course course,
//            @PathVariable CoursePart coursePart,
//            @PathVariable QuizQuestion quizQuestion,
//            @AuthenticationPrincipal User user,
//            @RequestParam(defaultValue = "none") String alert, Model model
//    ) throws IOException{
//        if (user == null)
//            return "redirect:/";
//
//        model.addAttribute("url", "/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz/" + quizQuestion.getId() + "/del");
//        model.addAttribute("alert", alert);
//
//        Map<String, String> serviceResult = quizQuestionService.deleteQuizQuestion(quizQuestion);
//
//        if (!serviceResult.isEmpty()) {
//            model.mergeAttributes(serviceResult);
//            return "question";
//        }
//
//        return "redirect:/my-courses/" + course.getId() + "/parts/" + coursePart.getId() + "/quiz";
//    }

}
