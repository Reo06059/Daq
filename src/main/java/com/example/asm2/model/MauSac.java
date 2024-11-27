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
@Table(name = "mau_sac")
public class MauSac {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    @NotBlank(message = "Mã màu không được để trống")
    private String ma;

    @Column(name = "ten")
    @NotBlank(message = "Tên màu không được để trống")
    private String ten;

    @Column(name = "trang_thai")
    @NotNull(message = "Trạng thái không được để trống")
    private Integer trangThai;
}
