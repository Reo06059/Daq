package com.example.asm2.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
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
@Table(name = "kich_thuoc")
public class KichThuoc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "ma")
    @NotBlank(message = "Bạn không được để trống mã")
    private String ma;

    @Column(name = "ten")
    @NotBlank(message = "Bạn không được để trống tên")
    private String ten;

    @Column(name = "trang_thai")
    private Integer trangThai;  // Changed to Boolean to allow null


}
