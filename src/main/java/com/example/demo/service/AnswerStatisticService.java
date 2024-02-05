package com.example.demo.service;

import com.example.demo.entity.AnswerStatistic;
import com.example.demo.entity.User;
import com.example.demo.repository.AnswerStatisticRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class AnswerStatisticService {
    @Autowired
    private AnswerStatisticRepository answerStatisticRepository;

    public List<AnswerStatistic> getAll() {
        return (List<AnswerStatistic>) answerStatisticRepository.findAll();
    }

    public List<AnswerStatistic> getUserAnswers(User user)
    {
        return getAll().stream().filter(answerStatistic -> answerStatistic.getIduser() == user.getId()).collect(Collectors.toList());
    }

    public List<AnswerStatistic> getUserIdAnswers(Long userId)
    {
        return getAll().stream().filter(answerStatistic -> answerStatistic.getIduser() == userId).collect(Collectors.toList());
    }


    public void save(Long idanswer, Long iduser){
        AnswerStatistic answerStatistic = new AnswerStatistic();
        answerStatistic.setIdanswer(idanswer);
        answerStatistic.setIduser(iduser);
        answerStatisticRepository.save(answerStatistic);
    }
}
