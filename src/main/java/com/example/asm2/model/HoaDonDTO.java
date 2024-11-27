package com.example.asm2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonDTO {
    private Integer id; // ID hóa đơn
    private String tenNhanVien;
    private String tenKhachHang;
    private LocalDate ngayMuaHang;
    private boolean trangThai;
//    private List<HoaDonChiTietDTO> chiTietList; // Danh sách hóa đơn chi tiết
}
