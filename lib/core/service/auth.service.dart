import 'dart:async';

import 'package:winequery/core/model/user.dart';

import '../../locator.dart';
import 'api.dart';

class AuthenticationService {
  Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(String email, String password) async {
    var fetchedUser = await _api.signin(email, password);

    var hasUser = fetchedUser != null;
    if(hasUser) {
      userController.add(fetchedUser);
    }

    return hasUser;
  }
}