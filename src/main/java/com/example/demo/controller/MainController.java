package com.example.demo.controller;

import com.example.demo.entity.Lesson;
import com.example.demo.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class MainController {
    @Autowired
    private LessonService lessonService;

    @GetMapping("/")
    public String redirect(Model model) {
        return "redirect:/home";
    }

    @GetMapping("/authentication")
    public String authentication(Model model) {
        return "redirect:/home";
    }
}
