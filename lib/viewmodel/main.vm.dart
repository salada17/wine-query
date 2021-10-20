import 'dart:convert';

import 'package:winequery/core/enum/viewstate.dart';
import 'package:winequery/core/model/location.dart';
import 'package:winequery/core/model/store.dart';
import 'package:winequery/core/model/wine.dart';
import 'package:winequery/core/service/api.dart';
import 'package:winequery/viewmodel/base.vm.dart';

import 'package:winequery/locator.dart';

class MainModel extends BaseModel {
  final Api _api = locator<Api>();
  String errorMessage = "";

  Coords? curPos;
  List<Store>? stores;
  Wine? wine;

  Future addWine(String name, String storeId, String userId, int price, int vintage) async {
    setState(ViewState.Busy);


    // Not a number
    if(name == null || storeId == null || price == null || vintage == null) {
      errorMessage = 'check for parameter';
      setState(ViewState.Idle);
      return ;
    }

    var wine = Wine.fromJson(<String,dynamic> {
      'name': name,
      'store_id': storeId,
      'user_id': userId,
      'price': price,
      'vintage': vintage
    });

    wine = await _api.registWine(wine);

    setState(ViewState.Idle);
  }

  Future getStore(Coords? pos) async {
    if (pos == null) {
      return ;
    }
    setState(ViewState.Busy);
    stores = <Store>[];

    setState(ViewState.Idle);
    return stores;
  }
}
