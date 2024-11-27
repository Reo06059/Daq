package com.example.asm2.controller;

import com.example.asm2.model.NhanVien;
import com.example.asm2.repository.NhanVienRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/nem")
public class NhanVienController {
    @Autowired
    NhanVienRepository nhanVienRepository;

    @GetMapping("/hien-thi-nhan-vien")
    public String hienThi(Model model) {
        model.addAttribute("nhanViens", nhanVienRepository.findAll());
        return "nhan-vien/home";
    }

    @GetMapping("/search-nhan-vien")
    public String search(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("nhanViens", nhanVienRepository.findById(id).stream().toList());
        return "nhan-vien/home";
    }

    @GetMapping("/delete-nhan-vien")
    public String delete(@RequestParam("id") Integer id) {
        nhanVienRepository.deleteById(id);
        return "redirect:/nem/hien-thi-nhan-vien";
    }

    @GetMapping("/add-nhan-vien")
    public String showAddForm(Model model) {
        model.addAttribute("nhanVien", new NhanVien());
        return "/nhan-vien/add";
    }

    @PostMapping("/update-nhan-vien")
    public String update(@Valid @ModelAttribute("nhanVien") NhanVien nhanVien, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("nhanVien", nhanVien);
            return "/nhan-vien/update";
        }
        nhanVienRepository.save(nhanVien);
        return "redirect:/nem/hien-thi";
    }

    @PostMapping("/add-nhan-vien")
    public String add(@Valid @ModelAttribute("nhanVien") NhanVien nhanVien, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/nhan-vien/add";
        }
        nhanVienRepository.save(nhanVien);
        return "redirect:/nem/hien-thi-nhan-vien";
    }

    @GetMapping("/update-nhan-vien/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("nhanVien", nhanVienRepository.findById(id).get());
        return "/nhan-vien/update";
    }

    @GetMapping("/detail-nhan-vien/{id}")
    public String detailinfo(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("nhanVien", nhanVienRepository.findById(id).get());
        return "/nhan-vien/detail";
    }
}
