//package com.example.asm2.controller;
//
//import com.example.asm2.model.*;
//import com.example.asm2.repository.*;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.stream.Collectors;
//
//@Service
//public class HoaDonService {
//
//    @Autowired
//    private HoaDonRepository hoaDonRepository;
//
//    @Autowired
//    private HoaDonChiTietRepository hoaDonChiTietRepository;
//
//    @Autowired
//    private NhanVienRepository nhanVienRepository;
//
//    @Autowired
//    private KhachHangRepository khachHangRepository;
//
//    @Autowired
//    private SanPhamRepository sanPhamCTRepository;
//
//
//    public List<HoaDonInfoDTO> getAllHoaDonInfo() {
//        List<HoaDon> hoaDonList = hoaDonRepository.findAll();
//
//        List<HoaDonInfoDTO> hoaDonInfoDTOList = hoaDonList.stream().map(hoaDon -> {
//            NhanVien nhanVien = nhanVienRepository.findById(hoaDon.getIdNhanVien()).orElse(null);
//            KhachHang khachHang = khachHangRepository.findById(hoaDon.getIdKhachHang()).orElse(null);
//            List<HoaDonChiTiet> chiTietList = hoaDonChiTietRepository.findByHoaDon(hoaDon);
//            HoaDonInfoDTO hoaDonInfoDTO = new HoaDonInfoDTO(
//                    hoaDon.getId(),
//                    nhanVien != null ? nhanVien.getTen() : "N/A",
//                    khachHang != null ? khachHang.getTen() : "N/A",
//                    hoaDon.getNgayMuaHang(),
//                    hoaDon.isTrangThai(),
//                    chiTietList
//            );
//
//            return hoaDonInfoDTO;
//        }).collect(Collectors.toList());
//
//        return hoaDonInfoDTOList;
//    }
//
//}
//
//
//
//
//
