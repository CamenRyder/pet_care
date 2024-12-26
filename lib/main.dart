import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/controller/system_controller.dart';

import 'model/category_model.dart';
import 'model/product_model.dart';
import 'views/add_product.dart';
import 'views/cart_page.dart';
import 'views/login_screen.dart';
import 'views/product_page.dart';
import 'views/category_page.dart';
import 'views/order_page.dart';
import 'views/doctor_management_page.dart';
import 'views/schedule_management_page.dart';

// dart run flutter_launcher_icons:generate
final primaryColor = const Color.fromARGB(255, 154, 59, 59);
void main() {
  runApp(PetShopApp());
}

class PetShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Shop App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SystemController systemController;
  @override
  void initState() {
    systemController = Get.put(SystemController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 154, 59, 59),
        title: const Text(
          'Pet Shop App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Get.to(() => AddProductPage());
            },
          ),
        ],
      ),
      body: ProductPage(), // Mặc định hiển thị trang Sản phẩm
      backgroundColor: backgroundColor,
      drawer: RightDrawer(),
      // endDrawer: const RightDrawer(),
    );
  }
}

class RightDrawer extends StatelessWidget {
  RightDrawer({super.key});
  final systemController = Get.find<SystemController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 154, 59, 59),
            ),
            child: Center(
              child: const Text(
                'Pet Care',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  title: const Text('Sản phẩm'),
                  onTap: () {
                    Get.back();
                    // Get.to(() => ProductPage());
                  },
                ),
                systemController.userPicked.value.id == 99
                    ? ListTile(
                        title: const Text('Danh mục sản phẩm'),
                        onTap: () {
                          Get.to(() => CategoryPage());
                        },
                      )
                    : const SizedBox(),
                ListTile(
                  title: const Text('Đơn hàng'),
                  onTap: () {
                    Get.to(() => OrderPage());
                  },
                ),
                systemController.userPicked.value.id != 99
                    ? ListTile(
                        title: const Text('Quản lí giỏ hàng'),
                        onTap: () {
                          Get.to(() => CartPage(
                                cartProducts: [
                                  ProductModel(
                                      id: 2,
                                      productName: "Sữa tắm",
                                      price: "212.000 VND",
                                      stockQuanity: 5,
                                      categories: [
                                        CategoryModel(id: 1, name: "Sữa tắm"),
                                      ],
                                      description: "Sữa tắm cho thú cưng",
                                      pathImages: 'assets/images/suatam4.jpg'),
                                  ProductModel(
                                      id: 1,
                                      productName: "Sữa tắm",
                                      price: "212.000 VND",
                                      stockQuanity: 5,
                                      categories: [
                                        CategoryModel(id: 1, name: "Sữa tắm"),
                                      ],
                                      description: "Sữa tắm cho thú cưng",
                                      pathImages: 'assets/images/suatam4.jpg'),
                                  ProductModel(
                                      id: 1,
                                      productName: "Sữa tắm",
                                      price: "212.000 VND",
                                      stockQuanity: 5,
                                      categories: [
                                        CategoryModel(id: 1, name: "Sữa tắm"),
                                      ],
                                      description: "Sữa tắm cho thú cưng",
                                      pathImages: 'assets/images/suatam4.jpg'),
                                ],
                              ));
                        },
                      )
                    : const SizedBox(),
                systemController.userPicked.value.id == 99
                    ? ListTile(
                        title: const Text('Quản lí bác sĩ'),
                        onTap: () {
                          Get.to(() => DoctorManagementPage());
                        },
                      )
                    : const SizedBox(),
                systemController.userPicked.value.id == 99
                    ? ListTile(
                        title: const Text('Quản lí khung giờ'),
                        onTap: () {
                          Get.to(() => const ScheduleManagementPage());
                        },
                      )
                    : const SizedBox(),
                ListTile(
                  title: const Text('Đăng xuất'),
                  onTap: () {
                    Get.to(() => LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
