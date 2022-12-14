import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../presentation/resources/color_manager.dart';

class PaymentItem extends StatelessWidget {
  PaymentItem({Key? key,required this.name,required this.image,required this.price,required this.id,}) : super(key: key);
  String name;
  String image;
  String price;
  String id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.slateGray2
                        ),
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
