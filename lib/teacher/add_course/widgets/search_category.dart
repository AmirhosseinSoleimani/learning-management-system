import 'package:flutter/material.dart';
import '../../../models/search_category.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';

class SearchCategory extends StatefulWidget {
  const SearchCategory({Key? key}) : super(key: key);

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {

  final _searchCategoryFocusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  // List<Category> category = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        title: Image.asset(
          ImageAssets.epent,
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0, vertical: 10.0),
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(
                width: 2,
                color: ColorManager.lightSteelBlue2,
              ),
            ),
            filled: true,
            hintText: 'Search Category',
            hintStyle: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400
            ),
            prefixIcon: const Icon(
              Icons.search,
              size: 20.0,
            ),
            fillColor: ColorManager.lightBlue4,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          focusNode: _searchCategoryFocusNode,
          controller: _controller,
          autofocus: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          validator: (String? value) {
            if (value!.isEmpty) {
              return 'Field is required';
            }
            return null;
          },
        ),
      ),
    );
  }
}
