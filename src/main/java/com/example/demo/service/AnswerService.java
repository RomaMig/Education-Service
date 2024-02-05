package com.example.demo.service;

import com.example.demo.entity.Answer;
import com.example.demo.repository.AnswerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AnswerService {

    @Autowired
    private AnswerRepository answerRepository;

    public List<Answer> getAll() {
        return (List<Answer>)answerRepository.findAll();
    }

    public Answer getAnswerById(Long id){
        return answerRepository.findById(id).get();
    }

    public List<Answer> getAnswerByQuestionId(Long questionId) {
        return getAll().stream()
                .filter(answer -> answer.getIdquestion().equals(questionId))
                .collect(Collectors.toList());
    }
    public void deleteAnswerByQuestionId(Long questionId) {
        getAll().stream()
                .filter(answer -> answer.getIdquestion().equals(questionId))
                .forEach(answer -> delete(answer.getId()));
    }

    public Answer save(Answer answer) {
        return (Answer) answerRepository.save(answer);
    }

    public void delete(Long id) {
        answerRepository.deleteById(id);
    }
}
