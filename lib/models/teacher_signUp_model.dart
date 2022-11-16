
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
  TeacherSignUpPatch({this.firstName,this.lastName,this.email,this.gender,this.birthDay,this.country,this.introduction});
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