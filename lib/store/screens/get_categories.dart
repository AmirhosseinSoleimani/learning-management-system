import 'package:flutter/material.dart';
import '../../data.dart';
import '../widgets/category_box.dart';

class GetCategories extends StatelessWidget {
  const GetCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
        List.generate(categories.length, (index) => Padding(
          padding: const EdgeInsets.only(right: 15.0,bottom: 5.0),
          child: CategoryBox(date: categories[index],
          ),
        ),
        ),
      ),
    );
  }
}
