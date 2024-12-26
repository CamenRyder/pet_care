import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/model/order_model.dart';
import 'package:pet_care/model/order_state_model.dart';
import 'package:pet_care/views/schedule_management_page.dart';

import '../controller/system_controller.dart';

class OrderPage extends StatefulWidget {
  OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // Dữ liệu đơn hàng giả lập
  List<OrderModel> orders = [];
  final systemController = Get.find<SystemController>();
  @override
  void initState() {
    super.initState();
    orders = systemController.orderDetail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: const Text(
          'Danh sách đơn đặt hàng',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        backgroundColor: const Color.fromARGB(255, 154, 59, 59), // Màu chủ đạo
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return ListView.builder(
            itemCount: systemController.orderDetail.length,
            itemBuilder: (context, index) {
              return OrderCard(order: systemController.orderDetail[index]);
            },
          );
        }),
      ),
    );
  }
}

class OrderCard extends StatefulWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late String _orderStatus;
  late OrderModel _order;
  final systemControler = Get.find<SystemController>();
  @override
  void initState() {
    super.initState();
    _orderStatus = widget.order.stateOrder.name; // Khởi tạo trạng thái ban đầu
    _order = widget.order;
  }

  // Hàm thay đổi trạng thái đơn hàng
  void _updateOrderStatus(OrderStateModel status) {
    setState(() {
      _order.stateOrder = status;
      _orderStatus = status.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      shadowColor: Colors.black.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tên người đặt và ngày tạo đơn
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _order.nameOrder,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 154, 59, 59), // Màu chủ đạo
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  _order.dateCreate,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                systemControler.userPicked.value.id == 99
                    ? PopupMenuButton<OrderStateModel>(
                        onSelected: (OrderStateModel status) {
                          _updateOrderStatus(status);
                        },
                        itemBuilder: (context) => [
                          for (var status in systemControler.orderState)
                            PopupMenuItem(
                              value: status,
                              child: Text(status.name),
                            ),
                        ],
                        icon: const Icon(Icons.more_vert),
                      )
                    : const SizedBox(),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    _order.products.first.pathImages,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                // Danh sách sản phẩm trong đơn
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sản phẩm:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      for (var product in _order.products)
                        Row(
                          children: [
                            Text(
                              '- ${product.productName} ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                          ],
                        )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Giá tiền tổng và trạng thái đơn
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng: ${(_order.totalPrice)}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 154, 59, 59), // Màu chủ đạo
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(_order.stateOrder.id),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _orderStatus,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // Hàm lấy màu sắc cho trạng thái đơn
  Color _getStatusColor(int status) {
    switch (status) {
      case 0:
        return Colors.orange;
      case 1:
        return Colors.blue;
      case 2:
        return Colors.green;
      case 3:
        return Colors.red;
      case 4:
        return Colors.greenAccent;
      case 5:
        return Colors.amber;

      default:
        return Colors.grey;
    }
  }
}

// Mô hình dữ liệu đơn hàng
class Order {
  final String customerName;
  final DateTime createdAt;
  final String imageUrl;
  final double totalPrice;
  final List<String> products;
  String orderStatus; // Trạng thái có thể thay đổi

  Order({
    required this.customerName,
    required this.createdAt,
    required this.imageUrl,
    required this.totalPrice,
    required this.products,
    required this.orderStatus,
  });
}
