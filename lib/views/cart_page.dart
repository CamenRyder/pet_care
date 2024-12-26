import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import '../controller/system_controller.dart';
import '../model/product_model.dart';

class CartPage extends StatefulWidget {
  final List<ProductModel> cartProducts;

  const CartPage({required this.cartProducts});

  @override
  _CartPageState createState() => _CartPageState();
}

double parseCurrency(String input) {
  // Loại bỏ các ký tự không phải số hoặc dấu chấm thập phân
  String sanitizedInput = input.replaceAll(RegExp(r'[^0-9.]'), '');

  // Kiểm tra xem chuỗi sau khi loại bỏ đã thành công hay không
  if (sanitizedInput.isEmpty) {
    throw FormatException("Input không hợp lệ");
  }

  // Chuyển chuỗi đã làm sạch thành double
  return double.tryParse(sanitizedInput) ?? 0.0;
}

double totalPrice = 0;

class _CartPageState extends State<CartPage> {
  void _removeProduct(int index) {
    setState(() {
      widget.cartProducts.removeAt(index);
    });
  }

  final systemController = Get.find<SystemController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() {
              totalPrice = systemController.faculties
                  .fold(0, (sum, item) => sum + parseCurrency(item.price));
              return Expanded(
                child: ListView.builder(
                  itemCount: systemController.faculties.length,
                  itemBuilder: (context, index) {
                    final product = systemController.faculties[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        leading: Image.asset(
                          product.pathImages,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.productName),
                        subtitle: Text('Giá: ${product.price}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () => _removeProduct(index),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(height: 16),
            Text(
              'Tổng tiền: \$${totalPrice.toStringAsFixed(3)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                child: const Center(
                    child: Text(
                  'Thanh toán',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
