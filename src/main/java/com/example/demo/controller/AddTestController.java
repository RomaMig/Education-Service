package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.AnswerService;
import com.example.demo.service.LessonService;
import com.example.demo.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AddTestController {
    @Autowired
    private LessonService lessonService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    private String headerText = "Тест";
    private Lesson currentLesson;
    private long currentIdQuestion = 0L;

    @RequestMapping(value = {"/add_test"}, method = RequestMethod.GET)
    public String addTest(@RequestParam(required = true, defaultValue = "") String questionId,
                          @RequestParam(required = true, defaultValue = "") String action,
                          Model model) {
        switch (action) {
            case "change":
                currentIdQuestion = Long.parseLong(questionId);
                Question question = questionService.getQuestionById(currentIdQuestion);
                if (question == null)
                    break;
                List<Answer> answerTextList = answerService.getAnswerByQuestionId(currentIdQuestion);
                model.addAttribute("questionText", question.getQuestion());
                model.addAttribute("answerTextList", answerTextList);
                break;
            case "delete":
                Long id = Long.parseLong(questionId);
                question = questionService.getQuestionById(id);
                if (question == null)
                    break;
                answerService.deleteAnswerByQuestionId(id);
                questionService.delete(id);
                break;
        }
        if (currentLesson == null) {
            currentLesson = lessonService.getLessonById(lessonService.getAll().get(0).getId());
            headerText = currentLesson.getName();
        }
        try {
            createQuestionList(model);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        List<Lesson> lessonList = lessonService.getAll();
        model.addAttribute("lessonCount", lessonList.size());
        model.addAttribute("lessonList", lessonList);
        model.addAttribute("lessonName", headerText);

        return "add_test";
    }

    @RequestMapping(value = {"/add_test/{id}"}, method = RequestMethod.GET)
    public String loadTest(@PathVariable int id, Model model) {
        if (id == 0) {
            if (currentLesson != null)
                return "redirect:/add_test";
            id = lessonService.getAll().get(0).getId();
        }
        currentLesson = lessonService.getLessonById(id);
        headerText = currentLesson.getName();
        return "redirect:/add_test";
    }

    @PostMapping("/add_test")
    public String addQuestion(@RequestParam(required = true, defaultValue = "") String questionText,
                              @RequestParam(required = true, defaultValue = "") String answerCheck1,
                              @RequestParam(required = true, defaultValue = "") String answerText1,
                              @RequestParam(required = true, defaultValue = "") String answerCheck2,
                              @RequestParam(required = true, defaultValue = "") String answerText2,
                              @RequestParam(required = true, defaultValue = "") String answerCheck3,
                              @RequestParam(required = true, defaultValue = "") String answerText3,
                              @RequestParam(required = true, defaultValue = "") String answerCheck4,
                              @RequestParam(required = true, defaultValue = "") String answerText4,
                              @RequestParam(required = true, defaultValue = "") String answerCheck5,
                              @RequestParam(required = true, defaultValue = "") String answerText5,
                              @RequestParam(required = true, defaultValue = "") String action,
                              Model model) {
        String[] answers = {answerText1, answerText2, answerText3, answerText4, answerText5};
        String[] checks = {answerCheck1, answerCheck2, answerCheck3, answerCheck4, answerCheck5};
        switch (action) {
            case "save":
                Question question = new Question();
                question.setQuestion(questionText);
                question.setIdlesson(currentLesson.getId());
                questionService.save(question);
                long questionId = question.getId();
                for (int i = 0; i < 5; i++) {
                    if (answers[i].equals("")) continue;
                    Answer answer = new Answer();
                    answer.setAnswer(answers[i]);
                    answer.setTruth(checks[i].equals("on"));
                    answer.setIdquestion(questionId);
                    answerService.save(answer);
                }
                if (currentIdQuestion != 0L) {
                    answerService.deleteAnswerByQuestionId(currentIdQuestion);
                    questionService.delete(currentIdQuestion);
                    currentIdQuestion = 0L;
                }
                break;
        }
        return "redirect:/add_test";
    }

    private void createQuestionList(Model model) throws Exception {
        List<Question> questionList = questionService.getQuestionByLessonId(currentLesson.getId());
        if (questionList == null || questionList.size() == 0)
            return;

        model.addAttribute("questionCount", questionList.size());
        model.addAttribute("questionList", questionList);
        List<Answer> answerList = new LinkedList<>();
        List<Integer> answerCount = new LinkedList<>();
        List<Integer> answerOffset = new LinkedList<>();
        answerOffset.add(0);
        for (Question question : questionList) {
            List<Answer> ans = answerService.getAnswerByQuestionId(question.getId());
            answerOffset.add(ans.size() + answerOffset.get(answerOffset.size() - 1));
            answerCount.add(ans.size());
            answerList.addAll(ans);
        }
        model.addAttribute("answerList", answerList);
        model.addAttribute("answerCount", answerCount);
        model.addAttribute("answerOffset", answerOffset);
    }
}
