import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pet_care/controller/system_controller.dart';
import 'package:pet_care/model/category_model.dart';
import '../model/product_model.dart';

class DetailProductPage extends StatefulWidget {
  final ProductModel product;

  const DetailProductPage({required this.product});

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;
  late TextEditingController _quantityController;
  bool _isEditing = false;
  final systemController = Get.find<SystemController>();
  late CategoryModel _selectedCategory;
  List<CategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.product.productName);
    _priceController =
        TextEditingController(text: widget.product.price.toString());
    _descriptionController =
        TextEditingController(text: widget.product.description);
    _categoryController =
        TextEditingController(text: widget.product.categories.join(','));
    _quantityController =
        TextEditingController(text: widget.product.stockQuanity.toString());
    _selectedCategory = widget.product.categories.isEmpty
        ? CategoryModel(id: 99, name: "Chưa có danh mục")
        : widget.product.categories[0];
    _categories = systemController.categories;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      widget.product.productName = _nameController.text;
      widget.product.price = _priceController.text;
      widget.product.description = _descriptionController.text;
      widget.product.categories = [
        _selectedCategory
      ]; //_categoryController.text;
      widget.product.stockQuanity = int.parse(_quantityController.text);
      _isEditing = false;
    });
    // Handle save changes to the backend or database
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        backgroundColor: const Color.fromARGB(255, 154, 59, 59),
        title: const Text(
          'Chi tiết sản phẩm',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isEditing ? Icons.save : Icons.edit,
              color: Colors.white,
            ),
            onPressed: _isEditing ? _saveChanges : _toggleEdit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.product.pathImages,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            _isEditing
                ? TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Tên sản phẩm',
                      border: OutlineInputBorder(),
                    ),
                  )
                : Text(
                    widget.product.productName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(height: 16),
            _isEditing
                ? TextField(
                    controller: _priceController,
                    decoration: const InputDecoration(
                      labelText: 'Giá tiền ',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  )
                : Text(
                    'Giá tiền:  ${widget.product.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            const SizedBox(height: 16),
            _isEditing
                ? TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Thông tin sản phẩm',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Thông tin sản phẩm'),
                      Text(
                        widget.product.description,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
            const SizedBox(height: 16),
            _isEditing
                ? const SizedBox()
                // ? DropdownButtonFormField<CategoryModel>(
                //     value: _selectedCategory,
                //     decoration: const InputDecoration(
                //       labelText: 'Danh mục sản phẩm',
                //       border: OutlineInputBorder(),
                //     ),
                //     items: _categories
                //         .map((category) => DropdownMenuItem<CategoryModel>(
                //               value: category,
                //               child: Text(category.name),
                //             ))
                //         .toList(),
                //     onChanged: (newValue) {
                //       setState(() {
                //         _selectedCategory = newValue!;
                //       });
                //     },
                //   )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Thuộc danh mục: ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: widget.product.categories
                            .map((category) => Chip(
                                  backgroundColor: Colors.blue,
                                  label: Text(
                                    category.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ))
                            .toList(),
                      )
                    ],
                  ),
            const SizedBox(height: 16),
            _isEditing
                ? TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(
                      labelText: 'Số lượng sản phảm',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  )
                : Text(
                    'Số lượng sản phảm: ${widget.product.stockQuanity}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
