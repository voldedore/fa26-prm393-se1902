import 'package:adaptive_layout/list_product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /**************************** MediaQuery ************************/
    // Lấy thông tin liên quan đến kích thước màn hình
    // final mq = MediaQuery.of(context);
    // print('Width = ${mq.size.width}');
    // print('Height = ${mq.size.height}');
    // print('Aspect ratio = ${mq.size.aspectRatio}');
    // print('Orientation = ${mq.orientation}');

    // My an lien
    // return Scaffold(body: ListProduct(col: mq.orientation == Orientation.portrait ? 2 : 3));

    // 1st xac dinh orientation
    // if (mq.orientation == .portrait) {
    //   return Scaffold(body: ListProduct(col: 2));
    // } else {
    //   return Scaffold(body: ListProduct(col: 3));
    // }

    // 2nd xac dinh theo kich thuoc cua screen
    // final isWide = mq.size.width >= 500;
    // if (!isWide) {
    //   return Scaffold(body: ListProduct(col: 2));
    // } else {
    //   return Scaffold(body: ListProduct(col: 3));
    // }

    /************** LAYOUT BUILDER ***************/
    // return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
    //   if (constraint.maxWidth >= 500) {
    //     return ListProduct(col: 3);
    //   } else {
    //     return ListProduct(col: 2);
    //   }
    // }));


    // Bai tap 2:
    // Xay dung them 3 'menu' cho Drawer
    // - Home
    // - Login
    // - Settings
    // Handle case:
    // - Portrait: hien thi menu nhu 1 drawer
    // - Landscape: luon hien thi menu ben trai cua ListProduct, ko dung Drawer

    /*************** OrientationBuilder ************/
    return Scaffold(
        appBar: AppBar(title: Text('Adaptive & Responsive')),
        drawer: Drawer(),
        body: OrientationBuilder(builder: (context, orientation) {
        if (orientation == .landscape) {
          return ListProduct(col: 3);
        } else {
          return ListProduct(col: 2);
        }
    }));
  }
}
