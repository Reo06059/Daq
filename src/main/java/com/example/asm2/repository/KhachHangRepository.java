package com.example.asm2.repository;

import com.example.asm2.model.HoaDonChiTiet;
import com.example.asm2.model.KhachHang;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {
}
