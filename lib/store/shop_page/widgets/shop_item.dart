import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_management_system/provider/store_provider.dart';
import 'package:provider/provider.dart';

import '../../../presentation/resources/color_manager.dart';

class ShopItem extends StatelessWidget {
  ShopItem({Key? key,required this.name,required this.image,required this.price,required this.id}) : super(key: key);

  String name;
  String image;
  String price;
  String id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
      child: SizedBox(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: ColorManager.lightSteelBlue3),
            borderRadius: BorderRadius.circular(10.0),
            color: ColorManager.lightSteelBlue3,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0,top: 8.0),
                child: Container(
                  width: 30.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5,
                          color: ColorManager.darkOrange),
                      borderRadius:
                      BorderRadius.circular(7.0)),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<StoreProvider>(context,listen: false).deleteItems(id);
                    },
                    child: Icon(
                      Icons.delete_outline_outlined,
                      color: ColorManager.darkOrange,
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 70,
                      height: 70.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1.0,
                              color: ColorManager.lightSteelBlue3
                          ),
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        imageUrl: image,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.slateGray2
                          ),
                        ),
                      ),
                      Text(
                        'master: Jessica Lambert',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.lightSteelBlue1
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: ColorManager.primary
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
