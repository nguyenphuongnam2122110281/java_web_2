package com.example.NguyenPhuongNam.dto;

import jakarta.validation.constraints.NotBlank;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryStoreRequest {
    @NotBlank(message = "Tên danh mục không được để trống")
    private String name;
}
