package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class LessonController {
    @Autowired
    private LessonService lessonService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private AnswerService answerService;
    @Autowired
    private AnswerStatisticService answerStatisticService;
    private int currentArticleId = 1;
    private long currentUserId = -1;
    private String username = "";

    @RequestMapping(value = {"/home"}, method = RequestMethod.GET)
    public String goHome(Model model) {
        createSidebar(model);
        return "home";
    }

    @RequestMapping(value = "/journal", method = RequestMethod.GET)
    public String getJournal(@RequestParam(required = true, defaultValue = "") String username, Authentication authentication, Model model) {
        createSidebar(model);
        model.addAttribute("userList", userService.getAllUsernames());
        model.addAttribute("username", username);
        try {
            currentUserId = userService.findUserIdByUsername(username);
        }
        catch (NoSuchElementException e)
        {
            currentUserId = -1;
        }
        if (currentUserId == -1)
            currentUserId = ((User) authentication.getPrincipal()).getId();
        addInfo(currentUserId, model);
        currentUserId = -1;
        return "journal";
    }

    private void addInfo(Long userId, Model model) {
        List<Answer> answers = answerStatisticService.getUserIdAnswers(userId).stream()
                .map(answerStatistic -> answerService.getAnswerById(answerStatistic.getIdanswer()))
                .distinct()
                .collect(Collectors.toList());
        if (answers.size() == 0)
            return;
        List<Question> questionList = questionService.getAll()
                .stream()
                .filter(question -> answers.stream().anyMatch(answer -> question.getId().equals(answer.getIdquestion())))
                .distinct()
                .collect(Collectors.toList());

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
        answerList.stream()
                .filter(answers::contains)
                .forEach(answer -> answer.setChosen(true));

        model.addAttribute("answerList", answerList);
        model.addAttribute("answerCount", answerCount);
        model.addAttribute("answerOffset", answerOffset);
    }

    @RequestMapping(value = {"/lesson/{id}"})
    public String initLesson(@PathVariable int id) {
        currentArticleId = id;
        return "redirect:/lesson";
    }

    @RequestMapping(value = {"/lesson"}, method = RequestMethod.GET)
    public String goLesson(Model model) {
        Article currentArticle = articleService.getArticleById(currentArticleId);
        createSidebar(model);
        model.addAttribute("currentLesson", lessonService.getLessonById(currentArticle.getIdlesson()));
        model.addAttribute("currentArticle", currentArticle);
        return "lesson";
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
