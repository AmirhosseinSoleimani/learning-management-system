import 'package:flutter/material.dart';
import 'package:learning_management_system/presentation/resources/routes_manager.dart';
import 'package:learning_management_system/provider/category_provider.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/color_manager.dart';



class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {

  final _categoryFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: ColorManager.black
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2.0, color: ColorManager.lightSteelBlue2),
                borderRadius: BorderRadius.circular(10.0),
                color: ColorManager.lightBlue4
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: TextFormField(
                      initialValue: (Provider.of<CategoryProvider>(context,listen: false).categoryEnd == true)? Provider.of<CategoryProvider>(context,listen: false).categorySelected:'',
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
                      focusNode: _categoryFocusNode,
                      keyboardType: TextInputType.none,
                      textInputAction: TextInputAction.done,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onTap: () async{
                        await Provider.of<CategoryProvider>(context,listen: false).fetchCategoryList();
                        Navigator.of(context).pushReplacementNamed(Routes.searchCategory);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
