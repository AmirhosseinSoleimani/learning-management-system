
import 'package:flutter/material.dart';
import 'package:learning_management_system/models/store_model.dart';


class StoreProvider with ChangeNotifier{
  final List<StoreModel> _storePayment = [];
  List<StoreModel> get storePayment{
    return _storePayment;
  }

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
  }
}