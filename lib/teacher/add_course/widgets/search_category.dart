import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/category_provider.dart';
import 'package:provider/provider.dart';
import '../../../models/category_model.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../presentation/resources/values_manager.dart';
import '../../../provider/add_courses_provider.dart';

class SearchCategory extends StatefulWidget {
  const SearchCategory({Key? key}) : super(key: key);

  @override
  State<SearchCategory> createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {

  final _searchCategoryFocusNode = FocusNode();

  final TextEditingController _controller = TextEditingController();

  List<CategoryList> categoryList = [];




  @override
  void initState() {
    categoryList = Provider.of<CategoryProvider>(context,listen: false).category;
    super.initState();
  }


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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
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
              onChanged: updateList,
            ),
          ),
          SizedBox(
            height: 500,
            width: double.infinity,
            child: ListView.builder(
              itemCount: categoryList.length,
                itemBuilder: (context,index) => GestureDetector(
                  onTap: (){
                    setState(() {
                      Provider.of<CategoryProvider>(context,listen: false).categorySelected = categoryList[index].name!;
                      Provider.of<CategoryProvider>(context,listen: false).categoryEnd = true;
                      Provider.of<AddCourseProvider>(context,listen: false).backTitle = true;
                      Provider.of<CategoryProvider>(context,listen: false).findIdCategory(categoryList[index].name!);
                      Navigator.of(context).pushReplacementNamed(Routes.addCourseTitle);
                    });
                  },
                  child: ListTile(
                    title: Text(
                        categoryList[index].name!
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
  void updateList(String value){
        final suggestionList = categoryList.where((element){
        final categoryTitle = element.name!.toLowerCase();
        final input = value.toLowerCase();
        return categoryTitle.contains(input);
      }).toList();
        setState(() {
          categoryList = suggestionList;
        });
  }
}
