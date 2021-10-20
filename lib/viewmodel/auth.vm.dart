import 'package:winequery/core/enum/viewstate.dart';
import 'package:winequery/core/service/auth.service.dart';
import 'package:winequery/viewmodel/base.vm.dart';

import 'package:winequery/locator.dart';

class AuthModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String errorMessage = "";

  Future<bool> login(String email, String password) async {
    setState(ViewState.Busy);


    // Not a number
    if(email == null || password == null) {
      errorMessage = 'Value entered is not a number';
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(email, password);

    // Handle potential error here too.

    setState(ViewState.Idle);
    return success;
  }
}
