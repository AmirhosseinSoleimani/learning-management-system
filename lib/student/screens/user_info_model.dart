import 'package:hive/hive.dart';
part 'user_info_model.g.dart';


@HiveType(typeId: 1)

class UserInfo{
  @HiveField(0)
  final String fullName;
  @HiveField(1)
  final String age;
  @HiveField(2)
  final String city;


  UserInfo({
    required this.fullName,
    required this.age,
    required this.city
});
}