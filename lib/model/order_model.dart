import 'package:pet_care/model/order_state_model.dart';
import 'package:pet_care/model/product_model.dart';

class OrderModel {
  int id;
  String nameOrder;
  List<ProductModel> products;
  String totalPrice;
  String dateCreate;
  OrderStateModel stateOrder;

  OrderModel(
      {required this.dateCreate,
      required this.id,
      required this.nameOrder,
      required this.products,
      required this.stateOrder,
      required this.totalPrice});
}
