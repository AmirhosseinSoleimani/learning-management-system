
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/store_model.dart';


class StoreProvider with ChangeNotifier{
  final List<StoreModel> _storePayment = [];
  List<StoreModel> get storePayment{
    return _storePayment;
  }

  double totalPrice = 0;

  Future<void> addShopPayment(StoreModel storeModel) async{
    final newStoreModel = StoreModel(
        id: storeModel.id,
        name: storeModel.name,
        image: storeModel.image,
        price: storeModel.price,
        duration: storeModel.duration,
        session: storeModel.session,
        review: storeModel.review,
        description: storeModel.description,
    );
    storePayment.add(newStoreModel);
    notifyListeners();
  }

  Future<void> calculatorPrice() async{
    for(int i = 0 ; i<= _storePayment.length ; i++){
      totalPrice = double.parse(storePayment[i].price);
      notifyListeners();
    }
  }

  Future<void> deleteItems(String id) async {
    final existingProductIndex = _storePayment.indexWhere((element) => element.id == id) ;
    _storePayment.removeAt(existingProductIndex);
    notifyListeners();
  }
}