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

class User{
  static const String passionCooking = 'cooking';
  static const String passionHiking = 'hiking';
  static const String passionTraveling = 'traveling';

  String firstName = '';
  String lastName = '';
  Map<String, bool> passions = {
    passionCooking: false,
    passionHiking: false,
    passionTraveling: false
  };
  bool newsLetter = false;

  save(){
    print('saving user using a web service');
  }
}
