import 'major_model.dart';
import 'working_time.dart';

class DoctorModel {
  int id;
  String name;
  String pirce;
  int yearsOfExp;
  String intro;
  String pathUrlAvatar;
  MajorModel major;
  List<WorkingTime> timeWorking;

  DoctorModel(
      {required this.id,
      required this.intro,
      required this.major,
      required this.name,
      required this.pathUrlAvatar,
      required this.pirce,
      required this.timeWorking,
      required this.yearsOfExp});
}
