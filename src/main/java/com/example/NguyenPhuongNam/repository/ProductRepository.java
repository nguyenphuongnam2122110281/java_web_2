package com.example.NguyenPhuongNam.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.NguyenPhuongNam.entity.Product;


import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    List<Product> findByDeletedAtIsNull();

    List<Product> findByCategoryIdAndDeletedAtIsNull(int categoryId);

    List<Product> findByBrandIdAndDeletedAtIsNull(int brandId);

    // List<Product> findByNameContainingIgnoreCaseAndDeletedAtIsNull(String keyword);

    List<Product> findByNameContainingIgnoreCaseAndDeletedAtIsNull(String keyword);


}
