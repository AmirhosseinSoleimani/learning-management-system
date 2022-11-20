class StudentSignUpPost {
  String? password;
  String? userName;
  StudentSignUpPost({this.password, this.userName});

}


class StudentSignUpPatch{
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
  String? language;
  String? bio;
  String? workHistory;
  String? id;

  StudentSignUpPatch({
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
    this.cardNumber,
    this.workHistory,
    this.language,
    this.bio,
    this.id
  });
}