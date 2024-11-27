package com.example.asm2.controller;

import com.example.asm2.model.KichThuoc;
import com.example.asm2.model.MauSac;
import com.example.asm2.model.SanPham;
import com.example.asm2.model.SanPhamCT;
import com.example.asm2.repository.KichThuoctRepository;
import com.example.asm2.repository.MauSacRepository;
import com.example.asm2.repository.SanPhamRepository;
import com.example.asm2.repository.SanPhanCTRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/nem")
public class SanPhamCTController {
    @Autowired
    SanPhanCTRepository sanPhanCTRepository;

    @Autowired
    SanPhamRepository sanPhamRepository;

    @Autowired
    KichThuoctRepository kichThuoctRepository;

    @Autowired
    MauSacRepository mauSacRepository;

    @ModelAttribute("listSanPham")
    public List<SanPham> getALl() {
        return sanPhamRepository.findAll();
    }

    @ModelAttribute("listKichThuoc")
    public List<KichThuoc> getALlkt() {
        return kichThuoctRepository.findAll();
    }

    @ModelAttribute("listMauSac")
    public List<MauSac> getALlms() {
        return mauSacRepository.findAll();
    }

    @GetMapping("/hien-thi-san-pham-ct")
    public String hienThi(Model model) {
        model.addAttribute("sanPhamCTs", sanPhanCTRepository.findAll());
        return "san-pham-ct/home";
    }

    @GetMapping("/search-san-pham-ct")
    public String search(Model model, @RequestParam("id") Integer id) {
        model.addAttribute("sanPhamCTs", sanPhanCTRepository.findById(id).stream().toList());
        return "san-pham-ct/home";
    }

    @GetMapping("/delete-san-pham-ct")
    public String delete(@RequestParam("id") Integer id) {
        sanPhanCTRepository.deleteById(id);
        return "redirect:/nem/hien-thi-san-pham-ct";
    }

    @PostMapping("/add-san-pham-ct")
    public String add(@Valid @ModelAttribute("sanPhamCT") SanPhamCT sanPhamCT, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {

            return "san-pham-ct/add";
        }
        sanPhanCTRepository.save(sanPhamCT);
        return "redirect:/nem/hien-thi-san-pham-ct";
    }

    @GetMapping("/add-san-pham-ct")
    public String showAddForm(Model model) {
        model.addAttribute("sanPhamCT", new SanPhamCT());


        return "san-pham-ct/add";
    }


    @GetMapping("/update-san-pham-ct/{id}")
    public String showUpdateForm(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("sanPhamCT", sanPhanCTRepository.findById(id).get());
        return "san-pham-ct/update";
    }

    @PostMapping("/update-san-pham-ct")
    public String update(@Valid @ModelAttribute("sanPhamCT") SanPhamCT sanPhamCT, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            model.addAttribute("sanPhamCT", sanPhamCT);
            return "san-pham-ct/update";
        }
        sanPhanCTRepository.save(sanPhamCT);
        return "redirect:/nem/hien-thi-san-pham-ct";
    }

    @GetMapping("/detail-san-pham-ct/{id}")
    public String detailinfo(Model model, @PathVariable("id") Integer id) {
        model.addAttribute("sanPhamCT", sanPhanCTRepository.findById(id).get());
        return "san-pham-ct/detail";
    }
}
