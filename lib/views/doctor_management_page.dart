import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/model/doctor_model.dart';
import 'package:pet_care/model/major_model.dart';
import 'package:pet_care/model/working_time.dart';
import 'package:pet_care/views/help_function.dart';
import 'package:pet_care/views/schedule_management_page.dart';

import '../controller/system_controller.dart';

class Doctor {
  final String image;
  final String name;
  final String specialty;
  final String phone;
  final int experience;
  final double consultationFee;

  Doctor({
    required this.image,
    required this.name,
    required this.specialty,
    required this.phone,
    required this.experience,
    required this.consultationFee,
  });
}

class DoctorManagementPage extends StatefulWidget {
  @override
  _DoctorManagementPageState createState() => _DoctorManagementPageState();
}

class _DoctorManagementPageState extends State<DoctorManagementPage> {
  TextEditingController searchController = TextEditingController();

  List<DoctorModel> doctorsList = [];

  MajorModel majorModel = MajorModel(id: 1, majorName: "Thú y");

  List<DoctorModel> get filteredDoctors {
    if (searchController.text.isEmpty) {
      return doctorsList;
    } else {
      return doctorsList
          .where((doctor) => doctor.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }
  }

  final systemController = Get.find<SystemController>();

  // Thêm bác sĩ mới
  void addDoctor(DoctorModel doctor) {
    setState(() {
      doctorsList.add(doctor);
    });
  }

  // Chỉnh sửa thông tin bác sĩ
  void editDoctor(int index, DoctorModel updatedDoctor) {
    setState(() {
      doctorsList[index] = updatedDoctor;
    });
  }

  // Xóa bác sĩ
  void deleteDoctor(int index) {
    setState(() {
      doctorsList.removeAt(index);
    });
  }

  // Tạo UI tìm kiếm
  Widget buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Tìm kiếm bác sĩ...',
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
        ),
        // items: doctorsList.map((DoctorModel doctor) {
        //   return DropdownMenuItem<String>(
        //     value: doctor.name,
        //     child: Text(doctor.name),
        //   );
        // }).toList(),
        // onSubmitted: (value) {
        //   searchController.text = value;
        //   filteredDoctors;
        // },
        onChanged: (value) {
          setState(() {
            searchController.text = value;
            filteredDoctors;
          });
        },
      ),
    );
  }

  // Tạo UI cho mỗi item bác sĩ trong ListView
  Widget buildDoctorItem(DoctorModel doctor, int index) {
    return Card(
      color: Colors.white,
      elevation: 5, // Tăng shadow để tách biệt với nền
      margin: const EdgeInsets.symmetric(
          vertical: 10), // Tạo khoảng cách giữa các items
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            doctor.pathUrlAvatar,
            width: 75,
            height: 75,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          doctor.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.teal, // Làm nổi bật tên bác sĩ
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${doctor.major.majorName} - ${doctor.yearsOfExp} năm kn',
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            Row(
              children: [
                Text(
                  'SĐT: ',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Text("032442253",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'Giá: ${doctor.pirce}/giờ',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.red, // Làm nổi bật giá khám
                ),
              ),
            ),
          ],
        ),
        trailing: PopupMenuButton<int>(
          onSelected: (value) {
            if (value == 1) {
              // Chỉnh sửa bác sĩ
              editDoctor(
                  index,
                  DoctorModel(
                    id: 100,
                    pathUrlAvatar:
                        'assets/images/bacsi1.png', // Cập nhật thông tin mẫu khi chỉnh sửa
                    name: 'Dr. Edit Example',
                    major: MajorModel(id: 5, majorName: "Thú y"),
                    timeWorking: systemController.workingTime,
                    yearsOfExp: 3,
                    intro: "Số điện thoại của bạn: 0123456789",
                    pirce: "320.000 VND",
                  ));
            } else if (value == 2) {
              // Xóa bác sĩ
              deleteDoctor(index);
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text('Chỉnh sửa'),
            ),
            const PopupMenuItem(
              value: 2,
              child: Text('Xóa'),
            ),
          ],
        ),
      ),
    );
  }

  // Màn hình thêm bác sĩ
  void navigateToAddDoctor() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddDoctorPage(onAddDoctor: (doctor) {
          addDoctor(doctor);
          Navigator.pop(context); // Quay lại màn hình chính
        }),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctorsList = systemController.doctors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // systemController.doctors.value = doctorsList;
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 154, 59, 59), // Màu chủ đạo
        title: const Text('Quản Lý Bác Sĩ Thú Y',
            style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: navigateToAddDoctor,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildSearchField(),
            Expanded(
              child: ListView.builder(
                itemCount: filteredDoctors.length,
                itemBuilder: (context, index) {
                  return buildDoctorItem(filteredDoctors[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddDoctorPage extends StatefulWidget {
  final Function(DoctorModel) onAddDoctor;

  AddDoctorPage({required this.onAddDoctor});

  @override
  // ignore: library_private_types_in_public_api
  _AddDoctorPageState createState() => _AddDoctorPageState();
}

class _AddDoctorPageState extends State<AddDoctorPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController specialtyController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  String image = 'assets/images/bacsi1.png'; // Hình ảnh bác sĩ mặc định
  MajorModel majorModel = MajorModel(id: 1, majorName: "Thú y");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors
            .white, // const Color.fromARGB(255, 154, 59, 59), // Màu chủ đạo
        title: const Text('Thêm Bác Sĩ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Tên Bác Sĩ',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(
                        255, 154, 59, 59), // Màu chủ đạo khi focus
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              readOnly: false,
              onTap: () async {
                final systemController = Get.find<SystemController>();
                final major = await showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  isScrollControlled: true,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      child: Column(children: [
                        const SizedBox(
                          height: 16,
                        ),
                        const Text(
                          'Chọn chuyên ngành của bác sĩ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: systemController.majors.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pop(
                                      context, systemController.majors[index]);
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                      bottom: 16, left: 12, right: 12),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    color: Color.fromARGB(255, 184, 92, 92),
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    systemController.majors[index].majorName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ]),
                    );
                  },
                );
                setState(() {
                  majorModel = major;
                  specialtyController.text = major.majorName;
                });
              },
              controller: specialtyController,
              decoration: InputDecoration(
                labelText: 'Chuyên Ngành',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Số Điện Thoại',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: experienceController,
              decoration: InputDecoration(
                labelText: 'Kinh Nghiệm (Năm)',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: feeController,
              decoration: InputDecoration(
                labelText: 'Giá Khám (VNĐ)',
                labelStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final newDoctor = DoctorModel(
                  id: 231,
                  intro: phoneController.text,
                  pathUrlAvatar: image,
                  name: nameController.text,
                  major: majorModel,
                  yearsOfExp: int.parse(experienceController.text),
                  pirce: feeController.text,
                  timeWorking: SystemController().workingTime,
                );
                widget.onAddDoctor(newDoctor);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 154, 59, 59),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('Thêm Bác Sĩ',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
