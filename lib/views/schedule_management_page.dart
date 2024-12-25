import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/system_controller.dart';
import '../main.dart';
import '../model/working_time.dart';

final backgroundColor = const Color.fromARGB(255, 241, 213, 212);

class ScheduleManagementPage extends StatefulWidget {
  const ScheduleManagementPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WorkSchedulePageState createState() => _WorkSchedulePageState();
}

class _WorkSchedulePageState extends State<ScheduleManagementPage> {
  // Danh sách các khung giờ làm việc
  List<WorkingTime> time = [];
  final systemController = Get.find<SystemController>();
  @override
  void initState() {
    super.initState();
    time = systemController.workingTime;
  }

  // Hàm thêm khung giờ mới
  void _addNewSchedule() {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String startTime = '';
        String endTime = '';

        return AlertDialog(
          title: const Text('Thêm khung giờ mới'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Tiêu đề'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Giờ bắt đầu'),
                onChanged: (value) {
                  startTime = value;
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Giờ kết thúc'),
                onChanged: (value) {
                  endTime = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (title.isNotEmpty &&
                    startTime.isNotEmpty &&
                    endTime.isNotEmpty) {
                  setState(() {
                    time.add(WorkingTime(
                      id: 111,
                      name: title,
                      timeStart: startTime,
                      timeEnd: endTime,
                    ));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Lưu'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
          ],
        );
      },
    );
  }

  // Hàm sửa khung giờ
  void _editSchedule(int index) {
    String title = time[index].name;
    String startTime = time[index].timeStart;
    String endTime = time[index].timeEnd;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Chỉnh sửa khung giờ'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: TextEditingController(text: title),
                decoration: const InputDecoration(labelText: 'Tiêu đề'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: startTime),
                decoration: const InputDecoration(labelText: 'Giờ bắt đầu'),
                onChanged: (value) {
                  startTime = value;
                },
              ),
              TextField(
                controller: TextEditingController(text: endTime),
                decoration: const InputDecoration(labelText: 'Giờ kết thúc'),
                onChanged: (value) {
                  endTime = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  time[index] = WorkingTime(
                    id: 231,
                    name: title,
                    timeStart: startTime,
                    timeEnd: endTime,
                  );
                });
                Navigator.of(context).pop();
              },
              child: const Text('Lưu'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Hủy'),
            ),
          ],
        );
      },
    );
  }

  // Hàm xóa khung giờ
  void _deleteSchedule(int index) {
    setState(() {
      time.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            systemController.workingTime = time;
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        title: const Text(
          'Quản lý khung giờ làm việc',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: time.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              title: Text(time[index].name,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle:
                  Text('${time[index].timeStart} - ${time[index].timeEnd}'),
              trailing: PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    _editSchedule(index);
                  } else if (value == 'delete') {
                    _deleteSchedule(index);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Sửa'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Xóa'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewSchedule,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

// Lớp mô tả một khung giờ làm việc
class WorkSchedule {
  String title;
  String startTime;
  String endTime;

  WorkSchedule({
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
