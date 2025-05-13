package com.example.NguyenPhuongNam.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.NguyenPhuongNam.entity.Brand;

import java.util.List;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Integer> {
    List<Brand> findByDeletedAtIsNull(); // Lấy tất cả brand chưa bị xóa mềm
}
