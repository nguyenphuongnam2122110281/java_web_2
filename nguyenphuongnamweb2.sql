-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 11, 2025 lúc 12:01 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nguyenphuongnamweb2`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `name`, `updated_at`, `updated_by`) VALUES
(6, '2025-04-20 16:52:45.000000', 2, NULL, NULL, 'Apple', '2025-04-20 16:52:45.000000', NULL),
(7, '2025-04-20 16:53:02.000000', 2, NULL, NULL, 'Casio', '2025-04-20 16:53:02.000000', NULL),
(10, '2025-05-06 22:19:48.000000', 2, NULL, NULL, 'Sony', '2025-05-06 22:19:48.000000', NULL),
(11, '2025-05-06 22:36:36.000000', 2, NULL, NULL, 'Samsung', '2025-05-06 22:36:36.000000', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `name`, `updated_at`, `updated_by`) VALUES
(5, '2025-04-20 16:52:18.000000', 2, NULL, NULL, 'Đồng hồ cơ', '2025-04-20 16:52:18.000000', NULL),
(6, '2025-04-20 16:52:34.000000', 2, NULL, NULL, 'Đồng hồ thông minh', '2025-04-20 16:52:34.000000', NULL),
(8, '2025-04-21 07:50:01.000000', 2, NULL, NULL, 'Máy tính bảng', '2025-05-06 22:30:16.000000', 2),
(9, '2025-05-06 22:30:27.000000', 2, NULL, NULL, 'Điện Thoại', '2025-05-06 22:30:27.000000', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `total_amount` decimal(38,2) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `address`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `email`, `name`, `note`, `payment_method`, `phone`, `total_amount`, `updated_at`, `updated_by`, `user_id`) VALUES
(8, '64 duong 339 ', '2025-04-23 14:58:01.000000', 2, NULL, NULL, 'nam123@gmail.com', 'ipadPro2', 'dat hang ', 'cash', '0348803396', 6000000.00, '2025-04-23 14:58:01.000000', NULL, 2),
(9, '539 gobal city', '2025-04-23 15:09:22.000000', 2, NULL, NULL, 'nam1234@gmail.com', 'ipad12', 'dat hang nhanh', 'cash', '0348803396', 6000000.00, '2025-04-23 15:09:22.000000', NULL, 2),
(10, '21 đường 22 phường Phước Long B', '2025-05-06 22:22:28.000000', 2, NULL, NULL, 'nam@gmail.com', 'Nguyen Phuong Nam', 'Đặt hàng từ website', 'cash', '0961251656', 9939998.00, '2025-05-06 22:22:28.000000', NULL, 2),
(11, '21 đường 22 phường Phước Long B', '2025-05-10 17:22:29.000000', 2, NULL, NULL, 'nam@gmail.com', 'Nguyen Phuong Nam', 'Đặt hàng từ website', 'cash', '0961251656', 48000000.00, '2025-05-10 17:22:29.000000', NULL, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` decimal(38,2) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `note`, `order_id`, `price`, `product_id`, `quantity`, `updated_at`, `updated_by`) VALUES
(7, '2025-04-23 14:58:02.000000', 2, NULL, NULL, 'string', 8, 600000000.00, 3, 1, '2025-04-23 14:58:02.000000', NULL),
(8, '2025-04-23 15:09:22.000000', 2, NULL, NULL, 'string', 9, 6000000.00, 3, 1, '2025-04-23 15:09:22.000000', NULL),
(9, '2025-05-06 22:22:28.000000', 2, NULL, NULL, '', 10, 950000.00, 4, 1, '2025-05-06 22:22:28.000000', NULL),
(10, '2025-05-06 22:22:28.000000', 2, NULL, NULL, '', 10, 8989998.00, 6, 1, '2025-05-06 22:22:28.000000', NULL),
(11, '2025-05-10 17:22:29.000000', 2, NULL, NULL, 'giao hang nhanh', 11, 47996000.00, 21, 3, '2025-05-10 17:23:07.000000', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `description`, `detail`, `slug`, `thumbnail`, `title`, `topic_id`, `type`, `updated_at`, `updated_by`) VALUES
(1, '2025-04-20 15:09:39.000000', NULL, NULL, NULL, 'chính sách đổi trả', 'đổi trả trong vòng 7 ngày nếu có lỗi', 'post-new', 'chinh-sach-oi-tra-1745136579840.jpg', 'chính sách đổi trả', 1, 'post', '2025-04-20 15:09:39.000000', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `price` decimal(38,2) NOT NULL,
  `price_sale` decimal(18,2) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `brand_id`, `category_id`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `description`, `name`, `price`, `price_sale`, `thumbnail`, `updated_at`, `updated_by`) VALUES
(3, 7, 5, '2025-04-20 16:59:07.000000', 2, NULL, NULL, 'Kích thước vỏ (Dài × Rộng × Cao)\r\n40 × 34 × 7.9 mm\r\nTrọng lượng\r\n64 g\r\nDây đeo\r\nDây đeo bằng thép không gỉ\r\nNắp gập ba\r\nChống nước\r\nChống nước\r\nBộ nguồn và tuổi thọ pin\r\nTuổi thọ pin xấp xỉ: 3 năm đối với pin SR626SW', 'Đồng Hồ Seiko 5 Sport Nam SRPD53K1', 6000000.00, 5999000.00, 'ong-ho-seiko-5-sport-nam-srpd53k1-1745143147265.webp', '2025-04-20 16:59:07.000000', NULL),
(4, 7, 5, '2025-04-20 17:00:59.000000', 2, NULL, NULL, 'Kích thước vỏ (Dài × Rộng × Cao)\r\n46 × 40 × 8.2 mm\r\nTrọng lượng\r\n44 g\r\nDây đeo\r\nDây đeo bằng da\r\nChống nước\r\nChống nước\r\nBộ nguồn và tuổi thọ pin\r\nTuổi thọ pin xấp xỉ: 3 năm đối với pin SR626SW', 'Đồng Hồ Nam Chính Hãng CASIO MTP-VT04L-7E', 1247000.00, 950000.00, 'ong-ho-nam-chinh-hang-casio-mtp-vt04l-7e-1745143259179.jpg', '2025-04-20 17:00:59.000000', NULL),
(5, 7, 5, '2025-04-20 17:08:22.000000', 2, NULL, NULL, 'Thông tin cơ bản\r\nKích thước vỏ (Dài × Rộng × Cao): 47.2 × 44.5 × 13.4 mm\r\nTrọng lượng:  43 g\r\nVật liệu vỏ / gờ: Nhựa\r\nDây đeo bằng nhựa\r\nKhả năng chống nước ở độ sâu 100 mét\r\nBộ nguồn và tuổi thọ pin\r\nTuổi thọ pin xấp xỉ: 10 năm đối với pin CR2025', 'Đồng Hồ Nam Chính Hãng CASIO WS-1400H-8AV', 2000000.00, 1500000.00, 'ong-ho-nam-chinh-hang-casio-ws-1400h-8av-1745143702405.jpg', '2025-04-20 17:08:22.000000', NULL),
(6, 6, 6, '2025-04-20 17:17:58.000000', 2, NULL, NULL, 'Kèm dây đeo, cáp sạc.\r\nKèm dây đeo, cáp sạc. (*) Giảm thêm 200.000đ với máy không có phụ kiện đi kèm.\r\nSản phẩm có thể đã qua bảo hành hãng hoặc sửa chữa thay thế linh kiện để đảm bảo sự ổn định khi sử dụng.\r\nĐủ phụ kiện từ NSX\r\nBảo hành 12 tháng tại CellphoneS không loại trừ linh kiện, bảo hành cả nguồn, màn hình. 1 đổi 1 trong 30 ngày nếu có lỗi phần cứng từ nhà sản xuất. (xem chi tiết)', 'Apple Watch Series 10 46mm (GPS) Viền Nhôm Dây Vải', 10000000.00, 8989998.00, 'apple-watch-series-10-46mm-gps-vien-nhom-day-vai-1745144278020.webp', '2025-04-20 17:17:58.000000', NULL),
(8, 6, 6, '2025-04-20 17:30:21.000000', 2, NULL, NULL, 'Hàng chính hãng Apple Việt Nam, Mới\r\nApple Watch Ultra 2\r\nDây đeo\r\nCáp Sạc Nhanh Từ Tính Có Đầu Nối USB-C (1m) Của Apple Watch\r\n1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple: CareS.vn(xem chi tiết)\r\nXem thông tin kích hoạt bảo hành các sản phẩm Apple (tại đây)\r\nGiá sản phẩm đã bao gồm VAT', 'Apple Watch Ultra 2 2024 49mm 4G Viền Titan ', 25000000.00, 24490000.00, 'apple-watch-ultra-2-2024-49mm-4g-vien-titan-1745145021233.webp', '2025-04-20 17:30:21.000000', NULL),
(9, 6, 6, '2025-04-20 17:35:38.000000', 2, NULL, NULL, 'Mới, đầy đủ phụ kiện từ nhà sản xuất\r\n1 ĐỔI 1 trong 30 ngày nếu có lỗi phần cứng nhà sản xuất. Bảo hành 12 tháng tại trung tâm bảo hành chính hãng Apple: CareS.vn(xem chi tiết)\r\nXem thông tin kích hoạt bảo hành các sản phẩm Apple (tại đây)\r\nGiá sản phẩm đã bao gồm VAT', 'Apple Watch SE 2 2023 40mm (GPS) viền nhôm', 5000000.00, 4890000.00, 'apple-watch-se-2-2023-40mm-gps-vien-nhom-chinh-hang-apple-1745145338113.webp', '2025-04-20 17:36:10.000000', 2),
(14, 6, 8, '2025-05-06 22:21:11.000000', 2, NULL, NULL, 'sản phẩm hot nhất mùa hè 2025 ', 'Ipad Pro', 8000000.00, 7200000.00, 'tai-nghe-sony-1746545452781.jpg', '2025-05-10 16:50:32.000000', 2),
(15, 6, 9, '2025-05-06 22:31:55.000000', 2, NULL, NULL, 'sản phẩm mới nhất năm 2025 \r\n256GB màn hình HD ', 'Iphone 15 Promax', 28000000.00, 24000000.00, 'iphone-15-promax-1746545515570.jpg', '2025-05-06 22:31:55.000000', NULL),
(16, 11, 9, '2025-05-06 22:36:21.000000', 2, NULL, NULL, 'Màn hình Dynamic AMOLED 2X, Chính 6.7\" & Phụ 1.9\", Full HD+\r\n\r\nChip Snapdragon 888\r\n\r\nRAM: 8 GB\r\n\r\nDung lượng: 256 GB\r\n\r\nCamera sau: 2 camera 12 MP\r\n\r\nCamera trước: 10 MP\r\n\r\nPin 3300 mAh, Sạc 15 W', 'Samsung Galaxy Xtra ', 18000000.00, NULL, 'samsung-galaxy-xtra-1746545781636.jpg', '2025-05-06 22:36:45.000000', 2),
(17, 6, 9, '2025-05-10 16:36:51.000000', 2, NULL, NULL, 'Màn hình: 6.7 inch Super Retina XDR, ProMotion 120Hz\r\n\r\nCPU: Apple A17 Pro (3nm)\r\n\r\nRAM: 8GB\r\n\r\nBộ nhớ trong: 256GB\r\n\r\nCamera sau: 48MP + 12MP + 12MP\r\n\r\nCamera trước: 12MP\r\n\r\nPin: 4422mAh, sạc nhanh 20W\r\n\r\nHệ điều hành: iOS 17\r\n\r\nKết nối: 5G, Wi-Fi 6E, Bluetooth 5.3, USB-C\r\n\r\nChất liệu: Khung titan, mặt lưng kính nhám\r\n\r\nKháng nước: IP68\r\n\r\nMàu sắc: Titan Xanh, Titan Đen, Titan Trắng, Titan Tự nhiên\r\n\r\nNgày ra mắt: Tháng 9/2023', 'IP 13PX', 17000000.00, 15000000.00, 'ip-13px-1746869811893.jpg', '2025-05-10 16:36:51.000000', NULL),
(18, 6, 9, '2025-05-10 16:38:15.000000', 2, NULL, NULL, 'Màn hình: 6.7” Super Retina XDR, 120Hz\r\n\r\nChip: A17 Pro (3nm)\r\n\r\nRAM: 8GB\r\n\r\nCamera: 48MP + 12MP + 12MP\r\n\r\nPin: 4422mAh, sạc nhanh 20W\r\n\r\nKháng nước IP68, USB-C\r\n\r\nMàu sắc: Titan xanh, titan tự nhiên, titan trắng, titan đen\r\n\r\nNgày ra mắt: 09/2023', 'IP XSMAX', 8000000.00, 7800000.00, 'ip-xsmax-1746869895632.jpg', '2025-05-10 16:38:15.000000', NULL),
(19, 6, 8, '2025-05-10 16:39:43.000000', 2, NULL, NULL, 'Màn hình: 12.9” Liquid Retina XDR, ProMotion 120Hz\r\n\r\nChip: Apple M2\r\n\r\nRAM: 8GB\r\n\r\nBộ nhớ: 128GB\r\n\r\nCamera: 12MP + 10MP + LiDAR / Camera trước 12MP\r\n\r\nPin: ~10758mAh\r\n\r\nBút cảm ứng: Hỗ trợ Apple Pencil 2\r\n\r\nCổng sạc: USB-C (Thunderbolt)\r\n\r\nHệ điều hành: iPadOS 16\r\n\r\nMàu sắc: Xám, bạc\r\n\r\nNgày ra mắt: 10/2022\r\n\r\n', 'MacBook Air 4', 38000000.00, NULL, 'macbook-air-4-1746869983208.jpg', '2025-05-10 16:39:43.000000', NULL),
(20, 6, 8, '2025-05-10 16:40:19.000000', 2, NULL, NULL, 'Màn hình: 14.6” Super AMOLED, 120Hz\r\n\r\nChip: Snapdragon 8 Gen 2\r\n\r\nRAM: 12GB\r\n\r\nBộ nhớ: 256GB (hỗ trợ microSD)\r\n\r\nCamera: 13MP + 8MP / Selfie kép 12MP\r\n\r\nPin: 11200mAh, sạc nhanh 45W\r\n\r\nBút cảm ứng: Tặng kèm S Pen\r\n\r\nCổng sạc: USB-C', 'Imax 24 Pro', 70000000.00, NULL, 'imax-24-pro-1746870019286.jpg', '2025-05-10 16:40:19.000000', NULL),
(21, 10, 8, '2025-05-10 16:50:00.000000', 2, NULL, NULL, 'san pham moi', 'LapTop SoGx', 48000000.00, NULL, 'laptop-sogx-1746870600515.jpg', '2025-05-10 16:50:00.000000', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `topics`
--

INSERT INTO `topics` (`id`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `description`, `name`, `updated_at`, `updated_by`) VALUES
(1, '2025-04-20 15:03:59.000000', NULL, NULL, NULL, 'mới thêm', 'mới thêm', '2025-04-20 15:03:59.000000', NULL),
(3, '2025-04-21 08:58:21.000000', 2, NULL, NULL, NULL, 'mới sửa', '2025-04-21 08:58:54.000000', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `deleted_at` datetime(6) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `address`, `avatar`, `created_at`, `created_by`, `deleted_at`, `deleted_by`, `email`, `full_name`, `password`, `phone`, `role`, `updated_at`, `updated_by`) VALUES
(2, '21 đường 22 phường Phước Long B', 'nguyen-phuong-nam.jpg', '2025-04-19 10:50:53.000000', NULL, NULL, NULL, 'nam@gmail.com', 'Nguyen Phuong Nam', '123123', '0961251656', 'admin', '2025-05-06 22:22:06.000000', NULL),
(6, 'tphcm', 'hehehe.webp', '2025-04-19 21:42:38.000000', NULL, NULL, NULL, 'hehe@gmail.com', 'mới sửa', '123123', '2222222221', 'admin', '2025-04-20 22:08:29.000000', NULL),
(8, 'Tổ 10 khu phố 7A phường long bình Biên Hòa Đồng Nai', 'nguyen-tuan-anh.png', '2025-05-09 16:39:26.000000', NULL, NULL, NULL, 'tuan@gmail.com', 'Nguyen Tuan Anh', '123123', '0379559608', 'customer', '2025-05-09 16:39:26.000000', NULL),
(10, 'Tổ 10 khu phố 7A phường long bình Biên Hòa Đồng Nai', 'nguyen-hoang-long.png', '2025-05-09 16:40:28.000000', NULL, NULL, NULL, 'Long@gmail.com', 'Nguyen Hoang Long', '123123', '0379559608', 'customer', '2025-05-09 16:40:28.000000', NULL),
(11, 'Tổ 10 khu phố 7A phường long bình Biên Hòa Đồng Nai', 'nguyen-phuong-uyen.png', '2025-05-09 16:45:08.000000', NULL, NULL, NULL, 'uyen@gmail.com', 'Nguyễn Phuong Uyên', '123123', '0379559608', 'customer', '2025-05-09 16:45:08.000000', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6osclwf271vehfepcym3k1839` (`created_by`),
  ADD KEY `FK8fh7t10dmkytrnw8d6k77md41` (`deleted_by`),
  ADD KEY `FKglsdaljqdr1pagfew65a8xffc` (`updated_by`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5yfru0au6kpyqs4tonky5vfne` (`created_by`),
  ADD KEY `FKdq18goagfq0ra9m5johdqyy0g` (`deleted_by`),
  ADD KEY `FKnbfq7vefwik42v5ka12ekr4hv` (`updated_by`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKtjwuphstqm46uffgc7l1r27a9` (`created_by`),
  ADD KEY `FKcpaialgcvbuqn1m2jpsasb2y8` (`deleted_by`),
  ADD KEY `FKlp4lgmbltaqb2no1dqdceogto` (`updated_by`),
  ADD KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt16iq569w3mfuv4ym7lkx8qs3` (`created_by`),
  ADD KEY `FK3mmbvu3yx9mjrjwblt1e7j0vt` (`deleted_by`),
  ADD KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  ADD KEY `FK4q98utpd73imf4yhttm3w0eax` (`product_id`),
  ADD KEY `FKgnfvuvpntgkyo3nd8rl4pby9i` (`updated_by`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4s8wtgwpo1h8p5tsy9f04ybjg` (`created_by`),
  ADD KEY `FKr2pufx4n0tm911hoqj7kdqgh` (`deleted_by`),
  ADD KEY `FKrfchr8dax0kfngvvkbteh5n7h` (`topic_id`),
  ADD KEY `FKsbta2b48v5gachv43ylk3mli4` (`updated_by`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  ADD KEY `FKl0lce8i162ldn9n01t2a6lcix` (`created_by`),
  ADD KEY `FK1bljl3jcfk1bleryfp6ka9bbm` (`deleted_by`),
  ADD KEY `FKdeswm6d74skv6do803axl6edj` (`updated_by`);

--
-- Chỉ mục cho bảng `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKaewa94ts0j1piw2o5mr9lu5ec` (`created_by`),
  ADD KEY `FK4p76g73qfeneq3nm7tjnoa0lh` (`deleted_by`),
  ADD KEY `FKjpfjceeqjmehucyqndtep49qi` (`updated_by`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `FK6osclwf271vehfepcym3k1839` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK8fh7t10dmkytrnw8d6k77md41` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKglsdaljqdr1pagfew65a8xffc` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `FK5yfru0au6kpyqs4tonky5vfne` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKdq18goagfq0ra9m5johdqyy0g` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKnbfq7vefwik42v5ka12ekr4hv` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKcpaialgcvbuqn1m2jpsasb2y8` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKlp4lgmbltaqb2no1dqdceogto` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKtjwuphstqm46uffgc7l1r27a9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK3mmbvu3yx9mjrjwblt1e7j0vt` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK4q98utpd73imf4yhttm3w0eax` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKgnfvuvpntgkyo3nd8rl4pby9i` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKt16iq569w3mfuv4ym7lkx8qs3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `FK4s8wtgwpo1h8p5tsy9f04ybjg` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKr2pufx4n0tm911hoqj7kdqgh` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKrfchr8dax0kfngvvkbteh5n7h` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`),
  ADD CONSTRAINT `FKsbta2b48v5gachv43ylk3mli4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK1bljl3jcfk1bleryfp6ka9bbm` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKa3a4mpsfdf4d2y6r8ra3sc8mv` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `FKdeswm6d74skv6do803axl6edj` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKl0lce8i162ldn9n01t2a6lcix` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Các ràng buộc cho bảng `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `FK4p76g73qfeneq3nm7tjnoa0lh` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKaewa94ts0j1piw2o5mr9lu5ec` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKjpfjceeqjmehucyqndtep49qi` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
