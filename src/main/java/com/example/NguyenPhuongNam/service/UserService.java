package com.example.NguyenPhuongNam.service;

import java.util.Optional;

import com.example.NguyenPhuongNam.entity.User;

public interface UserService {
    Optional<User> login(String email, String password);

    Optional<User> findByEmail(String email);

    // UserService.java
    Optional<User> findById(Integer id);

}
