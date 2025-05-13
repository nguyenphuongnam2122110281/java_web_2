package com.example.NguyenPhuongNam.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.NguyenPhuongNam.entity.Category;

import java.util.List;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    List<Category> findByDeletedAtIsNull();
}
