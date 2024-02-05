package com.example.demo.service;

import com.example.demo.entity.Lesson;
import com.example.demo.repository.LessonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LessonService {

    @Autowired
    private LessonRepository lessonRepository;

    public List<Lesson> getAll() {
        List<Lesson> lessons = (List<Lesson>) lessonRepository.findAll();
        lessons.sort((l1, l2) -> l1.getName().compareTo(l2.getName()));
        return lessons;
    }

    public Lesson getLessonById(int id){
        return lessonRepository.findById(id).get();
    }
    public Lesson getLessonByName(String name) {
        return getAll()
                .stream()
                .filter(l -> l.getName().equals(name))
                .findAny()
                .orElse(null);
    }
    public Lesson save(Lesson lesson) {
        return (Lesson) lessonRepository.save(lesson);
    }

    public void delete(int id) {
        lessonRepository.deleteById(id);
    }
}
