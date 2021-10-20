import 'dart:convert';

import 'package:winequery/core/model/purchase.dart';
import 'package:winequery/core/model/review.dart';
import 'package:winequery/core/model/store.dart';
import 'package:winequery/core/model/wine.dart';
import 'package:winequery/core/model/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const endpoint = 'https://winequery.herokuapp.com/api/v1';

  var client = new http.Client();

  Future<User> signin(String email, String password) async {
    // Get user profile for id
    var header = <String, String> {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await client.post('$endpoint/auth/signin', headers: header, body: jsonEncode({"email": email, "password": password}));
    var body = json.decode(response.body);
    if (body['status'] == true) {
      return User.fromJson(body['data']);
    } else {
      throw Exception("$response.body");
    }
  }

  Future<User> signup(User user) async {

    var header = <String, String> {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var body = <String, dynamic> {
      'name': user.name,
      'email': user.email,
      'password': user.password,
      'sex': user.sex,
      'state': user.state
    };

    var response = await client.post('$endpoint/auth/signup', headers: header, body: body);

    // Convert and return
    return User.fromJson(json.decode(response.body).data);
  }

  Future<List<Wine>> searchWine(String query) async {
    var wines = <Wine>[];
    // Get user posts for id

    var response = await client.get('$endpoint/wine/read=$query');

    // parse into List
    var parsed = json.decode(response.body).data as List<dynamic>;

    // loop and convert each item to Post
    for (var wine in parsed) {
      wines.add(Wine.fromJson(wine));
    }

    return wines;
  }

  Future<Wine> registWine(Wine wine) async {

    var header = <String, String> {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer token'
    };
    var body = <String, dynamic> {
      'name': wine.name,
    };

    var response = await client.post('$endpoint/auth/signup', headers: header, body: body);

    return json.decode(response.body).data;
  }

  Future<List<Store>> searchStore(String query) async {
    var stores = <Store>[];
    // Get user posts for id

    var response = await client.get('$endpoint/wine/read=$query');

    // parse into List
    var parsed = json.decode(response.body).data as List<dynamic>;

    // loop and convert each item to Post
    for (var store in parsed) {
      stores.add(Store.fromJson(store));
    }

    return stores;
  }

  Future<List<Purchase>> getPurchase(String id) async {

    var response = await client.get('$endpoint/purchase/read?id=$id');

    return json.decode(response.body).data;
  }

  Future<Store> registPurchase(Purchase purchase) async {

    var header = <String, String> {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer token'
    };
    var body = <String, dynamic> {
      'name': purchase.name,
    };

    var response = await client.post('$endpoint/auth/signup', headers: header, body: body);

    return json.decode(response.body).data;
  }
}
