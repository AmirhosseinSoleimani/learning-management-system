class CategoryList {
  String? id;
  String? name;
  String? picture;
  int? courseCount;

  CategoryList({this.id, this.name, this.picture, this.courseCount});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    courseCount = json['course_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['picture'] = picture;
    data['course_count'] = courseCount;
    return data;
  }
}