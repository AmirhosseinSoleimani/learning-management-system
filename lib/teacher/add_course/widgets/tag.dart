import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../presentation/resources/color_manager.dart';
import '../../../provider/add_courses_provider.dart';

class Tag extends StatefulWidget {
  const Tag({Key? key}) : super(key: key);

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {

  final _tagFocusNode = FocusNode();


  final _tagController = TextEditingController();

  final _form = GlobalKey<FormState>();

  String? _tagText;

  bool isLoading = false;

  Future<void> updateUi() async{
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 3),(){
      setState(() {
        isLoading = false;
      });
    });

  }

  final cubeGrid = SpinKitWanderingCubes(
    size: 100,
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? ColorManager.slateGray2 : ColorManager.lightSteelBlue2,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    final tagProvider = Provider.of<AddCourseProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 4,
                  child: Form(
                    key: _form,
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
                        fillColor: ColorManager.lightBlue4,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              width: 2,
                              color: ColorManager.lightSteelBlue2),
                        ),
                      ),
                      controller: _tagController,
                      focusNode: _tagFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Field is required';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState((){
                          _tagText = value;
                        });
                      },
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: (_tagController.text.isEmpty) ? GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.done,
                      size: 30.0,
                      color: ColorManager.lightSteelBlue1,),
                  )
                      :GestureDetector(
                        onTap: () {
                          Provider.of<AddCourseProvider>(context, listen: false).addTagList(_tagText!);
                          _tagController.clear();
                          updateUi();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1,
                                    color: ColorManager.lightSteelBlue2),
                                borderRadius:
                                BorderRadius.circular(5.0),
                                color: ColorManager.primary),
                            child: Icon(
                              Icons.done,
                              size: 30.0,
                              color: ColorManager.white,
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          (tagProvider.tag.isEmpty) ? const SizedBox(height: 1.0,) : Builder(
            builder: (context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: ColorManager.lightSteelBlue2),
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorManager.lightBlue4,
                  ),
                  child: (isLoading == true)? Center(child: cubeGrid): ListView.builder(
                    itemCount: tagProvider.tag.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                      child: Card(
                        elevation: 6,
                        child: ListTile(
                          title: Text(tagProvider.tag[index],),
                          trailing: IconButton(
                            onPressed: () async{
                              await tagProvider.deleteTagList(tagProvider.tag[index]);
                              updateUi();
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
              );
            }
          ),
        ],
      ),
    );
  }
}
