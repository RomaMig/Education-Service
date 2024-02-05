package com.example.demo.service;

import com.example.demo.entity.Answer;
import com.example.demo.entity.Question;
import com.example.demo.repository.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    public List<Question> getAll() {
        return (List<Question>)questionRepository.findAll();
    }

    public Question getQuestionById(Long id){
        return questionRepository.findById(id).orElse(null);
    }

    public Question getQuestionByText(String text) {
        return getAll().stream()
                .filter(question -> question.getQuestion().equals(text))
                .findAny().get();
    }

    public List<Question> getQuestionByLessonId(Integer lessonId) {
        return getAll().stream()
                .filter(question -> question.getIdlesson().equals(lessonId))
                .sorted((o1, o2) -> o1.getQuestion().compareTo(o2.getQuestion()))
                .collect(Collectors.toList());
    }


    public Question save(Question question) {
        return (Question) questionRepository.save(question);
    }

    public void delete(Long id) {
        questionRepository.deleteById(id);
    }
}
