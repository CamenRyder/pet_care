import 'package:pet_care/model/category_model.dart';

class ProductModel {
  int id;
  String productName;
  String pathImages;
  String description;
  String price;
  int stockQuanity;
  List<CategoryModel> categories;
  ProductModel(
      {required this.description,
      required this.stockQuanity,
      required this.id,
      required this.price,
      required this.categories,
      required this.pathImages,
      required this.productName});
}
