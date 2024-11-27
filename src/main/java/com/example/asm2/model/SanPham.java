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
@Table(name = "san_pham")
public class SanPham {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;

    @Column(name = "ma")
    @NotBlank(message = "Bạn không được để trống mã sản phẩm")
    private String ma;

    @Column(name = "ten")
    @NotBlank(message = "Bạn không được để trống tên sản phẩm")
    private String ten;

    @Column(name = "trang_thai")
    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai;
}
