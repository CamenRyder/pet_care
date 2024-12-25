import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/controller/system_controller.dart';

import '../model/product_model.dart';

final List<Map<String, dynamic>> products = [
  {
    'image': 'assets/images/xitthom.jpg', // URL hoặc tài nguyên hình ảnh
    'name': 'Chai xịt thơm động vật',
    'price': '38,0000 VND',
    'quantity': 14
  },
  {
    'image': 'assets/images/xitthom2.jpg',
    'name': 'Chai xịt thơm động vật Đức Quốc Xã',
    'price': '2,000,000 VND',
    'quantity': 5
  },
  {
    'image': 'assets/images/xitthom3.jpg',
    'name': 'Golden Time chai xịt thơm',
    'price': '3,000,000 VND',
    'quantity': 8
  },
  {
    'image': 'assets/images/suatam6.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/snackchocho.jpg', // URL hoặc tài nguyên hình ảnh
    'name': 'Chai xịt thơm động vật',
    'price': '21,000 VND',
    'quantity': 14
  },
  {
    'image': 'assets/images/snackchocho2.jpg',
    'name': 'Chai xịt thơm động vật Đức Quốc Xã',
    'price': '2,000,000 VND',
    'quantity': 5
  },
  {
    'image': 'assets/images/snackchocho3.jpg',
    'name': 'Golden Time chai xịt thơm',
    'price': '3,000,000 VND',
    'quantity': 8
  },
  {
    'image': 'assets/images/snackchocho4.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/snackchocho5.jpg',
    'name': 'Chai xịt thơm động vật Đức Quốc Xã',
    'price': '2,000,000 VND',
    'quantity': 5
  },
  {
    'image': 'assets/images/snackchocho6.jpg',
    'name': 'Golden Time chai xịt thơm',
    'price': '3,000,000 VND',
    'quantity': 8
  },
  {
    'image': 'assets/images/suatamduonglong.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatamduonglong2.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatamduonglong3.jpg',
    'name': 'chai xịt thơm Đức Quốc a',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatam.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatam2.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatam3.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatam4.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatam5.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
  {
    'image': 'assets/images/suatam6.jpg',
    'name': 'chai xịt thơm Đức Quốc Xã',
    'price': '2,500,000 VND',
    'quantity': 7
  },
];

class ProductPage extends StatelessWidget {
  // Dữ liệu giả lập cho sản phẩm
  final systemController = Get.put(SystemController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Số cột
          crossAxisSpacing: 8, // Khoảng cách giữa các cột
          mainAxisSpacing: 8, // Khoảng cách giữa các dòng
          childAspectRatio: 0.75, // Tỉ lệ chiều rộng/chiều cao của mỗi item
        ),
        itemCount: systemController.products.length,
        itemBuilder: (context, index) {
          ProductModel product = systemController.products[index];
          return ProductCard(
            image: product.pathImages,
            name: product.productName,
            price: product.price,
            quantity: product.stockQuanity,
          );
        },
      ),
    );
  }
}

// Widget cho từng sản phẩm trong GridView
class ProductCard extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final int quantity;

  const ProductCard({
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hình ảnh sản phẩm
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên sản phẩm
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                // Giá sản phẩm
                Text(
                  'Giá: $price',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                // Số lượng
                Text(
                  'Số lượng: $quantity',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
