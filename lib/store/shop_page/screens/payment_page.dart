import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../data.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../drawer.dart';
import '../widgets/payment_item.dart';


class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20.0,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.shopPageRoute);
          },
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ColorManager.black,
          size: 30.0,
        ),
      ),
      endDrawer: const DrawerAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.shopPageRoute);
                  },
                  icon: SvgPicture.asset(IconAssets.shop),
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(IconAssets.support),
                )
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.60,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: ColorManager.lightSteelBlue2,
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: (){},
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: ColorManager.lightSteelBlue1,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorManager.lightSteelBlue1,
                          decorationThickness: 1.5
                        ),
                      ),
                  ),
                  Center(
                    child: Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.40,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => PaymentItem(
                        data: courses[index],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      thickness: 2,
                      color: ColorManager.lightSteelBlue2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount:',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              color: ColorManager.slateGray2
                          ),
                        ),
                        Text(
                          courses[1]['price'],
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.primary
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: ColorManager.lightSteelBlue2,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorManager.lightSteelBlue4
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              filled: true,
                              fillColor: ColorManager.white,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'ٍEnter Coupon Code',
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  color: ColorManager.lightSteelBlue1
                              ),
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0
                        ),
                        child: TextButton(
                            onPressed: (){},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: ColorManager.primary)
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(ColorManager.primary),
                          ),
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0
                              ),
                            ),
                        ),
                      ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: ColorManager.lightSteelBlue2,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorManager.lightSteelBlue4
              ),
            )
          ],
        ),
      ),
    );
  }
}
