package com.example.asm2.controller;

import com.example.asm2.model.HoaDon;
import com.example.asm2.model.HoaDonChiTiet;
import com.example.asm2.model.KhachHang;
import com.example.asm2.model.NhanVien;
import com.example.asm2.repository.HoaDonChiTietRepository;
import com.example.asm2.repository.KhachHangRepository;
import com.example.asm2.repository.NhanVienRepository;
import com.example.asm2.repository.SanPhanCTRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/nem")
public class LoginController {
   /////////////// okkkkkkkkkkkkkkkkkkkkkkkk
    @Autowired
    HoaDonChiTietRepository hoaDonChiTietRepository;
    @Autowired
    KhachHangRepository khachHangRepository;
    @Autowired
    NhanVienRepository nhanVienRepository;
    @Autowired
    SanPhanCTRepository sanPhanCTRepository;

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/home")
    public String home() {

        return "home";
    }

    @PostMapping("/home")
    public String home1() {
        return "home";
    }

    @PostMapping("/login")
    public String loginPost(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            Model model) {
        // Check if username or password is empty
        if (username.isBlank() || password.isBlank()) {
            model.addAttribute("errorMessage", "Tên đăng nhập và mật khẩu không được để trống");
            return "login";
        }

        // Check if the username and password match
        NhanVien nhanVien = nhanVienRepository.findByTenDangNhap(username);
        if (nhanVien != null && nhanVien.getMatKhau().equals(password)) {
            model.addAttribute("successMessage", "Nhân viên " + nhanVien.getTen() + " đã đăng nhập thành công! Đang chuyển hướng...");
            return "login";
        } else {
            // Login failed, return to login page with error message
            model.addAttribute("errorMessage", "Tên đăng nhập hoặc mật khẩu không đúng");
            return "login";
        }
    }


}
