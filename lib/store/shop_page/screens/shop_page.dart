import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_management_system/presentation/resources/values_manager.dart';
import 'package:learning_management_system/store/shop_page/widgets/shop_item.dart';
import 'package:provider/provider.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/routes_manager.dart';
import '../../../provider/store_provider.dart';
import '../../drawer.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override

  void initState() {
    Provider.of<StoreProvider>(context,listen: false).calculatorPrice();
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.black,
            size: AppSize.s20,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(Routes.homePage);
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
            Stack(
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
                (Provider.of<StoreProvider>(context).storePayment.isEmpty) ? Container(
                  child: null,
                ) : Positioned(
                  top: 3.0,
                  left: 34.0,
                  child: Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: ColorManager.white
                        ),
                        borderRadius: BorderRadius.circular(100.0),
                        color: ColorManager.white
                    ),
                    child: Center(
                      child: Text(
                        '${Provider.of<StoreProvider>(context).storePayment.length}',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.primary
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: (Provider.of<StoreProvider>(context).storePayment.length == 1) ? MediaQuery.of(context).size.height * 0.6:MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1.5, color: ColorManager.lightSteelBlue2),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'your product list',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 28.0,
                              color: ColorManager.primary),
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      (Provider.of<StoreProvider>(context).storePayment.isEmpty)? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: const Center(
                          child: Text(
                            'No Selected Any Product',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ) :SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: (Provider.of<StoreProvider>(context).storePayment.length == 1) ? MediaQuery.of(context).size.height * 0.25 :
                        (Provider.of<StoreProvider>(context).storePayment.length == 1) ? MediaQuery.of(context).size.height * 0.45: MediaQuery.of(context).size.height * 0.51,
                        child: ListView.builder(
                          itemCount: Provider.of<StoreProvider>(context).storePayment.length,
                          itemBuilder: (context, index) => ShopItem(
                            name: Provider.of<StoreProvider>(context).storePayment[index].name,
                            image: Provider.of<StoreProvider>(context).storePayment[index].image,
                            price: Provider.of<StoreProvider>(context).storePayment[index].price,
                            id: Provider.of<StoreProvider>(context).storePayment[index].id,

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
                            (Provider.of<StoreProvider>(context,listen: false).storePayment.isEmpty) ?
                            Text(
                              '\$ 0',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.primary
                              ),
                            )
                            : Text(
                                '\$ ${Provider.of<StoreProvider>(context,listen: false).totalPrice}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.primary
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextButton(
                            onPressed: (){
                              if(Provider.of<StoreProvider>(context,listen: false).storePayment.isNotEmpty){
                                Navigator.of(context).pushReplacementNamed(Routes.paymentPageRoute);
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(
                                          color: (Provider.of<StoreProvider>(context).storePayment.isEmpty) ?
                                           Colors.grey :
                                          ColorManager.green)
                                  ),
                              ),
                              backgroundColor: (Provider.of<StoreProvider>(context).storePayment.isEmpty) ?
                              MaterialStateProperty.all(Colors.grey)
                               : MaterialStateProperty.all(ColorManager.green),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'payment',
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400
                                  ),
                                ),
                                Icon(
                                    Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: ColorManager.white,
                                )
                              ],
                            ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
