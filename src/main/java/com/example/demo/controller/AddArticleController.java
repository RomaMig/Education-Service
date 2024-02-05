package com.example.demo.controller;

import com.example.demo.entity.Article;
import com.example.demo.entity.Lesson;
import com.example.demo.service.ArticleService;
import com.example.demo.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;

@Controller
public class AddArticleController {
    @Autowired
    private LessonService lessonService;
    @Autowired
    private ArticleService articleService;
    private Article currentArticle;

    @PostMapping("/add_course")
    public String setLesson(@RequestParam(required = true, defaultValue = "") String lessonName,
                            @RequestParam(required = true, defaultValue = "") String articleName,
                            @RequestParam(required = true, defaultValue = "") String articleText,
                            @RequestParam(required = true, defaultValue = "0") String lesson_id,
                            @RequestParam(required = true, defaultValue = "0") String article_id,
                            @RequestParam(required = true, defaultValue = "") String action,
                            Model model) {
        int lessonId = Integer.parseInt(lesson_id);
        int articleId = Integer.parseInt(article_id);
        switch (action) {
            case "save":
                Lesson lesson = lessonService.getLessonByName(lessonName);
                if (lesson == null) {
                    lesson = new Lesson();
                    lesson.setName(lessonName);
                    lessonService.save(lesson);
                    createArticle(lesson.getId(), articleName, articleText);
                } else {
                    Article article = articleService.getArticleByNameAndLessonId(articleName, lesson.getId());
                    if (article == null) {
                        createArticle(lesson.getId(), articleName, articleText);
                    } else {
                        article.setArticle(articleText);
                        articleService.delete(article.getId());
                        articleService.save(article);
                        currentArticle = article;
                    }
                }
                break;
            case "load":
                break;
            case "delete_lesson":
                if (lessonId > 0) {
                    articleService.deleteByLessonId(lessonId);
                    lessonService.delete(lessonId);
                }
                break;
            case "delete_article":
                if (articleId > 0) {
                    int articleCount = articleService.getAllByLessonId(lessonId = articleService.getArticleById(articleId).getIdlesson()).size();
                    articleService.delete(articleId);
                    if (articleCount <= 1) {
                        lessonService.delete(lessonId);
                    }
                }
                break;
        }
        return "redirect:/add_course";
    }

    @RequestMapping(value = {"/add_course/{id}"})
    public String loadArticle(@PathVariable int id) {
        currentArticle = articleService.getArticleById(id);
        return "redirect:/add_course";
    }

    @RequestMapping(value = {"/add_course"}, method = RequestMethod.GET)
    public String addCourse(Model model) {
        createSidebar(model);
        String currentArticleName = "";
        String currentLessonName = "";
        String articleText = "Hello World!";
        if (currentArticle != null)
        {
            currentArticleName = currentArticle.getName();
            currentLessonName = lessonService.getLessonById(currentArticle.getIdlesson()).getName();
            articleText = currentArticle.getArticle();
        }
        model.addAttribute("currentArticleName", currentArticleName);
        model.addAttribute("currentLessonName", currentLessonName);
        model.addAttribute("articleText", articleText);
        model.addAttribute("lessonList", lessonService.getAll());
        model.addAttribute("articleListSelect", articleService.getAll());
        return "add_course";
    }

    private Article createArticle(int lessonId, String articleName, String articleText)
    {
        Article article = new Article();
        article.setName(articleName);
        article.setIdlesson(lessonId);
        article.setArticle(articleText);
        articleService.save(article);
        return article;
    }

    private void createSidebar(Model model)
    {
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