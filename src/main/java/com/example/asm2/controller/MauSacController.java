package com.example.asm2.controller;

import com.example.asm2.model.MauSac;
import com.example.asm2.repository.MauSacRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/nem")
public class MauSacController {
    @Autowired
    MauSacRepository mauSacRepository;

    @GetMapping("/hien-thi-mau-sac")
    public String hienThi(Model model) {
        model.addAttribute("mauSacs", mauSacRepository.findAll());
        return "mau-sac/home";
    }

    @GetMapping("/search-mau-sac")
    public String search(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("mauSacs", mauSacRepository.findById(id).stream().toList());
        return "mau-sac/home";
    }

    @GetMapping("/delete-mau-sac")
    public String delete(@RequestParam("id") Integer id) {
        mauSacRepository.delete(mauSacRepository.findById(id).get());
        return "redirect:/nem/hien-thi-mau-sac";
    }

    @GetMapping("/add-mau-sac")
    public String showAddForm(Model model) {
        model.addAttribute("mauSac", new MauSac());
        return "/mau-sac/add"; // Update this path to your actual view path
    }

    @PostMapping("/add-mau-sac")
    public String add(@Valid @ModelAttribute("mauSac") MauSac mauSac, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/mau-sac/add";
        }
        mauSacRepository.save(mauSac);
        return "redirect:/nem/hien-thi-mau-sac";
    }

    @GetMapping("/update-mau-sac/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        MauSac mauSac = mauSacRepository.findById(id).get();
        model.addAttribute("mauSac", mauSac);
        return "/mau-sac/update"; // Update this path to your actual view path
    }

    @PostMapping("/update-mau-sac")
    public String update(@Valid @ModelAttribute("mauSac") MauSac mauSac, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("mauSac", mauSac);
            return "/mau-sac/update"; // Update this path to your actual view path
        }
        mauSacRepository.save(mauSac);
        return "redirect:/nem/hien-thi-mau-sac";
    }

    @GetMapping("/detail-mau-sac/{id}")
    public String detailinfo(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("mauSac", mauSacRepository.findById(id).get());
        return "/mau-sac/detail"; // Update this path to your actual view path
    }
}
