
class StudentSignUpPut {
  String? bio;
  int? birthDay;
  String? country;
  String? email;
  String? firstName;
  int? gender;
  String? id;
  String? introduction;
  String? lastName;
  String? phoneNumber;

  StudentSignUpPut(
      {this.bio,
        this.birthDay,
        this.country,
        this.email,
        this.firstName,
        this.gender,
        this.id,
        this.introduction,
        this.lastName,
        this.phoneNumber});

  StudentSignUpPut.fromJson(Map<String, dynamic> json) {
    bio = json['bio'];
    birthDay = json['birth_day'];
    country = json['country'];
    email = json['email'];
    firstName = json['first_name'];
    gender = json['gender'];
    id = json['id'];
    introduction = json['introduction'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['bio'] = bio;
    data['birth_day'] = birthDay;
    data['country'] = country;
    data['email'] = email;
    data['first_name'] = firstName;
    data['gender'] = gender;
    data['id'] = id;
    data['introduction'] = introduction;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    return data;
  }
}