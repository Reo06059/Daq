package com.example.asm2.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "hoa_don_chi_tiet")
public class HoaDonChiTiet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_hoa_don")
    private HoaDon hoaDon;

    @ManyToOne
    @JoinColumn(name = "id_spct")
    private SanPhamCT sanPhamCT;

    @Column(name = "so_luong")
    @NotNull(message = "Số lượng không được để trống")
    private Integer soLuong;

    @Column(name = "don_gia")
    @NotNull(message = "Đơn giá không được để trống")
    private Float donGia;


    @Column(name = "trang_thai")
    private Integer trangThai;


}
