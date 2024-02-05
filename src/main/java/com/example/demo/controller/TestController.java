package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

@Controller
public class TestController {
    @Autowired
    private LessonService lessonService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private AnswerStatisticService answerStatisticService;
    private Lesson currentLesson;
    private List<Question> poolQuestions;
    private Question currentQuestion;
    private List<Answer> answerList;
    private boolean testStart;
    private boolean testEnd;
    private boolean multiAnswer;
    private Boolean request;

    @RequestMapping(value = {"/test"}, method = RequestMethod.GET)
    public String setTest(Model model) {
        createSidebar(model);
        model.addAttribute("testName", currentLesson == null ? "Аттестация" : "Тест - " + currentLesson.getName());
        model.addAttribute("lessonName", currentLesson.getName());
        model.addAttribute("testStart", testStart);
        model.addAttribute("testEnd", testEnd);
        if (currentQuestion != null) {
            model.addAttribute("question", currentQuestion);
            model.addAttribute("answerCount", answerList.size());
            model.addAttribute("answerList", answerList);
            model.addAttribute("multiAnswer", multiAnswer);
            if (request != null)
                model.addAttribute("request", request);
            request = null;
        }
        return "test";
    }

    @RequestMapping("/test/{id}")
    public String chooseTest(@PathVariable int id, Authentication authentication, Model model) {
        testStart = false;
        testEnd = false;
        User user = ((User)authentication.getPrincipal());
        currentLesson = lessonService.getLessonById(id);
        if (currentLesson != null) {
            poolQuestions = questionService.getQuestionByLessonId(currentLesson.getId())
                    .stream()
                    .filter(question ->
                    {
                        List<Answer> answers = answerStatisticService.getUserAnswers(user).stream()
                                .map(answerStatistic -> answerService.getAnswerById(answerStatistic.getIdanswer()))
                                .collect(Collectors.toList());
                        return answers.stream().noneMatch(answer ->
                                {
                                    boolean res = true;
                                    for (Answer a : answerService.getAnswerByQuestionId(answer.getIdquestion())) {
                                        res &= !a.isTruth() || answers.contains(a);
                                    }
                                    return res && question.getId().equals(answer.getIdquestion());
                                });
                    }).collect(Collectors.toList());
        }
        return "redirect:/test";
    }

    @RequestMapping("/test/next")
    public String nextTest(Model model) {
        if (!testStart) {
            testStart = true;
        }

        if (poolQuestions.size() <= 0) {
            testEnd = true;
            currentQuestion = null;
            answerList = null;
        } else {
            currentQuestion = poolQuestions.remove((new Random()).nextInt(poolQuestions.size()));
            answerList = answerService.getAnswerByQuestionId(currentQuestion.getId());
            int count = 0;
            for (Answer ans : answerList) {
                count += ans.isTruth() ? 1 : 0;
            }
            multiAnswer = count > 1;
        }
        return "redirect:/test";
    }

    @RequestMapping("/test/send")
    public String sendAnswer(@RequestParam(required = true, defaultValue = "") String radio,
                             @RequestParam(required = true, defaultValue = "") String check,
                             Authentication authentication, Model model) {
        if (testStart) {
            User user = ((User)authentication.getPrincipal());
            boolean res = true;
            String ans = radio + check;
            for (int i = 0; i < answerList.size(); i++) {
                boolean tmp = ans.contains((i + 1) + "");
                Answer answer = answerList.get(i);
                res &= answer.isTruth() ^ !tmp;
                if (tmp) answerStatisticService.save(answer.getId(), user.getId());
            }
            request = res;
        }
        return "redirect:/test";
    }

    private void createSidebar(Model model) {
        List<Lesson> lessonList = lessonService.getAll();
        model.addAttribute("lessonCount", lessonList.size());
        model.addAttribute("lessonList", lessonList);
        List<Article> articleList = new LinkedList<>();
        List<Integer> articleCount = new LinkedList<>();
        List<Integer> articleOffset = new LinkedList<>();
        articleOffset.add(0);
        for (Lesson lesson : lessonList) {
            List<Article> art = articleService.getAllByLessonId(lesson.getId());
            articleOffset.add(art.size() + articleOffset.get(articleOffset.size() - 1));
            articleCount.add(art.size());
            articleList.addAll(art);
        }
        model.addAttribute("articleList", articleList);
        model.addAttribute("articleCount", articleCount);
        model.addAttribute("articleOffset", articleOffset);
    }
}
