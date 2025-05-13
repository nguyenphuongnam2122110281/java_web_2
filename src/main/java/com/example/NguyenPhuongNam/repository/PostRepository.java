package com.example.NguyenPhuongNam.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.NguyenPhuongNam.entity.Post;

public interface PostRepository extends JpaRepository<Post, Integer> {
}
