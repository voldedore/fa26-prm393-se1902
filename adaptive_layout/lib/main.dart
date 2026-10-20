import 'package:adaptive_layout/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Bai tap
// Viet 1 widget (file list_product.dart), ListProduct
// Xây dựng 1 GridView để hiển thị danh sách sp dạng lưới
// - Có thể dùng List.generate để sinh ra 20 products (grid items)
// - GridView hiển thị 3 cột
// - Mỗi grid item là 1 widget Card, trong đó có
//    tên sp dạng "Product #X" X là số tự tăng từ 1, và 1 nút add to cart
//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
