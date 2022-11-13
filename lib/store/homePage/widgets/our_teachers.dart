import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';

class OurTeachers extends StatelessWidget {
  const OurTeachers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.68,
      color: ColorManager.lightBlue2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.68,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ColorManager.ivory,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
          color: ColorManager.ivory,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'our ',
                  style: TextStyle(
                      color: ColorManager.black,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Teachers',
                      style: TextStyle(
                          color: ColorManager.darkOrange,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    const Image(
                      image: AssetImage(
                          ImageAssets.markLine
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 35.0
              ),
              child: Text(
                'Single user, personal educational use only, no redistribution. The total price includes the item price and a buyer fee.',
                style: TextStyle(
                    fontSize: 18,
                    color: ColorManager.lightSteelBlue1,
                    fontWeight: FontWeight.w400
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: features.length,
                itemBuilder: (BuildContext context,int index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: ColorManager.lightSteelBlue2,
                          ),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5,
                                      color: ColorManager.ivory
                                  ),
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                              child: CachedNetworkImage(
                                imageBuilder: (context,imageProvider) => Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      image: DecorationImage(image: imageProvider,
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                                imageUrl: features[index]['image'],
                              ),

                            ),
                          ),
                          Text(
                            'Alex Stanton',
                            style: TextStyle(
                                color:ColorManager.slateGray2,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'master of education degree',
                            style: TextStyle(
                                color: ColorManager.lightSteelBlue1,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 17.0,
                                vertical: 8.0
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 20.0,
                                  color: ColorManager.darkOrange,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20.0,
                                  color: ColorManager.darkOrange,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20.0,
                                  color: ColorManager.darkOrange,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20.0,
                                  color: ColorManager.darkOrange,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 20.0,
                                  color: ColorManager.darkOrange,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: ColorManager.lightSteelBlue1
                                        ),
                                        borderRadius: BorderRadius.circular(5.0)
                                    ),
                                    child: Icon(Icons.favorite_border,
                                      size: 20.0,
                                      color: ColorManager.lightSteelBlue1,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: (){},
                                  child: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: ColorManager.primary
                                        ),
                                        borderRadius: BorderRadius.circular(5.0),
                                        color: ColorManager.primary
                                    ),
                                    child: Icon(
                                      Icons.share_outlined,
                                      size: 20.0,
                                      color: ColorManager.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
