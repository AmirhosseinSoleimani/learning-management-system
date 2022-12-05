class CategoryModel{
  String? id;
  String? name;
  String? image;
  double? price;
  String? duration;
  String? session;
  String? review;
  bool? isSelected;
  String? description;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.price,
    this.duration,
    this.session,
    this.review,
    this.isSelected,
    this.description,
});

}

class UpdateCourse{
  String category;
  List<String> courseObjectives;
  String description;
  int price;
  List<String> tags;
  UpdateCourse({
    required this.category,
    required this.courseObjectives,
    required this.description,
    required this.price,
    required this.tags,
});
}
