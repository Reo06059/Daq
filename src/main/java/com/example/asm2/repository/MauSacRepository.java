package com.example.asm2.repository;

import com.example.asm2.model.HoaDonChiTiet;
import com.example.asm2.model.MauSac;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MauSacRepository extends JpaRepository<MauSac, Integer> {
}
