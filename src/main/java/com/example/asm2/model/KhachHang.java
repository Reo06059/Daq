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
@Table(name = "khach_hang")
public class KhachHang {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ten")
    @NotBlank(message = "Tên không được để trống")
    private String ten;

    @Column(name = "sdt")
    @NotBlank(message = "Số điện thoại không được để trống")
    private String sdt;

    @Column(name = "ma_kh")
    @NotBlank(message = "Mã khách hàng không được để trống")
    private String maKH;

    @Column(name = "trang_thai")
    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai;
}
