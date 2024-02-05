package com.example.demo.repository;

import com.example.demo.entity.AnswerStatistic;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AnswerStatisticRepository extends CrudRepository<AnswerStatistic, Long> {
}
