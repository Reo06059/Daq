package com.example.asm2.controller;

import com.example.asm2.model.SanPham;
import com.example.asm2.repository.SanPhamRepository;
import com.example.asm2.repository.SanPhanCTRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/nem")
public class SanPhamController {
    @Autowired
    SanPhamRepository sanPhamRepository;

    @GetMapping("/hien-thi-san-pham")
    public String hienThi(Model model) {
        model.addAttribute("sanPhams", sanPhamRepository.findAll());
        return "san-pham/home";
    }

    // Search for products by ID
    @GetMapping("/search-san-pham")
    public String search(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("sanPhams", sanPhamRepository.findById(id).stream().toList());
        return "san-pham/home";
    }

    // Delete a product
    @GetMapping("/delete-san-pham")
    public String delete(@RequestParam("id") Integer id) {
        sanPhamRepository.deleteById(id);
        return "redirect:/nem/hien-thi-san-pham";
    }

    // Show form to add a new product
    @GetMapping("/add-san-pham")
    public String showAddForm(Model model) {
        model.addAttribute("sanPham", new SanPham());
        return "san-pham/add";
    }

    // Update an existing product
    @PostMapping("/update-san-pham")
    public String update(@Valid @ModelAttribute("sanPham") SanPham sanPham, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("sanPham", sanPham);
            return "san-pham/update";
        }
        sanPhamRepository.save(sanPham);
        return "redirect:/nem/hien-thi-san-pham";
    }

    // Add a new product
    @PostMapping("/add-san-pham")
    public String add(@Valid @ModelAttribute("sanPham") SanPham sanPham, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "san-pham/add";
        }
        sanPhamRepository.save(sanPham);
        return "redirect:/nem/hien-thi-san-pham";
    }

    // Show the form to update a product
    @GetMapping("/update-san-pham/{id}")
    public String detail(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("sanPham", sanPhamRepository.findById(id).get());
        return "san-pham/update";
    }

    // Show product details
    @GetMapping("/detail-san-pham/{id}")
    public String detailinfo(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("sanPham", sanPhamRepository.findById(id).get());
        return "san-pham/detail";
    }
}
