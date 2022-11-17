
class TeacherSignUpPost {
  String? password;
  String? userName;
  TeacherSignUpPost({this.password, this.userName});
}

class TeacherSignUpPatch{
  String? firstName;
  String? lastName;
  String? email;
  int? gender;
  int? birthDay;
  String? country;
  String? introduction;
  String? phoneNumber;
  String? address;
  double? latitude;
  double? longitude;
  String? financial;
  int? cardNumber;

  TeacherSignUpPatch({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.birthDay,
    this.country,
    this.introduction,
    this.phoneNumber,
    this.address,
    this.latitude,
    this.longitude,
    this.financial,
    this.cardNumber
  });
}

class TeacherSignUpGeneral{
  String? password;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  int? gender;
  int? birthDay;
  String? country;
  String? introduction;
  TeacherSignUpGeneral({this.userName,this.password,this.firstName,this.lastName,this.email,this.gender,this.birthDay,this.country,this.introduction});

}