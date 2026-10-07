import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData create(Brightness brightness) {
    // Khai báo 1 tông màu từ 'hạt giống' (seed) màu
    final colorScheme = ColorScheme.fromSeed(seedColor: Color(0xFAFA23C6), brightness: brightness);
    // Khai báo 1 ThemeData toàn cục cho cả ứng dụng,
    // dùng MaterialDesign 3 và tông màu đã tạo bên trên
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme
    );
    // copyWith = dựa trên cái default, ta custom lại 1 số theme riêng biệt
    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        titleLarge: base.textTheme.titleLarge?.copyWith(
          fontWeight: .bold
        ),
        bodyMedium: base.textTheme.bodyMedium?.copyWith(
          height: 1.4,
          fontWeight: .w100
        )
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom( // styleFrom = tạo Style mới
          shape: RoundedRectangleBorder(
            borderRadius: .circular(12)
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12)
        )
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.secondaryContainer,
      )
    );
  }
}