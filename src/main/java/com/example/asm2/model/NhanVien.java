package com.example.asm2.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "nhan_vien")
public class NhanVien {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma_nv")
    @NotBlank(message = "Hãy nhập mã nhân viên")
    private String maNV;

    @Column(name = "ten")
    @NotBlank(message = "Hãy nhập tên nhân viên")
    private String ten;

    @Column(name = "ten_dang_nhap")
    @NotBlank(message = "Hãy nhập tên đăng nhập")
    private String tenDangNhap;

    @Column(name = "mat_khau")
    @NotBlank(message = "Hãy nhập mật khẩu")
    private String matKhau;

    @Column(name = "trang_thai")
    private Integer trangThai;
}
