import 'package:get/get.dart';
import 'package:pet_care/model/category_model.dart';
import 'package:pet_care/model/doctor_model.dart';
import 'package:pet_care/model/major_model.dart';
import 'package:pet_care/model/order_state_model.dart';
import 'package:pet_care/model/product_model.dart';
import 'package:pet_care/model/working_time.dart';

import '../model/order_model.dart';
import '../model/user_model.dart';

const String description =
    "Bác sĩ thú y chuyên ngành nội khoa là chuyên gia chăm sóc sức khỏe cho động vật, đặc biệt là các bệnh lý liên quan đến các cơ quan nội tạng như tiêu hóa, hô hấp, tim mạch, và nội tiết. Họ chẩn đoán, điều trị các bệnh phức tạp và mạn tính, sử dụng phương pháp hiện đại như xét nghiệm, siêu âm, và hình ảnh học. Ngoài kỹ năng chuyên môn, bác sĩ thú y nội khoa còn cần khả năng giao tiếp tốt để tư vấn cho chủ vật nuôi về tình trạng và phương pháp điều trị, đảm bảo sức khỏe và chất lượng sống của động vật.";

class SystemController extends GetxController {
  var userPicked =
      UserModel(fullName: "Admin", id: 99, password: "Admin", username: 'Admin')
          .obs;
  List<UserModel> users = [
    UserModel(fullName: "Admin", id: 99, password: "Admin", username: 'Admin'),
    UserModel(
        fullName: "Admin01",
        id: 1,
        password: 'PhamHoaiThuong',
        username: 'PhamHoaiThuong'),
    UserModel(
        fullName: "Admin02",
        id: 2,
        password: 'NguyenMinhQuang',
        username: 'NguyenMinhQuang'),
    UserModel(
        fullName: "Admin03",
        id: 3,
        password: 'NguyenQuangTrai',
        username: 'NguyenQuangTrai'),
  ];
// ['Sữa tắm', 'Thức ăn', 'Xịt thơm', 'Quần áo'];

  List<CategoryModel> categories = [
    CategoryModel(id: 1, name: "Sữa tắm"),
    CategoryModel(id: 2, name: "Thức ăn"),
    CategoryModel(id: 3, name: "Quần áo"),
    CategoryModel(id: 4, name: "Xịt thơm"),
  ];

  List<WorkingTime> workingTime = [
    WorkingTime(id: 0, name: "Ca sáng", timeStart: "8:00", timeEnd: "12:00"),
    WorkingTime(id: 1, name: "Ca chiều", timeStart: "13:00", timeEnd: "16:30"),
    WorkingTime(id: 2, name: "Ca tối", timeStart: "18:00", timeEnd: "22:00"),
  ];
  // faculty

  final faculties = <ProductModel>[].obs;

  addProduct(ProductModel product) {
    faculties.add(product);
    Get.showSnackbar(const GetSnackBar(
      message: 'Thêm sản phẩm thành công',
      duration: Duration(seconds: 1),
    ));
  }

  clearProduct() {
    faculties.clear();
  }

  final products = <ProductModel>[
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
        id: 2,
        productName: "Sữa tắm",
        price: "212.000 VND",
        stockQuanity: 5,
        categories: [
          CategoryModel(id: 1, name: "Sữa tắm"),
        ],
        description: "Sữa tắm cho thú cưng",
        pathImages: 'assets/images/suatam4.jpg'),
  ].obs;

  final majors = <MajorModel>[
    MajorModel(id: 0, majorName: "Chuyên chó nội khoa"),
    MajorModel(id: 1, majorName: "Chuyên chó ngoại khoa"),
    MajorModel(id: 2, majorName: "Chuyên mèo nội khoa"),
    MajorModel(id: 3, majorName: "Chuyên mèo ngoại khoa"),
    MajorModel(id: 4, majorName: "Chuyên bò sát"),
    MajorModel(id: 5, majorName: "Chuyên gia dinh dưỡng động vật"),
  ].obs;

  final doctors = <DoctorModel>[
    DoctorModel(
        id: 1,
        intro: description,
        major: MajorModel(id: 0, majorName: "Chuyên chó nội khoa"),
        timeWorking: [
          WorkingTime(
              id: 0, name: "Ca sáng", timeStart: "8:00", timeEnd: "12:00"),
          WorkingTime(
              id: 1, name: "Ca chiều", timeStart: "13:00", timeEnd: "16:30")
        ],
        name: "David Backham",
        pathUrlAvatar: "assets/images/bacsi1.png",
        pirce: "212.000 VNĐ",
        yearsOfExp: 5),
    DoctorModel(
        id: 2,
        intro: description,
        major: MajorModel(id: 1, majorName: "Chuyên chó ngoại khoa"),
        timeWorking: [
          WorkingTime(
              id: 0, name: "Ca sáng", timeStart: "8:00", timeEnd: "12:00"),
          WorkingTime(
              id: 1, name: "Ca chiều", timeStart: "13:00", timeEnd: "16:30")
        ],
        name: "Ronaldo Backham",
        pathUrlAvatar: "assets/images/bacsi1.png",
        pirce: "128.000 VNĐ",
        yearsOfExp: 3),
    DoctorModel(
        id: 1,
        intro: description,
        major: MajorModel(id: 0, majorName: "Chuyên chó nội khoa"),
        timeWorking: [
          WorkingTime(
              id: 0, name: "Ca sáng", timeStart: "8:00", timeEnd: "12:00"),
          WorkingTime(
              id: 1, name: "Ca chiều", timeStart: "13:00", timeEnd: "16:30")
        ],
        name: "David Backham",
        pathUrlAvatar: "assets/images/bacsi1.png",
        pirce: "212.000 VNĐ",
        yearsOfExp: 5),
    DoctorModel(
        id: 2,
        intro: description,
        major: MajorModel(id: 1, majorName: "Chuyên chó ngoại khoa"),
        timeWorking: [
          WorkingTime(
              id: 0, name: "Ca sáng", timeStart: "8:00", timeEnd: "12:00"),
          WorkingTime(
              id: 1, name: "Ca chiều", timeStart: "13:00", timeEnd: "16:30")
        ],
        name: "Ronaldo Backham",
        pathUrlAvatar: "assets/images/bacsi1.png",
        pirce: "128.000 VNĐ",
        yearsOfExp: 3),
    DoctorModel(
        id: 1,
        intro: description,
        major: MajorModel(id: 0, majorName: "Chuyên chó nội khoa"),
        timeWorking: [
          WorkingTime(
              id: 0, name: "Ca sáng", timeStart: "8:00", timeEnd: "12:00"),
          WorkingTime(
              id: 1, name: "Ca chiều", timeStart: "13:00", timeEnd: "16:30")
        ],
        name: "David Backham",
        pathUrlAvatar: "assets/images/bacsi1.png",
        pirce: "212.000 VNĐ",
        yearsOfExp: 5),
    DoctorModel(
        id: 2,
        intro: description,
        major: MajorModel(id: 1, majorName: "Chuyên chó ngoại khoa"),
        timeWorking: [
          WorkingTime(
              id: 0, name: "Ca sáng", timeStart: "8:00", timeEnd: "12:00"),
          WorkingTime(
              id: 1, name: "Ca chiều", timeStart: "13:00", timeEnd: "16:30")
        ],
        name: "Ronaldo Backham",
        pathUrlAvatar: "assets/images/bacsi1.png",
        pirce: "128.000 VNĐ",
        yearsOfExp: 3),
  ].obs;
  final orderDetail = <OrderModel>[
    OrderModel(
        dateCreate: "2021-10-10",
        id: 1,
        totalPrice: '821.000 VNĐ',
        nameOrder: "Order 1",
        stateOrder: OrderStateModel(id: 0, name: 'Mới'),
        products: [
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
        ]),
    OrderModel(
        dateCreate: "2021-10-10",
        id: 1,
        totalPrice: '821.000 VNĐ',
        nameOrder: "Order 1",
        stateOrder: OrderStateModel(id: 0, name: 'Mới'),
        products: [
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
        ]),
    OrderModel(
        dateCreate: "2021-10-10",
        id: 1,
        totalPrice: '821.000 VNĐ',
        nameOrder: "Order 1",
        stateOrder: OrderStateModel(id: 0, name: 'Mới'),
        products: [
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
        ]),
    OrderModel(
        dateCreate: "2021-10-10",
        id: 1,
        totalPrice: '821.000 VNĐ',
        nameOrder: "Order 1",
        stateOrder: OrderStateModel(id: 0, name: 'Mới'),
        products: [
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
          ProductModel(
            id: 1,
            productName: "Sữa tắm",
            price: "212.000 VNĐ",
            stockQuanity: 5,
            categories: [
              CategoryModel(id: 1, name: "Sữa tắm"),
            ],
            description: description,
            pathImages: 'assets/images/suatamduonglong.jpg',
          ),
        ])
  ].obs;

  List<OrderStateModel> orderState = [
    OrderStateModel(id: 0, name: 'Mới'),
    OrderStateModel(id: 1, name: 'Đang vận chuyển.'),
    OrderStateModel(id: 3, name: 'Hủy bỏ.'),
    OrderStateModel(id: 4, name: 'Hoàn thành.'),
    OrderStateModel(id: 4, name: 'Xác nhận đơn hàng.'),
  ];

  getListProducts() {
    return products;
  }
}
