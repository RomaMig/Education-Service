package com.example.demo.entity;

import javax.persistence.*;

@Entity
@Table(name = "answer_statistic")
public class AnswerStatistic {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private Long iduser;
    private Long idanswer;

    public AnswerStatistic(){}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIduser() {
        return iduser;
    }

    public void setIduser(Long iduser) {
        this.iduser = iduser;
    }

    public Long getIdanswer() {
        return idanswer;
    }

    public void setIdanswer(Long idanswer) {
        this.idanswer = idanswer;
    }
}
