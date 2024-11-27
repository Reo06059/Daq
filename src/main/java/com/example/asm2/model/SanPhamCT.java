package com.example.asm2.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.bind.annotation.InitBinder;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "san_pham_chi_tiet")
public class SanPhamCT {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @NotBlank(message = "không được để trống Mã sản phẩm chi tiết")
    @Pattern(regexp = "^[0-9]+$", message = "Số lượng phải là số")
    @Column(name = "ma_spct")
    private String maSPCT;

    @ManyToOne
    @JoinColumn(name = "id_kich_thuoc")
    private KichThuoc kichThuoc;
    //    @Column(name = "id_kich_thuoc")
    ////    @NotBlank(message = "Bạn không được để trống kích thước")
    //    private Integer idKichThuoc;
    //
    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;
//    @Column(name = "id_mau_sac")
////    @NotBlank(message = "Bạn không được để trống màu sắc")
//    private Integer idMauSac;
//

    @ManyToOne
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;
//    @Column(name = "id_san_pham")
////    @NotBlank(message = "Bạn không được để trống id sản phẩm")
//    private Integer idSanPham;

    @NotNull(message = "số lượng không được để trống")
    @Column(name = "so_luong")


    @Positive(message = "Số lượng phải lớn hơn 0")
    private Integer soLuong;

    @Column(name = "don_gia")
    @NotNull(message = "Giá không được để trống")
    @Positive(message = "Đơn giá phải lớn hơn 0")
    private BigDecimal donGia;


    private Integer trangThai;


}
