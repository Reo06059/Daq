package com.example.asm2.controller;


import com.example.asm2.model.KichThuoc;
import com.example.asm2.repository.KichThuoctRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/nem")
public class KichThuocController {

    @Autowired
    KichThuoctRepository kichThuoctRepository;

    @GetMapping("/hien-thi-kich-thuoc")
    public String hienThi(Model model) {
        model.addAttribute("kichThuocs", kichThuoctRepository.findAll());
        return "kich-thuoc/home";
    }

    @GetMapping("/search-kich-thuoc")
    public String search(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("kichThuocs", kichThuoctRepository.findById(id).stream().toList());
        return "kich-thuoc/home";
    }

    @GetMapping("/delete-kich-thuoc")
    public String delete(@RequestParam("id") Integer id) {
        kichThuoctRepository.delete(kichThuoctRepository.findById(id).get());
        return "redirect:/nem/hien-thi-kich-thuoc";
    }

    @GetMapping("/add-kich-thuoc")
    public String showAddForm(Model model) {
        model.addAttribute("kichThuoc", new KichThuoc());
        return "/kich-thuoc/add";
    }

    @PostMapping("/add-kich-thuoc")
    public String add(@Valid @ModelAttribute("kichThuoc") KichThuoc kichThuoc, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "/kich-thuoc/add";
        }
        kichThuoctRepository.save(kichThuoc);
        return "redirect:/nem/hien-thi-kich-thuoc";
    }

    @GetMapping("/update-kich-thuoc/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        KichThuoc kichThuoc = kichThuoctRepository.findById(id).get();
        model.addAttribute("kichThuoc", kichThuoc);
        return "/kich-thuoc/update";
    }

    @PostMapping("/update-kich-thuoc")
    public String update(@Valid @ModelAttribute("kichThuoc") KichThuoc kichThuoc, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("kichThuoc", kichThuoc);
            return "/kich-thuoc/update";
        }
        kichThuoctRepository.save(kichThuoc);
        return "redirect:/nem/hien-thi-kich-thuoc";
    }

    @GetMapping("/detail-kich-thuoc/{id}")
    public String detailinfo(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("kichThuoc", kichThuoctRepository.findById(id).get());
        return "/kich-thuoc/detail";
    }
}
