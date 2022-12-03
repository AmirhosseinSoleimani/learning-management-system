
class SignInModel {
String userName;
String password;
SignInModel({
  required this.userName,
  required this.password
});
}

class UserInformation {
  String userName = '';
  String firstName = '';
  String lastName = '';
  String birthday = '';
  String country = '';
  int longitude = 0;
  int latitude = 0;
  String token = '';
  int roleNumber;
  UserInformation({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.country,
    required this.longitude,
    required this.latitude,
    required this.token,
    required this.roleNumber,

  });
}
