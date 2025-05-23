package com.example.NguyenPhuongNam.dto;

import java.math.BigDecimal;

public interface OrderDetailWithProduct {
    Integer getId();
    Integer getQuantity();
    BigDecimal getPrice();
    String getNote();
    String getProductName();
    String getProductThumbnail();
}
