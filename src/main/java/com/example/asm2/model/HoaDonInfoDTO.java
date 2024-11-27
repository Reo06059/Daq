package com.example.asm2.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class HoaDonInfoDTO {
    private Integer idHoaDon;
    private String tenNhanVien;
    private String tenKhachHang;
    private LocalDate ngayMuaHang;
    private Integer trangThai;
    private List<HoaDonChiTiet> chiTietList;

}
