
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
}