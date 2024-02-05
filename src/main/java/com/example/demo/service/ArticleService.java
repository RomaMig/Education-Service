package com.example.demo.service;

import com.example.demo.entity.Article;
import com.example.demo.entity.Lesson;
import com.example.demo.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    public List<Article> getAll() {
        return (List<Article>) articleRepository.findAll();
    }

    public List<Article> getAllByLessonId(int idlesson)
    {
        List<Article> articles = getAll().stream()
                .filter(article -> article.getIdlesson() == idlesson)
                .collect(Collectors.toList());
        articles.sort((art1, art2) -> art1.getName().compareTo(art2.getName()));
        return articles;
    }
    public void deleteByLessonId(int idlesson)
    {
        getAll().stream()
                .filter(article -> article.getIdlesson() == idlesson)
                .forEach(article -> articleRepository.delete(article));
    }


    public Article getArticleById(int id){
        return articleRepository.findById(id).get();
    }
    public Article getArticleByNameAndLessonId(String name, int id) {
        return getAll()
                .stream()
                .filter(a -> a.getName().equals(name) && a.getIdlesson() == id)
                .findAny()
                .orElse(null);
    }
    public Article save(Article article) {
        return (Article) articleRepository.save(article);
    }

    public void delete(int id) {
        articleRepository.deleteById(id);
    }
}
