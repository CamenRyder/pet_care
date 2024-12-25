import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/controller/system_controller.dart';
import 'package:pet_care/main.dart';
import 'package:pet_care/model/category_model.dart';
import 'package:pet_care/views/schedule_management_page.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // Dữ liệu danh mục sản phẩm giả lập

  List<CategoryModel> categoryList = [];

  final systemController = Get.find<SystemController>();

  // Hàm hiển thị Dialog để tạo hoặc sửa danh mục
  void _showCategoryDialog({String? initialCategory, int? index}) {
    final TextEditingController controller = TextEditingController(
      text: initialCategory ?? '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tiêu đề Dialog
                Text(
                  initialCategory == null ? 'Tạo danh mục' : 'Sửa danh mục',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 154, 59, 59), // Màu chủ đạo
                  ),
                ),
                const SizedBox(height: 16),
                // TextField nhập tên danh mục
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.category, color: Colors.grey),
                    hintText: 'Nhập tên danh mục',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 154, 59, 59),
                      ),
                    ),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                // Các nút hành động (Hủy và Lưu)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Nút Hủy
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Hủy',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Nút Lưu
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (index != null) {
                            // Sửa tên danh mục
                            categoryList[index].name = controller.text;
                          } else {
                            // Tạo mới danh mục
                            categoryList.add(
                                CategoryModel(id: 6, name: controller.text));
                          }
                        });
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 154, 59, 59), // Màu chủ đạo
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Lưu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Hàm hiển thị Dialog xác nhận xóa danh mục
  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            'Xác nhận xóa',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text('Bạn có chắc chắn muốn xóa danh mục này không?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back(); // Đóng hộp thoại
              },
              child: const Text('Hủy'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  categoryList.removeAt(index); // Xóa danh mục
                });
                Get.back(); // Đóng hộp thoại xác nhận
              },
              child: const Text('Xóa', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryList = systemController.categories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              systemController.categories = categoryList;
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 24,
              color: Colors.white,
            )),
        title: const Text(
          'Danh mục sản phẩm',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        backgroundColor: primaryColor, // Màu chủ đạo
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => _showCategoryDialog(),
            tooltip: 'Thêm danh mục',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadowColor: Colors.black.withOpacity(0.2),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  title: Text(
                    categoryList[index].name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 154, 59, 59),
                    ),
                  ),
                  subtitle: Text(
                    'Nhấn để chỉnh sửa hoặc xóa',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showCategoryDialog(
                          initialCategory: categoryList[index].name,
                          index: index,
                        ),
                        tooltip: 'Sửa danh mục',
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _showDeleteConfirmationDialog(index),
                        tooltip: 'Xóa danh mục',
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
