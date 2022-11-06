class StudentSignUpPost {
  String? password;
  String? userName;

  StudentSignUpPost({this.password, this.userName});

  StudentSignUpPost.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['password'] = password;
    data['user_name'] = userName;
    return data;
  }
}